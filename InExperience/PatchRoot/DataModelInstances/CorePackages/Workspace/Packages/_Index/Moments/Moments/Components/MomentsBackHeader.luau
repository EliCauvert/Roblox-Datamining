local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local momentsHeaderContainerModule = require(moments.Components.MomentsHeader.MomentsHeaderContainer)

return function(p1)
	-- upvalues: reactModule (ref), momentsHeaderContainerModule (ref)
	return reactModule.createElement(momentsHeaderContainerModule, {
		variant = "back",
		showTopScrim = true,
		layoutOrder = p1.layoutOrder,
		onBack = p1.onBack,
		onCreatePressed = p1.onCreatePressed
	})
end