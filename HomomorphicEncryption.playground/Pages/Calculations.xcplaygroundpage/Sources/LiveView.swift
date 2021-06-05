import SwiftUI
import PlaygroundSupport

public struct LiveView: View {
    
    // var 1
    @State var changeVar1 = false
    var plainVar1 : Int = 0
    var encryptedVar1 : EncryptedInteger?
    // var 2
    @State var changeVar2 = false
    var plainVar2 : Int = 0
    var encryptedVar2 : EncryptedInteger?
    // var 3
    @State var changeVar3 = false
    var plainVar3 : Int = 0
    var encryptedVar3 : EncryptedInteger?
    // result
    @State var changeRes = true
    var plainRes : Int = 0
    var encryptedRes : EncryptedInteger?
    
    public init(var1Plain: Int, var1Enc: EncryptedInteger, var2Plain: Int, var2Enc: EncryptedInteger, var3Plain: Int, var3Enc: EncryptedInteger, result: Int, resultEnc: EncryptedInteger?){
        self.plainVar1 = var1Plain
        self.encryptedVar1 = var1Enc
        self.plainVar2 = var2Plain
        self.encryptedVar2 = var2Enc
        self.plainVar3 = var3Plain
        self.encryptedVar3 = var3Enc
        self.plainRes = result
        self.encryptedRes = resultEnc
    }
    
    public var body: some View {
        VStack {
            HStack {
                Header(with: "Calculation", and: "See the result of your calculation!")
                Spacer(minLength: 0)
            }
            Spacer()
            
            //first input
                VStack {
                    HStack {
                        if self.changeVar1 {
                            Text(String(self.plainVar1))
                                .padding()
                                .foregroundColor(.white)
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar1.toggle()
                                }
                            }) {
                                Image(systemName: "lock.open.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 10))
                            .transition(.move(edge: .trailing))
                        } else {
                            ScrollView(.horizontal) {
                                if let v = self.encryptedVar1 {
                                    HStack {
                                        ZStack {
                                            Text(String("c0"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c0.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                        
                                        ZStack {
                                            Text(String("c1"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c1.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                    }
                                } else {
                                    Text("Error")
                                }
                            }
                            .padding()
                            
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar1.toggle()
                                }
                            }) {
                                Image(systemName: "lock.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                            .transition(.move(edge: .trailing))
                        }
                    }
                }
                .background(self.changeVar1 ? Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)) : Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                .cornerRadius(20.0)
                .shadow(radius: 5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .addOperator("+")
            
            //second input
                VStack {
                    HStack {
                        if self.changeVar2 {
                            Text(String(self.plainVar2))
                                .padding()
                                .foregroundColor(.white)
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar2.toggle()
                                }
                            }) {
                                Image(systemName: "lock.open.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 10))
                            .transition(.move(edge: .trailing))
                        } else {
                            ScrollView(.horizontal) {
                                if let v = self.encryptedVar2 {
                                    HStack {
                                        ZStack {
                                            Text(String("c0"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c0.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                        
                                        ZStack {
                                            Text(String("c1"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c1.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                    }
                                } else {
                                    Text("Error")
                                }
                            }
                            .padding()
                            
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar2.toggle()
                                }
                            }) {
                                Image(systemName: "lock.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                            .transition(.move(edge: .trailing))
                        }
                    }
                }
                .background(self.changeVar2 ? Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)) : Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                .cornerRadius(20.0)
                .shadow(radius: 5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .addOperator("x")
            
            //third input
                VStack {
                    HStack {
                        if self.changeVar3 {
                            Text(String(self.plainVar3))
                                .padding()
                                .foregroundColor(.white)
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar3.toggle()
                                }
                            }) {
                                Image(systemName: "lock.open.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 10))
                            .transition(.move(edge: .trailing))
                        } else {
                            ScrollView(.horizontal) {
                                if let v = self.encryptedVar3 {
                                    HStack {
                                        ZStack {
                                            Text(String("c0"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c0.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                        
                                        ZStack {
                                            Text(String("c1"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c1.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                    }
                                } else {
                                    Text("Error")
                                }
                            }
                            .padding()
                            
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeVar3.toggle()
                                }
                            }) {
                                Image(systemName: "lock.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                            .transition(.move(edge: .trailing))
                        }
                    }
                }
                .background(self.changeVar3 ? Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)) : Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                .cornerRadius(20.0)
                .shadow(radius: 5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .addOperator("=")
            
            //result input
                VStack {
                    HStack {
                        if self.changeRes {
                            Text(String(self.plainRes))
                                .padding()
                                .foregroundColor(.white)
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeRes.toggle()
                                }
                            }) {
                                Image(systemName: "lock.open.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 10))
                            .transition(.move(edge: .trailing))
                        } else {
                            ScrollView(.horizontal) {
                                if let v = self.encryptedRes {
                                    HStack {
                                        ZStack {
                                            Text(String("c0"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c0.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                        
                                        ZStack {
                                            Text(String("c1"))
                                                .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                                .padding(.leading, 8)
                                                .padding(.trailing, 8)
                                                .padding(.top, 5)
                                                .padding(.bottom, 5)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10.0)
                                        
                                        ForEach(v.c1.coefficients , id: \.self) { num in
                                            CoefView(value: num)
                                        }
                                    }
                                } else {
                                    Text("Error")
                                }
                            }
                            .padding()
                            
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation() {
                                    self.changeRes.toggle()
                                }
                            }) {
                                Image(systemName: "lock.fill")
                                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                                    .background(Color.white)
                                    .foregroundColor(Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                                    .clipShape(Circle())
                            }
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 8))
                            .transition(.move(edge: .trailing))
                        }
                    }
                }
                .background(self.changeRes ? Color(UIColor(red: 255/255, green: 0/255, blue: 128/255, alpha: 1.0)) : Color(UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1.0)))
                .cornerRadius(20.0)
                .shadow(radius: 5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10))
                
            Spacer()
    
        }
        .padding()
    }
    
}

extension View {
    func addOperator(_ str: String) -> some View {
        ZStack(alignment: .bottomLeading) {
            self
            OperationView(str: str)
                .offset(x: -3, y: 18)
        }
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
    }

}

public struct OperationView: View {
    
    var str : String
    
    public init(str: String){
        self.str = str
    }
    
    public var body: some View {
        ZStack {
            Text(self.str)
                .foregroundColor(Color.white)
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .padding(.top, 15)
                .padding(.bottom, 15)
        }
        .background(Color(UIColor(red: 102/255, green: 102/255, blue: 255/255, alpha: 1.0)))
        .clipShape(Circle())
        .cornerRadius(10.0)
        .shadow(radius: 7)
    }

}
