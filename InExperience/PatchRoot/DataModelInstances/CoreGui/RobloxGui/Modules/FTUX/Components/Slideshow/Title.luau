local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local _ = require(parent.Enums.PlatformEnum)

return function(p0) --[[ line: 19 | named "Title" ]]
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), reactModule (ref), UIBloxModule (ref)
	local var4 = useStyle()
	local theme = var4.Theme
	local font = var4.Font
	
	return withLocalization({
		titleText = FTUXSlideshowDataModule[p0.platform][p0.currentIndex].title
	})(function(p1) --[[ line: 30 ]]
		-- upvalues: reactModule (copy), UIBloxModule (copy), font (ref), theme (ref)
		return reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
			layoutOrder = 1,
			text = p1.titleText,
			fontStyle = font.SubHeader1,
			colorStyle = theme.TextEmphasis,
			textXAlignment = Enum.TextXAlignment.Left,
			size = UDim2.new(1, 0, 0.031, 0)
		})
	end)
end