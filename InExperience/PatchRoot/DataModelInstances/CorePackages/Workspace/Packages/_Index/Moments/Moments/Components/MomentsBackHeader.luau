local moments = script:FindFirstAncestor("Moments")
local reactModule = require(moments.Parent.React)
local momentsHeaderContainerModule = require(moments.Components.MomentsHeader.MomentsHeaderContainer)

return function(p0)
	-- upvalues: reactModule (ref), momentsHeaderContainerModule (ref)
	return reactModule.createElement(momentsHeaderContainerModule, {
		variant = "back",
		showTopScrim = true,
		layoutOrder = p0.layoutOrder,
		onBack = p0.onBack,
		onCreatePressed = p0.onCreatePressed
	})
end