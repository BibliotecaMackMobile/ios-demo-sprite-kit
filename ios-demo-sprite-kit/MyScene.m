//
//  MyScene.m
//  ios-demo-sprite-kit
//
//  Created by Renan Benevides Cargnin on 3/8/14.
//  Copyright (c) 2014 Renan Benevides Cargnin. All rights reserved.
//

#import "MyScene.h"
#import "AnimatedSpriteScene.h"
#import "DragAndDropScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        animatedSpriteButton = [SKSpriteNode spriteNodeWithImageNamed:@"animatedSprite"];
        dragAndDropButton = [SKSpriteNode spriteNodeWithImageNamed:@"dragAndDrop"];
        moveActionButton = [SKSpriteNode spriteNodeWithImageNamed:@"moveAction"];
        physicsSimulationButton = [SKSpriteNode spriteNodeWithImageNamed:@"physicsSimulation"];
        
        animatedSpriteButton.name = @"animatedSprite";
        dragAndDropButton.name = @"dragAndDrop";
        moveActionButton.name = @"moveAction";
        physicsSimulationButton.name = @"physicsSimulation";
        
        animatedSpriteButton.position = CGPointMake(animatedSpriteButton.size.width / 2, self.size.height / 2 + animatedSpriteButton.size.height / 2);
        
        dragAndDropButton.position = CGPointMake(self.size.width - dragAndDropButton.size.width / 2, self.size.height / 2 + dragAndDropButton.size.height / 2);
        
        moveActionButton.position = CGPointMake(moveActionButton.size.width / 2, self.size.height / 2 - moveActionButton.size.height / 2);
        
        physicsSimulationButton.position = CGPointMake(self.size.width - physicsSimulationButton.size.width / 2, self.size.height / 2 - physicsSimulationButton.size.height / 2);
        
        [self addChild:animatedSpriteButton];
        [self addChild:dragAndDropButton];
        [self addChild:moveActionButton];
        [self addChild:physicsSimulationButton];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    
    NSLog(@"%@", node.name);
    
    SKScene *scene;
    
    if ([node.name isEqualToString:@"animatedSprite"])
    {
        scene = [[AnimatedSpriteScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:scene];
    }
    else if ([node.name isEqualToString:@"dragAndDrop"])
    {
        scene = [[DragAndDropScene alloc] initWithSize:self.size];
        [self.scene.view presentScene:scene];
    }
    
    /*
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
     */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
