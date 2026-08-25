local guiService = game:GetService("GuiService")
local expChat = script:FindFirstAncestor("ExpChat")
local parent = expChat.Parent
local roduxModule = require(parent.Rodux)
local dictionary = require(parent.llama).Dictionary
local actions = expChat.Actions
local y = guiService:GetGuiInset().Y

return roduxModule.createReducer({
	Position = UDim2.new(0, 8, 0, 4),
	AnchorPoint = Vector2.new(0, 0),
	UIListLayoutVerticalAlignment = Enum.VerticalAlignment.Top
}, {
	[require(actions.ChatLayoutHorizontalAlignmentChanged).name] = function(p0, p1)
		-- upvalues: dictionary (ref)
		local position = p0.Position
		local anchorPoint = p0.AnchorPoint
		
		if p1.value == Enum.HorizontalAlignment.Left then
			position = UDim2.new(0, 8, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(0, anchorPoint.Y)
		elseif p1.value == Enum.HorizontalAlignment.Center then
			position = UDim2.new(0.5, 0, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(0.5, anchorPoint.Y)
		elseif p1.value == Enum.HorizontalAlignment.Right then
			position = UDim2.new(1, -8, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(1, anchorPoint.Y)
		end
		return dictionary.join(p0, { Position = position, AnchorPoint = anchorPoint })
	end,
	[require(actions.ChatLayoutVerticalAlignmentChanged).name] = function(p2, p3)
		-- upvalues: y (ref), dictionary (ref)
		local position = p2.Position
		local anchorPoint = p2.AnchorPoint
		
		if p3.value == Enum.VerticalAlignment.Top then
			position = UDim2.new(position.X.Scale, position.X.Offset, 0, 4)
			anchorPoint = Vector2.new(anchorPoint.X, 0)
		elseif p3.value == Enum.VerticalAlignment.Center then
			position = UDim2.new(position.X.Scale, position.X.Offset, 0.5, -y)
			anchorPoint = Vector2.new(anchorPoint.X, 0.5)
		elseif p3.value == Enum.VerticalAlignment.Bottom then
			position = UDim2.new(position.X.Scale, position.X.Offset, 1, -4)
			anchorPoint = Vector2.new(anchorPoint.X, 1)
		end
		return dictionary.join(p2, {
			Position = position,
			AnchorPoint = anchorPoint,
			UIListLayoutVerticalAlignment = p3.value
		})
	end
})