import UIKit
import XCPlayground

public class ArrayStackView: UIView {
    public var values: [Int] = [] {
        didSet {
            updateAllViews()
        }
    }
    
    convenience public init() {
        self.init(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .grayColor()
    }

    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func insertValues(newValues: [Int], startingFrom start: Int) {
        var currentValues = values
        
        for (index, value) in newValues.enumerate() {
            currentValues[index + start] = value
        }
        
        values = currentValues
    }
    
    func updateAllViews() {
        for view in subviews {
            view.removeFromSuperview()
        }

        var maxValue = 0

        for value in values {
            if value > maxValue {
                maxValue = value
            }
        }
        
        let width = frame.width / CGFloat(values.count)
        
        for (index, value) in values.enumerate() {
            addViewWithHeight(value, width: width, x: width*CGFloat(index), maxHeight: maxValue)
        }
    }
    
    public func captureView(identifier: String) {
        XCPCaptureValue(identifier, value: self)
    }
    
    public func showView(identifier: String) {
        XCPShowView(identifier, view: self)
    }
    
    func addViewWithHeight(height: Int, width: CGFloat, x: CGFloat, maxHeight: Int) {
        let percentage = CGFloat(height) / CGFloat(maxHeight)
        let height = self.frame.height * percentage
        let view = UIView(frame: CGRect(x: x, y: self.frame.height - height, width: width, height: height))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colorForPercentage(percentage)
//        view.layer.borderColor = UIColor.blackColor().CGColor
//        view.layer.borderWidth = 1.0
        addSubview(view)
    }
    
    func colorForPercentage(percentage: CGFloat) -> UIColor {
        return UIColor(hue: percentage, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
}