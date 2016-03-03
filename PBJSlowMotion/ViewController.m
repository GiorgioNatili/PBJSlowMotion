//
//  ViewController.m
//  PBJSlowMotion
//
//  Created by Natili, Giorgio on 3/2/16.
//  Copyright © 2016 Natili, Giorgio. All rights reserved.
//

#import "ViewController.h"
#import <PBJVideoPlayer/PBJVideoPlayer.h>
#import "TTMAVCaptureManager.h"

@interface ViewController () {
    PBJVideoPlayerController *videoPlayerController;
}
@property (nonatomic, strong) TTMAVCaptureManager *captureManager;
@property (nonatomic, assign) NSTimer *timer;
@property (nonatomic, strong) UIImage *recStartImage;
@property (nonatomic, strong) UIImage *recStopImage;
@property (nonatomic, strong) UIImage *outerImage1;
@property (nonatomic, strong) UIImage *outerImage2;

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UISegmentedControl *fpsControl;
@property (nonatomic, weak) IBOutlet UIButton *recBtn;
@property (nonatomic, weak) IBOutlet UIImageView *outerImageView;
@property (nonatomic, weak) IBOutlet UIView *previewView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // allocate controller
    videoPlayerController = [[PBJVideoPlayerController alloc] init];
    videoPlayerController.delegate = self;
    videoPlayerController.view.frame = self.view.bounds;

    
}
- (IBAction)playVideo:(id)sender {
    
    // setup media
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"slow_motion" ofType:@"m4v"];
    
    videoPlayerController.videoPath = videoPath;

    [self addChildViewController:videoPlayerController];
    [self.view addSubview:videoPlayerController.view];
    [videoPlayerController didMoveToParentViewController:self];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
