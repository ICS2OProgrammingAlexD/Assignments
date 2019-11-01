-- Title: Math Quiz
-- Name: Alex De Meo 
-- Class: ICS2O
-- Description: displays a random math question on-screen. If user answers correctly 
--then they get a point, if they answer incorrectly then they lose a can of coke


-- hide the status bar 
display.setStatusBar (display.HiddenStatusBar)

-- set background color
display.setDefault ("background", 0.76,0.97,1.00)

----------------------------------------------------------------
-- local variables
----------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local randomOperator
local divMulAns
local checkmark
local redX
local dingsound
local buzzSound
local pointsCount
local points = 0 
local livesCount
local lives = 4
local youWin
local gameOver
local coke1
local coke2
local coke3
local coke4
local totalSeconds = 11
local secondsLeft = 10
local clockText
local countDownTimer
local youWinMusic = audio.loadStream ("Sounds/TaDa.mp3")
local youWinMusicChannel
local gameOverMusic = audio.loadStream("Sounds/GameOver.mp3")
local gameOverMusicChannel
local squareRoot
local scrollSpeed = 4

-----------------------------------------------------------------
-- local functions
---------------------------------------------------------------
 
local function AskQuestion()
	randomNumber1 = math.random (1, 20)
	randomNumber2 = math.random (1, 20)
	randomOperator = math.random (1, 7)
	-- if randomOperator == 1 do addition
	if (randomOperator == 1) then
		-- set correct answer
		correctAnswer = randomNumber1 + randomNumber2	

		--create questionObject
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " ="
	-- if randomOperator == 2 then do multiplication
	elseif (randomOperator == 2) then
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)
		-- set correctAnswer
		correctAnswer = randomNumber1 * randomNumber2

		-- set the questionObject
		questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " ="
	-- randomOperator == 3 then do subtraction
	elseif (randomOperator == 3) then
		if (randomNumber2 > randomNumber1) then
			-- set correctAnswer
			correctAnswer = randomNumber2 - randomNumber1	

			-- set questionObject
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " ="
		else
			--set correctAnswer
			correctAnswer = randomNumber1 - randomNumber2

			-- set questionObject
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " ="
		end
	-- if randomOperator == 4 then do division
	elseif (randomOperator == 4) then
		randomNumber1 = math.random(1, 10)
		randomNumber2 = math.random(1, 10)
		-- set divMulAns and correctAnswer
		divMulAns = randomNumber1 * randomNumber2
		correctAnswer = divMulAns / randomNumber1
		-- set questionObject
		questionObject.text = divMulAns .. " / " .. randomNumber1 .. " ="
	-- if randomOperator == 5
	elseif (randomOperator == 5) then
		randomNumber1 = math.random(1, 7)
		questionObject.text = randomNumber1 .. "!" .. "="

		if (randomNumber1 == 1) then
			correctAnswer = 1 
		elseif (randomNumber1 == 2) then 
			correctAnswer = 2 * 1
		elseif (randomNumber1 == 3) then
			correctAnswer = 3 * 2 * 1
		elseif (randomNumber1 == 4) then
			correctAnswer = 4 * 3 * 2 * 1
		elseif (randomNumber1 == 5) then
			correctAnswer = 5 * 4 * 3 * 2 * 1
		elseif (randomNumber1 == 6) then 
			correctAnswer = 6 * 5 * 4 * 3 * 2 * 1
		elseif (randomNumber1 == 7) then
			correctAnswer = 7 * 6 * 5 * 4 * 3 * 2 * 1
		end	
		-- if randomOperator == 6 then do powers
	elseif(randomOperator == 6) then
		randomNumber1 = math.random(1,5)
		randomNumber2 = math.random(1,5)
		questionObject.text = randomNumber1 .. " ^" .. randomNumber2 .. " ="
		if (randomNumber2 == 1) then
			correctAnswer = randomNumber1
		elseif (randomNumber2 == 2) then
			correctAnswer = randomNumber1 * randomNumber1
		elseif (randomNumber2 == 3) then
			correctAnswer = randomNumber1 * randomNumber1 * randomNumber1
		elseif (randomNumber2 == 4) then
			correctAnswer = randomNumber1 * randomNumber1 * randomNumber1 * randomNumber1
		elseif (randomNumber2 == 5) then
			correctAnswer = randomNumber1 * randomNumber1 * randomNumber1 * randomNumber1 * randomNumber1
		end 	
	-- if randomOperator == 7 then do square root	
	elseif (randomOperator == 7) then
		randomNumber1 = math.random(1, 10)
		squareRoot = randomNumber1 * randomNumber1
		questionObject.text = "√" .. squareRoot
		correctAnswer = squareRoot / randomNumber1
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function PlayYouWinMusic(  )
	youWinMusicChannel = audio.play (youWinMusic, {loops= 0})
end

local function PlayGameOverMusic(  )
	gameOverMusicChannel = audio.play (gameOverMusic, {loops= 1})
end

local function HideCheckmark()
	checkmark.isVisible = false
	AskQuestion()
end

local function HideIncorrect(  )
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideRedX()
	redX.isVisible = false
	AskQuestion()
end



local function UpdateTime(  )
	-- decrease the number of seconds 
	secondsLeft = secondsLeft - 1

	-- display number of seconds left 
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		-- restart number of seconds left 
		secondsLeft = totalSeconds
		lives = lives - 1 

		-- If no lives left, play a game over sound,
		-- show a Game over Image, nd cancel the timer , 
		-- remove cokes

		if ( lives == 3 ) then
			coke4.isVisible = false
			audio.play(buzzSound)
		elseif (lives == 2) then
			coke3.isVisible = false
			audio.play(buzzSound)
		elseif (lives == 1) then
			coke2.isVisible = false
			audio.play(buzzSound)			
		elseif (lives == 0) then
			coke1.isVisible = false
			gameOver.isVisible = true
			pointsCount.isVisible = false
			numericField.isVisible = false
			clockText.isVisible = false
			questionObject.isVisible = false
			PlayGameOverMusic()
		end
	
	end

end

local function StartTimer()
	-- create a countDownTimer that loops infinitly
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

local function NumericFieldListener( event )

	-- User begins editing numeric field
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""
	elseif (event.phase == "submitted") then

		-- when the answer is submitted ( enter key is pressed ) set input to user's answer
		userAnswer = tonumber (event.target.text)

		-- if user answers correctly
		if  (userAnswer == correctAnswer) then
			if (points == 4) then
				youWin.isVisible = true
				numericField.isVisible = false
				questionObject.isVisible = false
				pointsCount.isVisible = false
				timer.cancel(countDownTimer)
				clockText.isVisible = false
				coke1.isVisible = false
				coke2.isVisible = false
				coke3.isVisible = false
				coke4.isVisible = false
				PlayYouWinMusic()
			else
				points = points + 1 
				pointsCount.text = "Points: " .. points
				correctObject.isVisible = true
				checkmark.isVisible = true
				audio.play (dingSound)
				timer.performWithDelay (2000, HideCheckmark)
				timer.performWithDelay (2000, HideCorrect)
				event.target.text = ""
				secondsLeft = totalSeconds
			end 
		else
			lives = lives - 1
			if (lives == 3 ) then
				coke4.isVisible = false
				incorrectObject.text = "         Not Quite, \n the right answer is " .. correctAnswer
				incorrectObject.isVisible = true
				redX.isVisible = true
				audio.play(buzzSound)
				timer.performWithDelay (2000, HideIncorrect)
				timer.performWithDelay (2000, HideRedX)
			elseif (lives == 2) then
				coke3.isVisible = false
				incorrectObject.text = "         Not Quite, \n the right answer is " .. correctAnswer
				incorrectObject.isVisible = true
				redX.isVisible = true
				audio.play(buzzSound)
				timer.performWithDelay (2000, HideIncorrect)
				timer.performWithDelay (2000, HideRedX)
			elseif (lives == 1) then
				coke2.isVisible = false
				incorrectObject.text = "         Not Quite, \n the right answer is " .. correctAnswer
				incorrectObject.isVisible = true
				redX.isVisible = true
				audio.play(buzzSound)
				timer.performWithDelay (2000, HideIncorrect)
				timer.performWithDelay (2000, HideRedX)
			elseif (lives == 0) then
				coke1.isVisible = false
				gameOver.isVisible = true
				numericField.isVisible = false
				questionObject.isVisible = false
				pointsCount.isVisible = false
				timer.cancel(countDownTimer)
				clockText.isVisible = false
				PlayGameOverMusic()
			end
			event.target.text = ""
			secondsLeft = totalSeconds
			

		
		end
	end 	
end

local function MoveEndImages( event )
	youWin.x = youWin.x - scrollSpeed
	gameOver.x = gameOver.x - scrollSpeed

	if (youWin.x < -200) then
		youWin.x = 1224
	end
	if (gameOver.x < -200) then
		gameOver.x = 1224
	end
end
--------------------------------------------------------------------
-- Object Creation
--------------------------------------------------------------------

-- displays a question and sets colour
questionObject = display.newText ("", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setTextColor (0, 0, 0)
 
-- create CorrectObject
correctObject = display.newText ("Correct!", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
correctObject:setTextColor (0.08,0.90,0.16) 
correctObject.isVisible = false

-- create incorrectObject
incorrectObject = display.newText ("Not Quite! \n The right answer is ", display.contentWidth/2, display.contentHeight*2/3, Arial, 50)
incorrectObject:setTextColor (230/255, 0, 0)
incorrectObject.isVisible = false

--create checkmark 
checkmark = display.newImageRect ("Images/checkmark.png", 150, 150)
checkmark.x = display.contentWidth*2/3
checkmark.y = display.contentHeight*2/3
checkmark.isVisible = false

--create redX
redX = display.newImageRect ("Images/red_x.png", 150, 150)
redX.x = display.contentWidth*2/3 + 60
redX.y = display.contentHeight/3
redX.isVisible = false

-- create audio for correctObject
dingSound = audio.loadSound ("Sounds/ding.mp3")

--create audio for incorrect object 
buzzSound = audio.loadSound ("Sounds/buzzer.mp3")

-- create coke1
coke1 = display.newImageRect("Images/coke.png", 150, 150)
coke1.x = 900
coke1.y = 100
coke1.isVisible = true

--create coke2 
coke2 = display.newImageRect("Images/coke.png", 150, 150)
coke2.x = 740
coke2.y = 100
coke2.isVisible = true

--create coke3
coke3 = display.newImageRect("Images/coke.png", 150, 150)
coke3.x = 580
coke3.y = 100
coke3.isVisible = true

-- create coke4
coke4 = display.newImageRect("Images/coke.png", 150, 150)
coke4.x = 420
coke4.y = 100
coke4.isVisible = true

-- create YouWin Image
youWin = display.newImageRect ("Images/You Win.png", 1000, 500)
youWin.x = display.contentWidth/2
youWin.y = display.contentHeight/2
youWin.isVisible = false
-- addEventListener for End Images
Runtime:addEventListener("enterFrame", MoveEndImages)

-- create gameOver Image
gameOver = display.newImageRect ("Images/GameOver.png", 1000, 700)
gameOver.x = display.contentWidth/2
gameOver.y = display.contentHeight/2
gameOver.isVisible = false

-- create the points counter
pointsCount = display.newText ("Points: " .. points, 100, 100, nil, 40)
pointsCount:setTextColor (0, 0, 0)

-- create numeric field
numericField = native.newTextField (display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- create clockText
clockText = display.newText(secondsLeft .. "", 150, 600, nil, 200)
clockText:setTextColor(0, 0, 0)
clockText.isVisible = true

-- add the event listener for numeric field
numericField:addEventListener ("userInput", NumericFieldListener)

-------------------------------------------------------------
-- funtion calls
-------------------------------------------------------------

-- call the function to ask question
AskQuestion()
StartTimer()

