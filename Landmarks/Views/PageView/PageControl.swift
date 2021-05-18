//
//  PageControl.swift
//  Landmarks
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI
import UIKit

//Update PC to conform to UIVR
//UIVR and UIVCR have the same life cycle
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
    }

    func makeUIView(context: Context) -> UIPageControl { //UIPC is the little dots that tell you which page you are on
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        
        //add coord as the target for control, specifying the currentPage method as the action to preform
        control.addTarget(
                  context.coordinator,
                  action: #selector(Coordinator.updateCurrentPage(sender:)),
                  for: .valueChanged)

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl

        init(_ control: PageControl) {
            self.control = control
        }

        //updates page binding
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
    
}

