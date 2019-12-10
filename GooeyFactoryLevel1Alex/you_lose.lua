-----------------------------------------------------------------------------------------
-- Name: Alex De Meo
-- File: you_lose.lua
-- Class: ICS2O
-- Description: You lose screen for the CPT
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "you_lose"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- FORWARD REFERENCES
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkgImage
local youLoseSound = audio.loadStream("Sounds/YouLoseSound.mp3")
local youLoseSoundChannel
local youLoseImage
local scrollSpeed = 10
local scrollSpeed2 = 7
local scrollSpeed3 = 7
local restartButton
local mainMenuButton
----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- restarts level 1
local function RestartTransition(  )
    composer.gotoScene("level1_screen")
end

--goes to main menu
local function MainMenuTransition(  )
    composer.gotoScene("main_menu")
end


-- functon moves level failed text across the screen
local function AnimateEverything( event )
    youLoseImage.x = youLoseImage.x - scrollSpeed
    restartButton.y = restartButton.y - scrollSpeed2
    mainMenuButton.y = mainMenuButton.y - scrollSpeed3
    if (youLoseImage.x < -500) then
        youLoseImage.x = 1500
    end
    if (restartButton.y < display.contentHeight*12/15) then
        scrollSpeed2 = 0
    end
    if (mainMenuButton.y < display.contentHeight*12/ 13) then
        scrollSpeed3 = 0
    end
end

--------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    bkgImage = display.newImage("Images/YouLoseScreenForAlex.png")
    bkgImage.x = display.contentCenterX
    bkgImage.y = display.contentCenterY
    bkgImage.width = display.contentWidth
    bkgImage.height = display.contentHeight

    -- create youLoseImage
    youLoseImage = display.newImage("Images/LevelFailedText.png")
    youLoseImage.x = display.contentWidth/2
    youLoseImage.y = display.contentHeight*2/3 - 20
    youLoseImage.width = 1000
    youLoseImage.height = 100

    restartButton = widget.newButton(
    {
        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/2,
        y = display.contentHeight*1.25,

        -- Insert the images here
        defaultFile = "Images/RestartButtonUnpressedAlex.png",
        overFile = "Images/RestartButtonPressedAlex.png",

        -- height and width
        width = 150,
        height = 75,

        -- go to the question
        onRelease = RestartTransition
    } )

    mainMenuButton = widget.newButton(
    {
        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/2,
        y = display.contentHeight*1.25,

        -- Insert the images here
        defaultFile = "Images/MainMenuButtonUnpressedAlex.png",
        overFile = "Images/MainMenuButtonPressedAlex.png",

        -- height and width
        width = 150,
        height = 75,

        -- go to the question
        onRelease = MainMenuTransition
    } )
   
    -- Associating display objects with this scene 
    sceneGroup:insert( bkgImage )
    sceneGroup:insert( youLoseImage )
    sceneGroup:insert( mainMenuButton )
    sceneGroup:insert( restartButton )
  
end    

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        if (soundOn == true) then
            youLoseSoundChannel = audio.play(youLoseSound, {channel = 6})
        else
            youLoseSoundChannel = audio.play(youLoseSound, {channel = 6})
            audio.pause(youLoseSoundChannel)
        end
        Runtime:addEventListener("enterFrame", AnimateEverything)
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        Runtime:removeEventListener("enterFrame", AnimateEverything)
    end

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
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

