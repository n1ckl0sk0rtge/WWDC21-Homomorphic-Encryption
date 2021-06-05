//
//  Polynomials.swift
//  IntegerHomomorphicEncryption
//
//  Created by Nicklas Körtge on 09.04.21.
//  https://rosettacode.org/wiki/Polynomial_synthetic_division#Python

import Foundation

open class Polynomial : CustomStringConvertible {
    
    public var coefficients = [Double]()
    public var dimension : Int = 0
    
    public init(coefficients: [Int64]) {
        self.coefficients = Int_arr_to_double(arr: coefficients)
        self.dimension = coefficients.count
    }
    
    public init(coefficients: [Double]) {
        self.coefficients = coefficients
        self.dimension = coefficients.count
    }
    
    private func Int_arr_to_double(arr: [Int64]) -> [Double] {
        var d_arr = [Double]()
        
        for value in arr {
            d_arr.append(Double(value))
        }
        
        return d_arr
    }
    
    public func floorP() -> Polynomial {
        
        var coef = [Double](repeating: 0.0, count: self.coefficients.count)
        
        for i in 0..<self.coefficients.count {
            coef[i] = floor(self.coefficients[i])
        }
        
        return Polynomial(coefficients: coef)
    }
    
    public func roundP() -> Polynomial {
        
        var coef = [Double](repeating: 0.0, count: self.coefficients.count)
        
        for i in 0..<self.coefficients.count {
            coef[i] = round(self.coefficients[i])
        }
        
        return Polynomial(coefficients: coef)
    }
    
    open var description: String {
        return "\(self.coefficients.map({ $0 }))"
    }
    
}

public func ==(lhs: Polynomial, rhs: Polynomial) -> Bool {
    return lhs.coefficients == rhs.coefficients
}

public func +(lhs: Polynomial, rhs: Polynomial) -> Polynomial {
    
    let size = max(lhs.coefficients.count, rhs.coefficients.count)
    var coef = [Double](repeating: 0.0, count: size)
    
    for i in 0..<lhs.coefficients.count {
        coef[i] = lhs.coefficients[i]
    }
    
    for j in 0..<rhs.coefficients.count {
        coef[j] += rhs.coefficients[j]
    }
    
    return Polynomial(coefficients: coef)
    
}

public func +(lhs: Polynomial, rhs: Double) -> Polynomial {
    
    var coef = [Double](repeating: 0.0, count: lhs.coefficients.count)
    
    for i in 0..<lhs.coefficients.count {
        coef[i] = lhs.coefficients[i] + rhs
    }
    return Polynomial(coefficients: coef)
    
}


public func *(lhs: Polynomial, rhs: Polynomial) -> Polynomial {
    
    var coef = [Double](repeating: 0.0, count: lhs.coefficients.count + rhs.coefficients.count - 1)
    
    for i in 0..<lhs.coefficients.count {
        for j in 0..<rhs.coefficients.count {
            coef[i+j] += lhs.coefficients[i] * rhs.coefficients[j]
        }
    }
    return Polynomial(coefficients: coef)
    
}

public func *(lhs: Polynomial, rhs: Double) -> Polynomial {
    
    var coef = [Double](repeating: 0.0, count: lhs.coefficients.count)
    
    for i in 0..<lhs.coefficients.count {
        coef[i] = lhs.coefficients[i] * rhs
    }
    return Polynomial(coefficients: coef)
    
}

public func *(lhs:Double, rhs: Polynomial) -> Polynomial {
    return rhs * lhs
    
}

public func /(lhs: Polynomial, rhs: Polynomial) -> (Polynomial, Polynomial)  {
    let res = lhs
    let normalizer = rhs.coefficients[0]
    
    for i in 0..<lhs.coefficients.count - (rhs.coefficients.count - 1) {
        res.coefficients[i] = lhs.coefficients[i] / normalizer
        let coef = res.coefficients[i]
        
        if coef != 0 {
            for j in 1..<rhs.coefficients.count {
                res.coefficients[i+j] += -rhs.coefficients[j] * coef
            }
        }
    }
    
    let separator = res.coefficients.count - (rhs.coefficients.count - 1)
    
    let result = Polynomial(coefficients: Array(res.coefficients[0...separator]))
    let rest = Polynomial(coefficients: Array(res.coefficients[separator...res.coefficients.count-1]))
    
    return (result, rest)
}

public func /(lhs: Polynomial, rhs: Double) -> (Polynomial)  {
    
    var coef = [Double](repeating: 0.0, count: lhs.coefficients.count)
    
    for i in 0..<lhs.coefficients.count {
        coef[i] = lhs.coefficients[i] / rhs
    }
    return Polynomial(coefficients: coef)
}

public func powP(lhs: Polynomial, rhs: Int) -> Polynomial {
    
    guard rhs > 0 else {
        fatalError()
    }
    
    var res = lhs
    
    for _ in 1..<rhs {
        res = res * lhs
    }
    
    return res
}

public func %%(lhs: Polynomial, rhs: Int64) -> Polynomial {
    var coef = [Double](repeating: 0.0, count: lhs.coefficients.count)
    
    for i in 0..<lhs.coefficients.count {
        coef[i] = Double(Int64(lhs.coefficients[i]) %% rhs)
    }
    return Polynomial(coefficients: coef)
}


public func createPolynomial(of size: Int, in range: ClosedRange<Int64>) -> Polynomial {
    let coef = (1...size).map( {_ in Int64.random(in: range)})
    return Polynomial(coefficients: coef)
}

public func createPolynomial(of size: Int, uniformly from: Int64) -> Polynomial {
    let range = -(from / 2)...(from / 2)
    let coef = (1...size).map( {_ in Int64.random(in: range)})
    return Polynomial(coefficients: coef)
}

public func createPolynomial(of size: Int, with distribution: Distribution) -> Polynomial {
    let coef = (1...size).map( {_ in distribution.getSample()})
    return Polynomial(coefficients: coef)
}
