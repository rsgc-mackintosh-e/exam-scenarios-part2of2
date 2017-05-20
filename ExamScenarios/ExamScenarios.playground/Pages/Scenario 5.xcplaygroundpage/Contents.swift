//: [Previous](@previous)
//: # Scenario 5
//: ## Your goal
//: Reproduce this image:
//:
//: ![Velvet Underground](VelvetUnderground.png "Velvet Underground")
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

canvas.fillColor = Color.black
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 400, height: 600)

func drawArrow(X: Int, Y: Int) {
    canvas.translate(byX: X, byY: Y)
    
    //Draw the vertical and horisonatal part of the arrow
    canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 15, height: 45)
    canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 0, width: 45, height: 15)
    
    //Draw the stick of the arrow
    canvas.rotate(by: 45)
    canvas.drawRectangle(bottomLeftX: 20, bottomLeftY: -8, width: 50, height: 15)
    canvas.rotate(by: -45)
    
    
    canvas.translate(byX: -X, byY: -Y)
}


for x in stride(from: 0, through: 335, by: 67) {
    for y in stride(from: 0, through: 335, by: 67) {
        
        //Only on the diagonal is this true
        if x == y  {
            //Make it white
            canvas.fillColor = Color.white
            drawArrow(X: x, Y: y)

        } else {
            //Leave it as purple
        canvas.fillColor = Color.init(hue: 313, saturation: 77, brightness: 65, alpha: 100)
        
            drawArrow(X: x, Y: y)
            
        }
    }

}

//Set the line color
canvas.fillColor = Color.white

//Set the text color
canvas.textColor = Color.white

//Title
canvas.drawText(message: "the velvet underground", size: 30, x: 15, y: 400)

//Draw bottom White line accross the canvas
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 440, width: 450, height: 2)

//Draw the first box of text
canvas.drawText(message: "first appearance in london", size: 9, x: 10, y: 535)
canvas.drawText(message: "the london college of printing", size: 9, x: 10, y: 525)

//Draw the second box of text
canvas.drawText(message: "with spring and pollyfloskin", size: 9, x: 150, y: 535)
canvas.drawText(message: "plus the great western light show", size: 9, x: 150, y: 525)

//Draw the third box of text
canvas.drawText(message: "thursday", size: 9, x: 300, y: 535)
canvas.drawText(message: "october 14 1981/8 pm", size: 9, x: 300, y: 525)

//Draw the second white line accross the canvas
canvas.drawRectangle(bottomLeftX: 0, bottomLeftY: 560, width: 400, height: 2)


    //: ## Template code
    //: The code below is necessary to see the result of your work in the Assistant Editor at right. Please do not remove.
    PlaygroundPage.current.liveView = canvas.imageView
