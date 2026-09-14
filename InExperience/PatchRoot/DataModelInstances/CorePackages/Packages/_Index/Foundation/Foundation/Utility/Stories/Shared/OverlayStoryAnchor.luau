local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local uDim2 = UDim2.fromOffset(88, 36)

return {
	PLAYGROUND_TAG = "row align-x-center align-y-center padding-y-large bg-surface-0",
	Anchor = reactModule.forwardRef(function(p1, p2)
		-- upvalues: reactModule (ref), viewModule (ref), uDim2 (ref), textModule (ref)
		return reactModule.createElement(viewModule, {
			tag = "row align-x-center align-y-center radius-medium bg-shift-200",
			LayoutOrder = p1.LayoutOrder,
			Position = p1.Position,
			AnchorPoint = p1.AnchorPoint,
			Size = p1.Size or uDim2,
			onActivated = p1.onActivated,
			ref = p2
		}, {
			Label = reactModule.createElement(textModule, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small content-emphasis",
				Text = p1.label or "Anchor"
			})
		})
	end),
	DEFAULT_SIZE = uDim2,
	TALL_SIZE = UDim2.fromOffset(88, 64),
	PLAYGROUND_FRAME_SIZE = UDim2.new(1, 0, 0, 240)
}