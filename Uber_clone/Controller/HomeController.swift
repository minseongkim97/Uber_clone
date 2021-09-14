//
//  HomeController.swift
//  Uber_clone
//
//  Created by MIN SEONG KIM on 2021/09/14.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    //MARK: - Properties
    private let mapView = MKMapView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
//        signOut()
        
    }
    
    //MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }

        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //MARK: - Helper Function
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}
