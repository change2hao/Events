//
//  ActivityCell.h
//  Events
//
//  Created by tianliwei on 6/16/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ActivityCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (void)loadContent:(ActivityModel *)model;
@end
