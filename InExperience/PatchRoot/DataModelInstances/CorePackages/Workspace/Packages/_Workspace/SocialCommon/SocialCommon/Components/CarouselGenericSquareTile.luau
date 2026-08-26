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
	onActivated = function() end,
	iconSize = iconSize.Large,
	cornerRadius = UDim.new(0, 8),
	styleProps = {
		containFooterInTileSize = false,
		textXAlignment = Enum.TextXAlignment.Center
	}
}

return function(p1)
	-- upvalues: dashModule (ref), t (ref), useStyle (ref), text (ref), reactModule (ref), useImpressionsTagger (ref), imageSetButton (ref), imageSetLabel (ref), colors (ref), badge (ref), styledTextLabel (ref)
	local var1 = dashModule.join(t, p1 or {})
	local var2 = useStyle()
	local font = var2.Font
	local styleProps = var1.styleProps
	local var3 = if styleProps.font then styleProps.font else font.CaptionHeader
	local textHeight = text.GetTextHeight(var1.labelText, var3.Font, font.BaseSize * var3.RelativeSize)
	local var4 = var1.tileSize - var1.borderThickness
	local var5 = if var1.styleProps.containFooterInTileSize then var4 - textHeight * 2 - 8 else var4
	local var6 = nil
	
	if var1.impressionsTag then
		var6 = reactModule.useRef(nil)
		useImpressionsTagger(var6, var1.impressionsTag, var1.LayoutOrder)
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = var1.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(var5, 0),
		ref = var6
	}, {
		UIPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var1.borderThickness) }),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		Tile = reactModule.createElement(imageSetButton, {
			Size = UDim2.fromOffset(var5, var5),
			BackgroundColor3 = var2.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = var2.Theme.BackgroundUIDefault.Transparency,
			[reactModule.Event.Activated] = var1.onActivated,
			LayoutOrder = 1
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = var1.cornerRadius }),
			UIStroke = reactModule.createElement("UIStroke", {
				Color = var2.Theme.Divider.Color,
				Transparency = var2.Theme.Divider.Transparency,
				Thickness = var1.borderThickness
			}),
			Icon = reactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageTransparency = var2.Theme.IconEmphasis.Transparency,
				ImageColor3 = colors.White,
				Image = var1.icon,
				Size = UDim2.fromOffset(var1.iconSize, var1.iconSize),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			Badge = var1.badgeValue and reactModule.createElement(badge, {
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.fromOffset(var1.tileSize - 8, 8),
				value = var1.badgeValue
			})
		}),
		Label = reactModule.createElement(imageSetButton, {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			[reactModule.Event.Activated] = var1.onActivated,
			LayoutOrder = 2
		}, {
			Text = reactModule.createElement(styledTextLabel, {
				fluidSizing = false,
				richText = false,
				lineHeight = 1,
				text = var1.labelText,
				fontStyle = var3,
				colorStyle = var2.Theme.TextEmphasis,
				size = UDim2.fromOffset(var5, textHeight * 2),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = styleProps.textXAlignment,
				textYAlignment = Enum.TextYAlignment.Top
			})
		})
	})
end