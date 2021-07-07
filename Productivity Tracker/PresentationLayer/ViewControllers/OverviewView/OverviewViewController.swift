//
//  HomeViewController.swift
//  Productivity Tracker
//
//  Created by Matej Butkovic on 13.05.2021..
//

import UIKit
import Charts
import  UserNotifications

class OverviewViewController: UIViewController {

    var titleLabel: UILabel!
    var presenter: OverviewPresenter!
    var barChart = BarChartView()
    var dict = Dictionary<Date, [ActivityScore]>()
    var colorArray = [UIColor]()
    let date = Date()
    let dateFormatter = DateFormatter()
    var days = [String]()
    var meditiranje = UILabel()

    convenience init(presenter: OverviewPresenter) {
        self.init()
        self.presenter = presenter
        title = "Overview"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
        
        
        let calendar = Calendar(identifier: .gregorian)
        days = calendar.weekdaySymbols
        print(days)
        dateFormatter.dateFormat = "EEE"
        let dayInWeek = dateFormatter.string(from: date)
    print(dayInWeek)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dict = presenter.getThisWeek()
        createChart()

    }
    
    
    func createChart() {

        //configure the axis
        barChart.leftAxis.labelTextColor = .black
        barChart.leftAxis.gridColor = .black
        barChart.xAxis.labelTextColor = .black
        barChart.xAxis.gridColor = .black
        
        
        barChart.rightAxis.enabled = false
        barChart.xAxis.labelPosition = .bottom

        barChart.leftAxis.granularityEnabled = true
        barChart.leftAxis.granularity = 1.0
        barChart.isUserInteractionEnabled = false
        
        //configure legend
        barChart.legend.enabled = false
        
        
        //supply data
        var entries = [BarChartDataEntry]()
         var i = 0
        for day in Array(dict.keys).sorted(by: <){
            let color = UIColor.systemGreen
            for s in dict[day, default: []]{
                entries.append(BarChartDataEntry(x: Double(i), y: Double(Int.random(in: 0..<3))))
                colorArray.append(color)
                i += 1
            }
           
        }

        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        barChart.xAxis.granularity = 1
        let chartDataSet = BarChartDataSet(entries: entries)
        chartDataSet.colors = colorArray

        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.setDrawValues(false)
        barChart.data = chartData
    
    }
    
    
    


   
}
extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
