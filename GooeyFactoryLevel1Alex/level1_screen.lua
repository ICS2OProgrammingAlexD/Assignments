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

-- Variables containing the user answer and the actual answer
local userAnswer

-- boolean variables telling me which answer box was touched
local flourAlreadyTouched = false
local eggsAlreadyTouched = false
local sugarAlreadyTouched = false
local butterAlreadyTouched = false

--objects
local flour
local eggs 
local sugar
local butter
local bowl 


-- each answer will return back to its previous position after it is moved
local flourPreviousY
local eggsPreviousY
local sugarPreviousY
local butterPreviousY

local flourPreviousX
local eggsPreviousX
local sugarPreviousX
local butterPreviousX

-- the black box where the user will drag the answer
local bowlPlaceholder

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
-- sound effects
local correctSound
local booSound 

-- background music
local bkgMusic = audio.loadStream("Sounds/Level1Music.mp3")
local bkgMusicChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

local function DisplayQuestion()
    local randomNumber1
    local randomNumber2

    --set random numbers
    randomNumber1 = math.random(2, 15)
    randomNumber2 = math.random(2, 15)

    --calculate answer
    correctAnswer = randomNumber1 + randomNumber2

    --change question text in relation to answer
    questionText.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 

    -- put the correct answer into the answerbox
    answerbox.text = correctAnswer

    -- make it possible to click on the answers again
    answerboxAlreadyTouched = false
    alternateAnswerBox1AlreadyTouched = false
    alternateAnswerBox2AlreadyTouched = false

end

local function PositionIngredients()
    -- put ingredients into position
    flour.x = 
    flour.y = 
    sugar.x =
    sugar.y =
    butter.x = 
    butter.y =
    eggs.x = 
    eggs.y =
end

-- Transitioning Function to YouWin screen
local function YouWinTransitionLevel1( )
    composer.gotoScene("you_win", {effect = "fade", time = 500})
end

-- Function to Restart Level 1
local function RestartLevel1()
    DisplayQuestion()
    DetermineAlternateAnswers()
    PositionIngredients()    
end

-- Function to Check User Input
local function CheckUserAnswerInput()
          
    timer.performWithDelay(1600, RestartLevel1) 
end

local function TouchListenerflour(touch)
    --only work if none of the other boxes have been touched
    if (sugarAlreadyTouched == false) and 
        (eggsAlreadyTouched == false) and
        (butterAlreadyTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            flourAlreadyTouched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            flour.x = touch.x
            flour.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            answerboxAlreadyTouched = false

              -- if the number is dragged into the userAnswerBox, place it in the center of it
            if (((bowlPlaceHolder.x - bowlPlaceHolder.width/2) < flour.x ) and
                ((bowlPlaceHolder.x + bowlPlaceHolder.width/2) > flour.x ) and 
                ((bowlPlaceHolder.y - bowlPlaceHolder.height/2) < flour.y ) and 
                ((bowlPlaceHolder.y + bowlPlaceHolder.height/2) > flour.y ) ) then

                -- setting the position of the number to be in the center of the box
                flour.x = bowlPlaceHolder.x
                flour.y = bowlPlaceHolder.y
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

local function TouchListenerAnswerBox1(touch)
    --only work if none of the other boxes have been touched
    if (answerboxAlreadyTouched == false) and 
        (alternateAnswerBox2AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswerBox1AlreadyTouched = true
            
        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            alternateAnswerBox1.x = touch.x
            alternateAnswerBox1.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswerBox1AlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((bowlPlaceHolder.x - bowlPlaceHolder.width/2) < alternateAnswerBox1.x ) and 
                ((bowlPlaceHolder.x + bowlPlaceHolder.width/2) > alternateAnswerBox1.x ) and 
                ((bowlPlaceHolder.y - bowlPlaceHolder.height/2) < alternateAnswerBox1.y ) and 
                ((bowlPlaceHolder.y + bowlPlaceHolder.height/2) > alternateAnswerBox1.y ) ) then

                alternateAnswerBox1.x = bowlPlaceHolder.x
                alternateAnswerBox1.y = bowlPlaceHolder.y

                userAnswer = alternateAnswer1

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswerBox1.x = alternateAnswerBox1PreviousX
                alternateAnswerBox1.y = alternateAnswerBox1PreviousY
            end
        end
    end
end 

local function TouchListenerAnswerBox2(touch)
    --only work if none of the other boxes have been touched
    if (answerboxAlreadyTouched == false) and 
        (alternateAnswerBox1AlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            alternateAnswerBox2AlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            alternateAnswerBox2.x = touch.x
            alternateAnswerBox2.y = touch.y

        elseif (touch.phase == "ended") then
            alternateAnswerBox2AlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((bowlPlaceHolder.x - bowlPlaceHolder.width/2) < alternateAnswerBox2.x ) and 
                ((bowlPlaceHolder.x + bowlPlaceHolder.width/2) > alternateAnswerBox2.x ) and 
                ((bowlPlaceHolder.y - bowlPlaceHolder.height/2) < alternateAnswerBox2.y ) and 
                ((bowlPlaceHolder.y + bowlPlaceHolder.height/2) > alternateAnswerBox2.y ) ) then

                alternateAnswerBox2.x = bowlPlaceHolder.x
                alternateAnswerBox2.y = bowlPlaceHolder.y
                userAnswer = alternateAnswer2

                -- call the function to check if the user's input is correct or not
                CheckUserAnswerInput()

            --else make box go back to where it was
            else
                alternateAnswerBox2.x = alternateAnswerBox2PreviousX
                alternateAnswerBox2.y = alternateAnswerBox2PreviousY
            end
        end
    end
end 

-- Function that Adds Listeners to each answer box
local function AddAnswerBoxEventListeners()
    flour:addEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:addEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:addEventListener("touch", TouchListenerAnswerBox2)
end 

-- Function that Removes Listeners to each answer box
local function RemoveAnswerBoxEventListeners()
    answerbox:removeEventListener("touch", TouchListenerAnswerbox)
    alternateAnswerBox1:removeEventListener("touch", TouchListenerAnswerBox1)
    alternateAnswerBox2:removeEventListener("touch", TouchListenerAnswerBox2)
end 

----------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
----------------------------------------------------------------------------------


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
    bkg_image = display.newImageRect("Images/Level1ScreenAlex.png", 2048, 1536)
    bkg_image.anchorX = 0
    bkg_image.anchorY = 0
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    --the text that displays the question
    questionText = display.newText( "" , 0, 0, nil, 100)
    questionText.x = display.contentWidth * 0.3
    questionText.y = display.contentHeight * 0.9

    -- boolean variables stating whether or not the answer was touched
    flourAlreadyTouched = false
    sugarAlreadyTouched = false
    butterAlreadyTouched = false
    eggsAlreadyTouched = false


    -- create ingredients 
    flour = display.newImage("flour.png")
    butter = display.newImage("butter.png")
    sugar = display.newImage("sugar.png")
    eggs = display.newImage("eggs.png")

    -- set the x positions of each of the answer boxes
    answerboxPreviousX = display.contentWidth * 0.9
    alternateAnswerBox1PreviousX = display.contentWidth * 0.9
    alternateAnswerBox2PreviousX = display.contentWidth * 0.9


    -- the black box where the user will drag the answer
    bowlPlaceHolder = display.newImageRect("Images/bowlPlaceHolder.png",  130, 130, 0, 0)
    bowlPlaceHolder.x = display.contentWidth * 0.6
    bowlPlaceHolder.y = display.contentHeight * 0.9

    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------

    sceneGroup:insert( bkg_image ) 
    sceneGroup:insert( questionText ) 
    sceneGroup:insert( bowlPlaceHolder )
    sceneGroup:insert( flour )
    sceneGroup:insert( butter )
    sceneGroup:insert( sugar )
    sceneGroup:insert( eggs )

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
        RestartLevel1()
        AddAnswerBoxEventListeners() 
        -- start music
        bkgMusicChannel = audio.play(bkgMusic, {channel=3, loop= -1})
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
        audio.stop(bkgMusicChannel)
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