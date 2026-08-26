local app = script:FindFirstAncestor("App")
local parent = app.Parent
local reactModule = require(parent.Parent.React)
local _ = require(app.ImageSet.ImagesTypes)
local iconSizeModule = require(app.ImageSet.Enum.IconSize)
local getIconSizeModule = require(app.ImageSet.getIconSize)
local statWidgetModule = require(app.Indicator.StatWidget)
local _ = require(app.Style.Fonts)
local useStyleModule = require(parent.Core.Style.useStyle)
local getTextSizeModule = require(parent.Core.Text.GetTextSize)
local UIBloxConfigModule = require(parent.UIBloxConfig)
local _ = require(parent.App.Style.StyleTypes)
local var1 = getIconSizeModule(iconSizeModule.Large)

local function _(p1, p2, p3)
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p1, p2.RelativeSize * p3.Font.BaseSize, p2.Font, Vector2.new(10000, 10000)).X
end

local _ = function(p1, p2)
	-- upvalues: UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), var1 (ref), getTextSizeModule (ref)
	local var2 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, p2) else var1
	local title = p2.Font.Title
	local captionHeader = p2.Font.CaptionHeader
	
	return math.max(getTextSizeModule(p1.countText, title.RelativeSize * p2.Font.BaseSize, title.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(p1.labelText, captionHeader.RelativeSize * p2.Font.BaseSize, captionHeader.Font, Vector2.new(10000, 10000)).X) + var2 + 12
end

return function(p1)
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), var1 (ref), getTextSizeModule (ref), reactModule (ref), statWidgetModule (ref)
	local var2 = useStyleModule()
	local countLeft = p1.countLeft
	local var3 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, var2) else var1
	local title = var2.Font.Title
	local captionHeader = var2.Font.CaptionHeader
	local var4 = math.max(getTextSizeModule(countLeft.countText, title.RelativeSize * var2.Font.BaseSize, title.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(countLeft.labelText, captionHeader.RelativeSize * var2.Font.BaseSize, captionHeader.Font, Vector2.new(10000, 10000)).X) + var3 + 12
	local countRight = p1.countRight
	local var5 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, var2) else var1
	local title_1 = var2.Font.Title
	local captionHeader_1 = var2.Font.CaptionHeader
	countRight = var4 / (var4 + (math.max(getTextSizeModule(countRight.countText, title_1.RelativeSize * var2.Font.BaseSize, title_1.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(countRight.labelText, captionHeader_1.RelativeSize * var2.Font.BaseSize, captionHeader_1.Font, Vector2.new(10000, 10000)).X) + var5 + 12))
	local var6 = 1 - countRight
	local countLeft_1 = p1.countLeft
	local countRight_1 = p1.countRight
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p1.layoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = reactModule.createElement(statWidgetModule, {
			layoutOrder = 1,
			countText = countLeft_1.countText,
			labelText = countLeft_1.labelText,
			icon = countLeft_1.icon,
			position = UDim2.new(0, 0, 0, 0),
			anchorPoint = Vector2.new(0, 0),
			size = UDim2.new(countRight, 0, 1, 0),
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			styleProps = if UIBloxConfigModule.enableScalingForSomeEdpIcons then {
				iconSize = math.floor(getIconSizeModule(iconSizeModule.Large, var2))
			} else nil
		}),
		RightSection = reactModule.createElement(statWidgetModule, {
			layoutOrder = 2,
			countText = countRight_1.countText,
			labelText = countRight_1.labelText,
			icon = countRight_1.icon,
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0),
			size = UDim2.new(var6, 0, 1, 0),
			horizontalAlignment = Enum.HorizontalAlignment.Right,
			styleProps = if UIBloxConfigModule.enableScalingForSomeEdpIcons then {
				iconSize = math.floor(getIconSizeModule(iconSizeModule.Large, var2))
			} else nil
		})
	})
end