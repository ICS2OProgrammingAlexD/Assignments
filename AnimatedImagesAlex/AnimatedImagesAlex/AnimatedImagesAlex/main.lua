-- Title: AnimatedImages
-- Name: Alex De Meo
-- Course: ICS2O
-- This program has a background and 5 different objects
-- that move around on the screen. There will also be 
-- gradiented text.
-- spaceships bounce on sidescreens, one shrinks and leaves screen,
-- astronaut spins on diagonal
-- shooting star goes parabolic and becomes opaque

-- get rid of status bar
display.setStatusBar (display.HiddenStatusBar)

--------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------
local backgroundImage
local shootingStar
local astronaut
local spaceshipNum1
local spaceshipNum2
local welcomeText
local paint = {
	type="gradient",
	color1 = {0.32, 0.87, 0.59},
	color2 = {1, 1, 1},
	direction="down" 
} 
local scrollSpeed1 = 5
local scrollSpeed2 = 2
local scrollSpeed3 = 1
local spaceshipNum3
local spaceshipNum4
local dingSound
local buzzSound
local parabolicXSpeed = -20
local parabolicYSpeed = -25
--------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------
-- create the background
backgroundImage = display.newImageRect("Images/background.png", 1024, 768)
backgroundImage.x = display.contentWidth/2
backgroundImage.y = display.contentHeight/2

-- create shooting star
shootingStar = display.newImageRect("Images/ShootingStar.png", 200, 150)
shootingStar.x = 1024
shootingStar.y = 768

-- create astronaut
astronaut = display.newImageRect("Images/Astronaut.png", 150, 150)
astronaut.x = 0
astronaut.y = 768

-- create spaceshipNum1
spaceshipNum1 = display.newImageRect ("Images/Spaceship.png", 150, 150)
spaceshipNum1.x = display.contentWidth/2
spaceshipNum1.y = 600
spaceshipNum1.xScale = 0.01
spaceshipNum1.yScale = 0.01

-- create spaceshipNum2
spaceshipNum2 = display.newImageRect ("Images/Spaceship2.png", 150, 150)
spaceshipNum2.x = display.contentWidth/2 + 100
spaceshipNum2.y = 768
spaceshipNum2.alpha = 0.01
-- create welcomeText
welcomeText = display.newText ("                              Welcome. \n               This is Alex's rocket looper. \n Pay attention else you might miss something! \n Now click on something and see what happens", display.contentWidth/2, display.contentHeight/2, Arial, 40)
welcomeText.fill = paint

--create spaceshipNum3
spaceshipNum3 = display.newImageRect("Images/Spaceship.png", 150, 150)
spaceshipNum3.isVisible = true
spaceshipNum3.x = 800
spaceshipNum3.y = 600

-- create spaceshipNum4
spaceshipNum4 = display.newImageRect("Images/Spaceship2.png", 150, 150)
spaceshipNum4.isVisible = false
spaceshipNum4.x = 800
spaceshipNum4.y = 600

--create dingSound
dingSound = audio.loadSound("Sounds/Correct Answer Sound Effect.mp3")

--create buzzSound
buzzSound = audio.loadSound ("Sounds/Wrong Buzzer Sound Effect.mp3")
--------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------
-- hides spaceshipNum1 when clicked
local function HideSpaceship1( touch )
	spaceshipNum1.isVisible = false
end

-- Changes the rocket from spaceshipNum3 when clicked to spaceshipNum4
local function RocketSwitcher(touch)
	if (touch.phase == "began") then
		spaceshipNum3.isVisible = false
		spaceshipNum4.isVisible = true
		audio.play(dingSound)
	end

	if (touch.phase == "ended") then
		spaceshipNum3.isVisible = true
		spaceshipNum4.isVisible = false
		
	end
end
-- Part 2 of RocketSwitcher
local function RocketSwitcher2( touch )
	if (touch.phase == "began") then
		spaceshipNum4.isVisible = false
		spaceshipNum3.isVisible = true
		audio.play(buzzSound)
	end

	if (touch.phase == "ended") then
		spaceshipNum4.isVisible = true
		spaceshipNum3.isVisible = false
	end
end

-- makes shooting star go on a parabolic path
local function StarParabola( event )
	parabolicYSpeed = parabolicYSpeed + 1

	shootingStar.x = shootingStar.x + parabolicXSpeed
	shootingStar.y = shootingStar.y + parabolicYSpeed
end

-- moves the RocketSwitcher
local function MoveSwitchingRockets( event )
	spaceshipNum3.x = spaceshipNum3.x - scrollSpeed3
	spaceshipNum4.x = spaceshipNum4.x - scrollSpeed3
end

--Rotates spaceshipNum2 when clicked
local function SpinSpaceshipNum2( touch )
	spaceshipNum2:rotate(10)
end

local function MoveAstronaut( event )
	astronaut.x = astronaut.x + scrollSpeed2
	astronaut.y = astronaut.y - scrollSpeed2

	--spins astronaut
	astronaut:rotate(2)
end

-- Teleports Astronaut back to starting point when it is clicked
local function TeleportAstronaut( touch)
	astronaut.x  = 100
	astronaut.y = 700
end

-- Hides the Text when it is clicked
local function HideWelcomeText( touch )
	welcomeText.isVisible = false
end

--Moves spaceshipNum1 and spaceshipNum2
local function MoveSpaceships( event )
	
		spaceshipNum2.y = spaceshipNum2.y - scrollSpeed1
		spaceshipNum2.alpha = spaceshipNum2.alpha + 0.01
		
	if (spaceshipNum1.y == 0) then
		spaceshipNum1.y = 800 + scrollSpeed1
	else
		spaceshipNum1.y = spaceshipNum1.y - scrollSpeed1
		spaceshipNum1.xScale = spaceshipNum1.xScale + 0.01
		spaceshipNum1.yScale = spaceshipNum1.yScale + 0.01
	end

	if (spaceshipNum2.y < 0) then 
		scrollSpeed2 =  6
		spaceshipNum2.y = 800 + scrollSpeed2

	end

end

----------------------------------------------------------
-- EVENT LISTENERS
---------------------------------------------------------
-- do event listeners to astronaut
Runtime:addEventListener("enterFrame", MoveAstronaut)

-- event listener for spaceshipNum1
Runtime:addEventListener("enterFrame", MoveSpaceships)

-- add touch listener for spaceshipNum1
spaceshipNum1:addEventListener("touch", HideSpaceship1)

-- add touch listener for spaceshipNum2
spaceshipNum2:addEventListener("touch", SpinSpaceshipNum2)

-- add touch listener for welcomeText
welcomeText:addEventListener("touch", HideWelcomeText)

--  add touch listener  Astronaut
astronaut:addEventListener("touch", TeleportAstronaut)

-- add touch listener for spaceshipNum3
spaceshipNum3:addEventListener("touch", RocketSwitcher)

-- add touch listener for spaceshipNum4
spaceshipNum4:addEventListener("touch", RocketSwitcher2)

-- add event listener for shootingStar
Runtime:addEventListener("enterFrame", StarParabola)

-- add event listener for the Switching Rockets
Runtime:addEventListener("enterFrame", MoveSwitchingRockets)