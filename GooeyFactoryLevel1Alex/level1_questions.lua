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
local question
local questionImage

-- answers
local correctAnswer
local incorrectAnswer1
local incorrectAnswer2

local correctAnswerText
local incorrectAnswer1Text
local incorrectAnswer2Text

-- Positioning
local X1 = display.contentWidth/4
local X2 = display.contentWidth*2/4
local X3 = display.contentWidth*3/4
local Y = display.contentHeight*2/3


--------------------------------------------------------
-- LOCAL SOUNDS
--------------------------------------------------------------


----------------------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------------------------
-- choose question to ask
local function ChooseQuestion()
    local randomQuestion = math.random(1)
    if (randomQuestion == 1) then
        question.text = "What is the strongest shape?"
        correctAnswer = triangle 
        incorrectAnswer1 = square
        incorrectAnswer2 = circle
        
end
--Put answers into position
local function PositionAnswers(  )
    local answerPositioning = math.random(1, 3)

end
----------------------------------------------------------
--GLOBAL FUNCTIONS
-------------------------------------------------------------

-- function is called when the screen doesn't exist
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
