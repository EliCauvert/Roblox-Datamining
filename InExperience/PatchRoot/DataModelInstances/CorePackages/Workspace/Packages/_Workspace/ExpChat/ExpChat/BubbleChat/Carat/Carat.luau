local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local chatSettings = p1.chatSettings
	
	return reactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/InGameChat/Caret.png",
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.fromOffset(12, 8),
		ImageColor3 = chatSettings.BackgroundColor3,
		ImageTransparency = chatSettings.BackgroundTransparency
	}, {
		CaratGradient = chatSettings.UIGradient and reactModule.createElement("UIGradient", chatSettings.UIGradient)
	})
end