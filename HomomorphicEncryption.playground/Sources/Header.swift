import SwiftUI
import PlaygroundSupport

public struct Header: View {
    
    var pageName : String
    var description : String
    
    public init(with pagename: String, and description: String){
        self.pageName = pagename
        self.description = description
    }
    
    public var body: some View {
        VStack(alignment: .leading, content: {
            Text(self.pageName)
                .font(.largeTitle).bold()
            Text(self.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        })
    }
}


