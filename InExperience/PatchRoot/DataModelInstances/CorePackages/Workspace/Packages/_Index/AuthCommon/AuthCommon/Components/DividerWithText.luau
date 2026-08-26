local reactModule = require(script:FindFirstAncestor("AuthCommon").Parent.React)
local textService = game:GetService("TextService")

return function(p1)
	-- upvalues: textService (ref), reactModule (ref)
	local x = textService:GetTextSize(p1.text, p1.fontSize, p1.font, Vector2.new(1e999, p1.fontSize)).X
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = if p1.size then p1.size else UDim2.new(0, p1.width, 0, p1.height)
	}, reactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0.5, -x / 2 - p1.padding, 0, 1),
		BackgroundTransparency = p1.transparency,
		BackgroundColor3 = p1.color3
	}), reactModule.createElement("Frame", {
		Position = UDim2.new(0.5, x / 2 + p1.padding, 0.5, 0),
		Size = UDim2.new(0.5, -x / 2 - p1.padding, 0, 1),
		BackgroundTransparency = p1.transparency,
		BackgroundColor3 = p1.color3
	}), reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = p1.text,
		TextSize = p1.fontSize,
		Font = p1.font,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextTransparency = p1.transparency,
		TextColor3 = p1.color3
	}))
end