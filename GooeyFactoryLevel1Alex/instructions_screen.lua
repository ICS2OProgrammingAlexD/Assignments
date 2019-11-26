-- Title: instructions_screen.lua
-- Created by: Alex De Meo
-- Date: Nov. 19
-- Description: This is the instructions screen. From the instructions that our
-- group of grade 3s, this is where you will learn how to play.

-- Use composer library
local composer = require("composer")

-- Use widget Library 
local widget = require( "widget" )

-- Name the Scene Object
sceneName = "instructions_screen"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------
local bkgImage
local backButton

------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------
-- Creating Transitioning Function back to main menu
local function BackTransition( )
    composer.gotoScene( "main_menu", {effect = "slideUp", time = 500})
end

-- function is called when the screen doesn't exist
function scene:create( event )
    local sceneGroup = self.view
    -- set the background color
    bkgImage = display.newImage("Images/InstructionsScreenAlex.png")
    bkgImage.width = display.contentWidth
    bkgImage.height = display.contentHeight
    bkgImage.x = display.contentWidth/2
    bkgImage.y = display.contentHeight/2



    -- Creating Back Button
    backButton = widget.newButton( 
    {
        -- Setting Position
        x = display.contentWidth*2/8,
        y = display.contentHeight*14/16,

        -- Setting Dimensions
        width = 200,
        height = 100,

        -- Setting Visual Properties
        defaultFile = "Images/backButtonUnpressedAlex.png",
        overFile = "Images/BackButtonPressedAlex.png",

        -- Setting Functional Properties
        onRelease = BackTransition

    } )

    -- add buttons, objects and images to sceneGroup
    sceneGroup:insert( bkgImage)
    sceneGroup:insert( backButton)


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
