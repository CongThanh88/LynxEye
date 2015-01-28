//
//  LEViewController.m
//  Lynxeye
//
//  Created by Cong Thanh on 1/20/15.
//  Copyright (c) 2015 com.htam86. All rights reserved.
//

#import "LEViewController.h"
#import "GameLevel.h"

@interface LEViewController ()

@end

@implementation LEViewController
{
    NSArray *gameLevels;
    NSInteger currentLevel;
    GADBannerView *gadBannerView;
    NSInteger numberOfCorrect;
    NSInteger totalCorrectNumber;
    NSTimer *timer;
    int leftSeconds;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _btnSuggest.layer.cornerRadius = 4;
    _btnSuggest.layer.masksToBounds = YES;
    
    CGSize screenSize = [UIScreen  mainScreen].bounds.size;
    CGRect bannerFrame = CGRectMake(0, 0, screenSize.width, 50);
    // Replace this ad unit ID with your own ad unit ID.
    gadBannerView = [[GADBannerView alloc]initWithFrame:bannerFrame];
    gadBannerView.delegate = self;
    gadBannerView.adUnitID = @"ca-app-pub-7643684312776612/3491003487";
    gadBannerView.rootViewController = self;
    gadBannerView.adSize = kGADAdSizeBanner;
    [_bottomBannerContainer addSubview:gadBannerView];
    
    GADRequest *request = [GADRequest request];
    [gadBannerView loadRequest:request];

    NSArray *dictGameLevels = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"GameData" ofType:@"plist"]];
    gameLevels = [GameLevel parseListData:dictGameLevels];
    currentLevel = 0;
}


-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        CGSize realSizeView = _imvTopPicture.frame.size;
        for (GameLevel *gameLevel in gameLevels) {
            if (gameLevel) {
                [gameLevel updateMarkDataWithViewSize:realSizeView];
            }
        }
    });
}

- (void)adViewDidReceiveAd:(GADBannerView *)view
{
    
}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error
{
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _imvTopPicture.delegate = self;
    _imvBottomPicture.delegate = self;
    
    [self loadGame:currentLevel];
}

-(void)loadGame:(NSInteger)level
{
    if (gameLevels) {
        GameLevel *gameLevel = [gameLevels objectAtIndex:level];
        if (gameLevel) {
            if (gameLevel.gameData && gameLevel.gameData.listMarkPostions) {
                totalCorrectNumber = gameLevel.gameData.listMarkPostions.count;
            }
            leftSeconds = 30*totalCorrectNumber;
            if (timer) {
                [timer invalidate];
                timer = nil;
            }
            timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
            _lblCurrentLevel.text = [NSString stringWithFormat:@"LEVEL %d",(level+1)];
            _imvTopPicture.image = [UIImage imageNamed:gameLevel.leftImage];
            _imvBottomPicture.image = [UIImage imageNamed:gameLevel.rightImage];
            
            _imvTopPicture.data = gameLevel.gameData;
            _imvBottomPicture.data = gameLevel.gameData;
            
            [self updateCorrectNumberBaseTotalNumber];
        }
    }
}

-(void)updateTimer
{
    if(leftSeconds > 0 ){
        leftSeconds -- ;
        int minutes = (leftSeconds % 3600) / 60;
        int seconds = (leftSeconds %3600) % 60;
        _lblTimer.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }else{
        [timer invalidate];
        timer = nil;
    }
}

-(void)updateCorrectNumberBaseTotalNumber
{
    _lblCorrectNumber.text = [NSString stringWithFormat:@"%d/%d",numberOfCorrect, totalCorrectNumber];
}

#pragma mark - TouchedimageViewDelegate
-(void)touchedImageView:(TouchedImageView *)imageView markedOnFrame:(CGRect)frame
{
    numberOfCorrect ++;
    if (imageView == _imvTopPicture) {
        [_imvBottomPicture drawCircleOn:frame];
    }else{
        [_imvTopPicture drawCircleOn:frame];
    }
    [self updateCorrectNumberBaseTotalNumber];
    
    if (numberOfCorrect == totalCorrectNumber) {
        [self refreshGame];
    }
}

-(void)refreshGame
{
    numberOfCorrect = 0;
    if (gameLevels) {
        currentLevel = (currentLevel+1)%gameLevels.count;
    }
    [_imvTopPicture refreshView];
    [_imvBottomPicture refreshView];
    [_imvTopPicture resetData];
    [_imvBottomPicture resetData];
    
    [self loadGame:currentLevel];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSuggest:(id)sender {
}
@end
