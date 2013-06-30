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

-(void) initRobot {
    
    size = [[CCDirector sharedDirector] winSize];
    
    robot = [CCSprite spriteWithFile:@"spritebots_still_1.png"];
    robot.position = ccp(size.width/2, size.height/2);
    [self addChild:robot];
    
}

-(void) animateRobot {
    
    CCAnimation* robotAnim = [CCAnimation animation];
    for (int i = 2 ; i < 5 ; i++) {
        [robotAnim addSpriteFrameWithFilename:[NSString stringWithFormat:@"spritebots_move_%i.png", i]];
    }
    
    [robotAnim setDelayPerUnit:0.3f];
    [robotAnim setRestoreOriginalFrame:YES];
    
    robotAnimationAction = [CCAnimate actionWithAnimation:robotAnim];
    CCRepeatForever* repeatRobotAnimation = [CCRepeatForever actionWithAction:robotAnimationAction];
    [robot runAction:repeatRobotAnimation];
    
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        self.touchEnabled = YES;
        
        // init the robot sprite
        [self initRobot];

	}
	return self;
}

- (void)registerWithTouchDispatcher
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:
     self priority:0 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    return YES;
    
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event{
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    float robotVeolocity = size.width / 5.0;
    CGPoint moveDifference = ccpSub(touchLocation, robot.position);
    float distanceToMove = ccpLength(moveDifference);
    float moveDuration = distanceToMove / robotVeolocity;
    
    if (moveDifference.x<0) {
        robot.flipX = YES;
    } else {
        robot.flipX = NO;
    }
    
    [self animateRobot];
    [robot runAction:[CCMoveTo actionWithDuration:moveDuration position:touchLocation]];
    
}

@end
