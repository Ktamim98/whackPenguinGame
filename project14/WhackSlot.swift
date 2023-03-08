//
//  WhackSlot.swift
//  project14
//
//  Created by Tamim Khan on 7/3/23.
//
import SpriteKit
import UIKit

class WhackSlot: SKNode {
    var charNode: SKSpriteNode!
    
    
    var isVisible = false
   var isHit = false
    
    
    func configure(at position: CGPoint){
        self.position = position
        
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -83)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        
        addChild(cropNode)
    }
    
    func show(hideTime: Double){
        if isVisible {return}
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.run(SKAction.moveBy(x: 0, y: 80, duration: 0.05))
        isVisible = true
        isHit = false
        
        if Int.random(in: 0...2 ) == 0{
            charNode.texture = SKTexture(imageNamed: "penguinGood")
            charNode.name = "charFriend"
        }else{
            charNode.texture = SKTexture(imageNamed: "penguinEvil")
            charNode.name = "charEnemy"
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (hideTime * 3.5)) { [weak self] in
            self?.hide()
        }
        
    }
    
    
    func hide(){
        if !isVisible {return}
        
        charNode.run(SKAction.moveBy(x: 0, y: -80, duration: 0.05))
        isVisible = false
    }
    func hit(){
        isHit = true
        
        
        if let smokeParticle = SKEmitterNode(fileNamed: "smoke") {
            smokeParticle.position = charNode.position
            
            let smokeSequence = SKAction.sequence([
                SKAction.run { [weak self] in self?.addChild(smokeParticle) },
                SKAction.wait(forDuration: 3.0),
                SKAction.run { smokeParticle.removeFromParent() }
            ])
            
            run(smokeSequence)
        }
        
        
        let delay = SKAction.wait(forDuration: 0.25)
        let hide = SKAction.moveBy(x: 0, y: -80, duration: 0.5)
        let notVisible = SKAction.run {[unowned self] in self.isVisible = false}
        charNode.run(SKAction.sequence([delay, hide, notVisible]))
        
      
        
        
    }
    
    
    
}
