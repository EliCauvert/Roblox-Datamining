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
	[require(actions.ChatLayoutHorizontalAlignmentChanged).name] = function(p1, p2)
		-- upvalues: dictionary (ref)
		local position = p1.Position
		local anchorPoint = p1.AnchorPoint
		
		if p2.value == Enum.HorizontalAlignment.Left then
			position = UDim2.new(0, 8, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(0, anchorPoint.Y)
		elseif p2.value == Enum.HorizontalAlignment.Center then
			position = UDim2.new(0.5, 0, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(0.5, anchorPoint.Y)
		elseif p2.value == Enum.HorizontalAlignment.Right then
			position = UDim2.new(1, -8, position.Y.Scale, position.Y.Offset)
			anchorPoint = Vector2.new(1, anchorPoint.Y)
		end
		return dictionary.join(p1, { Position = position, AnchorPoint = anchorPoint })
	end,
	[require(actions.ChatLayoutVerticalAlignmentChanged).name] = function(p1, p2)
		-- upvalues: y (ref), dictionary (ref)
		local position = p1.Position
		local anchorPoint = p1.AnchorPoint
		
		if p2.value == Enum.VerticalAlignment.Top then
			position = UDim2.new(position.X.Scale, position.X.Offset, 0, 4)
			anchorPoint = Vector2.new(anchorPoint.X, 0)
		elseif p2.value == Enum.VerticalAlignment.Center then
			position = UDim2.new(position.X.Scale, position.X.Offset, 0.5, -y)
			anchorPoint = Vector2.new(anchorPoint.X, 0.5)
		elseif p2.value == Enum.VerticalAlignment.Bottom then
			position = UDim2.new(position.X.Scale, position.X.Offset, 1, -4)
			anchorPoint = Vector2.new(anchorPoint.X, 1)
		end
		return dictionary.join(p1, {
			Position = position,
			AnchorPoint = anchorPoint,
			UIListLayoutVerticalAlignment = p2.value
		})
	end
})