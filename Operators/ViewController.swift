//
//  ViewController.swift
//  Operators
//
//  Created by Fernando Mota e Silva on 28/03/18.
//  Copyright © 2018 Fernando Mota e Silva. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        execPipeline()
        
    }

    func execPipeline() {
        
        let todos = [Todo(description: "Tarefa 1"), Todo(description: "Tarefa 2"), Todo(description: "Tarefa 3")]
        
        let descriptions = ["Tarefa 1.1", "Tarefa 2.2", "Tarefa 3.3"]
        
        Observable.merge(Observable.just(todos),
                         Observable.just(descriptions)
                            .flatMap { values in
                                Observable.from(values)
                                
                            }
                            .map {value in
                                Todo(description: value)
                                
                            }.toArray())
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .flatMap { values in
                Observable.from(values)
            }.filter { value in
                value.description.contains("1")
            }.do(onNext: { todo in
                print("SIDE_EFFECT: Esta é a tarefa no side effect: \(todo.description)")
            }, onError: { error in
                print("SIDE_EFFECT: Este é o erro no side effect: \(error)")
            }, onCompleted: {
                print("SIDE_EFFECT: Este é o complete no side effect!")
            }, onSubscribe: {
                print("SIDE_EFFECT: Este é o handler de vai subscribar!")
            }, onSubscribed: {
                print("SIDE_EFFECT: Este é o handler de tá subscribado!")
            }, onDispose: {
                print("SIDE_EFFECT: Este é o handler de disposou!")
            })
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (value) in
                print("ON_NEXT: Descrição da tarefa: \(value.description)")
            }, onError: { (error) in
                print("ON_ERROR: Deu ruim óia o erro: \(error)")
            }, onCompleted: {
                print("ON_COMPLETED: Deu bom, se liga que completou!")
            }, onDisposed: {
                print("ON_DISOSED: Disposou aqui ó!")
            }).disposed(by: bag)
    }
    
}

