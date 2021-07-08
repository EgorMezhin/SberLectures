//
//  StringArray.h
//  Lecture29Homework
//
//  Created by Egor Lass on 08.07.2021.
//

#import <Foundation/Foundation.h>
#import "StringArrayDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface StringArray : NSObject <StringArrayDelegate>

- (NSArray *)getStringArray;

@end

NS_ASSUME_NONNULL_END
