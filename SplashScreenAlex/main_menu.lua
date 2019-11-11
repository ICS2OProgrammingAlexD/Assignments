--Title: main_menu.lua
-- Created by: Alex De Meo
-- Date: Nov. 6
-- Description: This is the main menu (It is only here because I need to switch scenes 
--so that Miss Raffin can see when the splash screen ends)

-- Use composer library
local composer = require("composer")

-- Name the Scene Object
sceneName = "main_menu"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)
------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------


-- function is called when the screen doesn't exist
function scene:create( event )
    local sceneGroup = self.view
    -- set the background color
    display.setDefault("background", 0, 0, 0)

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
