local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)

return function(p1)
	-- upvalues: ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		Rotation = 45,
		tag = "anchor-center-center",
		Size = UDim2.fromOffset(p1.size, p1.size),
		Position = p1.position,
		ZIndex = p1.ZIndex,
		backgroundStyle = p1.backgroundStyle,
		testId = p1.testId
	})
end