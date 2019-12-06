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

-- boolean variables telling me which answer box was touched
local flourAlreadyTouched = false
local butterAlreadyTouched = false
local eggsAlreadyTouched = false
local sugarAlreadyTouched = false

--create objects
local flour
local butter
local eggs
local sugar
local list
local butterCheckmark
local sugarCheckmark
local flourCheckmark
local eggsCheckmark
local bakeButton

-- create variables that will hold the previous x- and y-positions so that each ingredient
-- will return back to its previous position after it isn't moved into the bowl
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

-----------------------------------------------------------------------------------------
-- LOCAL SOUNDS
-----------------------------------------------------------------------------------------
local bkgMusic = audio.loadStream("Sounds/Level1Music.mp3")
local bkgMusicChannel

-- sound effect for when the ingredient is put into the bowl.
local splashSound = audio.loadSound("Sounds/splash.mp3")

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------
local function QuestionTransition()
    composer.gotoScene("level1_questions", {effect = "fade", time = 500} )
end
-- show the bake button to allow the player to bake the cake
local function ShowBakeButton()
    if (butterCheckmark.isVisible == true) and
        (sugarCheckmark.isVisible == true) and
        (flourCheckmark.isVisible == true) and
        (eggsCheckmark.isVisible == true) then
        bakeButton.isVisible = true
    end
end


local function PositionIngredients()
    -- set the new y-positions of each of the answers
    flour.y = display.contentHeight * 0.7
    flour.x = display.contentWidth* 7 / 10
    --eggs
    eggs.y = display.contentHeight * 0.70
    eggs.x = display.contentWidth* 9 / 10

    --butter
    butter.y = display.contentHeight * 0.55
    butter.x = display.contentWidth * 7 / 10
    -- sugar
    sugar.y = display.contentHeight * 0.55
    sugar.x = display.contentWidth* 9 / 10
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
            
            flour.x = touch.x
            flour.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            flourAlreadyTouched = false

              -- if the number is dragged into the userAnswerBox, place it in the center of it
            if (((bowlPlaceholder.x - bowlPlaceholder.width/2) < flour.x ) and
                ((bowlPlaceholder.x + bowlPlaceholder.width/2) > flour.x ) and 
                ((bowlPlaceholder.y - bowlPlaceholder.height/2) < flour.y ) and 
                ((bowlPlaceholder.y + bowlPlaceholder.height/2) > flour.y ) ) then

                -- setting the position of the number to be in the center of the box
                flour.x = bowlPlaceholder.x
                flour.y = bowlPlaceholder.y
                flour.isVisible = false
                flourCheckmark.isVisible = true
                if (soundOn == true) then
                    audio.play(splashSound)
                end
                timer.performWithDelay(500, ShowBakeButton)


            --else make box go back to where it was
            else
                flour.x = flourPreviousX
                flour.y = flourPreviousY
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
                butter.isVisible = false
                butterCheckmark.isVisible = true
                if (soundOn == true) then
                    audio.play(splashSound)
                end
                timer.performWithDelay(500, ShowBakeButton)


            --else make butter go back to where it was
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
                eggs.isVisible = false
                eggsCheckmark.isVisible = true
                if (soundOn == true) then
                    audio.play(splashSound)
                end
                timer.performWithDelay(500, ShowBakeButton)


            --else make rggs go back to where they were
            else
                eggs.x = eggsPreviousX
                eggs.y = eggsPreviousY
            end
        end
    end
end 

local function TouchListenerSugar(touch)
    --only work if none of the other boxes have been touched
    if (flourAlreadyTouched == false) and 
        (butterAlreadyTouched == false) and 
        (eggsAlreadyTouched == false) then

        if (touch.phase == "began") then
            --let other boxes know it has been clicked
            sugarAlreadyTouched = true
            
        elseif (touch.phase == "moved") then
            --dragging function
            sugar.x = touch.x
            sugar.y = touch.y

        elseif (touch.phase == "ended") then
            sugarAlreadyTouched = false

            -- if the box is in the userAnswerBox Placeholder  go to center of placeholder
            if (((bowlPlaceholder.x - bowlPlaceholder.width/2) < sugar.x ) and 
                ((bowlPlaceholder.x + bowlPlaceholder.width/2) > sugar.x ) and 
                ((bowlPlaceholder.y - bowlPlaceholder.height/2) < sugar.y ) and 
                ((bowlPlaceholder.y + bowlPlaceholder.height/2) > sugar.y ) ) then

                sugar.x = bowlPlaceholder.x
                sugar.y = bowlPlaceholder.y
                sugar.isVisible = false
                sugarCheckmark.isVisible = true

                if (soundOn == true) then
                    audio.play(splashSound)
                end
                timer.performWithDelay(500, ShowBakeButton)

            --else make sugar go back to where it was
            else
                sugar.x = sugarPreviousX
                sugar.y = sugarPreviousY
            end
        end
    end
end 

-- Function that Adds Listeners to each ingredient
local function AddIngredientEventListeners()
    flour:addEventListener("touch", TouchListenerFlour)
    butter:addEventListener("touch", TouchListenerButter)
    eggs:addEventListener("touch", TouchListenerEggs)
    sugar:addEventListener("touch", TouchListenerSugar)

end 

-- Function that Removes Listeners to each ingredient
local function RemoveIngredientEventListeners()
    flour:removeEventListener("touch", TouchListenerFlour)
    butter:removeEventListener("touch", TouchListenerButter)
    eggs:removeEventListener("touch", TouchListenerEggs)
    sugar:removeEventListener("touch", TouchListenerSugar)
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
    flour = display.newImageRect("Images/flour.png", 100, 100)
    flour.isVisible = true
    butter = display.newImageRect("Images/butter.png", 150, 75)
    butter.isVisible = true
    eggs = display.newImageRect("Images/eggs.png", 100, 50)
    eggs.isVisible = true
    sugar = display.newImageRect("Images/sugar.png", 75, 100)
    sugar.isVisible = true

    -- create the list of ingredients
    list = display.newImageRect("Images/List.png", 500, 250)
    list.x = display.contentWidth * 7 / 10
    list.y = display.contentHeight * 1 / 5

    -- create butterCheckmark
    butterCheckmark = display.newImageRect("Images/checkmark.png", 25, 25)
    butterCheckmark.x = display.contentWidth * 14 / 30 + 5
    butterCheckmark.y = display.contentHeight * 9 / 42
    butterCheckmark.isVisible = false

    -- create sugarCheckmark
    sugarCheckmark = display.newImageRect("Images/checkmark.png", 25, 25)
    sugarCheckmark.x = display.contentWidth * 14 / 30 + 5
    sugarCheckmark.y = display.contentHeight * 11 / 43
    sugarCheckmark.isVisible = false

    -- create flourCheckmark
    flourCheckmark = display.newImageRect("Images/checkmark.png", 25, 25)
    flourCheckmark.x = display.contentWidth * 14 / 30 + 5
    flourCheckmark.y = display.contentHeight * 12 / 42
    flourCheckmark.isVisible = false

    -- create eggsCheckmark
    eggsCheckmark = display.newImageRect("Images/checkmark.png", 25, 25)
    eggsCheckmark.x = display.contentWidth * 14 / 30 + 5
    eggsCheckmark.y = display.contentHeight * 14 / 43
    eggsCheckmark.isVisible = false

    -- create the bake button
    bakeButton = widget.newButton(
    {
        -- Set its position on the screen relative to the screen size
        x = display.contentWidth * 4 / 5,
        y = display.contentHeight * 2 /3,

        -- Insert the images here
        defaultFile = "Images/BakeButtonUnpressedAlex.png",
        overFile = "Images/BakeButtonPressedAlex.png",

        -- height and width
        width = 200,
        height = 100,

        -- go to the question
        onRelease = QuestionTransition
    } )
    bakeButton.isVisible = false

    -- the black box where the user will drag the answer
    bowlPlaceholder = display.newImageRect("Images/bowlPlaceholder.png",  150, 130, 0, 0)
    bowlPlaceholder.x = display.contentWidth/2
    bowlPlaceholder.y = display.contentHeight* 3 / 5

    ----------------------------------------------------------------------------------
    --adding objects to the scene group
    ----------------------------------------------------------------------------------  
    sceneGroup:insert( bkg_image) 
    sceneGroup:insert( bowlPlaceholder)
    sceneGroup:insert( flour)
    sceneGroup:insert( butter)
    sceneGroup:insert( eggs)
    sceneGroup:insert( sugar)
    sceneGroup:insert( list)
    sceneGroup:insert( butterCheckmark)
    sceneGroup:insert( sugarCheckmark)
    sceneGroup:insert( flourCheckmark)
    sceneGroup:insert( eggsCheckmark)
    sceneGroup:insert( bakeButton)


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
        AddIngredientEventListeners() 
        PositionIngredients()
        if (soundOn == true) then
            bkgMusicChannel = audio.play(bkgMusic, {channel=3, loops= -1})
            audio.setVolume(0.25, {channel=3})
        else
            bkgMusicChannel = audio.play(bkgMusic, {channel=3, loops= -1})
            audio.pause(bkgMusicChannel)
            audio.setVolume(0.25, {channel=3})
        end
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
        RemoveIngredientEventListeners()
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