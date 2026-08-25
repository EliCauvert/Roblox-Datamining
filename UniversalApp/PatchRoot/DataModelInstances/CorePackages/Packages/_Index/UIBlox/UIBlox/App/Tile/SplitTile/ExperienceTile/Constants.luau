local parent = script.Parent.Parent.Parent.Parent
local UIBloxConfigModule = require(parent.Parent.UIBloxConfig)
local _ = require(parent.Style.StyleTypes)
local _ = require(parent.Style.Fonts)

return {
	DEFAULT_FOOTER_HEIGHT = 22,
	DEFAULT_TEXT_LINE_COUNT = 2,
	getDefaultStyleProps = function(p0)
		-- upvalues: UIBloxConfigModule (ref)
		assert(p0.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			backgroundColor = {
				Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Surface.Surface_200.Color3 else p0.Tokens.Semantic.Color.Background.Muted.Color3,
				Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Surface.Surface_200.Transparency else p0.Tokens.Semantic.Color.Background.Muted.Transparency
			},
			border = {
				BorderColor = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Stroke.Emphasis.Color3 else p0.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Stroke.Emphasis.Transparency else p0.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
				},
				CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Radius.Medium else p0.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop),
				Width = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Stroke.Standard else p0.Tokens.Component.VerticalTile.Base.Container.BorderWidth
			},
			topContentPadding = {
				Left = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.None else p0.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Leading,
				Right = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.None else p0.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Trailing,
				Top = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.None else p0.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Top,
				Bottom = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.None else p0.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Bottom
			},
			bottomContentPadding = {
				Left = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.Small else p0.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Leading,
				Right = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.Small else p0.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Trailing,
				Top = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.Small else p0.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Top,
				Bottom = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Padding.Small else p0.Tokens.Component.VerticalTile.Base.ContentBottom.Spacing.Bottom
			},
			overlayColors = {},
			selectionCursorPadding = { Left = 0, Right = 0, Top = 0, Bottom = 0 },
			dropShadow = {
				ImageAssetName = "component_assets/dropshadow_24_6",
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				ImageColor = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Common.Shadow.Color3 else p0.Tokens.Semantic.Color.Common.DropShadow.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Color.Common.Shadow.Transparency else p0.Tokens.Semantic.Color.Common.DropShadow.Transparency
				},
				SliceCenter = Rect.new(18, 18, 18, 18)
			},
			contentTitlePadding = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p0.Tokens.Size.Size_200 else p0.Tokens.Global.Space_100,
			contentTitleFont = p0.Font.Header2
		}
	end
}