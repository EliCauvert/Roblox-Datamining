local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)

return function(p0)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		Rotation = 45,
		tag = "anchor-center-center",
		Size = UDim2.fromOffset(p0.size, p0.size),
		Position = p0.position,
		ZIndex = p0.ZIndex,
		backgroundStyle = p0.backgroundStyle,
		testId = p0.testId
	})
end