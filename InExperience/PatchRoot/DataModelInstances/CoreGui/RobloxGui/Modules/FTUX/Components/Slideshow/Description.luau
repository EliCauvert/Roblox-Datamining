local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(Parent.Resources.FTUXSlideshowData)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local _ = require(Parent.Enums.PlatformEnum)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization

return function(p1) --[[ Line: 19 | Named "Description" ]]
	-- upvalues: UseStyleFunction (copy), FTUXSlideshowDataModule (copy), WithLocalizationFunction (copy), ReactModule (copy), LuauPolyfillModule (copy), UIBloxModule (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local Text = FTUXSlideshowDataModule[p1.platform][p1.currentIndex].text
	
	return WithLocalizationFunction(Text)(function(p2) --[[ Line: 28 ]]
		-- upvalues: ReactModule (upval), LuauPolyfillModule (upval), Text (copy), UIBloxModule (upval), UseStyleResultFont (copy), Theme (copy)
		return ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0.4, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}, ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 0),
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}), LuauPolyfillModule.Array.map(Text, function(_, LayoutOrder) --[[ Line: 43 ]]
			-- upvalues: ReactModule (upval), UIBloxModule (upval), p2 (copy), UseStyleResultFont (upval), Theme (upval), Text (upval)
			return (ReactModule.createElement(UIBloxModule.App.Text.StyledTextLabel, {
				text = p2[LayoutOrder],
				fontStyle = UseStyleResultFont.CaptionBody,
				colorStyle = Theme.TextDefault,
				textXAlignment = Enum.TextXAlignment.Left,
				size = UDim2.new(1, 0, 1 / #Text, 0),
				layoutOrder = LayoutOrder
			}))
		end))
	end)
end