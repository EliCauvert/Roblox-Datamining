local ReactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p1) --[[ Line: 10 | Named "Carat" ]]
	-- upvalues: ReactModule (copy)
	local ChatSettings = p1.chatSettings
	
	return ReactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		Image = "rbxasset://textures/ui/InGameChat/Caret.png",
		LayoutOrder = p1.layoutOrder,
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.new(0.5, 0, 1, -1),
		Size = UDim2.fromOffset(12, 8),
		ImageColor3 = ChatSettings.BackgroundColor3,
		ImageTransparency = ChatSettings.BackgroundTransparency
	}, {
		CaratGradient = ChatSettings.UIGradient and ReactModule.createElement("UIGradient", ChatSettings.UIGradient)
	})
end