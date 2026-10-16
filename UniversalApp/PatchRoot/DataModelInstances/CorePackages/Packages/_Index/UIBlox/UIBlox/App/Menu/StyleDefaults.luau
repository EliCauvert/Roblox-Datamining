local parent = script.Parent.Parent.Parent
local _ = require(parent.App.Style.StyleTypes)
local UIBloxConfigModule = require(parent.UIBloxConfig)

return {
	getBaseMenuDefaultTokens = function(p1)
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			elementHeight = p1.Tokens.Component.MenuCell.Base.Container.Height,
			borderCornerRadius = p1.Tokens.Component.BaseMenu.BorderRadius,
			background = {
				Color = p1.Tokens.Component.BaseMenu.BackgroundColor.Color3,
				Transparency = p1.Tokens.Component.BaseMenu.BackgroundColor.Transparency
			}
		}
	end,
	getCellDefaultTokens = function(p1)
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			iconSize = p1.Tokens.Component.MenuCell.Base.IconFrame.Size,
			selectedIconSize = p1.Tokens.Component.MenuCell.Base.CheckFrame.Size,
			iconPaddingLeft = p1.Tokens.Component.MenuCell.Base.Container.Spacing.Leading,
			textPadding = {
				left = p1.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Leading,
				right = p1.Tokens.Component.MenuCell.Base.TextFrame.Spacing.Trailing
			},
			fontStyle = {
				Font = p1.Tokens.Component.MenuCell.Base.Text.Typography.Font,
				RelativeSize = p1.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / p1.Font.BaseSize,
				RelativeMinSize = p1.Tokens.Component.MenuCell.Base.Text.Typography.FontSize / p1.Font.BaseSize
			},
			dividerSize = p1.Tokens.Component.MenuCell.Divider.Container.BorderWidth,
			selectedIconPaddingRight = p1.Tokens.Component.MenuCell.Base.Container.Spacing.Trailing
		}
	end,
	getDropdownMenuCellDefaultTokens = function(p1)
		-- upvalues: UIBloxConfigModule (ref)
		return {
			iconSize = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_900 else p1.Tokens.Global.Size_450,
			containerPadding = {
				left = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_400 else p1.Tokens.Global.Space_200,
				right = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_600 else p1.Tokens.Global.Space_300
			},
			textFont = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Typography.TitleLarge else p1.Tokens.Semantic.Typography.Subheader,
			iconTextSpacing = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_400 else p1.Tokens.Global.Space_200,
			border = {
				cornerRadius = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Radius.Medium else p1.Tokens.Semantic.Radius.Medium,
				size = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Stroke.Standard else p1.Tokens.Global.Stroke_100
			}
		}
	end,
	getDropdownMenuDefaultTokens = function(p1)
		-- upvalues: UIBloxConfigModule (ref)
		return {
			height = UDim.new(0, if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Size.Size_1200 else p1.Tokens.Global.Size_600),
			menuStateColors = {
				buttonDefault = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.ActionSubtle.Border.Color3 else p1.Tokens.Semantic.Color.Action.Secondary.Border.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.ActionSubtle.Border.Transparency else p1.Tokens.Semantic.Color.Action.Secondary.Border.Transparency
				},
				contentDefault = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Default.Color3 else p1.Tokens.Semantic.Color.Text.Default.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.Content.Default.Transparency else p1.Tokens.Semantic.Color.Text.Default.Transparency
				},
				alert = {
					Color = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.ActionAlert.Border.Color3 else p1.Tokens.Semantic.Color.Action.Alert.Border.Color3,
					Transparency = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then p1.Tokens.Color.ActionAlert.Border.Transparency else p1.Tokens.Semantic.Color.Action.Alert.Border.Transparency
				}
			}
		}
	end
}