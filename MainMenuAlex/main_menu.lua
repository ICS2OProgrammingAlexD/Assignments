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

-------------------------------------------------------------------------
-- LOCAL VARIABLES
-------------------------------------------------------------------------
local cake 
local instructionsButton
local instructionsButtonPressed
local creditsButton
local creditsButtonPressed
local playButton
local playButtonPressed
local backButton
local backButtonPressed
local instructionsScrollSpeed = 10
local instructionsScrollSpeed2 = 10
local backScrollSpeed = 10
local backScrollSpeed2 = 5
local creditsScrollSpeed = 10
local creditsScrollSpeed2 = 5
local playScrollSpeed = 10
local playScrollSpeed2 = 10
------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------
-- When instructionsButton is touched
local function InstructionsTransition( touch )
    -- body
end

--This Function makes the buttons move into place 
local function MoveButtons()
    instructionsButton.x = instructionsButton.x + instructionsScrollSpeed
    instructionsButtonPressed.x = instructionsButtonPressed.x + instructionsScrollSpeed
    creditsButton.x = creditsButton.x + creditsScrollSpeed
    creditsButtonPressed.x = creditsButtonPressed.x + creditsScrollSpeed
    playButton.x = playButton.x + playScrollSpeed
    playButtonPressed.x = playButtonPressed.x + playScrollSpeed
    -- stops the buttons from moving offscreen, and moves them either up or down
    if (instructionsButton.x > display.contentWidth*8/10)then
        instructionsScrollSpeed = 0
        creditsScrollSpeed = 0
        playScrollSpeed = 0
        backScrollSpeed = 0 
        instructionsButton.y = instructionsButton.y - instructionsScrollSpeed2
        instructionsButtonPressed.y = instructionsButtonPressed.y - instructionsScrollSpeed2
        creditsButton.y = creditsButton.y - creditsScrollSpeed2
        creditsButtonPressed.y = creditsButtonPressed.y - creditsScrollSpeed2
        playButton.y = playButton.y + playScrollSpeed2
        playButtonPressed.y = playButtonPressed.y + playScrollSpeed2 
        -- stop the instructions Buttons from moving off screen
        if (instructionsButton.y < display.contentHeight*1/5) then
            instructionsScrollSpeed2 = 0
        end
        -- stops the credits buttons from moving off screen
        if (creditsButton.y < display.contentHeight*3/5) then
            creditsScrollSpeed2 = 0
        end
        -- stops the play buttons from moving off screen
        if (playButton.y > display.contentHeight*4/5) then
            playScrollSpeed2 = 0
        end
    end

end

-- function is called when the screen doesn't exist
function scene:create( event )
    local sceneGroup = self.view
    -- set the background color
    display.setDefault("background", 1, 1, 1)

    --create insructionsButton 
    instructionsButton = display.newImage("Images/InstructionsButtonUnpressedAlex@2x.png")
    instructionsButton.isVisible = true
    instructionsButton.width = 300
    instructionsButton.height = 150
    instructionsButton.x = display.contentWidth/3
    instructionsButton.y = display.contentHeight/2

    -- add to sceneGroup
    sceneGroup:insert(instructionsButton)

    --create instructionsButtonPressed
    instructionsButtonPressed = display.newImage("Images/InstructionsButtonPressedAlex@2x.png")
    instructionsButtonPressed.isVisible = true
    instructionsButtonPressed.width = 300
    instructionsButtonPressed.height = 150
    instructionsButtonPressed.x = display.contentWidth/3
    instructionsButtonPressed.y = display.contentHeight/2

    -- add to sceneGroup
    sceneGroup:insert(instructionsButtonPressed)

    --create creditsButton
    creditsButton = display.newImage("Images/creditsButtonUnpressedAlex@2x.png")
    creditsButton.isVisible = true
    creditsButton.width = 300
    creditsButton.height = 150
    creditsButton.x = display.contentWidth/3
    creditsButton.y = display.contentHeight/2

    -- add to sceneGroup
    sceneGroup:insert(creditsButton)

    --create creditsButtonPressed
    creditsButtonPressed = display.newImage("Images/creditsButtonPressedAlex@2x.png")
    creditsButtonPressed.isVisible = true
    creditsButtonPressed.width = 300
    creditsButtonPressed.height = 150
    creditsButtonPressed.x = display.contentWidth/3
    creditsButtonPressed.y = display.contentHeight/2

    -- add to sceneGroup
    sceneGroup:insert(creditsButtonPressed)


    --create playButton
    playButton = display.newImage("Images/PlayButtonUnpressedAlex@2x.png")
    playButton.isVisible = true
    playButton.width = 300
    playButton.height = 150
    playButton.x = display.contentWidth/3
    playButton.y = display.contentHeight/2
    -- add to sceneGroup
    sceneGroup:insert(playButton)


    -- create playButtonPressed
    playButtonPressed = display.newImage("Images/PlayButtonPressedAlex@2x.png")
    playButtonPressed.isVisible = true
    playButtonPressed.width = 300
    playButtonPressed.height = 150
    playButtonPressed.x = display.contentWidth/3
    playButtonPressed.y = display.contentHeight/2
    -- add to sceneGroup
    sceneGroup:insert(playButtonPressed)


    --create backButton
    backButton = display.newImage("Images/backButtonUnpressedAlex@2x.png")
    backButton.isVisible = true
    backButton.width = 300
    backButton.height = 150
    backButton.x = display.contentWidth/3
    backButton.y = display.contentHeight/2
    -- add to sceneGroup
    sceneGroup:insert(backButton)


    --create backButtonPressed
    backButtonPressed = display.newImage("Images/BackButtonPressedAlex@2x.png")
    backButtonPressed.isVisible = true
    backButtonPressed.width = 300
    backButtonPressed.height = 150
    backButtonPressed.x = display.contentWidth/3
    backButtonPressed.y = display.contentHeight/2
    -- add to sceneGroup
    sceneGroup:insert(backButtonPressed)


    -- create cake
    cake = display.newRect(0, 0, 600, 300)
    cake.x = display.contentWidth/3
    cake.y = display.contentHeight/2
    cake:setFillColor(0, 0, 0)

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
        MoveButtons()
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
