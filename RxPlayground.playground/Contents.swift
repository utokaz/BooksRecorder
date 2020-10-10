import UIKit
import RxSwift


let o = Observable.of(1, 2, 3).map { n in
    print(n)
}.publish()



o.subscribe()

o.subscribe()

o.connect()
