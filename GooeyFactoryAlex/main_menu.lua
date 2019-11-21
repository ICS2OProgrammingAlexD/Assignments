------------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Alex De Meo
-- Date: Nov. 16, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local instructionsScrollSpeed = 10
local instructionsScrollSpeed2 = 10
local backScrollSpeed = 10
local backScrollSpeed2 = 5
local creditsScrollSpeed = 10
local creditsScrollSpeed2 = 5
local playScrollSpeed = 10
local playScrollSpeed2 = 10
local moveToPosition = false
local cake


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "slideLeft", time = 500})
end 

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "crossFade", time = 1000})
end    

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function InstructionsTransition( )
    composer.gotoScene("instructions_screen", {effect = "slideDown", time = 1000})
end

-- this function move the buttons into position
local function MoveButtons()
     -- moves buttons right
    if (instructionsButton.x < display.contentWidth*8/10) then       
        instructionsButton.x = instructionsButton.x + instructionsScrollSpeed
        creditsButton.x = creditsButton.x + creditsScrollSpeed
        playButton.x = playButton.x + playScrollSpeed
    else
        -- move buttons up
        instructionsButton.y = instructionsButton.y - instructionsScrollSpeed2
        creditsButton.y = creditsButton.y + creditsScrollSpeed2
        playButton.y = playButton.y + playScrollSpeed2

        -- stop the instructions Buttons from moving off screen
        if (instructionsButton.y < display.contentHeight*2/5) then
        instructionsScrollSpeed2 = 0
        end
        -- stops the credits buttons from moving off screen
        if (creditsButton.y > display.contentHeight*3/5) then
        creditsScrollSpeed2 = 0
        end
        -- stops the play buttons from moving off screen
        if (playButton.y > display.contentHeight*4/5) then
        playScrollSpeed2 = 0
        end
    end
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuAlex@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/3 - 30,
            y = display.contentHeight/2 + 30,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedAlex@2x.png",
            overFile = "Images/PlayButtonPressedAlex@2x.png",
            -- height and width
            width = 200,
            height = 100,

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/3 - 30,
            y = display.contentHeight/2 + 30,

            -- Insert the images here
            defaultFile = "Images/creditsButtonUnpressedAlex@2x.png",
            overFile = "Images/creditsButtonPressedAlex@2x.png",
            -- height and width
            width = 200,
            height = 100,

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
    
    -- ADD INSTRUCTIONS BUTTON WIDGET
    ----------------------------------------------------------------------------------------
    instructionsButton = widget.newButton(
        {
          -- set x/y of button
          x = display.contentWidth/3 - 30,
          y = display.contentHeight/2 + 30,

          -- height and width
          width = 200,
          height = 100,

          -- Insert the images here
          defaultFile = "Images/InstructionsButtonUnpressedAlex@2x.png",
          overFile = "Images/InstructionsButtonPressedAlex@2x.png",

          -- when button is released, call the instructions transition function  
          onRelease = InstructionsTransition
      } )
    -----------------------------------------------------------------------------------------
    -- create the cake
    cake = display.newImage("Images/cake.png")
    cake.x = display.contentWidth*2/5 - 92
    cake.y = display.contentHeight*2/3 - 20
    cake.width = 350
    cake.height = 425

    -- Associating button widgets and images with this scene 
    sceneGroup:insert( bkg_image )
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton )
    sceneGroup:insert( cake )
    

end -- function scene:create( event )   




-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        MoveButtons()

    end

end -- function scene:show( event )

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
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

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
