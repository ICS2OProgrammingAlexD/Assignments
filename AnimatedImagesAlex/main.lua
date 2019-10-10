-- Title: AnimatedImages
-- Name: Alex De Meo
-- Course: ICS2O
-- This program has a background and 5 different objects
--that move around on the screen. There will also be 
--gradiented text.
-- spaceships bounce on sidescreens, one shrinks and leaves screen,
-- astronaut spins on diagonal
-- shooting star goes parabolic and becomes opaque

-- get rid of status bar
display.setStatusBar (display.HiddenStatusBar)

--------------------------------------------------------
-- make local variables
----------------------------------------------------------
local backgroundImage
local shootingStar
local astronaut
local spaceshipNum1
local spaceshipNum2
local welcomeText
local paint 
local scrollSpeed1 = 5
local scrollSpeed2 = 2

--------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------

-- create the background
backgroundImage = display.newImageRect("Images/background.png", 1024, 768)
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-- create shooting star
shootingStar = display.newImageRect("Images/ShootingStar.png", 200, 150)
shootingStar.x = 1124
shootingStar.y = 800

-- create astronaut
astronaut = display.newImageRect("Images/Astronaut.png", 150, 150)
astronaut.x = 0
astronaut.y = 768

-- create spaceshipNum1
spaceshipNum1 = display.newImageRect ("Images/Spaceship.png", 150, 150)
spaceshipNum1.x = display.contentWidth/2
spaceshipNum1.y = 762

-- create spaceshipNum2
spaceshipNum2 = display.newImageRect ("Images/Spaceship2.png", 150, 150)

-- create welcomeText

-- create and set the gradient fill


--------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------

local function MoveAstronaut( event )
	astronaut.x = astronaut.x + scrollSpeed2
	astronaut.y = astronaut.y - scrollSpeed2

	--spins astronaut
	astronaut:rotate(2)
end

local function MoveSpaceship( event )
	spaceshipNum1.y = spaceshipNum1.y - scrollSpeed1

	if (spaceshipNum1.y < 0) then
		spaceshipNum1.y = spaceshipNum1.x + scrollSpeed1
	end

	if ((spaceshipNum1.y + spaceshipNum1.width) > display.contentWidth) then 
		spaceship.y = spaceship.y + 3
		scrollSpeed1 = -scrollSpeed1
	end
	
end
-- to rotate = var:rotate(number for speed)

----------------------------------------------------------
-- EVENT LISTENERS
---------------------------------------------------------
-- do event listeners to astronaut
Runtime:addEventListener("enterFrame", MoveAstronaut)

-- event listener for spaceshipNum1
Runtime:addEventListener("enterFrame", MoveSpaceship)