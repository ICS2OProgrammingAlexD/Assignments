-- Title: level1_screen.lua
-- Created by: Alex De Meo
-- Date: Nov. 20, 2019
-- Description: This is the level 1 of my CPT app "Gooey Factory".

-- Use Composer Library 
local composer = require("composer")

-- Use widget Library
local widget = require("widget")

-- Name the Scene Object
sceneName = "level1_screen"
----------------------------------------------------------------------------

local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

----------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------
local bkgImage

----------------------------------------------------------------------------
--LOCAL SOUNDS
----------------------------------------------------------------------------
local bkgMusic = audio.loadStream("Sounds/Level1Music.mp3")
local bkgMusicChannel

----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------


function scene:create( event )
	local sceneGroup = self.view

	bkgImage = display.newImage("Images/Level1ScreenAlex.png")
	bkgImage.width = display.contentWidth
	bkgImage.height = display.contentHeight
	bkgImage.x = display.contentWidth/2
	bkgImage.y = display.contentHeight/2

	-- insert images and buttons to sceneGroup
	sceneGroup:insert(bkgImage)
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
        bkgMusicChannel = audio.play(bkgMusic)
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
		audio.stop(bkgMusicChannel)
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
