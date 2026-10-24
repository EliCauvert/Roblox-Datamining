local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "size-full",
		testId = "font-size-slider-touch-area",
		ref = p1.touchAreaRef,
		ZIndex = p1.ZIndex
	}, {
		DragDetector = ReactModule.createElement("UIDragDetector", {
			DragStyle = Enum.UIDragDetectorDragStyle.Scriptable,
			SelectionModeDragSpeed = UDim2.new(),
			[ReactModule.Event.DragStart] = p1.onDragStarted,
			[ReactModule.Event.DragContinue] = p1.onDrag
		})
	})
end