local reactModule = require(script:FindFirstAncestor("AuthCommon").Parent.React)
local textService = game:GetService("TextService")

return function(p0) --[[ line: 20 ]]
	-- upvalues: textService (ref), reactModule (ref)
	local x = textService:GetTextSize(p0.text, p0.fontSize, p0.font, Vector2.new(1e999, p0.fontSize)).X
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = if p0.size then p0.size else UDim2.new(0, p0.width, 0, p0.height)
	}, reactModule.createElement("Frame", {
		Position = UDim2.new(0, 0, 0.5, 0),
		Size = UDim2.new(0.5, -x / 2 - p0.padding, 0, 1),
		BackgroundTransparency = p0.transparency,
		BackgroundColor3 = p0.color3
	}), reactModule.createElement("Frame", {
		Position = UDim2.new(0.5, x / 2 + p0.padding, 0.5, 0),
		Size = UDim2.new(0.5, -x / 2 - p0.padding, 0, 1),
		BackgroundTransparency = p0.transparency,
		BackgroundColor3 = p0.color3
	}), reactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = p0.text,
		TextSize = p0.fontSize,
		Font = p0.font,
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		TextTransparency = p0.transparency,
		TextColor3 = p0.color3
	}))
end