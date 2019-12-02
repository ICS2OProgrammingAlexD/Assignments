-----------------------------------------------------------------------------------------
--
-- game_level1.lua
-- Created by: Daniel
-- Date: Nov. 22nd, 2014
-- Description: This is the level 1 screen of the game.
-----------------------------------------------------------------------------------------


-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_screen"

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The background image and soccer ball for this scene
local bkg_image

--the text that displays the question
local questionText 

-- Variables containing the user answer and the actual answer
local userAnswer

--flour 
--butter
--eggs
--sugar

-- boolean variables telling me which answer box was touched
local flourAlreadyTouched = false
local butterAlreadyTouched = false
local eggsAlreadyTouched = false
local sugarAlreadyTouched = false

--create textboxes holding answer and alternate answers 
local flour
local butter
local eggs
local sugar

-- create variables that will hold the previous x- and y-positions so that 
-- each answer will return back to its previous position after it is moved
local flourPreviousY
local butterPreviousY
local eggsPreviousY
local sugarPreviousY

local flourPreviousX
local butterPreviousX
local eggsPreviousX
local sugarPreviousX

-- the black box where the user will drag the answer
local bowlPlaceholder

-- sound effects
local correctSound
local booSound

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------




local function PositionAnswers()
    -- set the new y-positions of each of the answers
    flour.y = display.contentHeight * 0.7
    flour.x = display.contentWidth/
    --eggs
    eggs.y = display.contentHeight * 0.70
    eggs.x = display.contentWidth/2 + 300

    --butter
    butter.y = display.contentHeight * 0.55
    butter.x = display.contentWidth/
    -- sugar
    sugar.y = display.contentHeight * 0.55
    sugar.x = display.contentWidth/2 + 300
    ---------------------------------------------------------
    --remembering their positions to return the answer in case it's wrong
    butterPreviousY = butter.y
    butterPreviousX = butter.x
    eggsPreviousY = eggs.y
    eggsPreviousX = eggs.x 
    flourPreviousY = flour.y 
    flourPreviousX = flour.x
    sugarPreviousY = sugar.y
    sugarPreviousX = sugar.x 
end

-- Transitioning Function to YouWin screen
local function YouWinTransitionLevel1( )
    composer.gotoScene("you_win", {effect = "fade", time = 500})
end

-- Function to Restart Level 1
local function RestartLevel1()
    PositionAnswers()    
end

-- Function to Check User Input
local function CheckUserAnswerInput()
          
    timer.performWithDelay(1600, RestartLevel1) 
end

local function TouchListenerFlour(touch)
    --only work if none of the other boxes have been touched
    if (butterAlreadyTouched == false) and 
        (eggsAlreadyTouched == false) and 
        (sugarAlreadyTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            flourAlreadyTouched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            answerbox.x = touch.x
            answerbox.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            flourAlreadyTouched = false

              -- if the number is dragged into the userAnswerBox, place it in the center of it
            if (((bowlPlaceholder.x - bowlPlaceholder.width/2) < answerbox.x ) and
                ((bowlPlaceholder.x + bowlPlaceholder.width/2) > answerbox.x ) and 
                ((bowlPlaceholder.y - bowlPlaceholder.height/2) < answerbox.y ) and 
                ((bowlPlaceholder.y + bowlPlaceholder.height/2) > answerbox.y ) ) then

                -- setting the position of the number to be in the center of the box
                answerbox.x = bowlPlaceholder.x
                answerbox.y = bowlPlaceholder.y
                userAnswer = correctAnswer

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                answerbox.x = answerboxPreviousX
                answerbox.y = answerboxPreviousY
            end
        end
    end                
end 

local function TouchListenerButter(touch)
    --only work if none of the other boxes have been touched
    if (flourAlreadyTouched == false) and 
        (eggsAlreadyTouched == false) and 
        (sugarAlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            butterAlreadyTouched = true
            
        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            butter.x = touch.x
            butter.y = touch.y

        elseif (touch.phase == "ended") then
            butterAlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((bowlPlaceholder.x - bowlPlaceholder.width/2) < butter.x ) and 
                ((bowlPlaceholder.x + bowlPlaceholder.width/2) > butter.x ) and 
                ((bowlPlaceholder.y - bowlPlaceholder.height/2) < butter.y ) and 
                ((bowlPlaceholder.y + bowlPlaceholder.height/2) > butter.y ) ) then

                butter.x = bowlPlaceholder.x
                butter.y = bowlPlaceholder.y

                userAnswer = alternateAnswer1

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                butter.x = butterPreviousX
                butter.y = butterPreviousY
            end
        end
    end
end 

local function TouchListenerEggs(touch)
    --only work if none of the other boxes have been touched
    if (flourAlreadyTouched == false) and 
        (butterAlreadyTouched == false) and 
        (sugarAlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            eggsAlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            eggs.x = touch.x
            eggs.y = touch.y

        elseif (touch.phase == "ended") then
            eggsAlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((bowlPlaceholder.x - bowlPlaceholder.width/2) < eggs.x ) and 
                ((bowlPlaceholder.x + bowlPlaceholder.width/2) > eggs.x ) and 
                ((bowlPlaceholder.y - bowlPlaceholder.height/2) < eggs.y ) and 
                ((bowlPlaceholder.y + bowlPlaceholder.height/2) > eggs.y ) ) then

                eggs.x = bowlPlaceholder.x
                eggs.y = bowlPlaceholder.y
                userAnswer = alternateAnswer2

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                eggs.x = eggsPreviousX
                eggs.y = eggsPreviousY
            end
        end
    end
end 

-- Function that Adds Listeners to each answer box
local function AddAnswerBoxEventListeners()
    answerbox:addEventListener("touch", TouchListenerFlour)
    butter:addEventListener("touch", TouchListenerButter)
    eggs:addEventListener("touch", TouchListenerEggs)
end 

-- Function that Removes Listeners to each answer box
local function RemoveAnswerBoxEventListeners()
    answerbox:removeEventListener("touch", TouchListenerFlour)
    butter:removeEventListener("touch", TouchListenerButter)
    eggs:removeEventListener("touch", TouchListenerEggs)
end 

----------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
----------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ----------------------------------------------------------------------------------
    ----------------------------------------------------------------------------------
    --Inserting backgroud image and lives
    ----------------------------------------------------------------------------------

    -- Insert the background image
    bkg_image = display.newImageRect("Images/Level1ScreenAlex.png", 1024, 768)
    bkg_image.anchorX = 0
    bkg_image.anchorY = 0
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- boolean variables stating whether or not the answer was touched
    flourAlreadyTouched = false
    butterAlreadyTouched = false
    eggsAlreadyTouched = false
    sugarAlreadyTouched = false

    --create answerbox alternate answers and the boxes to show them
    flour = display.newImageRect("Images/flour.png", 100, 200)
    flour.isVisible = true
    butter = display.newImageRect("Images/butter.png", 200, 100)
    butter.isVisible = true
    eggs = display.newImageRect("Images/eggs.png", 200, 75)
    eggs.isVisible = true
    sugar = display.newImageRect("Images/sugar.png", 100, 200)
    sugar.isVisible = true

    -- the black box where the user will drag the answer
    bowlPlaceholder = display.newImageRect("Images/bowlPlaceholder.png",  130, 130, 0, 0)
    bowlPlaceholder.x = display.contentWidth * 0.6
    bowlPlaceholder.y = display.contentHeight * 0.9

    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------

    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( bowlPlaceholder )
    sceneGroup:insert( flour )
    sceneGroup:insert( butter )
    sceneGroup:insert( eggs )
    sceneGroup:insert( sugar )


end --function scene:create( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).    

    elseif ( phase == "did" ) then

        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        RestartLevel1()
        AddAnswerBoxEventListeners() 

    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        audio.stop()
        RemoveAnswerBoxEventListeners()
    end

end --function scene:hide( event )

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