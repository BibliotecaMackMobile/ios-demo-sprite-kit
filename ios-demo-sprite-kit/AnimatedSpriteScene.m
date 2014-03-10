//
//  AnimatedSpriteScene.m
//  ios-demo-sprite-kit
//
//  Created by Renan Benevides Cargnin on 3/8/14.
//  Copyright (c) 2014 Renan Benevides Cargnin. All rights reserved.
//

#import "AnimatedSpriteScene.h"
#import "MyScene.h"

@implementation AnimatedSpriteScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        
        NSMutableArray *walkingFrames = [NSMutableArray array];
        SKTextureAtlas *bearAnimatedAtlas = [SKTextureAtlas atlasNamed:@"BearImages"];
        
        int numImages = bearAnimatedAtlas.textureNames.count;
        for (int i=1; i <= numImages; i++) {
            NSString *textureName = [NSString stringWithFormat:@"bear%d", i];
            SKTexture *temp = [bearAnimatedAtlas textureNamed:textureName];
            [walkingFrames addObject:temp];
        }
        bearFrames = walkingFrames;
        
        SKTexture *temp = bearFrames[0];
        bear = [SKSpriteNode spriteNodeWithTexture:temp];
        bear.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:bear];
        [self startWalking];
        
        [self createBackButton];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"back"])
    {
        SKScene *scene = [[MyScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:scene];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)startWalking
{
    //This is our general runAction method to make our bear walk.
    [bear runAction:[SKAction repeatActionForever:
                      [SKAction animateWithTextures:bearFrames
                                       timePerFrame:0.1f
                                             resize:NO
                                            restore:YES]] withKey:@"walkingInPlaceBear"];
    return;
}

-(void)createBackButton
{
    backButton = [SKSpriteNode spriteNodeWithColor:[UIColor redColor] size:CGSizeMake(60, 30)];
    [backButton setPosition:CGPointMake(backButton.size.width / 2 + 20, self.size.height - backButton.size.height / 2 - 20)];
    
    SKLabelNode *backText = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    backText.text = @"Back";
    backText.fontSize = 24;
    [backText setPosition:CGPointMake(backText.position.x, backText.position.y - 10)];
    
    [backButton addChild:backText];
    
    backButton.name = @"back";
    backText.name = @"back";
    
    [self addChild:backButton];
}

@end
