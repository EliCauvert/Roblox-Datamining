local parent = script.Parent.Parent.Parent.Parent
local _ = require(parent.Style.StyleTypes)
local _ = require(parent.Style.Fonts)

return {
	getDefaultStyleProps = function(p1)
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			backgroundColor = {
				Color = p1.Tokens.Color.Surface.Surface_300.Color3,
				Transparency = p1.Tokens.Color.Surface.Surface_300.Transparency
			},
			border = {
				BorderColor = {
					Color = p1.Tokens.Color.Stroke.Emphasis.Color3,
					Transparency = p1.Tokens.Color.Stroke.Emphasis.Transparency
				},
				CornerRadius = UDim.new(0, p1.Tokens.Radius.Medium),
				Width = p1.Tokens.Stroke.Standard
			},
			topContentPadding = {
				Left = p1.Tokens.Padding.None,
				Right = p1.Tokens.Padding.None,
				Top = p1.Tokens.Padding.None,
				Bottom = p1.Tokens.Padding.None
			},
			overlayColors = {},
			selectionCursorPadding = { Left = 0, Right = 0, Top = 0, Bottom = 0 },
			contentGap = p1.Tokens.Size.Size_100,
			titleFont = p1.Font.Header2,
			titleTextColor = {
				Color = p1.Tokens.Color.Content.Emphasis.Color3,
				Transparency = p1.Tokens.Color.Content.Emphasis.Transparency
			},
			iconSize = p1.Tokens.Size.Size_900,
			iconImageColor = {
				Color = p1.Tokens.Color.Content.Emphasis.Color3,
				Transparency = p1.Tokens.Color.Content.Emphasis.Transparency
			},
			dropShadow = {
				ImageAssetName = "component_assets/dropshadow_24_6",
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				ImageColor = {
					Color = p1.Tokens.Color.Common.Shadow.Color3,
					Transparency = p1.Tokens.Color.Common.Shadow.Transparency
				},
				SliceCenter = Rect.new(18, 18, 18, 18)
			}
		}
	end
}