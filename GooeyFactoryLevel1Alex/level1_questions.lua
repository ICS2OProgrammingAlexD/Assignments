---------------------------------------------------------------
-- level1_questions
-- Created by: Alex De Meo
-- Date: Dec. 05, 2019
-- Description: This is the popup question screen for the level 1.
------------------------------------------------------------------

-------------------------------------------------------------------
--INITIALIZATIONS
-------------------------------------------------------------------------

-- Use Composer Library 
local composer = require("composer")

-- Name the Scene Object
sceneName = "level1_questions"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

-- get rid of status bar 
display.setStatusBar(display.HiddenStatusBar)

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------
-- for the question 
local questionText
local questionImage

-- answers
local correctAnswer
local incorrectAnswer1
local incorrectAnswer2

local correctAnswerText
local incorrectAnswer1Text
local incorrectAnswer2Text

local alreadyClickedAnswer = false
local alreadyClickedIncorrectAnswer1 = false
local alreadyClickedIncorrectAnswer2 = false
-- Positioning
local X1 = display.contentWidth/4
local X2 = display.contentWidth*2/4
local X3 = display.contentWidth*3/4
local Y = display.contentHeight*2/3

-- other stuff
local correct 
local checkmark


--------------------------------------------------------
-- LOCAL SOUNDS
--------------------------------------------------------------


----------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------
-- brings you back to level 1
local function BackToLevel1(  )
    composer.gotoScene("level1_screen")
end
-- choose question to ask
local function ChooseQuestion()
    local randomQuestion = math.random(1)
    if (randomQuestion == 1) then
        questionText.text = "What is the strongest shape?"
        correctAnswer = triangle 
        incorrectAnswer1 = square
        incorrectAnswer2 = circle
        correctAnswerText.text = "" .. correctAnswer
        incorrectAnswer1Text.text = "" .. incorrectAnswer1
        incorrectAnswer2Text.text = "" .. incorrectAnswer2
    end
end
--Put answers into position
local function PositionAnswers(  )
    local answerPositioning = math.random(1, 3)
    correctAnswerText.y = Y1
    correctAnswerText.isVisible = true
    incorrectAnswer1Text.y = Y1
    incorrectAnswer1Text.isVisible = true
    incorrectAnswer2Text.y = Y1
    incorrectAnswer2Text.isVisible = true
    if (answerPositioning == 1) then
        correctAnswerText.x = X1
        incorrectAnswer1Text.x = X2
        incorrectAnswer2Text.x = X3
    elseif (answerPositioning == 2) then
        correctAnswerText.x = X2
        incorrectAnswer1Text.x = X3
        incorrectAnswer2Text.x = X1
    elseif (answerPositioning == 3) then
        correctAnswerText.x = X3
        incorrectAnswer1Text.x = X1
        incorrectAnswer2Text.x = X2
    end
end

-- hides the checkmarks and exes and everything I need to 
local function HideEverything()
    checkmark.isVisible = false
    correct.isVisible = false
end
-- touch listener for the correctAnswer

local function TouchListenerCorrectAnswer( touch )
    local userAnswer = correctAnswerText.text

    if (touch.phase == "ended") and (alreadyClickedAnswer == false) then
        
        alreadyClickedAnswer = true

        incorrectAnswer1Text.isVisible = false
        incorrectAnswer2Text.isVisible = false

        -- if the user gets the answer right, display Correct and go back to the level1 scree
        if (userAnswer == correctAnswerText) then
            correct.isVisible = true
            checkmark.isVisible = true
            timer.performWithDelay(1250, HideEverything)
            -- call BackToLevel1
            timer.performWithDelay(1500, BackToLevel1)

        end 
    end
end 
----------------------------------------------------------
--GLOBAL FUNCTIONS
-------------------------------------------------------------

-- function is called when the screen doesn't exist
function scene:create( event )
	local sceneGroup = self.view

	display.setDefault("background", 1, 1, 1)

    -- create correct
    correct = display.newText("Correct!", display.contentWidth/2, display.contentHeight/2, nil, 75)
    correct.isVisible = false
    correct:setTextColor(0.00, 0.90, 0.15)

    -- create checkmark
    checkmark = display.newImageRect("Images/checkmark2.png", 150, 150)
    
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
        alreadyClickedAnswer = false
        alreadyClickedIncorrectAnswer1 = false
        alreadyClickedIncorrectAnswer2 = false
        ChooseQuestion()
        PositionAnswers()
    end

end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	----------------------------------------------------

	if (phase == "will") then

	--------------------------------------------------
	elseif (phase == "did") then
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
