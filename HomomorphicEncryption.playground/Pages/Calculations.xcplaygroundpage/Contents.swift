//: [Previous](@previous)
//#-hidden-code
//#-code-completion(everything, hide)
import PlaygroundSupport
import SwiftUI
public var result : Int = 0

public let heModule = HECryproModule()
public let (pk, sk) = heModule.createKeypair()
//#-end-hidden-code
/*:
 
 - Note:
 🔔 Please disable results before running the code. Otherwise, the UI will not work properly. Open the accelerometer at the bottom right and deactivate "Enable Results".
 
 # Calculations
 
 The strength of homomorphic encryption lies in its ability to operate on encrypted values. By being able to add and multiply two encrypted values, all rational values can be calculated (the set of encrypted values is a mathematical field with addition and multiplication [more](https://en.wikipedia.org/wiki/Field_(mathematics)))
 
 ## Addition
 
 To add two encrypted values, we can simply calculate the sum over the first and second polynomials of each value. When encrypting, the result is the sum of the plaintext values.
 
 ![Add encrypted messages together](Addition.png)

 Here is, how you can do this with the crypto module.🧑‍💻
 */

let number1 = /*#-editable-code*/5/*#-end-editable-code*/
let enc1 = heModule.encrypt(message:number1, with: pk)

let number2 = /*#-editable-code*/2/*#-end-editable-code*/
let enc2 = heModule.encrypt(message: number2, with: pk)

let encAdd = enc1.add(value: enc2)!

let decAdd = heModule.decrypt(cipher: encAdd, with: sk)

/*:
 
 ## Multiplication
 
 To multiply two encrypted values together, the process is more complex. As you can see in the example calculation below, multiplying two polynomials increases the number of coefficients in the result.
 
 ![Add encrypted messages together](poly.png)
 
 So when we calculate the multiplication of our scrambled values, we also get a coefficient increase. We have to take this into account. This is also the reason why three polynomials are calculated in the multiplication. But since the other operations are based on the structure with two polynomials per encoded value, we have to "truncate" the result of the multiplication again. To fix this problem, we apply a kind of re-linearization. Re-linearization reduces the result back to the desired size.
 
 ![Add encrypted messages together](Multiplication.png)
 
 Here is how you can do this with the Crypto module. To provide the re-linearization key, we need to provide the public key that contains this parameter. 🧑‍💻
 */

let encMult = enc1.mult(value: enc2, with: pk)!

let decMult = heModule.decrypt(cipher: encMult, with: sk)

/*:
 We are done with that. Now it's your turn to play around with the library. Try it out!🧑‍💻
 
 Just a short note: for the given configuration of the Crypto module, please consider the following points:
   * the input values and the result should be in the range of 0...1024, otherwise there will be undefined behavior
   * use only integer values as input
 
 Have a look on a more complex example. Run the code and have a look on the right to see the result 👀
 - Note:
 🔔 Please disable results before running the code. Otherwise, the UI will not work properly. Open the accelerometer at the bottom right and deactivate "Enable Results".
 */


let number3 = /*#-editable-code*/3/*#-end-editable-code*/
let enc3 = heModule.encrypt(message: number3, with: pk)

let encResult = enc1.add(value: enc2)?.mult(value: enc3, with: pk)

if let validResult = encResult {
    result = heModule.decrypt(cipher: validResult, with: sk)
}

/*:
 All right, I hope you had fun with my playground! Thank you very much for your attention! It was my pleasure to show you the basics of homomorphic encryption. In case you want to dive deeper into the topic and explore the real math and science stuff, I'll give you some links to get started. Have fun and always be open to new crazy things!!! 🤓🧑‍💻
 * For getting a deeper undersating of homomorphic encryption you can have a look on [this paper](https://eprint.iacr.org/2015/1192)
 * This is the paper I used for the implementation of a somewaht homomorphic encryption ([here](https://eprint.iacr.org/2012/144))
 * Reading about the first genereation of FHE: ([thesis of Craig Gentry](https://crypto.stanford.edu/craig/craig-thesis.pdf))
 
 # Cheers!!!😊
 */
//#-hidden-code
PlaygroundPage.current.setLiveView(LiveView(var1Plain: number1, var1Enc: enc1, var2Plain: number2, var2Enc: enc2, var3Plain: number3, var3Enc: enc3, result: result, resultEnc: encResult))
//#-end-hidden-code
