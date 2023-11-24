# Wheell Chart
This chart is a UIView written for UIKit. Purpose of usage is displaying a score or percentage. 

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)

## Installation
You can download just WheellChart.swift file or copy its content.

## Usage
After having WhellChart class, you can add a View component from Storyboard and make its class as WhellChart. 
Then create an IBOutlet from storyboard to the file that you want to use chart in.

## Examples
After creating IBOutlet, you can adjust your chart as needed.

For example you want to create a chart with 10 sections to simulate relevance score.
Then you need to create sectionPercentages array with dividing 1.0 to 10 pieces.
You can adjust left interval and right interval of the chart to show them in labels.
You should set score attribute for score label as a integer to show the score at the middle of the chart.
You should set the numberOfColoredSections to color the sections. This is implemented due to simulate some different ratio behaviors.
You can set chartDescriptionLabel for the label that is placed to the bottom.
You should adjust spacing between the sections. This value experienced as 0.015 best however you can adjust like your desire.
        
        let sectionPercentages: [CGFloat] = [0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
        wheellChart.sectionPercentages = sectionPercentages
        wheellChart.leftInterval = 0
        wheellChart.rightInterval = 10
        wheellChart.score = 8
        wheellChart.numberOfColoredSections = 8
        wheellChart.chartDescriptionLabel = "Relevance Score"
        wheellChart.sectionSpacing = 0.015 

## License
This project is licensed under the [MIT License].
