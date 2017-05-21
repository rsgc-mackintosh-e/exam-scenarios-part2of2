//: [Next](@next)
//: # Scenario 3
//: ## Your goal
//: Reproduce this image:
//:
//: ![Talking Heads](TalkingHeads.png "Talking Heads")
/*:
 ## Notes:
 * you will work on a canvas that is 400 pixels wide by 600 pixels high
 * strongly recommend that you make a plan [using this storyboard template](http://russellgordon.ca/rsgc/2016-17/ics2o/Storyboard%20Planning%20Template.pdf) (I have hard copies available if you are in class)
 * you can use the Digital Color Meter program to obtain an RGB color value (Command-Shift-C), then [go to this site](http://rgb.to/), paste the result, and use the HSB values provided.
 * efficiency counts: employ loops and/or function(s) and/or conditional statements to write compact code
 */
//: ## Template code
//: The following two statements are required to make the playground run. Please do not remove.
import Cocoa
import PlaygroundSupport
//: ## Reminder
//: To see the visual output, be sure to show the Assistant Editor and choose the Timeline option.
//:
//: ![timeline](timeline.png "Timeline")
//: ## Your code starts here
// Create a new canvas
let canvas = Canvas(width: 400, height: 600)
canvas.drawShapesWithBorders = false
canvas.drawShapesWithFill = true
//drawing the big triangles
for Tricolor in 1...2{
    var x = 0
    if Tricolor == 1{
        canvas.fillColor = Color.yellow
        x = 0
    }else{
        canvas.fillColor = Color.white
        x = 400
    }
    var triangles : [NSPoint] = []
    triangles.append( NSPoint( x: -1 , y: 200))
    triangles.append( NSPoint( x: 400-x , y: 200+x))
    triangles.append( NSPoint( x: 400 , y: 601))
    canvas.drawCustomShape(with: triangles)
}

//rectangle on the ground
canvas.fillColor = Color(hue: 10, saturation: 85, brightness: 97, alpha: 100)
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 400, height: 200)

//small trangles
canvas.fillColor = Color(hue: 10, saturation: 85, brightness: 97, alpha: 100)
for xAxis in stride(from: 0, to: 9, by: 1){
    for yAxis in stride(from: 0, to: 9, by: 1){
        var side = ((405/9) * xAxis) - 1
        var up = (405/9) * yAxis
        var Wvertices : [NSPoint] = []
        Wvertices.append( NSPoint( x: side , y: 200 + up))
        Wvertices.append( NSPoint( x: side , y: 200 + up + (405/9)))
        Wvertices.append( NSPoint( x: side + (405/9) , y: 200 + up + (405/9)))
        canvas.drawCustomShape(with: Wvertices)
    }
}



//: ## Template code
//: The code below is necessary to see the result of your work in the Assistant Editor at right. Please do not remove.
PlaygroundPage.current.liveView = canvas.imageView
