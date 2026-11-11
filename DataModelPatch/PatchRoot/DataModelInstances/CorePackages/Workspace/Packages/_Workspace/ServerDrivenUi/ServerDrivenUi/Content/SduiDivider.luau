local ReactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		Size = p1.size or UDim2.new(1, 0, 0, 1),
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		BackgroundColor3 = p1.backgroundColor3 or Color3.new(1, 1, 1),
		BackgroundTransparency = p1.backgroundTransparency or 0.85,
		BorderSizePixel = 0,
		[ReactModule.Tag] = "data-testid=--sdui-divider"
	})
end)