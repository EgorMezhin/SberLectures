//
//  BlocksTest.h
//  Lecture4Homework
//
//  Created by Egor Lass on 29.04.2021.
//

#import <Foundation/Foundation.h>
@interface BlocksTest : NSObject

//Объявляем блок как property
//
@property (nonatomic, copy) void (^ _Nullable completionBlock)( NSData * _Nonnull ,  NSError * _Nullable );

//Методы для тестов
//
- (void)testOutput;
- (void)testBlockStorageType;
- (void)stackBlockTest;
- (void)mallocBlockTest;
- (void)globalBlockTest;
- (void)oneMoreMallocBlockTest;
 
@end
