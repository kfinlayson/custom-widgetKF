# Custom Widget
In this assignment, you have to modify the CustomWidget class to change its functionality. 
Currently, the widget displays a square in the center of the panel. If the square is selected, it turns blue. 
Otherwise, it is yellow.

     --------------------------
    |                          |
    |                          |
    |           ----           |
    |          |    |          |
    |          |    |          |
    |           ----           |
    |                          |
    |                          |
     -------------------------- 
 
You need to modify this to make a widget that has two shapes, a regular hexagon and a regular octagon, 
each with a width equal to one-fourth of the smaller of the widget's width and height. 
The hexagon should be one-third from the left edge and the octagon should be one-third from the right edge. 
If the hexagon is selected, it turns green. 
If the octagon is selected, it turns red. 
If either is deselected, it is white. The hexagon and octagon are mutually exclusive (like radio buttons). 
Only one can be selected at a time, and the other is automatically deselected. 
The hexagon defaults to being selected upon creation.

Below is my *very* crude attempt to draw something like what I'm describing. These are *clearly* not regular polygons, 
but yours should be.

     ---------------------------
    |                           |
    |                  __       |
    |       /\        /  \      |
    |      /  \      /    \     |
    |     |    |    |      |    |
    |      \  /      \    /     |
    |       \/        \__/      |
    |                           |
    |                           |
     --------------------------- 
     

## Modifications
You will obviously need to modify most of the files. Here are my suggestions.

ShapeEvent
: Modify (or reinterpret) the selected variable to clarify which of the shapes is selected.

Main
: Have the label display "Hexagon" or "Octagon", rather than "Selected" and "Not Selected".

CustomWidget
: Plenty of stuff will have to change here, but you should definitely focus on these things:
  
  * getShape should become getShapes and should return a two-element array of the Shape objects (hexagon and octagon)
  * mouseClicked should check the event's location against both shapes and update accordingly
  * paintComponent has to be modified to work on two shapes
  * calculateVertices (or some other function that does the job) will have to determine where the 
  vertices of those shapes should be, given the size of the widget; this is probably the most difficult of the 
  changes because it will require some analytical geometry (and maybe a trig function or two)
  
CustomWidgetKeywords
: You probably won't follow much of this code, but you will need to make a few changes.

  * You can just remove clickCustomWidget entirely if you want.
  * clickCustomWidgetInside will need to become clickHexagon. Modify it to get just the hexagon
   shape and click the center of those bounds. You'll also need to create another function for 
   clickOctagon based on this function.
  * clickCustomWidgetOutside will need to become clickOutside. It should get the bounds of 
  both shapes and click a point that is outside of both of them.

Those are the main changes that you should make.


## Acceptance Tests

    | *Setting* | *Value*                       |
    | Library   | SwingLibrary                  |
    | Library   | keywords.CustomWidgetKeywords |

    | *Test Case*                                  | *Action*             | *Argument*        | *Argument* |
    | Hexagon Is Selected Initially                | Start Application    | edu.jsu.mcis.Main |            |
    |                                              | Select Window        | Main              |            |
    |                                              | Label Text Should Be | label             | Hexagon    |
    |                                              | Close Window         | Main              |            |
    | Octagon Is Selected After Center Click       | Start Application    | edu.jsu.mcis.Main |            |
    |                                              | Select Window        | Main              |            |
    |                                              | Click Octagon        |                   |            |
    |                                              | Label Text Should Be | label             | Octagon    |
    |                                              | Close Window         | Main              |            |
    | Widget Is Unchanged After Edge Click         | Start Application    | edu.jsu.mcis.Main |            |
    |                                              | Select Window        | Main              |            |
    |                                              | Click Outside        |                   |            |
    |                                              | Label Text Should Be | label             | Hexagon    |
    |                                              | Close Window         | Main              |            |
    | Widget Toggles With Successive Center Clicks | Start Application    | edu.jsu.mcis.Main |            |
    |                                              | Select Window        | Main              |            |
    |                                              | Click Octagon        |                   |            |
    |                                              | Label Text Should Be | label             | Octagon    |
    |                                              | Click Hexagon        |                   |            |
    |                                              | Label Text Should Be | label             | Hexagon    |
    |                                              | Close Window         | Main              |            |
     
