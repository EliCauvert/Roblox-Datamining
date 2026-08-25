local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local buttonModule = require(parent.Components.Slideshow.Button)
local _ = require(parent.Enums.PlatformEnum)

return function(p0)
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), reactModule (ref), buttonModule (ref), UIBloxModule (ref)
	local var5 = useStyle()
	local theme = var5.Theme
	local font = var5.Font
	local platform = FTUXSlideshowDataModule[p0.platform]
	
	return withLocalization({ footerText = "CoreScripts.VRFTUX.Label.Footer" })(function(p1)
		-- upvalues: p0 (ref), platform (ref), reactModule (copy), buttonModule (copy), UIBloxModule (copy), font (ref), theme (ref)
		return p0.currentIndex ~= #platform and reactModule.createElement(buttonModule, {
			platform = p0.platform,
			currentIndex = p0.currentIndex,
			increaseCurrentIndex = p0.increaseCurrentIndex
		}) or reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 2,
			text = p1.footerText,
			fontStyle = font.CaptionHeader,
			colorStyle = theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 1, 0)
		})
	end)
end