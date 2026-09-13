local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-full",
		testId = "PhotoboothMomentsPageView"
	}, {
		TopBar = reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y",
			testId = "PhotoboothMomentsPageView_TopBar",
			padding = { top = UDim.new(0, p1.topInset) }
		}, {
			Bar = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center size-full-0 auto-y padding-x-medium padding-y-small"
			}, {
				BackButton = reactModule.createElement(foundationModule.IconButton, {
					testId = "PhotoboothMomentsPageView_BackButton",
					icon = foundationModule.Enums.IconName.ChevronLargeLeft,
					onActivated = p1.onBackButtonPressed
				})
			})
		})
	})
end