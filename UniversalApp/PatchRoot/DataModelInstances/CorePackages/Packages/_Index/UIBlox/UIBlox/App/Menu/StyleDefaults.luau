local _ = require(script.Parent.Parent.Parent.App.Style.StyleTypes)

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
		return {
			iconSize = p1.Tokens.Size.Size_900,
			containerPadding = {
				left = p1.Tokens.Size.Size_400,
				right = p1.Tokens.Size.Size_600
			},
			textFont = p1.Tokens.Typography.TitleLarge,
			iconTextSpacing = p1.Tokens.Size.Size_400,
			border = {
				cornerRadius = p1.Tokens.Radius.Medium,
				size = p1.Tokens.Stroke.Standard
			}
		}
	end,
	getDropdownMenuDefaultTokens = function(p1)
		return {
			height = UDim.new(0, p1.Tokens.Size.Size_1200),
			menuStateColors = {
				buttonDefault = {
					Color = p1.Tokens.Color.ActionSubtle.Border.Color3,
					Transparency = p1.Tokens.Color.ActionSubtle.Border.Transparency
				},
				contentDefault = {
					Color = p1.Tokens.Color.Content.Default.Color3,
					Transparency = p1.Tokens.Color.Content.Default.Transparency
				},
				alert = {
					Color = p1.Tokens.Color.ActionAlert.Border.Color3,
					Transparency = p1.Tokens.Color.ActionAlert.Border.Transparency
				}
			}
		}
	end
}