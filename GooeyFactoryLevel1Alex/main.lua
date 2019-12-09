-- Title: SplashScreen (Assignment)
-- Class: ICS2O
-- Name: Alex De Meo
-- Description: This is the program for the splash screen and main menu of my CPT app.
---------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

---------------------------------------------------------------------------------

-- Use composer library
local composer = require("composer")

---------------------------------------------------------------------------------------

-- go to the splash screen
composer.gotoScene( "you_win" )