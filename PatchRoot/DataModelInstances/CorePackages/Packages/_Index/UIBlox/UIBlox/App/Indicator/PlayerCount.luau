-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:55 2026 Pacific Standard Time.

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
local var8 = getIconSizeModule(iconSizeModule.Large)

local function _(p0, p1, p2) --[[ line: 32 | named "getTextWidth" ]]
	-- upvalues: getTextSizeModule (ref)
	return getTextSizeModule(p0, p1.RelativeSize * p2.Font.BaseSize, p1.Font, Vector2.new(10000, 10000)).X
end

local _ = function(p3, p4) --[[ line: 39 | named "getMeasuredSectionWidth" ]]
	-- upvalues: UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), var8 (ref), getTextSizeModule (ref)
	local var9 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, p4) else var8
	local title = p4.Font.Title
	local captionHeader = p4.Font.CaptionHeader
	
	return math.max(getTextSizeModule(p3.countText, title.RelativeSize * p4.Font.BaseSize, title.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(p3.labelText, captionHeader.RelativeSize * p4.Font.BaseSize, captionHeader.Font, Vector2.new(10000, 10000)).X) + var9 + 12
end

return function(p5) --[[ line: 46 | named "PlayerCount" ]]
	-- upvalues: useStyleModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), var8 (ref), getTextSizeModule (ref), reactModule (ref), statWidgetModule (ref)
	local var10 = useStyleModule()
	local countLeft = p5.countLeft
	local var11 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, var10) else var8
	local title = var10.Font.Title
	local captionHeader = var10.Font.CaptionHeader
	local var12 = math.max(getTextSizeModule(countLeft.countText, title.RelativeSize * var10.Font.BaseSize, title.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(countLeft.labelText, captionHeader.RelativeSize * var10.Font.BaseSize, captionHeader.Font, Vector2.new(10000, 10000)).X) + var11 + 12
	local countRight = p5.countRight
	local var13 = if UIBloxConfigModule.enableScalingForSomeEdpIcons then getIconSizeModule(iconSizeModule.Large, var10) else var8
	local title_1 = var10.Font.Title
	local captionHeader_1 = var10.Font.CaptionHeader
	countRight = var12 / (var12 + (math.max(getTextSizeModule(countRight.countText, title_1.RelativeSize * var10.Font.BaseSize, title_1.Font, Vector2.new(10000, 10000)).X, getTextSizeModule(countRight.labelText, captionHeader_1.RelativeSize * var10.Font.BaseSize, captionHeader_1.Font, Vector2.new(10000, 10000)).X) + var13 + 12))
	local var14 = 1 - countRight
	local countLeft_1 = p5.countLeft
	local countRight_1 = p5.countRight
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		LayoutOrder = p5.layoutOrder,
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
				iconSize = math.floor(getIconSizeModule(iconSizeModule.Large, var10))
			} else nil
		}),
		RightSection = reactModule.createElement(statWidgetModule, {
			layoutOrder = 2,
			countText = countRight_1.countText,
			labelText = countRight_1.labelText,
			icon = countRight_1.icon,
			position = UDim2.new(1, 0, 0, 0),
			anchorPoint = Vector2.new(1, 0),
			size = UDim2.new(var14, 0, 1, 0),
			horizontalAlignment = Enum.HorizontalAlignment.Right,
			styleProps = if UIBloxConfigModule.enableScalingForSomeEdpIcons then {
				iconSize = math.floor(getIconSizeModule(iconSizeModule.Large, var10))
			} else nil
		})
	})
end