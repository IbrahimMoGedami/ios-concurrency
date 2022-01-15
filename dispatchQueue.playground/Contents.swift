//: A UIKit based Playground for presenting user interface
  
// main target is to understand (main vs. background) thread
import UIKit

//mainThread
DispatchQueue.main.async {
    foo()
}

//backgroundThread
DispatchQueue.global(qos: .userInitiated).async {
    // fetch api data
    DispatchQueue.main.async {
        // update ui 
    }
}

func foo(){
    
}



