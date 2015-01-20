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
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
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
            
            _imvTopPicture.image = [UIImage imageNamed:gameLevel.leftImage];
            _imvBottomPicture.image = [UIImage imageNamed:gameLevel.rightImage];
            
            _imvBottomPicture.data = gameLevel.gameData;
            _imvBottomPicture.data = gameLevel.gameData;
            
        }
    }
}

#pragma mark - TouchedimageViewDelegate
-(void)touchedImageView:(TouchedImageView *)imageView markedOnFrame:(CGRect)frame
{
    if (imageView == _imvTopPicture) {
        [_imvTopPicture drawCircleOn:frame];
    }else{
        [_imvBottomPicture drawCircleOn:frame];
    }
}

-(void)refreshGame
{
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

@end
