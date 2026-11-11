local Parent = script:FindFirstAncestor("UserActivationFramework").Parent
local _ = require(Parent.RobloxAppHooks)
local _ = require(Parent.Style)

return function(_, p1)
	return {
		horizontalPaddingPx = p1.Size.Size_500,
		verticalPaddingPx = p1.Size.Size_100,
		headerTopPadding = p1.Size.Size_800,
		headerIconSize = p1.Size.Size_900,
		footerButtonMarginBetweenPx = p1.Size.Size_200,
		footerButtonHeightPx = p1.Size.Size_1200,
		footerTopPaddingPx = p1.Size.Size_400,
		subfooterTopPaddingPx = p1.Size.Size_400,
		subfooterBottomPaddingPx = p1.Size.Size_250
	}
end