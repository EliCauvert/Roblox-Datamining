local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return function(p1)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		Rotation = 45,
		tag = "anchor-center-center",
		Size = UDim2.fromOffset(p1.size, p1.size),
		Position = p1.position,
		ZIndex = p1.ZIndex,
		backgroundStyle = p1.backgroundStyle,
		testId = p1.testId
	})
end