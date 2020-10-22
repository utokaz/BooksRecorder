import UIKit
import RxSwift
import RxRelay
import RxCocoa

let disposeBag = DisposeBag()

func getDataOrError(completionHandler: @escaping ((String?, Error?)) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
        print("fetching")
        //        return completionHandler((nil, NSError()))
        return completionHandler(("data fetched!", nil))
    }
}

var singleObservable: Single<String> {
    return Single.create { single in
        getDataOrError { (data, error) in
            if let error = error {
                single(.error(error))
                return
            }
            
            single(.success(data!))
        }
        return Disposables.create()
    }
}

singleObservable
    .subscribe({
        print($0)
    })
    .disposed(by: disposeBag)

singleObservable
    .subscribe({
        print($0)
    })
    .disposed(by: disposeBag)
