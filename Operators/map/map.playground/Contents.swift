//: Playground - noun: a place where people can play

import UIKit

import RxSwift

class Task {
    
    let description: String
    
    init(description: String) {
        self.description = description
    }
}

let bag = DisposeBag()
let observableOne = Observable.just(["Tarefa 1", "Tarefa 2", "Tarefa 3", "Tarefa 3.1"])

observableOne
    .flatMap { tarefas -> Observable<String> in
        print(tarefas)
        return Observable.from(tarefas)
    }
    .map { descricaoTarefa in
        Task(description: descricaoTarefa)
    }
    .subscribe(onNext: { value in
        dump(value)
    }).disposed(by: bag)

