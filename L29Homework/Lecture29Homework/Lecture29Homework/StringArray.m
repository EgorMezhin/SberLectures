//
//  StringArray.m
//  Lecture29Homework
//
//  Created by Egor Lass on 08.07.2021.
//

#import "StringArray.h"

@implementation StringArray

- (NSArray *)getStringArray {
    
    NSArray *array = @[
        @"eireene",
        @"egor",
        @"earleen",
        @"easter",
        @"veronika",
        @"ekaterina",
        @"eerika"
        ];
    
    NSLog(@"Initial Array: %@", array);
    
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id  _Nonnull objOne, id  _Nonnull objTwo)
                            {
        
        NSUInteger objOneLetterCount = [[objOne componentsSeparatedByString:@"e"] count];
        NSUInteger objTwoLetterCount = [[objTwo componentsSeparatedByString:@"e"] count];
        
        if (objOneLetterCount < objTwoLetterCount) {
            return NSOrderedAscending;
        } else if (objTwoLetterCount < objOneLetterCount) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    return sortedArray;
}

@end
