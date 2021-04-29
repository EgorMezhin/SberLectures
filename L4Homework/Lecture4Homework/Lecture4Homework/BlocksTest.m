//
//  BlocksTest.m
//  Lecture4Homework
//
//  Created by Egor Lass on 29.04.2021.
//

#import <Foundation/Foundation.h>
#import "BlocksTest.h"
@implementation BlocksTest

- (void) testOutput {
    NSLog(@"test");
}

// Пример. В блоке используется переменная someValue, но someValue объявлена в методе testBlockStorageType,
// в котором также объявлен наш блок. По умолчанию в таком блоке нельзя изменять значение этой переменной.
//
- (void) testBlockStorageType {
    //Добавляем модификатор __block чтобы someValue могла изменять значение
    //
    __block int someValue = 10;
    int (^myOperation)(void) = ^(void){
        someValue += 5;
        return someValue + 10;
    };
    NSLog(@"%d", myOperation());
}

// Пример. Блоки, которые не захватывают переменных – global.
// Блоки, которые захватывают переменные – stack или malloc.
// Блоки изначально в стеке. Когда блок стека копируется в первый раз, он перемещается в кучу.
// Копирование блока кучи не создает другую копию.
//
- (void) stackBlockTest {
    int foo = 3;
    Class class = [^{
        int foo1 = foo + 1;
    } class];
    NSLog(@"%@", NSStringFromClass(class));
}

- (void) mallocBlockTest {
    int foo = 3;
    Class class = [[^{
        int foo1 = foo + 1;
    } copy] class];
    NSLog(@"%@", NSStringFromClass(class));
}

- (void) globalBlockTest {
    Class class = [^{
    } class];
    NSLog(@"%@", NSStringFromClass(class));
}

- (void) oneMoreMallocBlockTest {
    int foo = 3;
        id thisIsBlock = ^{
            int foo1 = foo + 1;
        };
        Class class = [thisIsBlock class];
        NSLog(@"%@", NSStringFromClass(class));
}

@end
