local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local buttonModule = require(parent.Components.Slideshow.Button)
local _ = require(parent.Enums.PlatformEnum)

return function(p1)
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), reactModule (ref), buttonModule (ref), UIBloxModule (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	local font = var1.Font
	local platform = FTUXSlideshowDataModule[p1.platform]
	
	return withLocalization({ footerText = "CoreScripts.VRFTUX.Label.Footer" })(function(p2)
		-- upvalues: p1 (ref), platform (ref), reactModule (copy), buttonModule (copy), UIBloxModule (copy), font (ref), theme (ref)
		return p1.currentIndex ~= #platform and reactModule.createElement(buttonModule, {
			platform = p1.platform,
			currentIndex = p1.currentIndex,
			increaseCurrentIndex = p1.increaseCurrentIndex
		}) or reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 2,
			text = p2.footerText,
			fontStyle = font.CaptionHeader,
			colorStyle = theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 1, 0)
		})
	end)
end