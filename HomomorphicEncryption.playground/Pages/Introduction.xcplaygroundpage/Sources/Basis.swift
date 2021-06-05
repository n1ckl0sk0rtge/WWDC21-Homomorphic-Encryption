import Foundation

import Foundation

public class Basis : CustomStringConvertible {
    
    var space : Int
    var vectors : [Vector]
    
    public init? (space: Int, vectors: [Vector]) {
        
        guard vectors.count == space else {
            return nil
        }
        
        for v in vectors {
            if v.coefficients.count != space {
                return nil
            }
        }
        
        self.space = space
        self.vectors = vectors
        
    }
    
    public var description: String {
        
        var str = "{ "
        for i in 0..<vectors.count {
            str.append(vectors[i].description)
            
            if i < (vectors.count - 1) {
                str.append(", ")
            } else {
                str.append(" }")
            }
        }
        return str
    }
    
}
