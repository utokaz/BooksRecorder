//
//  SharedSequenceConvertibeType+.swift
//  BooksMakeYouYou
//
//  Created by uto kazuori on 2020/09/02.
//  Copyright © 2020 uto kazuori. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

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
