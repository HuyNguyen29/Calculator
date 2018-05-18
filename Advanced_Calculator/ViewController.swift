import UIKit
import MathParser
class ViewController: UIViewController {

    override func viewDidLoad()  {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 1...28{
            view.viewWithTag(i)?.layer.borderWidth = 2.0
            view.layer.borderColor = UIColor.red.cgColor
        }
    }
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var secondLabel: UILabel!
    func tinhtoan(_stringMaths:String) -> String{
        do{
            let value = try _stringMaths.evaluate()
             return String(value)
        }
        catch let other as MathParserError{
           // print(other.kind)
            let sss = String("\(other.kind)")
            if sss! == "missingCloseParenthesis"{
                return "Lỗi: Thiếu đóng ngoặc! "
            }
            else if sss! == "missingOpenParenthesis"{
                return "Lỗi: Thiếu mở ngoặc! "
            }
            else if sss!.range(of: "multiply") != nil{
                return "Lỗi: Sai toán tử * "
            }
            else if sss!.range(of: "divide") != nil{
                return "Lỗi: Sai toán tử / "
            }else if sss!.range(of: "subtract") != nil{
                return "Lỗi: Sai toán tử - "
            }else if sss!.range(of: "add") != nil{
                return "Lỗi: Sai toán tử +"
            }
            else if  sss!.range(of:"emptyGroup") != nil{
                return "Lỗi: Rỗng trong ngoặc!"
            }

            else{
                return "Lỗi khác!"
            
            }
            
        }
        catch{
             return "Unknown Error!"
            
        }
    }

  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var stringMathematic: String = "" // Example
    var result  : String = ""
    //button->tag
    //0->1.    3->4.     6->7.      9->10
    //1->2.    4->5.     7->8.      (->11
    //2->3.    5->6.     8->9.      )->12
    ///->13.   x->14.    - ->15.    +->16
    // =->17.  .->18.   C->19.    can->20.
    //log->21. x2->22.  +/- ->23. sin->24.
    //cos->25. tan->26.  pi->27

    @IBAction func buttonEqual(_ sender: UIButton) {
        
        if label.text != ""
        {
            result = tinhtoan(_stringMaths: stringMathematic)
            //label.text = String(result)
            secondLabel.text = result
            
        }
    }

    @IBAction func buttonClear(_ sender: UIButton) {
            result = ""
            stringMathematic = ""
            label.text = ""
            secondLabel.text = ""
    }
    @IBAction func buttonNumber1to9(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "π" || string == ")"){
                stringMathematic = stringMathematic + "*" + sender.currentTitle!
                label.text = stringMathematic
            }
            else{
                stringMathematic = stringMathematic + sender.currentTitle!
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = stringMathematic + sender.currentTitle!
            label.text = stringMathematic
        }
    }
    @IBAction func buttonDot(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9"){
                stringMathematic = stringMathematic + "." + sender.currentTitle!
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = "0." + sender.currentTitle!
            label.text = stringMathematic
        }
    }
    @IBAction func buttonOperation(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")"){
                stringMathematic = stringMathematic +  sender.currentTitle!
                label.text = stringMathematic
            }
        }
    }
    @IBAction func buttonSCTL(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")"){
                stringMathematic = stringMathematic + "*" + sender.currentTitle! + "("
                label.text = stringMathematic
            }
            else{
                stringMathematic = stringMathematic  + sender.currentTitle! + "("
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = stringMathematic  + sender.currentTitle! + "("
            label.text = stringMathematic
        }
    }
    @IBAction func buttonOpenParent(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")" ){
                stringMathematic = stringMathematic + "*" + sender.currentTitle!
                label.text = stringMathematic
            }
            else{
                stringMathematic = stringMathematic + sender.currentTitle!
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = stringMathematic  + sender.currentTitle!
            label.text = stringMathematic
        }
    }
    @IBAction func buttonCloseParent(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")"){
                stringMathematic = stringMathematic +  sender.currentTitle!
                label.text = stringMathematic
            }
            else{
                stringMathematic = stringMathematic +  sender.currentTitle!
                label.text = stringMathematic
            }
        }
    }
    
    @IBAction func buttonPi(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")"){
                stringMathematic = stringMathematic + "*" +  "π"
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = stringMathematic +  "π"
            label.text = stringMathematic 
        }
       
    }
    @IBAction func buttonSQRT(_ sender: UIButton) {
        if label.text != ""
        {
            let string = stringMathematic.characters.last!
            if (string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9" || string == "π" || string == ")"){
                stringMathematic = stringMathematic + "*" +  "sqrt("
                label.text = stringMathematic
            }
        }
        else{
            stringMathematic = stringMathematic + "sqrt("
            label.text = stringMathematic
        }
        
    }
    @IBAction func buttonChangeStatus(_ sender: UIButton) {
        stringMathematic = String((Double(stringMathematic)!)*(-1.0))
        label.text = stringMathematic
    }
    @IBAction func DEL(_ sender: UIButton) {
        if label.text != "" {
            stringMathematic = String(stringMathematic.characters.dropLast())
            label.text = stringMathematic
        }
    }
}
    
