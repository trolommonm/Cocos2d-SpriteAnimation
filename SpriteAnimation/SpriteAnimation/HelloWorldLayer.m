//
//  HelloWorldLayer.m
//  SpriteAnimation
//
//  Created by Alvin Tan De Jun on 30/6/13.
//  Copyright Alvin Tan De Jun 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];
        CCSprite *robot = [CCSprite spriteWithFile:@"spritebots_still_1.png"];
        robot.position = ccp(size.width/2, size.height/2);
        [self addChild:robot];
        
        CCAnimation* robotAnim = [CCAnimation animation];
        [robotAnim addSpriteFrameWithFilename:@"spritebots_move_2.png"];
        [robotAnim addSpriteFrameWithFilename:@"spritebots_move_3.png"];
        [robotAnim addSpriteFrameWithFilename:@"spritebots_move_4.png"];
        [robotAnim setDelayPerUnit:0.2f];
        [robotAnim setRestoreOriginalFrame:YES];
        
        CCAnimate* robotAnimationAction = [CCAnimate actionWithAnimation:robotAnim];
        CCRepeatForever* repeatRobotAnimation = [CCRepeatForever actionWithAction:robotAnimationAction];
        [robot runAction:repeatRobotAnimation];

	}
	return self;
}

@end
