//
//  PageView.swift
//  Landmarks
//
//  Created by Alicia Windsor on 18/05/2021.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    @State private var currentPage = 0
    
    var body: some View {
        
        
        
       VStack {
        ZStack (alignment: .bottomTrailing){
                //declare PVC as child of PV
                PageViewController(pages: pages, currentPage: $currentPage)
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width, height: 260)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                    .frame(width: CGFloat(pages.count * 18))
                    .padding(.trailing)
            }
        
            Button(action:{ if currentPage < 2 { currentPage += 1} else {currentPage = 0} }) {
        
                    Text("Next Page")
                        .padding(.all)
            }
            .frame(width: UIScreen.main.bounds.size.width - 15, alignment: .trailing)
        
        }
        
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        
        //pass required array of views
        PageView(pages: ModelData().featured.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
