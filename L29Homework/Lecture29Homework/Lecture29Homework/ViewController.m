//
//  ViewController.m
//  Lecture29Homework
//
//  Created by Egor Lass on 07.07.2021.
//

#import "ViewController.h"
#import "StringArrayDelegate.h"
#import "StringArray.h"


@interface ViewController ()

@property (nonatomic, strong) id<StringArrayDelegate> stringsArrayDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stringsArrayDelegate = [[StringArray alloc] init];
    NSArray *sortedArray = [self.stringsArrayDelegate getStringArray];
    NSLog(@"Sorted Array: %@", sortedArray);
}


@end
