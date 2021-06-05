import Foundation

public class Vector : Polynomial {
    
    public init (values: [Int]) {
        super.init(coefficients: values.map({ Int64($0) }) )
    }
    
    public override var description: String {
        return "\(self.coefficients.map({ Int($0) }))" 
    }
    
}
