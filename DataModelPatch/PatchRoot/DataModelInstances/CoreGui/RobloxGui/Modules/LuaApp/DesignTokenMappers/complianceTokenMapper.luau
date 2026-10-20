local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)

return function(_, p1)
	return {
		xButtonSize = p1.Size.Size_900,
		xLeftPadding = p1.Size.Size_200,
		paddingTop = p1.Size.Size_1400,
		paddingBottom = p1.Size.Size_1200,
		paddingRight = p1.Size.Size_600,
		paddingLeft = p1.Size.Size_600,
		titleSize = p1.FontSize.FontSize_1200,
		messageSize = p1.FontSize.FontSize_400,
		messagePaddingTop = p1.Size.Size_1200,
		messagePaddingTopExtended = p1.Size.Size_1800,
		messagePaddingBottomReduced = p1.Size.Size_600,
		messagePaddingBottom = p1.Size.Size_1200,
		messagePaddingTopWideView = p1.Size.Size_600,
		messagePaddingTopWideViewExtended = p1.Size.Size_1800,
		messagePaddingBottomWideView = p1.Size.Size_300,
		dividerPaddingTop = p1.Size.Size_1200,
		listPaddingBottom = p1.Size.Size_600,
		checkboxSize = p1.Size.Size_600,
		checkboxPadding = p1.Size.Size_400,
		checkboxPaddingBottom = p1.Size.Size_500,
		agreeButtonHeight = p1.Size.Size_1200,
		agreeButtonPaddingBottom = p1.Size.Size_200
	}
end