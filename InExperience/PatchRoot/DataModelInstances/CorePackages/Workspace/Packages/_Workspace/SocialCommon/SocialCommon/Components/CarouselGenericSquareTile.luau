local parent = script:FindFirstAncestor("SocialCommon").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local dashModule = require(parent.Dash)
local text = require(parent.AppCommonLib).Text
local useStyle = UIBloxModule.Core.Style.useStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local imageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local iconSize = UIBloxModule.App.Constant.IconSize
local badge = UIBloxModule.App.Indicator.Badge
local colors = UIBloxModule.App.Style.Colors
local useImpressionsTagger = require(parent.Impressions).useImpressionsTagger
local t = {
	badgeValue = nil,
	icon = "",
	labelText = "",
	tileSize = 100,
	borderThickness = 0,
	onActivated = function() --[[ line: 62 ]] end,
	iconSize = iconSize.Large,
	cornerRadius = UDim.new(0, 8),
	styleProps = {
		containFooterInTileSize = false,
		textXAlignment = Enum.TextXAlignment.Center
	}
}

return function(p0) --[[ line: 73 ]]
	-- upvalues: dashModule (ref), t (ref), useStyle (ref), text (ref), reactModule (ref), useImpressionsTagger (ref), imageSetButton (ref), imageSetLabel (ref), colors (ref), badge (ref), styledTextLabel (ref)
	local var4 = dashModule.join(t, p0 or {})
	local var5 = useStyle()
	local font = var5.Font
	local styleProps = var4.styleProps
	local var6 = if styleProps.font then styleProps.font else font.CaptionHeader
	local textHeight = text.GetTextHeight(var4.labelText, var6.Font, font.BaseSize * var6.RelativeSize)
	local var8 = var4.tileSize - var4.borderThickness
	local var9 = if var4.styleProps.containFooterInTileSize then var8 - textHeight * 2 - 8 else var8
	local var10 = nil
	
	if var4.impressionsTag then
		var10 = reactModule.useRef(nil)
		useImpressionsTagger(var10, var4.impressionsTag, var4.LayoutOrder)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var4.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(var9, 0),
		ref = var10
	}, {
		UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var4.borderThickness) }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		Tile = reactModule.createElement(imageSetButton, {
			Size = UDim2.fromOffset(var9, var9),
			BackgroundColor3 = var5.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = var5.Theme.BackgroundUIDefault.Transparency,
			[reactModule.Event.Activated] = var4.onActivated,
			LayoutOrder = 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var4.cornerRadius }),
			UIStroke = reactModule.createElement("UIStroke", {
				Color = var5.Theme.Divider.Color,
				Transparency = var5.Theme.Divider.Transparency,
				Thickness = var4.borderThickness
			}),
			Icon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageTransparency = var5.Theme.IconEmphasis.Transparency,
				ImageColor3 = colors.White,
				Image = var4.icon,
				Size = UDim2.fromOffset(var4.iconSize, var4.iconSize),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			Badge = var4.badgeValue and reactModule.createElement(badge, {
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.fromOffset(var4.tileSize - 8, 8),
				value = var4.badgeValue
			})
		}),
		Label = reactModule.createElement(imageSetButton, {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			[reactModule.Event.Activated] = var4.onActivated,
			LayoutOrder = 2
		}, {
			Text = reactModule.createElement(styledTextLabel, {
				fluidSizing = false,
				richText = false,
				lineHeight = 1,
				text = var4.labelText,
				fontStyle = var6,
				colorStyle = var5.Theme.TextEmphasis,
				size = UDim2.fromOffset(var9, textHeight * 2),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = styleProps.textXAlignment,
				textYAlignment = Enum.TextYAlignment.Top
			})
		})
	})
end