//
//  ViewController.swift
//  Lecture4Homework
//
//  Created by Egor Lass on 29.04.2021.
//

import UIKit

class MainTestController: UIViewController {

    let blocksTest = BlocksTest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Проверка работы Obj-c + Swift
        //
        blocksTest.testOutput()
        
        //Тестируем блок
        //
        blocksTest.testBlockStorageType()
        
        //Блоку можно присвоить closure
        //
        let closure : (_ data: Data, _ error : Error?) -> Void = {(data: Data, error : Error?) -> Void in
            print("Some text")
        }
        blocksTest.completionBlock = closure
        
        //Если блок не захватывает внешние переменные, то получаем __NSGlobalBlock__
        //Если блок захватывает внешние переменные, то блок __NSStackBlock__ (на стеке)
        //Если послать блоку 'copy', то блок будет скопирован в кучу (__NSMallocBlock__)
        //
        blocksTest.stackBlockTest()
        blocksTest.mallocBlockTest()
        blocksTest.globalBlockTest()
        blocksTest.oneMoreMallocBlockTest()
    
    }


}

