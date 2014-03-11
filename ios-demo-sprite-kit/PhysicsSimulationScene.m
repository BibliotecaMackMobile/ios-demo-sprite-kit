//
//  PhysicsSimulationScene.m
//  ios-demo-sprite-kit
//
//  Created by Renan Cargnin on 3/11/14.
//  Copyright (c) 2014 Renan Benevides Cargnin. All rights reserved.
//

#import "PhysicsSimulationScene.h"
#import "MyScene.h"

@implementation PhysicsSimulationScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        
        [self setPhysicsBody:[SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame]];
        
        ball = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
        [ball setScale:0.25];
        [ball setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        
        ball.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ball.size.width / 2];
        [ball.physicsBody setRestitution:0.5];
        
        ball.name = @"ball";
        
        [self addChild:ball];
        
        [self createBackButton];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    if ([node.name isEqualToString:@"back"])
    {
        SKScene *scene = [[MyScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:scene];
    }
    else if ([node.name isEqualToString:@"ball"])
    {
        [ball.physicsBody applyImpulse:CGVectorMake((location.x - ball.position.x) * -1, 100) atPoint:location];
    }
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
