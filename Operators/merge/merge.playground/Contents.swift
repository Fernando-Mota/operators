//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let bag = DisposeBag()

let observableOne = Observable.of("Tarefa 1", "Tarefa 2", "Tarefa 3")

let observableTwo = Observable.of("Tarefa 4", "Tarefa 5", "Tarefa 6")

Observable.merge(observableOne, observableTwo)
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag)
