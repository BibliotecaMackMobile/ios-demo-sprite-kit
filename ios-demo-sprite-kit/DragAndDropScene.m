//
//  DragAndDropScene.m
//  ios-demo-sprite-kit
//
//  Created by Renan Benevides Cargnin on 3/9/14.
//  Copyright (c) 2014 Renan Benevides Cargnin. All rights reserved.
//

#import "DragAndDropScene.h"
#import "MyScene.h"

@implementation DragAndDropScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        
        bear = [SKSpriteNode spriteNodeWithImageNamed:@"bear1"];
        [bear setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        bear.name = @"bear";
        [self addChild:bear];
        
        touchedBear = NO;
        
        [self createBackButton];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"bear"])
    {
        touchedBear = YES;
    }
    else if ([node.name isEqualToString:@"back"])
    {
        SKScene *scene = [[MyScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:scene];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"bear"])
    {
        if (touchedBear)
        {
            [bear setPosition:[touch locationInNode:self]];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"bear"])
    {
        touchedBear = NO;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
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
