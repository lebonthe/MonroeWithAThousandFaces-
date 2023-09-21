//
//  ViewController.swift
//  MonroeWithAThousandFaces
//
//  Created by Min Hu on 2023/9/3.
//

import UIKit

class ViewController: UIViewController {
    // 連接夢露原圖
    @IBOutlet weak var marilynOriginImageView: UIImageView!
    // 連接四個 UIView
    @IBOutlet weak var hairView: UIView!
    @IBOutlet weak var lipsAndTeethView: UIView!
    @IBOutlet weak var eyeShadowView: UIView!
    @IBOutlet weak var faceView: UIView!
    // 屬於 Marilyn segmentedControl
    // 連接顏色 Slider
    @IBOutlet weak var faceRedColor: UISlider!
    @IBOutlet weak var faceGreenColor: UISlider!
    @IBOutlet weak var faceBlueColor: UISlider!
    
    @IBOutlet weak var hairRedColor: UISlider!
    @IBOutlet weak var hairGreenColor: UISlider!
    @IBOutlet weak var hairBlueColor: UISlider!
    
    @IBOutlet weak var lipsAndTeethRedColor: UISlider!
    @IBOutlet weak var lipsAndTeethGreenColor: UISlider!
    @IBOutlet weak var lipsAndTeethBlueColor: UISlider!
    
    @IBOutlet weak var eyeShadowRedColor: UISlider!
    @IBOutlet weak var eyeShadowGreenColor: UISlider!
    @IBOutlet weak var eyeShadowBlueColor: UISlider!
    
    @IBOutlet weak var backgroundRedColor: UISlider!
    @IBOutlet weak var backgroundGreenColor: UISlider!
    @IBOutlet weak var backgroundBlueColor: UISlider!
    // 連接透明 Slider
    @IBOutlet weak var alpha: UISlider!
    
    //  屬於 Frame segmentedControl
    @IBOutlet weak var BorderLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var borderSlider: UISlider!

    @IBOutlet weak var frameRedColorSlider: UISlider!
    @IBOutlet weak var frameGreenColorSlider: UISlider!
    @IBOutlet weak var frameBlueColorSlider: UISlider!
 
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var segmentedControlIndex = 0
    
    @IBOutlet weak var frameSettingView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 載入畫面時先將 frameSettingView 隱藏
        frameSettingView.isHidden = true
        
        // 設定 hairImageView 裝載頭髮圖片
        let hairImageView = UIImageView(image: UIImage(named: "Marilyn Hair"))
        // 將 hairImageView 的框架設定與頭髮圖片一樣邊界
        hairImageView.frame = hairView.bounds
        // 設定 hairImageView 的 contentMode 為按比例縮放填滿的 AspectFit
        hairImageView.contentMode = .scaleAspectFit
        // 將 hairImageView 設定為頭髮圖片的遮罩
        hairView.mask = hairImageView
        // 設定初始顏色，為了顯示出原本的頭髮顏色，所以透明度設定0，其他三色隨意
        hairView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        // 將頭髮 RGB 滑塊的 thumb 移動到中央
        hairRedColor.setValue(0.5, animated: true)
        hairGreenColor.setValue(0.5, animated: true)
        hairBlueColor.setValue(0.5, animated: true)
        
        // 設定 lipsAndTeethImageView 裝載唇齒圖片
        let lipsAndTeethImageView = UIImageView(image: UIImage(named: "Marilyn Lips and Teeth"))
        // 將 lipsAndTeethImageView 的框架設定與唇齒圖片一樣邊界
        lipsAndTeethImageView.frame = lipsAndTeethView.bounds
        // 設定 lipsAndTeethImageView 的 contentMode 為按比例縮放填滿的 AspectFit
        lipsAndTeethImageView.contentMode = .scaleAspectFit
        // 將 lipsAndTeethImageView 設定為唇齒圖片的遮罩
        lipsAndTeethView.mask = lipsAndTeethImageView
        // 設定初始顏色，為了顯示出原本的唇齒顏色，所以透明度設定0，其他三色隨意
        lipsAndTeethView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        // 將唇齒 RGB 滑塊的 thumb 移動到中央
        lipsAndTeethRedColor.setValue(0.5, animated: true)
        lipsAndTeethGreenColor.setValue(0.5, animated: true)
        lipsAndTeethBlueColor.setValue(0.5, animated: true)
        
        // 設定 faceImageView 裝載臉的圖片，此段內容與前兩段相似，只是替換掉底圖
        let faceImageView = UIImageView(image: UIImage(named: "Marilyn Face"))
        faceImageView.frame = faceView.bounds
        faceImageView.contentMode = .scaleAspectFit
        faceView.mask = faceImageView
        faceView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        faceRedColor.setValue(0.5, animated: true)
        faceGreenColor.setValue(0.5, animated: true)
        faceBlueColor.setValue(0.5, animated: true)
        
        // 設定 eyeShadowImageView 裝載眼影的圖片，此段內容與前三段相似，只是替換掉底圖
        let eyeShadowImageView = UIImageView(image: UIImage(named: "Marilyn Eye Shadow"))
        eyeShadowImageView.frame = eyeShadowView.bounds
        eyeShadowImageView.contentMode = .scaleAspectFit
        eyeShadowView.mask = eyeShadowImageView
        eyeShadowView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        eyeShadowRedColor.setValue(0.5, animated: true)
        eyeShadowGreenColor.setValue(0.5, animated: true)
        eyeShadowBlueColor.setValue(0.5, animated: true)
        
        
        // 設定透明背景，因為原圖為去背的 PNG 圖檔，因此不放任何顏色就是透明的顏色。
        marilynOriginImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        // 將背景 RGB 滑塊的 thumb 移動到中央
        backgroundRedColor.setValue(0.5, animated: true)
        backgroundGreenColor.setValue(0.5, animated: true)
        backgroundBlueColor.setValue(0.5, animated: true)
        
        // 將透明度滑塊的 thumb 移動到 0
        alpha.setValue(0, animated: true)
    }

    @IBAction func changeBackgroundColor(_ sender: Any) {
   
        marilynOriginImageView.backgroundColor = UIColor(red: CGFloat(backgroundRedColor.value), green: CGFloat(backgroundGreenColor.value), blue: CGFloat(backgroundBlueColor.value), alpha: CGFloat(alpha.value))
        
        
    }
    @IBAction func changeEyeShadowColor(_ sender: Any) {
        eyeShadowView.backgroundColor = UIColor(red: CGFloat(eyeShadowRedColor.value), green: CGFloat(eyeShadowGreenColor.value), blue: CGFloat(eyeShadowBlueColor.value), alpha: CGFloat(alpha.value))
    }
    
    @IBAction func changeLipsAndTeethColor(_ sender: Any) {
        lipsAndTeethView.backgroundColor = UIColor(red: CGFloat(lipsAndTeethRedColor.value), green: CGFloat(lipsAndTeethGreenColor.value), blue: CGFloat(lipsAndTeethBlueColor.value), alpha: CGFloat(alpha.value))
        
        
    }
    @IBAction func changeHairColor(_ sender: Any) {
        hairView.backgroundColor = UIColor(red: CGFloat(hairRedColor.value), green: CGFloat(hairGreenColor.value), blue: CGFloat(hairBlueColor.value), alpha: CGFloat(alpha.value))
        
    }
    @IBAction func changeFaceColor(_ sender: Any) {
        faceView.backgroundColor = UIColor(red: CGFloat(faceRedColor.value), green: CGFloat(faceGreenColor.value), blue: CGFloat(faceBlueColor.value), alpha: CGFloat(alpha.value))
    }

    @IBAction func randomChangeColor(_ sender: UIButton) {
        // 設定動畫，在前面區塊執行 0.3 秒的動畫後，執行後方區塊
        UIView.animate(withDuration: 0.3, animations: {
            // 設定 __Color 的值為 0-1 之間的亂數，開啟動畫
            self.faceRedColor.setValue(.random(in: 0...1), animated: true)
            self.faceGreenColor.setValue(.random(in: 0...1), animated: true)
            self.faceBlueColor.setValue(.random(in: 0...1), animated: true)
            
            self.hairRedColor.setValue(.random(in: 0...1), animated: true)
            self.hairGreenColor.setValue(.random(in: 0...1), animated: true)
            self.hairBlueColor.setValue(.random(in: 0...1), animated: true)
            
            self.lipsAndTeethRedColor.setValue(.random(in: 0...1), animated: true)
            self.lipsAndTeethGreenColor.setValue(.random(in: 0...1), animated: true)
            self.lipsAndTeethBlueColor.setValue(.random(in: 0...1), animated: true)
            
            self.eyeShadowRedColor.setValue(.random(in: 0...1), animated: true)
            self.eyeShadowGreenColor.setValue(.random(in: 0...1), animated: true)
            self.eyeShadowBlueColor.setValue(.random(in: 0...1), animated: true)
            
            self.backgroundRedColor.setValue(.random(in: 0...1), animated: true)
            self.backgroundGreenColor.setValue(.random(in: 0...1), animated: true)
            self.backgroundBlueColor.setValue(.random(in: 0...1), animated: true)
            
            self.alpha.setValue(.random(in: 0...1), animated: true)
        }){(finished) in // 後方區塊
            // 剛前方亂數得到的值生成顏色顯示
            self.faceView.backgroundColor = UIColor(red: CGFloat(self.faceRedColor.value), green: CGFloat(self.faceGreenColor.value), blue: CGFloat(self.faceBlueColor.value), alpha: CGFloat(self.alpha.value))
            
            
            self.hairView.backgroundColor = UIColor(red: CGFloat(self.hairRedColor.value), green: CGFloat(self.hairGreenColor.value), blue: CGFloat(self.hairBlueColor.value), alpha: CGFloat(self.alpha.value))
            
            
            self.lipsAndTeethView.backgroundColor = UIColor(red: CGFloat(self.lipsAndTeethRedColor.value), green: CGFloat(self.lipsAndTeethGreenColor.value), blue: CGFloat(self.lipsAndTeethBlueColor.value), alpha: CGFloat(self.alpha.value))
            
            
            self.eyeShadowView.backgroundColor = UIColor(red: CGFloat(self.eyeShadowRedColor.value), green: CGFloat(self.eyeShadowGreenColor.value), blue: CGFloat(self.eyeShadowBlueColor.value), alpha: CGFloat(self.alpha.value))
            
            
            self.marilynOriginImageView.backgroundColor = UIColor(red: CGFloat(self.backgroundRedColor.value), green: CGFloat(self.backgroundGreenColor.value), blue: CGFloat(self.backgroundBlueColor.value), alpha: CGFloat(self.alpha.value))
            
        }
    }
    // 重新設定
    @IBAction func resetColor(_ sender: UIButton) {
        viewDidLoad()
    }
    // Segmented Control
    @IBAction func clickSegmentedControl(_ sender: UISegmentedControl) {
        segmentedControlIndex = segmentedControl.selectedSegmentIndex
       
        if  segmentedControlIndex == 1 {
            frameSettingView.isHidden = false
        } else{
            frameSettingView.isHidden = true
        }
    }
    
    // 調整框線寬度
    @IBAction func changeBorder(_ sender: UISlider) {
        marilynOriginImageView.clipsToBounds = true
        marilynOriginImageView.layer.borderWidth = CGFloat(borderSlider.value)
    }
    
    // 設定外框顏色
    @IBAction func changeFrameColor(_ sender: Any) {
       
        marilynOriginImageView.layer.borderColor = CGColor(red: CGFloat(frameRedColorSlider.value), green: CGFloat(frameGreenColorSlider.value), blue: CGFloat(frameBlueColorSlider.value), alpha: 1)
    }
    // 隨機生成外框顏色
    @IBAction func randomChangeFrameColor(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            self.frameRedColorSlider.setValue(.random(in: 0...1), animated: true)
            self.frameGreenColorSlider.setValue(.random(in: 0...1), animated: true)
            self.frameBlueColorSlider.setValue(.random(in: 0...1), animated: true)

        }){(finished)in
            self.marilynOriginImageView.layer.borderColor = CGColor(red: CGFloat(self.frameRedColorSlider.value), green: CGFloat(self.frameGreenColorSlider.value), blue: CGFloat(self.frameBlueColorSlider.value), alpha: 1)
    }
    }
    // 重新設定
    @IBAction func resetFrameColor(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
            self.frameRedColorSlider.setValue(0, animated: true)
            self.frameGreenColorSlider.setValue(0, animated: true)
            self.frameBlueColorSlider.setValue(0, animated: true)
        }){(Finished)in
            self.marilynOriginImageView.layer.borderColor = CGColor(red: CGFloat(self.frameRedColorSlider.value), green: CGFloat(self.frameGreenColorSlider.value), blue: CGFloat(self.frameBlueColorSlider.value), alpha: 1)
        }
    }
}


