-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- By: Alex De Meo
-- Date: Dec. 7, 2019
-- Description: This is the level 1 question screen of the game.
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
sceneName = "level1_questions"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local bkgImage

-- for the question 
local questionTextObject
local checkmark
local redX1
local redX2

-- the text objects that will hold the correct answer and the wrong answers
local answerTextObject 
local wrongAnswer1TextObject
local wrongAnswer2TextObject

-- Boolean variable that states if user clicked the answer or not
local alreadyClickedAnswer = false

-- cakes baked/wrecked 
local cakesBaked = 0
local cakesBakedTextObject
local cakesWrecked = 0
local cakesWreckedTextObject

local bakedCake
local wreckedCake
local bakedCakeTextObject
local wreckedCakeTextObject

-----------------------------------------------------------------------------------------
-- SOUND
-----------------------------------------------------------------------------------------
local clockSound = audio.loadStream("Sounds/clockticking.mp3")
local clockSoundChannel
local dingSound = audio.loadSound("Sounds/dingSound.mp3")
local buzzSound = audio.loadSound("Sounds/buzzSound.mp3")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
-- function that goes back to the level 1 screen when called
local function BackToLevel1(  )
    composer.gotoScene("level1_screen", {effect = "fade", time = 500} )
end

-- goes to you win screen
local function YouWinTransition(  )
    composer.gotoScene("you_win", {effect = "fromRight", time = 500} )
end

-- goes to you Lose
local function YouLoseTransition(  )
    composer.gotoScene("you_lose", {effect = "fromRight", time = 500} )
end

-- function shows cake everything
local function ShowCake(  )
    bakedCake.isVisible = true
    bakedCakeTextObject.isVisible = true
    questionTextObject.isVisible = false
    answerTextObject.isVisible = false
    checkmark.isVisible = false

    -- call BackToLevel1 after 4 secs
    if (cakesBaked == 3) then
        cakesBakedTextObject.isVisible = false
        cakesWreckedTextObject.isVisible = false
        timer.performWithDelay(2000, YouWinTransition)
    else
        timer.performWithDelay(2000, BackToLevel1)
    end
end

-- function show wrecked cake 
local function ShowWreckedCake(  )
    wreckedCake.isVisible = true
    wreckedCakeTextObject.isVisible = true
    questionTextObject.isVisible = false
    answerTextObject.isVisible = false
    wrongAnswer1TextObject.isVisible = false
    wrongAnswer2TextObject.isVisible = false
    checkmark.isVisible = false
    redX1.isVisible = false
    redX2.isVisible = false

    if (cakesWrecked == 3) then 
        cakesBakedTextObject.isVisible = false
        cakesWreckedTextObject.isVisible = false
        timer.performWithDelay(2000, YouLoseTransition)
    else
        -- call BackToLevel1 after 4 secs
        timer.performWithDelay(2000, BackToLevel1)
    end
end

-- Function that changes the answers for a new question and places them randomly in one of the positions
local function DisplayAnswers( )
    local randomQuestion = math.random(1, 6)
    if (randomQuestion == 1) then
        questionTextObject.text = "What is the strongest shape?"
        answerTextObject.text = "Triangle"
        wrongAnswer1TextObject.text = "Square"
        wrongAnswer2TextObject.text = "Circle"
    elseif (randomQuestion == 2) then
        questionTextObject.text = "What kind of tree has flowers?"
        answerTextObject.text = "Blossom Tree"
        wrongAnswer1TextObject.text = "Oak Tree"
        wrongAnswer2TextObject.text = "Maple Tree"
    elseif (randomQuestion == 3) then
        questionTextObject.text = "What do plants need to grow?"
        answerTextObject.text = "Water + sun + CO2"
        checkmark.x = display.contentWidth/6
        wrongAnswer1TextObject.text = "Water + Moonlight + Oxygen"
        redX1.x = display.contentWidth/6
        wrongAnswer2TextObject.text = "Juice + Moonlight + CO2"
        redX2.x = display.contentWidth/6
    elseif (randomQuestion == 4) then
        questionTextObject.text = "Which one is a natural substance?"
        answerTextObject.text = "Oil"
        wrongAnswer1TextObject.text = "Chair"
        wrongAnswer2TextObject.text = "Car"
    elseif (randomQuestion == 5) then
        questionTextObject.text = "Which one is a natural substance?"
        answerTextObject.text = "Grass"
        wrongAnswer1TextObject.text = "Glass"
        wrongAnswer2TextObject.text = "Pavement"
    elseif (randomQuestion == 6) then
        questionTextObject.text = "What is the Earth?"
        answerTextObject.text = "Round"
        wrongAnswer1TextObject.text = "Flat"
        wrongAnswer2TextObject.text = "A Cube"

    end

    local answerPosition = math.random(1, 3)
    if (answerPosition == 1) then                
            answerTextObject.y = display.contentHeight*9/12  
            checkmark.y = display.contentHeight*9/12   
            wrongAnswer1TextObject.y = display.contentHeight*7/12
            redX1.y = display.contentHeight*7/12
            wrongAnswer2TextObject.y = display.contentHeight*8/12
            redX2.y = display.contentHeight*8/12

    elseif (answerPosition == 2) then
            answerTextObject.y = display.contentHeight*7/12   
            checkmark.y = display.contentHeight*7/12     
            wrongAnswer1TextObject.y = display.contentHeight*8/12
            redX1.y = display.contentHeight*8/12
            wrongAnswer2TextObject.y = display.contentHeight*9/12
            redX2.y = display.contentHeight*9/12

    elseif (answerPosition == 3) then
            answerTextObject.y = display.contentHeight*8/12  
            checkmark.y = display.contentHeight*8/12
            wrongAnswer1TextObject.y = display.contentHeight*9/12 
            redX1.y = display.contentHeight*9/12
            wrongAnswer2TextObject.y = display.contentHeight*7/12
            redX2.y = display.contentHeight*7/12
    end
end

local function RestartScene()

    alreadyClickedAnswer = false
    checkmark.isVisible = false
    redX1.isVisible = false
    redX2.isVisible = false
    bakedCake.isVisible = false
    wreckedCake.isVisible = false
    wrongAnswer2TextObject.isVisible = true
    wrongAnswer1TextObject.isVisible = true
    answerTextObject.isVisible = true
    questionTextObject.isVisible = true
    wreckedCakeTextObject.isVisible = false
    bakedCakeTextObject.isVisible = false
    if (cakesWrecked == 3) then
        cakesWrecked = 0
        cakesBaked = 0
    end

    if (cakesBaked == 3) then
        cakesBaked = 0 
        cakesWrecked = 0
    end


    DisplayAnswers()
end

-- Functions that checks if the buttons have been clicked.
local function TouchListenerAnswer(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = answerTextObject

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true

        -- if the user gets the answer right, display Correct and call RestartSceneRight
        if (answerTextObject == userAnswer) then     
            wrongAnswer1TextObject.isVisible = false
            wrongAnswer2TextObject.isVisible = false
            checkmark.isVisible = true
            cakesBaked = cakesBaked + 1
            audio.stop(clockSoundChannel)
            audio.play(dingSound)
            if (cakesBaked == 3) then
                cakesBakedTextObject.text = "Cakes Baked: 0"
                cakesWreckedTextObject.text = "Cakes Wrecked: 0"
            else
                cakesBakedTextObject.text = "Cakes Baked: ".. tostring(cakesBaked)
                cakesWreckedTextObject.text = "Cakes Wrecked: " .. tostring(cakesWrecked)
            end
            -- call ShowCake after 1 second
            timer.performWithDelay( 1500, ShowCake )
        end        

    end 
end

local function TouchListenerWrongAnswer1(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer1TextObject.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true


        if (answerTextObject ~= userAnswer) then
            -- show incorrect
            wrongAnswer2TextObject.isVisible = false
            checkmark.isVisible = true
            redX1.isVisible = true
            cakesWrecked = cakesWrecked + 1
            audio.stop(clockSoundChannel)
            audio.play(buzzSound)
            if (cakesWrecked == 3) then
                cakesWreckedTextObject.text = "Cakes Wrecked: 0" 
                cakesBakedTextObject.text = "Cakes Baked: 0"
            else
                cakesWreckedTextObject.text = "Cakes Wrecked: " .. tostring(cakesWrecked)
                cakesBakedTextObject.text = "Cakes Baked: " .. tostring(cakesBaked)
            end
            -- call ShowWreckedCake after 1 second
            timer.performWithDelay( 1500, ShowWreckedCake )            
        end        

    end
end

local function TouchListenerWrongAnswer2(touch)
    -- get the user answer from the text object that was clicked on
    local userAnswer = wrongAnswer2TextObject.text

      
    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then

        alreadyClickedAnswer = true


        if (answerTextObject ~= userAnswer) then
            -- make incorrect Visible
            wrongAnswer1TextObject.isVisible = false
            checkmark.isVisible = true
            redX2.isVisible = true
            cakesWrecked = cakesWrecked + 1
            audio.stop(clockSoundChannel)
            audio.play(buzzSound)
            if (cakesWrecked == 3) then
                cakesWreckedTextObject.text = "Cakes Wrecked: 0" 
                cakesBakedTextObject.text = "Cakes Baked: 0"
            else
                cakesWreckedTextObject.text = "Cakes Wrecked: " .. tostring(cakesWrecked)
                cakesBakedTextObject.text = "Cakes Baked: " .. tostring(cakesBaked)
            end
            -- call ShowWreckedCake after 1 second
            timer.performWithDelay( 1500, ShowWreckedCake )            
        end        
    end
end
    
-- Function that adds the touch listeners to each of the answer objects
local function AddTextObjectListeners()

    answerTextObject:addEventListener("touch", TouchListenerAnswer)
    wrongAnswer1TextObject:addEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2TextObject:addEventListener("touch", TouchListenerWrongAnswer2)

end

-- Function that removes the touch listeners from each of the answer objects
local function RemoveTextObjectListeners()

    answerTextObject:removeEventListener("touch", TouchListenerAnswer)
    wrongAnswer1TextObject:removeEventListener("touch", TouchListenerWrongAnswer1)
    wrongAnswer2TextObject:removeEventListener("touch", TouchListenerWrongAnswer2)
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    -- Insert the background image
    bkgImage = display.newImageRect("Images/wall.jpg", display.contentWidth, display.contentHeight)
    bkgImage.x = display.contentCenterX
    bkgImage.y = display.contentCenterY
    bkgImage.width = display.contentWidth
    bkgImage.height = display.contentHeight

    cakesBaked = 0

    cakesWrecked = 0


    -- create the text object that will hold the add equation. Make it empty for now.
    questionTextObject = display.newText( "", display.contentWidth/2, display.contentHeight*2/5, nil, 65)
    questionTextObject.isVisible = true
    -- sets the color of the add equation text object
    questionTextObject:setTextColor(1, 1, 1)

    -- create the text objects that will hold the correct answer and the wrong answers
    answerTextObject = display.newText("", display.contentWidth/2, display.contentHeight*7/12, nil, 50 )
    wrongAnswer1TextObject = display.newText("", display.contentWidth/2, display.contentHeight*8/12, nil, 50 )
    wrongAnswer2TextObject = display.newText("", display.contentWidth/2, display.contentHeight*9/12, nil, 50 )

    -- create checkmark, redX1 and redX2
    checkmark = display.newImageRect("Images/checkmark2.png", 25, 25)
    checkmark.x = display.contentWidth/3
    checkmark.isVisible = true
    redX1 = display.newImageRect("Images/red_x.png", 25, 25)
    redX1.x = display.contentWidth/3
    redX1.isVisible = false
    redX2 = display.newImageRect("Images/red_x.png", 25, 25)
    redX2.x = display.contentWidth/3
    redX2.isVisible = false
    
    -- create cakesBakedTextObject and cakesWreckedTextObject
    cakesBakedTextObject = display.newText("Cakes Baked: " .. tostring(cakesBaked), display.contentWidth/5, display.contentHeight/10, nil, 50)
    cakesWreckedTextObject = display.newText("Cakes Wrecked: " .. tostring(cakesWrecked), display.contentWidth/5+20, display.contentHeight/6, nil, 50)

    -- create the text object that will say Out of Time, set the colour and then hide it
    outOfTimeText = display.newText("Out of Time!", display.contentWidth*2/5, display.contentHeight*1/3, nil, 50)
    outOfTimeText:setTextColor(100/255, 47/255, 210/255)
    outOfTimeText.isVisible = false

    -- create baked/wrecked cake
    bakedCake = display.newImageRect("Images/finishedCake.png", 500, 500)
    bakedCake.x = display.contentWidth/2
    bakedCake.y = display.contentHeight/2
    bakedCake.isVisible = false

    bakedCakeTextObject = display.newText("Good Job! You Have Baked a Cake!", display.contentWidth/2, display.contentHeight*5/6, nil, 60)
    bakedCakeTextObject.isVisible = false

    wreckedCakeTextObject = display.newText("That's not the right answer! \n   You wrecked the cake!", display.contentWidth/2, display.contentHeight*5/6, nil, 50)
    wreckedCakeTextObject.isVisible = false

    wreckedCake = display.newImageRect("Images/wreckedCake.png", 500, 500)
    wreckedCake.x = display.contentWidth/2
    wreckedCake.y = display.contentHeight/2
    wreckedCake.isVisible = false

    -- Insert objects into scene group
    sceneGroup:insert( bkgImage )  
    sceneGroup:insert( answerTextObject )
    sceneGroup:insert( wrongAnswer1TextObject )
    sceneGroup:insert( wrongAnswer2TextObject )
    sceneGroup:insert( checkmark )
    sceneGroup:insert( redX1 )
    sceneGroup:insert( redX2 )
    sceneGroup:insert( questionTextObject )
    sceneGroup:insert( bakedCake)
    sceneGroup:insert( wreckedCake )
    sceneGroup:insert( bakedCakeTextObject )
    sceneGroup:insert( wreckedCakeTextObject )
end

-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    --local sceneGroup = self.view
    local phase = event.phase


    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        RestartScene()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then

        -- listeners to each of the answer text objects
        AddTextObjectListeners()  
        cakesBakedTextObject.isVisible = true
        cakesWreckedTextObject.isVisible = true      
        if (soundOn == true) then
            clockSoundChannel = audio.play(clockSound, {channel = 8, loops= -1} )
        else
            clockSoundChannel = audio.play(clockSound, {channel = 8, loops=-1 } )
            audio.pause(clockSoundChannel)
        end

        -- call the function to restart the scene
    end

end

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
        
        -- remove the listeners when leaving the scene
        RemoveTextObjectListeners()
        audio.stop(clockSoundChannel)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
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

-- Adding Event Listeners for Scene
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene