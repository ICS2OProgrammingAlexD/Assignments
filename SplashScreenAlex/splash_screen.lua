---------------------------------------------------------------
-- splash_screen.lua
-- Created by: Alex De Meo
-- Date: Nov. 4, 2019
-- Description: This is the splash screen for the app
------------------------------------------------------------------

-------------------------------------------------------------------
--INITIALIZATIONS
-------------------------------------------------------------------------

-- Use Composer Library 
local composer = require("composer")

-- Name the Scene Object
sceneName = "splash_screen"

----------------------------------------------------------------------------
local scene = composer.newScene( sceneName )

--------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------
local companyLogo
