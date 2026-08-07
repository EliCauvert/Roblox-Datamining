local _ = require(script.Parent.Parent.Parent.App.Style.StyleTypes)

return {
	getBaseMenuDefaultTokens = function(p0) --[[ line: 27 ]]
		assert(p0.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			elementHeight = p0.Tokens.Component.MenuCell.Base.Container.Height,
			borderCornerRadius = p0.Tokens.Component.BaseMenu.BorderRadius,
			background = {
				Color = p0.Tokens.Component.BaseMenu.BackgroundColor.Color3,
				Transparency = p0.Tokens.Component.BaseMenu.BackgroundColor.Transparency
			}
		}
	end,
	getCellDefaultTokens = function(p1) --[[ line: 7 ]]
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
	getDropdownMenuCellDefaultTokens = function(p2) --[[ line: 39 ]]
		return {
			iconSize = p2.Tokens.Global.Size_450,
			containerPadding = {
				left = p2.Tokens.Global.Space_200,
				right = p2.Tokens.Global.Space_300
			},
			textFont = p2.Tokens.Semantic.Typography.Subheader,
			iconTextSpacing = p2.Tokens.Global.Space_200,
			border = {
				cornerRadius = p2.Tokens.Semantic.Radius.Medium,
				size = p2.Tokens.Global.Stroke_100
			}
		}
	end,
	getDropdownMenuDefaultTokens = function(p3) --[[ line: 55 ]]
		return {
			height = UDim.new(0, p3.Tokens.Global.Size_600),
			menuStateColors = {
				buttonDefault = {
					Color = p3.Tokens.Semantic.Color.Action.Secondary.Border.Color3,
					Transparency = p3.Tokens.Semantic.Color.Action.Secondary.Border.Transparency
				},
				contentDefault = {
					Color = p3.Tokens.Semantic.Color.Text.Default.Color3,
					Transparency = p3.Tokens.Semantic.Color.Text.Default.Transparency
				},
				alert = {
					Color = p3.Tokens.Semantic.Color.Action.Alert.Border.Color3,
					Transparency = p3.Tokens.Semantic.Color.Action.Alert.Border.Transparency
				}
			}
		}
	end
}