-----------------------------------------------------------------------------------------
-- Name: Alex De Meo
-- File: you_win.lua
-- Class: ICS2O
-- Description: You win screen for the CPT
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Calling Composer Library
local composer = require( "composer" )

local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "you_win"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- FORWARD VARIABLES 
-----------------------------------------------------------------------------------------

-- local variables for the scene
local bkgImage
local youWinImage
local scrollSpeed = 10
local scrollSpeed2 = 7
local scrollSpeed3 = 7
local restartButton
local mainMenuButton

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------

local youWinSound = audio.loadStream("Sounds/tada.mp3")
local youWinSoundChannel

----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function RestartTransition(  )
    composer.gotoScene("level1_screen")
end

local function MainMenuTransition(  )
    composer.gotoScene("main_menu")
end

-- animation for the You you_win
local function AnimateYouWin( event )
    youWinImage.x = youWinImage.x - scrollSpeed
    if(youWinImage.x < -500) then
        youWinImage.x = 1500
    end
end

local function AnimateButtons( event )
    restartButton.y = restartButton.y - scrollSpeed2
    if(restartButton.y < display.contentHeight*7/10) then
        scrollSpeed2 = 0
    end
    mainMenuButton.y = mainMenuButton.y - scrollSpeed3
    if (mainMenuButton.y < display.contentHeight*11/13) then
        scrollSpeed3 = 0
    end
end


--------------------------------------------------------------------------------------
-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Display background
    bkgImage = display.newImage("Images/YouWinScreenForAlex.png")
    bkgImage.x = display.contentCenterX
    bkgImage.y = display.contentCenterY
    bkgImage.width = display.contentWidth
    bkgImage.height = display.contentHeight

    -- create youWinImage
    youWinImage = display.newImage("Images/LevelCompleted.PNG")
    youWinImage.x = display.contentWidth/2
    youWinImage.y = display.contentHeight/2

    restartButton = widget.newButton(
    {
        -- Set its position on the screen relative to the screen size
        x = display.contentWidth/2,
        y = display.contentHeight*1.25,

        -- Insert the images here
        defaultFile = "Images/RestartButtonUnpressedAlex.png",
        overFile = "Images/RestartButtonPressedAlex.png",

        -- height and width
        width = 200,
        height = 100,

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
        width = 200,
        height = 100,

        -- go to the question
        onRelease = MainMenuTransition
    } )


    -- Associating display objects with this scene 
    sceneGroup:insert( bkgImage )
    sceneGroup:insert( youWinImage )
    sceneGroup:insert( restartButton )
    sceneGroup:insert( mainMenuButton)
  
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

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        if(soundOn == true) then
            youWinSoundChannel = audio.play(youWinSound, {channel = 5})
        else
            youWinSoundChannel = audio.play(youWinSound, {channel = 5})
            audio.pause(youWinSoundChannel)
        end
        Runtime:addEventListener("enterFrame", AnimateYouWin)
        Runtime:addEventListener("enterFrame", AnimateButtons)

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
        audio.stop(youWinSoundChannel)
        Runtime:removeEventListener("enterFrame", AnimateYouWin)
        Runtime:removeEventListener("enterFrame", AnimateButtons)

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

