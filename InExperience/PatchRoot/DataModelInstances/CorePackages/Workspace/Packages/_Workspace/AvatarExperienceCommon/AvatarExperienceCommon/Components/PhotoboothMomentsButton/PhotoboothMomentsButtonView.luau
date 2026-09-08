local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "row align-x-center align-y-center radius-medium",
		testId = "PhotoboothMomentsButtonView",
		Size = p1.size,
		backgroundStyle = p1.backgroundStyle,
		onActivated = p1.onActivated,
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(foundationModule.Icon, {
			name = p1.iconName,
			size = p1.iconSize,
			style = p1.iconStyle
		})
	})
end