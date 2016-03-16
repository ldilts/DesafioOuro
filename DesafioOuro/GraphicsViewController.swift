//
//  GraphicsViewController.swift
//  DesafioOuro
//
//  Created by Student on 3/16/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit
import Charts

class GraphicsViewController: UIViewController,ChartViewDelegate {

    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lineChartView.delegate = self
        
//        lineChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255,alpha: 1)
        
        
        lineChartView.descriptionText = ""
        lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        
let months = ["Jan" , "Feb", "Mar", "Apr", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
        
        
        let unitsSold = [1453.0,2352,5431,1442,5451,6486,1173,5678,9234,1345,9411,2212]
        
        setChart(months, values: unitsSold)
        
        // Do any additional setup after loading the view.
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Likes App   ")
        lineChartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        lineChartDataSet.axisDependency = .Left
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
