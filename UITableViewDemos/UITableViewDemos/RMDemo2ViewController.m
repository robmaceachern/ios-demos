//
//  RMDemo2ViewController.m
//  Basic Demos
//
//  Created by Rob MacEachern on 2013-08-03.
//  Copyright (c) 2013 Rob MacEachern. All rights reserved.
//

#import "RMDemo2ViewController.h"
#import "RMDemo2CustomCell.h"

@interface RMDemo2ViewController ()

@end

@implementation RMDemo2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.values = @[ @"Value 1", @"Value 2", @"Value 3", @"Value 4", @"Value 5",
                     @"Value 6", @"Value 7", @"Value 8", @"Value 9", @"Value 10",
                     @"Value 11", @"Value 12", @"Value 13", @"Value 14", @"Value 15",
                     @"Value 16", @"Value 17", @"Value 18", @"Value 19", @"Value 20"];
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
    static NSString *CellIdentifier = @"Demo2Cell";
    RMDemo2CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.progressView.progress = (indexPath.row + 1) * 1.0 / [self.values count];
    cell.mainLabel.text = [self.values objectAtIndex:indexPath.row];
    
    return cell;
}

@end