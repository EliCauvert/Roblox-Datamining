local reactModule = require(script:FindFirstAncestor("ServerDrivenUi").Parent.React)

return reactModule.memo(function(p0) --[[ line: 18 | named "SduiDivider" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Size = p0.size or UDim2.new(1, 0, 0, 1),
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint,
		BackgroundColor3 = p0.backgroundColor3 or Color3.new(1, 1, 1),
		BackgroundTransparency = p0.backgroundTransparency or 0.85,
		BorderSizePixel = 0,
		[reactModule.Tag] = "data-testid=--sdui-divider"
	})
end)