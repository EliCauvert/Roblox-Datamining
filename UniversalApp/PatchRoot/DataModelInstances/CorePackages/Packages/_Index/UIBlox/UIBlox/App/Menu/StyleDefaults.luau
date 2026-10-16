local _ = require(script.Parent.Parent.Parent.App.Style.StyleTypes)

return {
	getBaseMenuDefaultTokens = function(p1) --[[ Line: 27 ]]
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			elementHeight = p1.Tokens.Size.Size_1400,
			borderCornerRadius = p1.Tokens.Radius.Medium,
			background = {
				Color = p1.Tokens.Color.Surface.Surface_300.Color3,
				Transparency = p1.Tokens.Color.Surface.Surface_300.Transparency
			}
		}
	end,
	getCellDefaultTokens = function(p1) --[[ Line: 7 ]]
		assert(p1.Tokens ~= nil, "Design token support is not enabled!")
		
		return {
			iconSize = p1.Tokens.Size.Size_800,
			selectedIconSize = p1.Tokens.Size.Size_800,
			iconPaddingLeft = p1.Tokens.Size.Size_300,
			textPadding = {
				left = p1.Tokens.Size.Size_300,
				right = p1.Tokens.Size.Size_300
			},
			fontStyle = {
				Font = p1.Tokens.Typography.TitleLarge.Font,
				RelativeSize = p1.Tokens.Typography.TitleLarge.FontSize / p1.Font.BaseSize,
				RelativeMinSize = p1.Tokens.Typography.TitleLarge.FontSize / p1.Font.BaseSize
			},
			dividerSize = p1.Tokens.Stroke.Standard,
			selectedIconPaddingRight = p1.Tokens.Size.Size_300
		}
	end,
	getDropdownMenuCellDefaultTokens = function(p1) --[[ Line: 39 ]]
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
	getDropdownMenuDefaultTokens = function(p1) --[[ Line: 55 ]]
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