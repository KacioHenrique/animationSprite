//
//  GameScene.swift
//  animation
//
//  Created by kacio henrique couto batista on 24/05/2018.
//  Copyright © 2018 kacio henrique couto batista. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var manGuy = SKSpriteNode()
    var textureAtlas = SKTextureAtlas()
    var textureArray:[SKTexture] = []
    override func didMove(to view: SKView) {
        textureAtlas = SKTextureAtlas(named:"imagens")
        print(textureAtlas.textureNames.count)
        for i in 1..<textureAtlas.textureNames.count{
            let name = "win_\(i)"
            textureArray.append(SKTexture(imageNamed: name))
            
        }
        manGuy = SKSpriteNode(imageNamed: textureAtlas.textureNames[0] )
        manGuy.size = CGSize(width: 70, height: 140)
        manGuy.position = CGPoint(x: 0, y: 0)
        self.addChild(manGuy)
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
     
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        manGuy.run(SKAction.repeatForever(SKAction.animate(with:textureArray, timePerFrame: 0.1)))
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
