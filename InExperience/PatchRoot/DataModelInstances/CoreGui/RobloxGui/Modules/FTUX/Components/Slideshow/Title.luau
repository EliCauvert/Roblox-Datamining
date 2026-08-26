local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local _ = require(parent.Enums.PlatformEnum)

return function(p1)
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), reactModule (ref), UIBloxModule (ref)
	local var1 = useStyle()
	local theme = var1.Theme
	local font = var1.Font
	
	return withLocalization({
		titleText = FTUXSlideshowDataModule[p1.platform][p1.currentIndex].title
	})(function(p2)
		-- upvalues: reactModule (copy), UIBloxModule (copy), font (ref), theme (ref)
		return reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 1,
			text = p2.titleText,
			fontStyle = font.SubHeader1,
			colorStyle = theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0.031, 0)
		})
	end)
end