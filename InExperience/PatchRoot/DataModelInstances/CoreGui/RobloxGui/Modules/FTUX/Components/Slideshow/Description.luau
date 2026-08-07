local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local _ = require(parent.Enums.PlatformEnum)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization

return function(p0) --[[ line: 19 | named "Description" ]]
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), reactModule (ref), luauPolyfillModule (ref), UIBloxModule (ref)
	local var5 = useStyle()
	local theme = var5.Theme
	local font = var5.Font
	local text = FTUXSlideshowDataModule[p0.platform][p0.currentIndex].text
	
	return withLocalization(text)(function(p1) --[[ line: 28 ]]
		-- upvalues: reactModule (copy), luauPolyfillModule (copy), text (ref), UIBloxModule (copy), font (ref), theme (ref)
		return reactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0.4, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, reactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}), luauPolyfillModule.Array.map(text, function(_, p2) --[[ line: 43 ]]
			-- upvalues: reactModule (copy), UIBloxModule (copy), p1 (ref), font (copy), theme (copy), text (copy)
			return reactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				text = p1[p2],
				fontStyle = font.CaptionBody,
				colorStyle = theme.TextDefault,
				textXAlignment = Enum.TextXAlignment.Left,
				size = UDim2.new(1, 0, 1 / #text, 0),
				layoutOrder = p2
			})
		end))
	end)
end