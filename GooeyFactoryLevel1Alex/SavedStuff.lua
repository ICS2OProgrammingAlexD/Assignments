----------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------
local bkgImage

----------------------------------------------------------------------------
--LOCAL SOUNDS
----------------------------------------------------------------------------
local bkgMusic = audio.loadStream("Sounds/Level1Music.mp3")
local bkgMusicChannel

----------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------


	bkgImage = display.newImage("Images/Level1ScreenAlex.png")
	bkgImage.width = display.contentWidth
	bkgImage.height = display.contentHeight
	bkgImage.x = display.contentWidth/2
	bkgImage.y = display.contentHeight/2

	-- insert images and buttons to sceneGroup
	sceneGroup:insert(bkgImage)
