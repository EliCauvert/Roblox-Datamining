local Parent = script.Parent.Parent.Parent.Parent
local _ = require(Parent.Style.StyleTypes)
local _ = require(Parent.Style.Fonts)

return {
	DEFAULT_FOOTER_HEIGHT = 22,
	DEFAULT_TEXT_LINE_COUNT = 2,
	getDefaultStyleProps = function(p1)
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			backgroundColor = {
				Color = p1.Tokens.Semantic.Color.Background.Muted.Color3,
				Transparency = p1.Tokens.Semantic.Color.Background.Muted.Transparency
			},
			border = {
				BorderColor = {
					Color = p1.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3,
					Transparency = p1.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
				},
				CornerRadius = UDim.new(0, p1.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop),
				Width = p1.Tokens.Component.VerticalTile.Base.Container.BorderWidth
			},
			topContentPadding = {
				Left = p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Leading,
				Right = p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Trailing,
				Top = p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Top,
				Bottom = p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Bottom
			},
			bottomContentPadding = {
				Left = p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Leading,
				Right = p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Trailing,
				Top = p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top,
				Bottom = p1.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
			},
			overlayColors = {},
			selectionCursorPadding = { Left = 0, Right = 0, Top = 0, Bottom = 0 },
			dropShadow = {
				ImageAssetName = "component_assets/dropshadow_24_6",
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				ImageColor = {
					Color = p1.Tokens.Semantic.Color.Common.DropShadow.Color3,
					Transparency = p1.Tokens.Semantic.Color.Common.DropShadow.Transparency
				},
				SliceCenter = Rect.new(18, 18, 18, 18)
			},
			contentTitlePadding = p1.Tokens.Global.Space_100,
			contentTitleFont = p1.Font.Header2
		}
	end
}