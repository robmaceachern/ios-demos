//
//  RMDemo3ViewController.m
//  Basic Demos
//
//  Created by Rob MacEachern on 2013-08-04.
//  Copyright (c) 2013 Rob MacEachern. All rights reserved.
//

#import "RMDemo3ViewController.h"

@interface RMDemo3ViewController ()

@end

@implementation RMDemo3ViewController

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
    static NSString *cellIdentifier = @"Demo3Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.values objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"icon.png"];
        
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.values removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (IBAction)addValue:(id)sender
{
    static NSUInteger newCounter = 1;
    [self.values addObject:[NSString stringWithFormat:@"Added New Value %d", newCounter++]];
    
    NSIndexPath *newRowIndexPath = [NSIndexPath indexPathForRow:([self.values count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newRowIndexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    [self.tableView scrollToRowAtIndexPath:newRowIndexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

@end