//
//  ViewController.swift
//  Chart
//
// 
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wheellChart: WheellChart!

    override func viewDidLoad() {
        super.viewDidLoad()

        let sectionPercentages: [CGFloat] = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
        wheellChart.sectionPercentages = sectionPercentages
        wheellChart.leftInterval = 0
        wheellChart.rightInterval = 10
        wheellChart.score = 8
        wheellChart.numberOfColoredSections = 8
        wheellChart.chartDescriptionLabel = "Relevance Point"
        wheellChart.sectionSpacing = 0.015
       
        /*
        let sectionPercentages: [CGFloat] = [0.2, 0.2, 0.2, 0.2, 0.2]
        wheellChart.sectionPercentages = sectionPercentages
        wheellChart.leftInterval = 0
        wheellChart.rightInterval = 100
        wheellChart.score = 80
        wheellChart.numberOfColoredSections = 4
        wheellChart.chartDescriptionLabel = "Risk Score"
        wheellChart.sectionSpacing = 0.015
       */
    }
}

