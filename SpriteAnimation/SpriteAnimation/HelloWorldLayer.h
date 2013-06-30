//
//  HelloWorldLayer.h
//  SpriteAnimation
//
//  Created by Alvin Tan De Jun on 30/6/13.
//  Copyright Alvin Tan De Jun 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CGSize size;
    CCSprite *robot;
    CCAnimate *robotAnimationAction;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
