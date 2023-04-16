//
//  ViewController.swift
//  MovieReview
//
//  Created by eun-ji on 2023/04/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieSearchManager().request(from: "Starwars") { movies in
            print(movies)
        }
    }

}
