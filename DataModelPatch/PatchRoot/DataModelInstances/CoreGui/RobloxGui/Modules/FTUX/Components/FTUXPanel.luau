local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Parent = script.Parent.Parent
local FTUXSlideshowModule = require(Parent.Components.FTUXSlideshow)
local FTUXConstantsModule = require(Parent.Resources.FTUXConstants)
local _ = require(Parent.Enums.PlatformEnum)
local FTUXPanelXOffset = game:DefineFastInt("FTUXPanelXOffset", 50)

return function(p1)
	-- upvalues: UseStyleFunction (copy), FTUXConstantsModule (copy), ReactModule (copy), FTUXPanelXOffset (copy), FTUXSlideshowModule (copy)
	local PanelConstants = FTUXConstantsModule[p1.platform].PanelConstants
	local MAINSCREENSIZEWIDTH = PanelConstants.MAIN_SCREEN_SIZE_WIDTH
	local MAINSCREENSIZEHEIGHT = PanelConstants.MAIN_SCREEN_SIZE_HEIGHT
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, FTUXPanelXOffset, 0, 0)
	}, {
		Slideshow = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			BackgroundColor3 = UseStyleFunction().Theme.BackgroundDefault.Color,
			Size = UDim2.new(PanelConstants.SLIDESHOW_FRAME_WIDTH / MAINSCREENSIZEWIDTH, 0, PanelConstants.SLIDESHOW_FRAME_HEIGHT / MAINSCREENSIZEHEIGHT, 0),
			Position = UDim2.new(PanelConstants.SLIDESHOW_FRAME_X / MAINSCREENSIZEWIDTH, 0, PanelConstants.SLIDESHOW_FRAME_Y / MAINSCREENSIZEHEIGHT, 0)
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.02, 0) }),
			Slideshow = ReactModule.createElement(FTUXSlideshowModule, { platform = p1.platform }, {})
		})
	})
end