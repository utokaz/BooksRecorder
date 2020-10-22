//
//  RxHelpers.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/10/12.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import PKHUD

public extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map { _ in }
    }
    
    func mapToTrue() -> SharedSequence<SharingStrategy, Bool> {
        map { _ in true }
    }
    
    func mapToFalse() -> SharedSequence<SharingStrategy, Bool> {
        map { _ in false }
    }
}

public extension Observable {
    func mapToVoid() -> Observable<Void> {
        map { _ in }
    }
    
    func mapToTrue() -> Observable<Bool> {
        map { _ in true}
    }
    
    func mapToFalse() -> Observable<Bool> {
        map { _ in false }
    }
}

extension Reactive where Base: UIScrollView {
    var reachedBottom: ControlEvent<Void> {
        let observable = contentOffset
            .flatMap { [weak base] contentOffset -> Observable<Void> in
                guard let scrollView = base else { return Observable.empty() }

                let visibleHeight = scrollView.frame.height - scrollView.contentInset.top - scrollView.contentInset.bottom
                let y = contentOffset.y + scrollView.contentInset.top
                let threshold = max(0.0, scrollView.contentSize.height - visibleHeight)

                return y > threshold ? Observable.just(()) : Observable.empty()
        }
        return ControlEvent(events: observable)
    }
}
