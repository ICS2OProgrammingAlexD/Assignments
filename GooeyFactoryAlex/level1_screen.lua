-- Use Composer Library 
local composer = require("composer")

-- Name the Scene Object
sceneName = "level1_screen"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)


function scene:create( event )
	local sceneGroup = self.view

	display.setDefault("background", 1, 1, 1)
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
