//
//  PageViewController.swift
//  Landmarks
//
//  Created by Alicia Windsor on 17/05/2021.
//

//implementing SwiftUI with UIKit

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    
    @Binding var currentPage: Int
    
    //can be used to implemet common Cocoa patterns (delegates, data sources, user-events via target-action etc.)
    //func gives an access point for the coordinator
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
    }
    
    //calls this method a single time to display the view
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
                                    transitionStyle: .scroll,
                                    navigationOrientation: .horizontal)

        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    //hosts swiftUI on each update, can init controller for effiency
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()

        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            
            //init using the pages array of views, good place to store these as the system inits only once
            controllers = parent.pages.map {UIHostingController(rootView: $0)}
        }
        
        //establishes a relationship betweek views which allow for swiping back and fourth
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore viewController: UIViewController) -> UIViewController?{
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index == 0 {
                return controllers.last
            }
            
            return controllers[index - 1]
        }

        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerAfter viewController: UIViewController) -> UIViewController?{
            
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            
            if index + 1 == controllers.count {
                return controllers.first
            }
                return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                didFinishAnimating finished: Bool,
                                previousViewControllers: [UIViewController],
                                transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
        }
        
        //class end
     }
    
    //struct end
}


