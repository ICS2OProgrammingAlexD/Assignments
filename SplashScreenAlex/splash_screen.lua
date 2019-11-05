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

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------
local companyLogo
local companyLogo2
local scrollSpeed = 10


----------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------

--this function allows the logo to drop from the top of the screen
local function DropLogo(  )
	if (companyLogo.y == display.contentHeight/2) then
		scrollSpeed = 0
	else
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
    companyLogo.y = 0

    -- create the company logo 2
    companyLogo2 = display.newImageRect("Images/CompanyLogoNumber2")


    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( companyLogo )
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
