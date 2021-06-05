import SwiftUI
import PlaygroundSupport

public struct LiveView: View {
    
    @State var poly1 = Polynomial(coefficients: [1.0, 2.0, 3.0])
    @State var poly2 = Polynomial(coefficients: [1.0, 2.0, 3.0])
    
    @StateObject private var res = TestObject()
    @StateObject private var rest = TestObject()
    
    public init(poly1: Polynomial, poly2: Polynomial){
        self.poly1 = poly1
        self.poly2 = poly2
    }
    
    public var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Header(with: "Polynomial", and: "Try out, hwo you can calculate with polynomials!").padding()
                Spacer()
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                Text(polynomialToString(poly: self.poly1))
                    .padding()
                Text(polynomialToString(poly: self.poly2))
                    .padding()
                Divider().padding()
                Text(self.res.value)
                    .padding()
                Text(self.rest.value)
                    .padding()
                HStack {
                    Button(action: {
                        self.res.value = polynomialToString(poly: self.poly1 + self.poly2)
                        self.rest.value = ""
                    }) {
                        Image(systemName: "plus").padding(25.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 2.0)
                                .frame(width: 50, height: 50, alignment: .center)
                        )
                    }
                    
                    Button(action: {
                        self.res.value = polynomialToString(poly: self.poly1 + (self.poly2 * -1.0))
                        self.rest.value = ""
                    }) {
                        Image(systemName: "minus").padding(25.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 2.0)
                                .frame(width: 50, height: 50, alignment: .center)
                        )
                    }
                    
                    Button(action: {
                        self.res.value = polynomialToString(poly: self.poly1 * self.poly2)
                        self.rest.value = ""
                    }) {
                        Image(systemName: "multiply").padding(25.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 2.0)
                                .frame(width: 50, height: 50, alignment: .center)
                        )
                    }
                    
                    Button(action: {
                        let (a, b) = self.poly1 / self.poly2
                        self.res.value = polynomialToString(poly: a)
                        self.rest.value = polynomialToString(poly: b)
                    }) {
                        Image(systemName: "divide").padding(25.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15.0)
                                .stroke(lineWidth: 2.0)
                                .frame(width: 50, height: 50, alignment: .center)
                        )
                    }
                }.padding()
                Spacer()
            }
        }
    }
    
    public func polynomialToString(poly: Polynomial) -> String {
        
        let coef = poly.coefficients
        var str =  ""
        
        for i in 0..<coef.count {
            var operat = " + "
            if coef[i] < 0.0 {
                operat = " - "
            }
            
            if i == coef.count-1 {
                operat = " "
            }
            
            str = operat + String(format: "%.1f", abs(coef[i])) + "x^" + String(i) + str
        }
        return str
    }
}

class TestObject: ObservableObject {
    @Published var value = ""
}
