--Title: Drawing Shapes 
-- Name: Alex De Meo
-- Course : ICS2OR
--This program displays Shapes with their corresponding names

-- remove status bar
display.setStatusBar (display.HiddenStatusBar)

-- Set teh background colour 
display.setDefault ("background", 204/255, 255/255, 255/255)

-------------------------- Triangle -----------------------------

-- Create local triangle variables
local triangle 
local triangleText
local triangleVertices = {0,-50, -50,50, 50,50}
local triangleX = 130 
local triangleY = 100

-- Draw the triangle
triangle = display.newPolygon (triangleX, triangleY, triangleVertices)

-- Make Border
triangle.strokeWidth = 10

-- Set border colour
triangle:setStrokeColor (1, 1, 1)

--change color of triangle
triangle:setFillColor (0, 0, 0)

-- Write "Triangle" on the screen
triangleText = display.newText ("Triangle", 130, 190, Times, 40)

-- Change the text colour
triangleText:setTextColor (0, 0, 0)

--set transparency to transparent
triangle.alpha = 0

-- funtion: OpaqueTriangle
-- Input: this function accepts an event listener
-- output: none 
-- description: this funtion makes the transparencey opaque
local function OpaqueTriangle( event )
	-- change the transparency of triangle
	triangle.alpha = triangle.alpha + 0.01
end
 
-- OpaqueTriangle will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueTriangle)

-------------------------- Trapezoid ----------------------------

--Create the local "Trapezoid" variables
local trapezoid
local trapezoidText
local trapezoidVertices = {-50,-50, -100,50, 100,50, 50,-50}
local trapezoidX = 130
local trapezoidY = 300

-- Create the trapezoid
trapezoid = display.newPolygon (trapezoidX, trapezoidY, trapezoidVertices)

-- change transparency of the trapezoid
trapezoid.alpha = 0

--create the border
trapezoid.strokeWidth = 10

--set the border colour
trapezoid:setStrokeColor (0, 0, 0)

-- Write "trapezoid" on-screen
trapezoidText = display.newText ("Trapezoid", 130, 380, Arial, 40 )

-- set the text colour
trapezoidText:setTextColor (0.32,0.87,0.59)

-- fill the trapezoid
trapezoid.fill =  {type="image", filename="Images/beachFill.png"}

--function: OpaqueTrapezoid
-- Input: this funtion accepts an EventListener
-- Output: none
-- Description: This funtion makes the transparency of the trapezoid opaque
local function OpaqueTrapezoid( event )
	trapezoid.alpha = trapezoid.alpha + 0.01
end

Runtime:addEventListener ("enterFrame", OpaqueTrapezoid)

-------------------------- Pentagon -----------------------------

-- create local "pentagon vars"
local pentagon
local pentagonText 
local pentagonVertices = {50,50, -50,50, -100,-50, -0,-150, 100,-50}
local pentagonX = 130
local pentagonY = 530
local pentagonPaint = {
	type="gradient",
	color1 = {178/255, 102/255, 255/255},
	color2 = {255/255, 102/255, 255/255},
	direction="down"
}
-- draw the pentagon
pentagon = display.newPolygon (pentagonX, pentagonY, pentagonVertices)

-- change transparency
pentagon.alpha = 0

--make border
pentagon.strokeWidth = 10

-- make border colour
pentagon:setStrokeColor (0, 0, 0)

-- Make the fill gradient 
pentagon.fill = pentagonPaint

-- write pentagon on-screen
pentagonText = display.newText ("Pentagon", 130, 655, Arial, 40 )

-- Change the text color 
pentagonText:setTextColor (60/255, 112/255, 164/255)

-- funtion: OpaquePentagon
-- Input: this funtion accepts an EventListener
-- Output none
-- description: this function changes the transparency of the pentagon to opaque
local function OpaquePentagon( event )
	pentagon.alpha = pentagon.alpha + 0.01
end

-- OpaquePentagon will be called over and over
Runtime:addEventListener ("enterFrame", OpaquePentagon)
-------------------------- Hexagon ------------------------------

-- create the local "hexagon" variables
local hexagon
local hexagonText
local hexagonX = 440
local hexagonY = 120
local hexagonVertices = {-50,-85, 50,-85, 100,0, 50,90, -50,90, -100,0}

-- draw the hexagon
hexagon = display.newPolygon (hexagonX, hexagonY, hexagonVertices)

hexagon.alpha = 0

-- make the border
hexagon.strokeWidth = 10

-- make the border color
hexagon:setStrokeColor (0, 0, 0)

-- change the color of the hexagon
hexagon:setFillColor (1.00,0.39,0.39)

--display hexagon under the hexagon
hexagonText = display.newText ("Hexagon", 440, 240, Arial, 40)

-- change the text color
hexagonText:setTextColor (1.00, 0.39, 0.39)

-- funtion: OpaqueHexagon
-- Input: this funtion accepts an EventListener
-- Output none
-- description: this function changes the transparency of the Hexagon to opaque
local function OpaqueHexagon( event )
	hexagon.alpha = hexagon.alpha + 0.01
end

-- OpaqueHexagon will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueHexagon)
-------------------------- Parallelogram --------------------------

-- create local Parallelogram variables
local parallelogram
local parallelogramText
local parallelogramX = 440 
local parallelogramY = 340
local parallelogramVertices = {0,0, 180,0, 90,90, -90,90}

-- draw the parallelogram 
parallelogram = display.newPolygon (parallelogramX, parallelogramY, parallelogramVertices)

parallelogram.alpha = 0

--make border
parallelogram.strokeWidth = 10

--change the border color
parallelogram:setStrokeColor (0, 0, 0)

-- display parallelogram under the parallelogram
parallelogramText = display.newText ("Parallelogram", 440, 430, Arial, 40)

-- change the text color
parallelogramText:setTextColor (0.20, 0.09, 0.47)

-- put image inside the parallelogram
parallelogram.fill = {type="image", filename="Images/milky way.png"}

-- funtion: OpaqueParallelogram
-- Input: this funtion accepts an EventListener
-- Output: none
-- description: this function changes the transparency of the parallelogram to opaque
local function OpaqueParallelogram(event)
	parallelogram.alpha = parallelogram.alpha + 0.01
end

-- OpaqueParallelogram will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueParallelogram)

-------------------------- Heptagon -------------------------------
--create local Heptagon variables
local heptagon 
local heptagonText
local heptagonX = 440
local heptagonY = 580
local heptagonVertices = {-50,100, 50,100, 110,20, 90,-75, 0,-120, -90,-76, -110,20}
local heptagonPaint = {
	type="gradient",
	color1 = {0.98,0.90,0.33},
	color2 = {0.32,0.87,0.59},
	direction="down"
}

-- draw the heptagon
heptagon = display.newPolygon (hexagonX, heptagonY, heptagonVertices)

heptagon.alpha = 0

-- make border
heptagon.strokeWidth = 10

-- change border color
heptagon:setStrokeColor (0, 0, 0)

-- display "heptagon" under the heptagon
heptagonText = display.newText ("Heptagon", 440, 720, Arial, 40)

-- Change the text color
heptagonText:setTextColor (0.98,0.90,0.33)

-- put gradient into heptagon
heptagon.fill = heptagonPaint

-- funtion: OpaqueHeptagon
-- Input: this funtion accepts an EventListener
-- Output none
-- description: this function changes the transparency of the pentagon to opaque
local function OpaqueHeptagon( event )
	heptagon.alpha = heptagon.alpha + 0.01
end

-- OpaqueHeptagon will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueHeptagon)
-------------------------- Octagon --------------------------------
-- create local "Octagon variables"
local octagon 
local octagonText
local octagonX = 800
local octagonY = 200
local octagonVertices = {-40,80, 40,80, 100,20, 100,-60, 40,-120, -40,-120, -100,-60, -100,20}

-- Draw the octagon
octagon = display.newPolygon (octagonX, octagonY, octagonVertices)

octagon.alpha = 0

--set the fill color
octagon:setFillColor (1.00,0.28,0.58) 

-- make the border
octagon.strokeWidth = 10

-- change the border color
octagon:setStrokeColor (0, 0, 0)

-- display "octagon" below the octagon
octagonText = display.newText ("Octagon", 800, 330, Arial, 40)

--change the text color
octagonText:setTextColor (1.00,0.28,0.58)

-- funtion: OpaqueOctagon
-- Input: this funtion accepts an EventListener
-- Output none
-- description: this function changes the transparency of the octagon to opaque
local function OpaqueOctagon( event )
	octagon.alpha = octagon.alpha + 0.01
end

-- OpaqueOctagon will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueOctagon)
-------------------------- Nonagon --------------------------------
--create local octagon variables
local nonagon 
local nonagonText
local nonagonX = 800
local nonagonY = 500
local nonagonVertices = {-40,80, 40,80, 100,30, 115,-50, 75,-120, 0,-145, -75,-110, -115,-50, -100,30}

-- draw the nonagon
nonagon = display.newPolygon (nonagonX, nonagonY, nonagonVertices)

nonagon.alpha = 0

-- set fill image 
nonagon.fill = {type="image", filename="Images/doodlesFill.png"}

-- make border
nonagon.strokeWidth = 10

-- change border color
nonagon:setStrokeColor (0, 0, 0)

-- display "nonagon" underneath the nonagon
nonagonText = display.newText ("Nonagon", 800, 640, Arial, 40)

-- change the text color
nonagonText:setTextColor (0.65,0.15,0.58)

-- funtion: OpaqueNonagon
-- Input: this funtion accepts an EventListener
-- Output none
-- description: this function changes the transparency of the nonagon to opaque
local function OpaqueNonagon( event )
	nonagon.alpha = nonagon.alpha + 0.01
end

-- OpaqueNonagon will be called over and over again
Runtime:addEventListener ("enterFrame", OpaqueNonagon)