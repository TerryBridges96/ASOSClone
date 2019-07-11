import Foundation
import UIKit

class TableData {
    let sectionLabel = ["NEW IN", "CLOTHING", "SHOES", "ACCESSORIES", "ACTIVEWEAR", "FACE + BODY", "LIVING + GIFTS", "BRANDS", "OUTLET"]
    
    var menImages: [UIImage] = [
        UIImage(named: "newin")!,
        UIImage(named: "clothing")!,
        UIImage(named: "menShoes")!,
        UIImage(named: "menAccess")!,
        UIImage(named: "activewear")!,
        UIImage(named: "menFace")!,
        UIImage(named: "menGift")!,
        UIImage(named: "brands")!,
        UIImage(named: "menOutlet")!
    ]
    
    var womanImages: [UIImage] = [
        UIImage(named: "womenNewin")!,
        UIImage(named: "womenClothing")!,
        UIImage(named: "womenShoes")!,
        UIImage(named: "womenAccess")!,
        UIImage(named: "womenActivewear")!,
        UIImage(named: "womensFace")!,
        UIImage(named: "womenGift")!,
        UIImage(named: "brands")!,
        UIImage(named: "womenOutlet")!
    ]
}
