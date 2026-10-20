local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local Parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(Parent.Resources.FTUXSlideshowData)
local _ = require(Parent.Enums.PlatformEnum)

return function(p1)
	-- upvalues: UseStyleFunction (copy), FTUXSlideshowDataModule (copy), WithLocalizationFunction (copy), ReactModule (copy), UIBloxModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	return WithLocalizationFunction({
		titleText = FTUXSlideshowDataModule[p1.platform][p1.currentIndex].title
	})(function(p2)
		-- upvalues: ReactModule (upval), UIBloxModule (upval), UseStyleResultFont (copy), Theme (copy)
		return ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 1,
			text = p2.titleText,
			fontStyle = UseStyleResultFont.SubHeader1,
			colorStyle = Theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0.031, 0)
		})
	end)
end