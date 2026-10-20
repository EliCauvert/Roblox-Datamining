local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local _UDim2 = UDim2.fromOffset(88, 36)

return {
	PLAYGROUND_TAG = "row align-x-center align-y-center padding-y-large bg-surface-0",
	Anchor = ReactModule.forwardRef(function(Frame: Frame, Ref)
		-- upvalues: ReactModule (copy), ViewModule (copy), _UDim2 (copy), TextModule (copy)
		return ReactModule.createElement(ViewModule, {
			tag = "row align-x-center align-y-center radius-medium bg-shift-200",
			LayoutOrder = Frame.LayoutOrder,
			Position = Frame.Position,
			AnchorPoint = Frame.AnchorPoint,
			Size = Frame.Size or _UDim2,
			onActivated = Frame.onActivated,
			ref = Ref
		}, {
			Label = ReactModule.createElement(TextModule, {
				LayoutOrder = 1,
				tag = "auto-xy text-label-small content-emphasis",
				Text = Frame.label or "Anchor"
			})
		})
	end),
	DEFAULT_SIZE = _UDim2,
	TALL_SIZE = UDim2.fromOffset(88, 64),
	PLAYGROUND_FRAME_SIZE = UDim2.new(1, 0, 0, 240)
}