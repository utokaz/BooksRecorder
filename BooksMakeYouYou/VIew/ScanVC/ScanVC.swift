//
//  ScanVC.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/08/14.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import PKHUD
import AVFoundation

class ScanVC: BaseVC, AVCaptureMetadataOutputObjectsDelegate {
    
    private let session = AVCaptureSession()
    let scanTrigger = PublishRelay<String>()
    let disposeBag = DisposeBag()
    var isLoading =  PublishRelay<Bool>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindingData()
    }
    
    func bindingData() {
        let vm = ScanVM()
        let output = vm.transform(input: .init(triger: scanTrigger))
        output.result.subscribe(onNext: { [weak self] result in
            self?.isLoading.accept(false)
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let sb = UIStoryboard(name: "BookInformationEditVC", bundle: nil)
                    let vc = sb.instantiateInitialViewController() as! BookInformationEditVC
                    vc.delegate = self
                    let model = BookModel.entityToModel(item: response.items[0])
                    vc.inject(item: model, type: .register)
                    self?.present(vc, animated: true)
                }
                
            case .failure( _):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "バーコードが正しくありません。", message: "二つあるうちの上のバーコードを読み取ってください", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
                        self?.session.startRunning()
                    })
                    alert.addAction(okAction)
                    self?.present(alert, animated: true)
                }
                
            }
            
        }).disposed(by: disposeBag)
        
        isLoading.bind(to: Binder(self) {_,flag in
            flag ? HUD.show(.progress) : HUD.hide()
        }).disposed(by: disposeBag)
        
    }
    
    private func setup() {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: .video, position: .back)
        let devices = discoverySession.devices
        if let backCamera = devices.first {
            do {
                // QRコードの読み取りに背面カメラの映像を利用するための設定
                let deviceInput = try AVCaptureDeviceInput(device: backCamera)
                if self.session.canAddInput(deviceInput) {
                    self.session.addInput(deviceInput)
                    
                    // 背面カメラの映像からQRコードを検出するための設定
                    let metadataOutput = AVCaptureMetadataOutput()
                    if self.session.canAddOutput(metadataOutput) {
                        self.session.addOutput(metadataOutput)
                        
                        metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
                        // 読み取りたいバーコードの種類を指定
                        metadataOutput.metadataObjectTypes = [.ean13]
                        
                        // 読み取り可能エリアの設定を行う
                        // 画面の横、縦に対して、左が10%、上が40%のところに、横幅80%、縦幅20%を読み取りエリアに設定
                        let x: CGFloat = 0.1
                        let y: CGFloat = 0.4
                        let width: CGFloat = 0.8
                        let height: CGFloat = 0.2
                        metadataOutput.rectOfInterest = CGRect(x: y, y: 1 - x - width, width: height, height: width)
                        
                        // 背面カメラの映像を画面に表示するためのレイヤーを生成
                        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
                        previewLayer.frame = self.view.bounds
                        previewLayer.videoGravity = .resizeAspectFill
                        self.view.layer.addSublayer(previewLayer)
                        
                        // 読み取り可能エリアの加工
                        let detectionArea = UIView()
                        detectionArea.frame = CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: view.frame.size.width * width, height: view.frame.size.height * height)
                        detectionArea.layer.borderColor = UIColor(named: "deepGreen")?.cgColor
                        detectionArea.layer.borderWidth = 3
                        detectionArea.layer.cornerRadius = 20.0
                        view.addSubview(detectionArea)
                        
                        // 読み取りかのエリア以外を半透明のレイヤーでマスキング
                        let clippedViewWidth: CGFloat = view.frame.size.width * width
                        let clippedViewHeight: CGFloat = view.frame.size.height * height
                        let backgroundLayer = CALayer()
                        backgroundLayer.bounds = view.bounds
                        backgroundLayer.position = view.center
                        backgroundLayer.backgroundColor = UIColor.black.cgColor
                        backgroundLayer.opacity = 0.6
                        
                        let maskLayer = CAShapeLayer()
                        maskLayer.bounds = backgroundLayer.bounds
                        let clippingViewRect =  CGRect(x: view.frame.size.width * x, y: view.frame.size.height * y, width: clippedViewWidth, height: clippedViewHeight)
                        let path =  UIBezierPath(roundedRect: clippingViewRect, cornerRadius: 20.0)
                        path.append(UIBezierPath(rect: maskLayer.bounds))
                        maskLayer.fillColor = UIColor.black.cgColor
                        maskLayer.path = path.cgPath
                        maskLayer.position = view.center
                        maskLayer.fillRule = CAShapeLayerFillRule.evenOdd
                        backgroundLayer.mask = maskLayer
                        self.view.layer.addSublayer(backgroundLayer)
                        
                        let label = UILabel()
                        label.text = "バーコードを読み取ってください"
                        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                        label.textColor = .white
                        view.addSubview(label)
                        label.translatesAutoresizingMaskIntoConstraints = false
                        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)])
                        
                        // 読み取り開始
                        self.session.startRunning()
                    }
                }
            } catch {
                print("Error occured while creating video device input: \(error)")
            }
        }
    }
    
    /// delegate method
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        for metadata in metadataObjects as! [AVMetadataMachineReadableCodeObject] {
            // バーコードの内容が空かどうかの確認
            if let isbn = metadata.stringValue {
                session.stopRunning()
                // 読み取ったデータの値
                print(metadata.type)
                print(metadata.stringValue!)
                scanTrigger.accept(isbn)
                isLoading.accept(true)
            }
            
        }
    }
}

extension ScanVC: BookInformationEditVCDelegate {
    func viewDidDisappear() {
        session.startRunning()
    }
}
