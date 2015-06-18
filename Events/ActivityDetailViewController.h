//
//  ActivityDetailViewController.h
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ActivityDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (nonatomic, strong) ActivityModel *activityModel;
@end
