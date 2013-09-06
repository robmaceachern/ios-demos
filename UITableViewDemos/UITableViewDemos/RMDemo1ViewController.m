//
//  RMDemo1ViewController.m
//  Basic Demos
//
//  Created by Rob MacEachern on 2013-08-03.
//  Copyright (c) 2013 Rob MacEachern. All rights reserved.
//

#import "RMDemo1ViewController.h"

@interface RMDemo1ViewController ()

@end

@implementation RMDemo1ViewController

@synthesize values = _values;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.values = @[@"Value 1", @"Value 2", @"Value 3", @"Value 4", @"Value 5",
                    @"Value 6", @"Value 7", @"Value 8", @"Value 9", @"Value 10",
                    @"Value 11", @"Value 12", @"Value 13", @"Value 14", @"Value 15"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.values count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Demo1Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.values objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"icon.png"];
    
    NSLog(@"cellForRowAtIP");
    
    return cell;
}

@end