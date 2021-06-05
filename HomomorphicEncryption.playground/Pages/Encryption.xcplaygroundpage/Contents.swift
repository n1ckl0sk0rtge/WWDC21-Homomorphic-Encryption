//: [Previous](@previous)
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 - Note:
 🔔 Please disable results before running the code. Otherwise, the UI will not work properly. Open the accelerometer at the bottom right and deactivate "Enable Results".
 
 # Encryption and Decryption
 
 So finally, let's start with the use of homomorphic encryption.🧑‍💻 (This implementation uses teh BFV-scheme, discribed [here](https://eprint.iacr.org/2012/144))
 
 ## Create the Key Pair

 First, we need to generate a key pair. The implementation of this scheme of homomorphic encryption (there are several of them) is asymmetric. That is, as in normal asymmetric cryptography, we have two keys. One is a public key that you use to encrypt the data and the other is the private or secret key that you use to decrypt the data. The public key is the one you can share with anyone who wants to send you an encrypted message. The secret key you keep for yourself.
 
 Okay, so after we create an instance of the HECryptoModule, we can call the *createKeypair* function to generate the public and secret keys.
 */

let heModule = HECryproModule()

let (pk, sk) = heModule.createKeypair()

/*:
 The public key is calculated using polynomials. In the figure below you can see how this is achieved. First, a random polynomial is generated according to certain parameters. This forms the first part of the public key. The secret polynomial is also random. The error polynomial is generated from a Gaussian distribution. This means that all coefficients are a sample from a Gaussian distribution. After generation, the first public polynomial is added to the secret polynomial and multiplied by the error polynomial. The result is then the second part of the public polynomial.
 
 ![Key Generation](KeyGeneration.png)
 
 And with that, we have our key pair:
 * the public key consists of two polynomials *pk0* and *pk1*
 * the secret key contains the secrect polynomial *s*
 
 Now we can start encrypting a message. 🤓
 
 ## Encrypt message
 
 After generating the keys, we can use them to encrypt data. For the encryption of our message we will use the public key. As you know, the public key has two values *pk0* and *pk1*. In an encryption scheme, you always want to add something random, because a problem that involves randomness is harder to solve. In our case, we will again use some error polynomials as we did for key generation.
 To encrypt, we first multiply the two parts of the public key by a choice polynomial. In doing so, as the name implies, we select random parts of the public key polynomials to make the problem even harder. For each result, we generate an error polynomial, which we then add to each of the terms. Finally, we choose the first result and add the message. With this, we have encoded our message! 🎉
 
 The following image visualizes the encryption process...
 
 ![Encrypting a message](Encryption.png)
 
 As a result, we have an encrypted message that consists of:
 * the first polynomial *c0*
 * the second polynomial *c1*
 
 Run the code to see what it will look like in the real implementation. Change the message to see different results! 🧑‍💻
 */

let number : Int = /*#-editable-code*/10/*#-end-editable-code*/

let encryptedValue = heModule.encrypt(message: number, with: pk)

/*:
 
 ## Decrypt message
 
 When we say encrypt, we must also say decrypt. So how does decryption work. We take our encrypted value and multiply the second half *c1* by our secret key *s*. If we then add the first part from the encrypted value, we get our original message back!
 
 ![Decrypting a message](Decryption.png)
 
 Let's have a look on the code!🧑‍💻
 */

let message = heModule.decrypt(cipher: encryptedValue, with: sk)

/*:
 Cool, it works! Now we can look at most of the homomorphic encryption: How to compute with encrypted messages....🤓
 */

//: [Next](@next)
//#-hidden-code
PlaygroundPage.current.setLiveView(LiveView(value: number, enc_value: encryptedValue))
//#-end-hidden-code
