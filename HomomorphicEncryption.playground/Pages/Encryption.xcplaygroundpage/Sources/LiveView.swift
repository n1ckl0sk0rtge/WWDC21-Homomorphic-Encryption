import SwiftUI

public struct LiveView: View {
    
    var value : Int
    var enc_value : EncryptedInteger
    
    public init(value: Int, enc_value: EncryptedInteger){
        self.value = value
        self.enc_value = enc_value
    }
    
    public var body: some View {
        VStack {
            HStack {
                Header(with: "Encryption of \(self.value)", and: "See how the number \(self.value) is encrypted!")
                Spacer(minLength: 0)
            }
            
            Spacer()
            
            EncryptedValue(str: "First encryption polynom (c0)", enc_: self.enc_value.c0)
                .padding(.bottom, 15)
            EncryptedValue(str: "Second encryption polynom (c1)", enc_: self.enc_value.c1)
            
            Spacer()
            
        }
        .padding()
    }
}

public struct EncryptedValue: View {
    
    var str : String
    var enc : Polynomial
    var line1 = [Double]()
    var line2 = [Double]()
    var line3 = [Double]()
    
    public init(str: String, enc_: Polynomial){
        self.str = str
        self.enc = enc_
        (self.line1, self.line2, self.line3) = getLines(value: enc_.coefficients)
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(self.str)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                Spacer(minLength: 0)
            }
            
            ScrollView(.horizontal) {
                VStack (alignment: .leading) {
                    HStack{
                        ForEach(line1, id: \.self) { num in
                            CoefView(value: num)
                                .padding(.bottom, 5)
                                .padding(.leading, 5)
                        }
                        
                    }
                    HStack{
                        ForEach(line2, id: \.self) { num in
                            CoefView(value: num)
                                .padding(.bottom, 5)
                                .padding(.leading, 5)
                        }
                    }
                    HStack{
                        ForEach(line3, id: \.self) { num in
                            CoefView(value: num)
                                .padding(.bottom, 5)
                                .padding(.leading, 5)
                        }
                    }
                }
                .padding(.bottom, 10)
                .padding(.leading, 10)
            }
        }
        .background(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
        .cornerRadius(20.0)
        .shadow(radius: 5)
    }
    
    private func getLines(value: [Double]) -> ([Double], [Double], [Double]) {
        let e = value.count / 3
        let r = value.count % 3
        
        var l1 = [Double]()
        var l2 = [Double]()
        var l3 = [Double]()
        
        for i in 0..<e {
            l1.append(value[2*i+i])
            l2.append(value[2*i+i+1])
            l3.append(value[2*i+i+2])
        }
        
        if r == 2 {
            l1.append(value[value.count-2])
            l2.append(value[value.count-1])
        } else if r == 1 {
            l1.append(value[value.count-1])
        }
        
        return (l1, l2, l3)
    }
}


public struct CoefView: View {
    
    var value : Double
    
    public init(value: Double){
        self.value = value
    }
    
    public var body: some View {
        ZStack {
            Text(String(self.value))
                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.top, 5)
                .padding(.bottom, 5)
        }
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(radius: 3)
    }

}
