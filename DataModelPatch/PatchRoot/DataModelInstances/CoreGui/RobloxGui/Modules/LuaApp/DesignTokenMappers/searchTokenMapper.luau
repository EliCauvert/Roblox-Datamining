local _ = require(game:GetService("CorePackages").Workspace.Packages.Style)

return function(_, p1)
	local Size500 = p1.Size.Size_500
	local Size1200: number = p1.Size.Size_1200
	local Size1200_1 = p1.Size.Size_1200
	local Size300: number = p1.Size.Size_300
	
	return {
		SearchHeadingScale = 0.8,
		SearchPaddingVertical = 85,
		SearchPaddingHorizontal = p1.Size.Size_600,
		SearchBoxHeight = Size1200,
		SearchBoxTextSize = p1.FontSize.FontSize_500,
		SearchBoxIconSize = Size500,
		SearchBoxIconPosition = Size500 + p1.Size.Size_200,
		SearchBoxIconPaddingLeft = p1.Size.Size_400 + Size500,
		SearchBoxIconPaddingRight = p1.Size.Size_400,
		SearchBoxIconPaddingVertical = p1.Size.Size_200,
		SearchTypePaddingVertical = Size300,
		SearchTypeHeight = Size1200_1,
		SearchBoxAndTypeOffset = Size1200 + 85 + Size1200_1 + Size300 * 2
	}
end