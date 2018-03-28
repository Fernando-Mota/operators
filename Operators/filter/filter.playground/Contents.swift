//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let bag = DisposeBag()

let observableOne = Observable.of("Tarefa 1", "Tarefa 2", "Tarefa 3", "Tarefa 3.1")


observableOne
    .filter { value in
        return value.contains("1")
    }
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag)

