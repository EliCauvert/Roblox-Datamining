local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)

return (ReactModule.forwardRef(function(Frame: Frame, Ref) --[[ Line: 15 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Frame.AutomaticSize or Enum.AutomaticSize.XY,
		BackgroundColor3 = Frame.BackgroundColor3,
		BackgroundTransparency = Frame.BackgroundTransparency or 1,
		LayoutOrder = Frame.LayoutOrder,
		Position = Frame.Position,
		Size = Frame.Size or UDim2.fromScale(1, 1),
		ZIndex = Frame.ZIndex,
		children = Frame.children,
		ref = Ref
	})
end))