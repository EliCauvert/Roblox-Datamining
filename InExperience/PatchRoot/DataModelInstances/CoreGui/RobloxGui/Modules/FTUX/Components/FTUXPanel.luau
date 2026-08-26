local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local useStyle = require(corePackagesService.Packages.UIBlox).Core.Style.useStyle
local parent = script.Parent.Parent
local FTUXSlideshowModule = require(parent.Components.FTUXSlideshow)
local FTUXConstantsModule = require(parent.Resources.FTUXConstants)
local _ = require(parent.Enums.PlatformEnum)
local FTUXPanelXOffset = game:DefineFastInt("FTUXPanelXOffset", 50)

return function(p1)
	-- upvalues: useStyle (ref), FTUXConstantsModule (ref), reactModule (ref), FTUXPanelXOffset (ref), FTUXSlideshowModule (ref)
	local var1 = useStyle()
	local panelConstants = FTUXConstantsModule[p1.platform].PanelConstants
	local MAIN_SCREEN_SIZE_WIDTH = panelConstants.MAIN_SCREEN_SIZE_WIDTH
	local MAIN_SCREEN_SIZE_HEIGHT = panelConstants.MAIN_SCREEN_SIZE_HEIGHT
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, FTUXPanelXOffset, 0, 0)
	}, {
		Slideshow = reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundColor3 = var1.Theme.BackgroundDefault.Color,
			Size = UDim2.new(panelConstants.SLIDESHOW_FRAME_WIDTH / MAIN_SCREEN_SIZE_WIDTH, 0, panelConstants.SLIDESHOW_FRAME_HEIGHT / MAIN_SCREEN_SIZE_HEIGHT, 0),
			Position = UDim2.new(panelConstants.SLIDESHOW_FRAME_X / MAIN_SCREEN_SIZE_WIDTH, 0, panelConstants.SLIDESHOW_FRAME_Y / MAIN_SCREEN_SIZE_HEIGHT, 0)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.02, 0) }),
			Slideshow = reactModule.createElement(FTUXSlideshowModule, { platform = p1.platform }, {})
		})
	})
end