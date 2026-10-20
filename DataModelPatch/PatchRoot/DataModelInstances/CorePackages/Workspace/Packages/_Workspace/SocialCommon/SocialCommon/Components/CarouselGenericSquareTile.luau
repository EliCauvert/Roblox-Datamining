local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local DashModule = require(Parent.Dash)
local Text = require(Parent.AppCommonLib).Text
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Badge = UIBloxModule.App.Indicator.Badge
local Colors = UIBloxModule.App.Style.Colors
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local config = {
	badgeValue = nil,
	icon = "",
	labelText = "",
	tileSize = 100,
	borderThickness = 0,
	onActivated = function() end,
	iconSize = UIBloxModule.App.Constant.IconSize.Large,
	cornerRadius = UDim.new(0, 8),
	styleProps = {
		containFooterInTileSize = false,
		textXAlignment = Enum.TextXAlignment.Center
	}
}

return function(p1)
	-- upvalues: DashModule (copy), config (copy), UseStyleFunction (copy), Text (copy), ReactModule (copy), UseImpressionsTaggerFunction (copy), ImageSetButton (copy), ImageSetLabel (copy), Colors (copy), Badge (copy), StyledTextLabel (copy)
	local JoinResult = DashModule.join(config, p1 or {})
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local StyleProps = JoinResult.styleProps
	local StylePropsFont = if StyleProps.font then StyleProps.font else UseStyleResultFont.CaptionHeader
	local TextHeight: number = Text.GetTextHeight(JoinResult.labelText, StylePropsFont.Font, UseStyleResultFont.BaseSize * StylePropsFont.RelativeSize)
	local TileSizeDelta = JoinResult.tileSize - JoinResult.borderThickness
	local XOffset = if JoinResult.styleProps.containFooterInTileSize then TileSizeDelta - TextHeight * 2 - 8 else TileSizeDelta
	local UseRefResult = nil
	
	if JoinResult.impressionsTag then
		UseRefResult = ReactModule.useRef(nil)
		UseImpressionsTaggerFunction(UseRefResult, JoinResult.impressionsTag, JoinResult.LayoutOrder)
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = JoinResult.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromOffset(XOffset, 0),
		ref = UseRefResult
	}, {
		UIPadding = ReactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, JoinResult.borderThickness) }),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		Tile = ReactModule.createElement(ImageSetButton, {
			Size = UDim2.fromOffset(XOffset, XOffset),
			BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency,
			[ReactModule.Event.Activated] = JoinResult.onActivated,
			LayoutOrder = 1
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = JoinResult.cornerRadius }),
			UIStroke = ReactModule.createElement("UIStroke", {
				Color = UseStyleResult.Theme.Divider.Color,
				Transparency = UseStyleResult.Theme.Divider.Transparency,
				Thickness = JoinResult.borderThickness
			}),
			Icon = ReactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				ImageTransparency = UseStyleResult.Theme.IconEmphasis.Transparency,
				ImageColor3 = Colors.White,
				Image = JoinResult.icon,
				Size = UDim2.fromOffset(JoinResult.iconSize, JoinResult.iconSize),
				Position = UDim2.fromScale(0.5, 0.5)
			}),
			Badge = JoinResult.badgeValue and ReactModule.createElement(Badge, {
				anchorPoint = Vector2.new(1, 0),
				position = UDim2.fromOffset(JoinResult.tileSize - 8, 8),
				value = JoinResult.badgeValue
			})
		}),
		Label = ReactModule.createElement(ImageSetButton, {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0),
			[ReactModule.Event.Activated] = JoinResult.onActivated,
			LayoutOrder = 2
		}, {
			Text = ReactModule.createElement(StyledTextLabel, {
				fluidSizing = false,
				richText = false,
				lineHeight = 1,
				text = JoinResult.labelText,
				fontStyle = StylePropsFont,
				colorStyle = UseStyleResult.Theme.TextEmphasis,
				size = UDim2.fromOffset(XOffset, TextHeight * 2),
				textTruncate = Enum.TextTruncate.AtEnd,
				textXAlignment = StyleProps.textXAlignment,
				textYAlignment = Enum.TextYAlignment.Top
			})
		})
	})
end