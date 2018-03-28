//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let bag = DisposeBag()
let observableOne = Observable.just(["Tarefa 1", "Tarefa 2", "Tarefa 3", "Tarefa 3.1"])

observableOne
    .flatMap { tarefas -> Observable<String> in
        print(tarefas)
        return Observable.from(tarefas)
    }
    .subscribe(onNext: { value in
        print(value)
    }).disposed(by: bag)

