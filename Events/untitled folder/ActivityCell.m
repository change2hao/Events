//
//  ActivityCell.m
//  Events
//
//  Created by tianliwei on 6/16/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "ActivityCell.h"
#import "UIImageView+WebCache.h"
@implementation ActivityCell

- (void)loadContent:(ActivityModel *)model{
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:nil];
    self.descriptionLabel.text = [NSString stringWithFormat:@"  %@",model.name];
}
@end
