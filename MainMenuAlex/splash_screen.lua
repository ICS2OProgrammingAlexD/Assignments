---------------------------------------------------------------
-- splash_screen.lua
-- Created by: Alex De Meo
-- Date: Nov. 4, 2019
-- Description: This is the splash screen for the app
------------------------------------------------------------------

-------------------------------------------------------------------
--INITIALIZATIONS
-------------------------------------------------------------------------

-- Use Composer Library 
local composer = require("composer")

-- Name the Scene Object
sceneName = "splash_screen"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)
--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------
local companyLogo
local companyLogo2
local scrollSpeed = 5
local splashScreenSound = audio.loadStream("Sounds/Intro.mp3")
local splashScreenSoundChannel


----------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------
-- this function transitions the screens.
local function MainMenuTransition(  )
    composer.gotoScene("main_menu")
end

-- this function makes the logos fade in/out
local function LogoFadeInOut(  )
    -- make the first company logo fade out
    companyLogo.alpha = companyLogo.alpha - 0.04
    -- make the second company logo fade in 
    companyLogo2.alpha = companyLogo2.alpha + 0.019 
    if (companyLogo2.alpha == 1) then
        --go to the main menu
        timer.performWithDelay(500, MainMenuTransition)
    end
end
--this function allows the logo to drop from the top of the screen
local function DropLogo(  )
	if (companyLogo.y > display.contentHeight/2) then
        --stop the company logo from dropping 
		scrollSpeed = 0
        -- start LogoFadeInOut
        timer.performWithDelay(1500, LogoFadeInOut)
	else
        -- drop the logo down
		companyLogo.y = companyLogo.y + scrollSpeed
	end
end


-- function is called when the screen doesn't exist
function scene:create( event )
	local sceneGroup = self.view

	display.setDefault("background", 1, 1, 1)

    -- Insert the companyLogo image
    companyLogo = display.newImageRect("Images/CompanyLogo@2x.png", 300, 300)

    -- set the initial x and y position of the companyLogo
    companyLogo.x = display.contentCenterX
    companyLogo.y = -200

    -- create the company logo 2
    companyLogo2 = display.newImageRect("Images/CompanyLogoNumber2@2x.png", 1024, 768)
    companyLogo2.x = display.contentWidth/2
    companyLogo2.y = display.contentHeight/2
    companyLogo2.alpha = 0


    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( companyLogo )
    sceneGroup:insert(companyLogo2 )
end

-- the function is called when the scene is still off screen (but is about to come on screen)
function scene:show(event)
	-- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Play the Intro Music
        splashScreenSoundChannel = audio.play(splashScreenSound)
        -- Drop the logo from the screen 
        Runtime:addEventListener("enterFrame", DropLogo)
    end

end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	----------------------------------------------------

	if (phase == "will") then

	--------------------------------------------------
	elseif (phase == "did") then
		-- stop the sound 
        splashScreenSoundChannel = audio.pause(splashScreenSound)
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
end

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
