local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged
	}, {
		Media = ReactModule.createElement("ViewportFrame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ref = p1.viewportFrameRef
		}, {
			WorldModel = ReactModule.createElement("WorldModel", { ref = p1.worldModelRef })
		}),
		Overlay = ReactModule.createElement(View, { tag = "size-full", ZIndex = 2 }, p1.children)
	})
end