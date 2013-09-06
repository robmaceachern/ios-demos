//
//  RMDemo4ViewController.m
//  Basic Demos
//
//  Created by Rob MacEachern on 2013-09-02.
//  Copyright (c) 2013 Rob MacEachern. All rights reserved.
//

#import "RMDemo4ViewController.h"

@interface RMDemo4ViewController ()

@end

@implementation RMDemo4ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.values = [NSMutableArray arrayWithArray:
                   @[@"Value 1", @"Value 2", @"Value 3", @"Value 4", @"Value 5"]];

    self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    static NSString *CellIdentifier = @"Demo4Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    cell.textLabel.text = [self.values objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *valueToMove = [self.values objectAtIndex:sourceIndexPath.row];
    [self.values removeObjectAtIndex:sourceIndexPath.row];
    [self.values insertObject:valueToMove atIndex:destinationIndexPath.row];
}


@end
