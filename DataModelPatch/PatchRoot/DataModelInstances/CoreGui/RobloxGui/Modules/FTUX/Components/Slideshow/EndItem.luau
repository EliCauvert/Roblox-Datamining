local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(Parent.Resources.FTUXSlideshowData)
local ButtonModule = require(Parent.Components.Slideshow.Button)
local _ = require(Parent.Enums.PlatformEnum)

return function(p1)
	-- upvalues: UseStyleFunction (copy), FTUXSlideshowDataModule (copy), WithLocalizationFunction (copy), ReactModule (copy), ButtonModule (copy), UIBloxModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local FTUXSlideshowDataModuleEntry = FTUXSlideshowDataModule[p1.platform]
	
	return WithLocalizationFunction({ footerText = "CoreScripts.VRFTUX.Label.Footer" })(function(p2)
		-- upvalues: p1 (copy), FTUXSlideshowDataModuleEntry (copy), ReactModule (upval), ButtonModule (upval), UIBloxModule (upval), UseStyleResultFont (copy), Theme (copy)
		return if p1.currentIndex == #FTUXSlideshowDataModuleEntry then ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 2,
			text = p2.footerText,
			fontStyle = UseStyleResultFont.CaptionHeader,
			colorStyle = Theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 1, 0)
		}) else ReactModule.createElement(ButtonModule, {
			platform = p1.platform,
			currentIndex = p1.currentIndex,
			increaseCurrentIndex = p1.increaseCurrentIndex
		}) or ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 2,
			text = p2.footerText,
			fontStyle = UseStyleResultFont.CaptionHeader,
			colorStyle = Theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Center,
			textYAlignment = Enum.TextYAlignment.Center,
			size = UDim2.new(1, 0, 1, 0)
		})
	end)
end