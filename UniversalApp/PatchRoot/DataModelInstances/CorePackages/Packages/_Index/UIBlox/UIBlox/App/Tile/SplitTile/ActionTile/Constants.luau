local parent = script.Parent.Parent.Parent.Parent
local UIBloxConfigModule = require(parent.Parent.UIBloxConfig)
local _ = require(parent.Style.StyleTypes)
local _ = require(parent.Style.Fonts)

return {
	getDefaultStyleProps = function(p1)
		-- upvalues: UIBloxConfigModule (ref)
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			backgroundColor = {
				Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Surface.Surface_300.Color3 else p1.Tokens.Component.VerticalTile.Base.Container.Background.Color3,
				Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Surface.Surface_300.Transparency else p1.Tokens.Component.VerticalTile.Base.Container.Background.Transparency
			},
			border = {
				BorderColor = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Stroke.Emphasis.Color3 else p1.Tokens.Component.VerticalTile.Base.Container.BorderColor.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Stroke.Emphasis.Transparency else p1.Tokens.Component.VerticalTile.Base.Container.BorderColor.Transparency
				},
				CornerRadius = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Radius.Medium else p1.Tokens.Component.VerticalTile.Base.Container.BorderRadius.LeadingTop),
				Width = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Stroke.Standard else p1.Tokens.Component.VerticalTile.Base.Container.BorderWidth
			},
			topContentPadding = {
				Left = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Padding.None else p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Leading,
				Right = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Padding.None else p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Trailing,
				Top = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Padding.None else p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Top,
				Bottom = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Padding.None else p1.Tokens.Component.VerticalTile.Base.ContentTop.Spacing.Bottom
			},
			overlayColors = {},
			selectionCursorPadding = { Left = 0, Right = 0, Top = 0, Bottom = 0 },
			contentGap = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_100 else p1.Tokens.Global.Space_50,
			titleFont = p1.Font.Header2,
			titleTextColor = {
				Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Emphasis.Color3 else p1.Tokens.Semantic.Color.Text.Emphasis.Color3,
				Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Emphasis.Transparency else p1.Tokens.Semantic.Color.Text.Emphasis.Transparency
			},
			iconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_900 else p1.Tokens.Semantic.Icon.Size.Medium,
			iconImageColor = {
				Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Emphasis.Color3 else p1.Tokens.Semantic.Color.Icon.Emphasis.Color3,
				Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Emphasis.Transparency else p1.Tokens.Semantic.Color.Icon.Emphasis.Transparency
			},
			dropShadow = {
				ImageAssetName = "component_assets/dropshadow_24_6",
				Position = UDim2.new(0.5, 0, 0.5, 2),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Size = UDim2.new(1, 10, 1, 12),
				ImageColor = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Common.Shadow.Color3 else p1.Tokens.Semantic.Color.Common.DropShadow.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Common.Shadow.Transparency else p1.Tokens.Semantic.Color.Common.DropShadow.Transparency
				},
				SliceCenter = Rect.new(18, 18, 18, 18)
			}
		}
	end
}