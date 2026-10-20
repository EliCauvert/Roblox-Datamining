local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationFontFaceMigration = require(Parent1.Foundation).Utility.Flags.FoundationFontFaceMigration
local _ = require(App.ImageSet.ImagesTypes)
local IconSizeModule = require(App.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(App.ImageSet.getIconSize)
local StatWidgetModule = require(App.Indicator.StatWidget)
local _ = require(App.Style.Fonts)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local GetTextSizeModule = require(Parent.Core.Text.GetTextSize)
local GetFontFromFontStyleModule = require(Parent.Core.Text.GetFontFromFontStyle)
local UIBloxConfigModule = require(Parent.UIBloxConfig)
local _ = require(Parent.App.Style.StyleTypes)
local IconSizeModule1 = GetIconSizeModule(IconSizeModule.Large)

local function _(p1, p2, p3)
	-- upvalues: FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy)
	return GetTextSizeModule(p1, p2.RelativeSize * p3.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(p2) else p2.Font, (Vector2.new(10000, 10000))).X
end

local _ = function(p1, p2): number
	-- upvalues: UIBloxConfigModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), IconSizeModule1 (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy)
	local Title = p2.Font.Title
	local CaptionHeader = p2.Font.CaptionHeader
	
	return math.max(GetTextSizeModule(p1.countText, Title.RelativeSize * p2.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(Title) else Title.Font, (Vector2.new(10000, 10000))).X, GetTextSizeModule(p1.labelText, CaptionHeader.RelativeSize * p2.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(CaptionHeader) else CaptionHeader.Font, (Vector2.new(10000, 10000))).X) + (if UIBloxConfigModule.enableScalingForSomeEdpIcons then GetIconSizeModule(IconSizeModule.Large, p2) else IconSizeModule1) + 12
end

return function(p1)
	-- upvalues: UseStyleModule (copy), UIBloxConfigModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), IconSizeModule1 (copy), FoundationFontFaceMigration (copy), GetFontFromFontStyleModule (copy), GetTextSizeModule (copy), ReactModule (copy), StatWidgetModule (copy)
	local UseStyleModuleResult = UseStyleModule()
	local CountLeft = p1.countLeft
	local Title = UseStyleModuleResult.Font.Title
	local CaptionHeader = UseStyleModuleResult.Font.CaptionHeader
	local NewLargest = math.max(GetTextSizeModule(CountLeft.countText, Title.RelativeSize * UseStyleModuleResult.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(Title) else Title.Font, (Vector2.new(10000, 10000))).X, GetTextSizeModule(CountLeft.labelText, CaptionHeader.RelativeSize * UseStyleModuleResult.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(CaptionHeader) else CaptionHeader.Font, (Vector2.new(10000, 10000))).X) + (if UIBloxConfigModule.enableScalingForSomeEdpIcons then GetIconSizeModule(IconSizeModule.Large, UseStyleModuleResult) else IconSizeModule1) + 12
	local CountRight = p1.countRight
	local Title1 = UseStyleModuleResult.Font.Title
	local CaptionHeader1 = UseStyleModuleResult.Font.CaptionHeader
	local XScale = NewLargest / (NewLargest + (math.max(GetTextSizeModule(CountRight.countText, Title1.RelativeSize * UseStyleModuleResult.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(Title1) else Title1.Font, (Vector2.new(10000, 10000))).X, GetTextSizeModule(CountRight.labelText, CaptionHeader1.RelativeSize * UseStyleModuleResult.Font.BaseSize, if FoundationFontFaceMigration then GetFontFromFontStyleModule(CaptionHeader1) else CaptionHeader1.Font, (Vector2.new(10000, 10000))).X) + (if UIBloxConfigModule.enableScalingForSomeEdpIcons then GetIconSizeModule(IconSizeModule.Large, UseStyleModuleResult) else IconSizeModule1) + 12))
	local CountLeft1 = p1.countLeft
	local CountRight1 = p1.countRight
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = ReactModule.createElement(StatWidgetModule, {
			layoutOrder = 1,
			countText = CountLeft1.countText,
			labelText = CountLeft1.labelText,
			icon = CountLeft1.icon,
			position = UDim2.new(0, 0, 0, 0),
			anchorPoint = Vector2.new(0, 0),
			size = UDim2.new(XScale, 0, 1, 0),
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			styleProps = if UIBloxConfigModule.enableScalingForSomeEdpIcons then {
				iconSize = math.floor((GetIconSizeModule(IconSizeModule.Large, UseStyleModuleResult)))
			} else nil
		}),
		RightSection = ReactModule.createElement(StatWidgetModule, {
			layoutOrder = 2,
			countText = CountRight1.countText,
			labelText = CountRight1.labelText,
			icon = CountRight1.icon,
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0),
			size = UDim2.new(1 - XScale, 0, 1, 0),
			horizontalAlignment = Enum.HorizontalAlignment.Right,
			styleProps = if UIBloxConfigModule.enableScalingForSomeEdpIcons then {
				iconSize = math.floor((GetIconSizeModule(IconSizeModule.Large, UseStyleModuleResult)))
			} else nil
		})
	})
end