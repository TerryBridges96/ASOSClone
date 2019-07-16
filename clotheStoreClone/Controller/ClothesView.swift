import Foundation
import UIKit


class ClothesView: UIViewController {
    
    var dataRecieved = ""
    var imageRecieved = UIImage()
    
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var sectionTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionTitle.text = dataRecieved
        sectionImage.image = imageRecieved
        
        //sectionTitle.text = tableData.sectionLabel[index.myIndex]
        //sectionImage.image = tableData.menImages[index.myIndex]
        
        
    }
}
