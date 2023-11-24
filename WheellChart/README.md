# Wheell Chart
This chart is a UIView written for UIKit. The purpose of usage is to display a score or percentage. 

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [License](#license)

## Installation
You can download just the WheellChart.swift file or copy its content.

## Usage
After having WhellChart class, you can add a View component from Storyboard and make its class as WhellChart. 
Then create an IBOutlet from the storyboard to the file that you want to use the chart in.

## Examples
After creating IBOutlet, you can adjust your chart as needed.

For example, you want to create a chart with 10 sections to simulate relevance score.

Then you need to create a sectionPercentages array by dividing 1.0 into 10 pieces.

You can adjust the left interval and right interval of the chart to show them in labels.

You should set the score attribute for the score label as an integer to show the score in the middle of the chart.

You should set the numberOfColoredSections to color the sections. This is implemented to simulate some different ratio behaviors.

You can set chartDescriptionLabel for the label that is placed at the bottom.

You should adjust the spacing between the sections. This value experienced as 0.015 best however you can adjust like your desire.
        
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

## Screenshots:
<div align="center">
  <table>
  <tr>
    <td>
      <img width="292" alt="ss1" src="https://github.com/rkmkrc/OpenSource-Swift/assets/42948198/314801b6-4f53-4761-936e-0ab36b3c2d6e">
    </td>
    <td>
      <img width="282" alt="ss2" src="https://github.com/rkmkrc/OpenSource-Swift/assets/42948198/dcd58efd-4bb7-41c5-89bd-eaf72d191039">
    </td>
    <td>
      <img width="282" alt="gallery" src="https://github.com/rkmkrc/OpenSource-Swift/assets/42948198/6ad82802-ef06-4881-815b-556ba2e348de">
    </td>
  </tr>
</table>
</div>
