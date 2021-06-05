//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 # Introduction
 
 Hey you and welcome to my playground!😊
 
 On the following pages I will introduce you to the capabilities of **Homomorphic Encryption**. Thereby I will try to simplify the usually used mathematical notations to explanatory texts and figures. I hope that this will give you an easy access to the complexity of homomorphic encryption.😉
 
 Let's start with a liitle bit of an introduction...
 
 ## What is Homomorphic Encryption?
 
 The main use of encryption is, to protect your data from others. You may heard about the CIA, no not the agency...😉 CIA stays for **C**onfidentiality, **I**ntegrity, and **A**vailability, which discribes the primary focus of information security. All three components can be secured directly or indirectly through encryption. As long as the data is encrypted, it is stored somewhere and will stay there until you need it. If you want to use the data again, you have to decrypt it. So, as you can see, there are currently two states of the data:
 * the data is encrypted and at rest
 * the data is in use and decrypted
 
 There is another case, and that is the encryption of data during transmission. This is achieved by using SSL over TLS, but apart from the transfer of data, these are not in use, so we can include this case among the first state.
 
 Homomorphic encryption brings another dimension to the world of encrypted data. In addition to encrypting data at rest and allowing the data to be decrypted for use, the class of homomorphic encryption schemes allows you to work with the encrypted data without losing its meaning. Sounds cool, doesn't it?🤓
 
 **Let's give you a short example with a real use case of homomorphic encryption**
 
 Imagine you work in healthcare. Over time, you will see medical information from dozens of different patients. Wouldn't it be nice to have some kind of AI that is able to determine a patient's disease by analyzing the patient's current and past health data, as well as data from other patients?
 Yes, that would be great, BUT there is a good reason why this is not currently done on a large scale. In Europe, for example, we have the GDPR, which helps protect the privacy of every citizen. So if you build an AI that uses people's health data, you will be disregarding their rights.
 
 However, with homorphic encryption, you can do that! By training an AI with the encrypted data, you respect the privacy rights and are able to produce valid results. The big advantage is the ability to calculate a meaningful result with the encrypted data. I know, already this use case birngt you to learn even more about this topic, right? But there is more. With the move to the cloud, you can think of even more use cases for this cool technology. So you will learn something for the future 😜
 
 So let's start with a little theory...🤓
 
 ## Lattices
 
 Lattices are a kind of mathematical structuring of algebra. For simplicity, you can think of a grid as shown in the figure below. In slightly more mathematical terms, each point (black) in a 2D grid can be described by its x and y components. For example, the point *(1, 2)* can be a point in a 2D-lattice. Moreover, in mathematics, a point is represented as a vector. This is nothing more than a fancy name for a point, so from now on we'll just call a point a vector.
 
 But because mathematicians always want to think outside the box, they never defined a box for a lattice. This means that the pattern you see in the picture goes on forever and has no limits. So there is an infinite number of vectors in the x-direction and in the y-direction. That means the pattern is what deffinates the lattice. But how do we define the pattern, or rather, how do we write it down?🤔
 
 ![Lattice](Lattices.png)
 
 To do this, we need to open the box of mathtools again and find something called a basis. A basis of a space or dimension describes each point within the space by a finite number of vectors. Sounds like we found the right thing, right? For our grid in the picture above, we can use the basis of *(0, 1)* and *(1, 0)* to describe each point within the grid. A basis for the grid in our image is shown with green arrows.

 Let's have a look at an example. How we can define the vector *(4, 2)* with our basis? Simple we multipli *(1, 0)* with 4 and *(0, 1)* with 2. The result is *(4, 2)*, our vector! This is called linear combination of vectores. (In addition, the vectors of a basis should be [linear-independent](https://en.wikipedia.org/wiki/Linear_independence))
 
 Let's have a look at a little bit of code 🧑‍💻
 */

let v1 = Vector(values: [1, 0])
let v2 = Vector(values: [0, 1])

let basis = Basis(space: 2, vectors: [v1, v2])

let newPoint = /*#-editable-code*/4/*#-end-editable-code*/ * v1 + /*#-editable-code*/2/*#-end-editable-code*/ * v2

/*:
 A cool fact about basis' are that there are an infinite number of them that can describe the same space. See the blue arrows in the picture? They describe the same lattice, just in a different way. Mathematics just doesn't like to commit to anything...🙄
 The dimension of the vectors is usually not limited to two, with regard to the cryptogtaphic application the dimension of the vectors will be much larger than two. Notice that!
 
 But why is that all important for cryptography, you may ask? Let's see..😉
 
 ## Short Vector Problem
 
 The security of crypthographic algorithms is generally based on a problem that is very difficult to solve in a reasonable amount of time. For homorphic encryption, this problem is based on the theory of lattices. Based on what you have just learned, imagine a given lattice but with at least dimension 1000. As we know, the base of a lattice consists of exactly as many vectors as the dimension is large. The Short Vector Problem (SVP) asks you to find a point in the given grid that is as close as possible to the origin point, but not the same. This is easy to solve for our example with dimension 2, but when the dimension is large, the problem is really hard to solve!
 
 **As you might guess, we will not be working directly with vectors in the real implementation. Instead, we will use polynomials for the implementation, but the basis is the same. Polynomials can be traded as vectors and vice versa.**
 
 Okay, that's it for the theory, let's take a look at how homomorphic encryption actually works! 👀
 */

//: [Next](@next)
