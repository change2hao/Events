//
//  ActivityDetailViewController.m
//  Events
//
//  Created by tianliwei on 6/17/15.
//  Copyright (c) 2015 Beijing Jaeger Communication Electronic Technology Co.,Ltd. All rights reserved.
//

#import "ActivityDetailViewController.h"
#import "HttpManager.h"
#import "StatusManager.h"
#import "QBImagePickerController.h"
#import "Macros.h"
#import "SVProgressHUD.h"
@interface ActivityDetailViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, QBImagePickerControllerDelegate, UIActionSheetDelegate>

@end

@implementation ActivityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.activityModel.name;
    self.describeLabel.text = self.activityModel.describe;
    [StatusManager registerTourID:self.activityModel.tour_id];
}

- (IBAction)uploadImage:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:@"上传照片" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册选择",@"使用手机拍照", nil];
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self openPics];
    }else if (buttonIndex == 1){
        [self openCamera];
    }
}

// 打开相机
- (void)openCamera {
    // UIImagePickerControllerCameraDeviceRear 后置摄像头
    // UIImagePickerControllerCameraDeviceFront 前置摄像头
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.delegate = self;
    // 编辑模式
    imagePicker.allowsEditing = NO;
    [self presentViewController:imagePicker animated:YES completion:^{
    }];
}

// 打开相册
- (void)openPics {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.delegate = self;
    imagePicker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    imagePicker.allowsEditing = NO;
//    UIView *overlayView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT - 128)];
//    overlayView.backgroundColor = [UIColor clearColor];
//    imagePicker.cameraOverlayView = overlayView;
    [self presentViewController:imagePicker animated:YES completion:^{
    }];
}

// 选中照片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"%@", info);
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]){
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        HttpManager *manager = [[HttpManager alloc] init];
        [SVProgressHUD show];
        [manager postPhotoWithData:image parameter:[StatusManager parameter] completion:^(MTLModel *result) {
            UploadSuccessModel *model = (UploadSuccessModel *)result;
            if ([model.errorCode integerValue] == 0){
                [SVProgressHUD showSuccessWithStatus:@"上传成功"];
            }else{
                [SVProgressHUD showErrorWithStatus:@"上传失败"];
            }
        } error:^(NSString *error) {
            [SVProgressHUD showErrorWithStatus:@"上传失败"];
        }];
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

// 取消相册
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
