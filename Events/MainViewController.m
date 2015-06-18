//
//  ViewController.m
//  Events
//
//  Created by tianliwei on 6/15/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "MainViewController.h"
#import "ActivityDetailViewController.h"
#import "HttpManager.h"
#import "ActivityCell.h"
#import "SVProgressHUD.h"
@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *activities;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    self.activities = [NSMutableArray array];
    HttpManager *httpManager = [[HttpManager alloc]init];
    [httpManager getTourActivityCompletion:^(NSArray *results) {
        [self.activities addObjectsFromArray:results];
        [self.collectionView reloadData];
        [SVProgressHUD dismiss];
    } error:^(NSString *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.activities.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ActivityCell";
    ActivityCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    ActivityModel *item = [self.activities objectAtIndex:indexPath.row];
    [cell loadContent:item];
    return cell;
}

#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ActivityModel *item = [self.activities objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ActivityDetailSegue" sender:item];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ActivityDetailSegue"])
    {
        // Get reference to the destination view controller
        ActivityDetailViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        [vc setActivityModel:sender];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
