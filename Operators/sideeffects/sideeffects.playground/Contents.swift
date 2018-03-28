//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let bag = DisposeBag()

let observableOne = Observable.of("Tarefa 1", "Tarefa 2", "Tarefa 3", "Tarefa 3.1")


observableOne
    .filter { value in
        return value.contains("1")
    }
    .do(onNext: { value in
        print("*SIDE_EFFECT Este é o proximo item \(value)")
    }, onError: { error in
        print("*SIDE_EFFECT Este é o erro \(error)")
    }, onCompleted: {
        print("*SIDE_EFFECT Completou!")
    }, onSubscribe: {
        print("*SIDE_EFFECT Vai increver!")
    }, onSubscribed: {
        print("*SIDE_EFFECT Inscreveu!")
    }, onDispose: {
        print("*SIDE_EFFECT Disposou!")
    })
    .subscribe(onNext: { value in
        print(value)
    }, onError: { error in
        print(error)
    }, onCompleted: {
        print("Completou!")
    }, onDisposed: {
        print("Disposou!")
    })

