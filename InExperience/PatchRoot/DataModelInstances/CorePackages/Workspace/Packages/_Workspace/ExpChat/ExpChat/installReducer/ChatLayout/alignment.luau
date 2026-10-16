local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local Dictionary = require(Parent.llama).Dictionary
local Actions = ExpChat.Actions
local Y = game:GetService("GuiService"):GetGuiInset().Y

return require(Parent.Rodux).createReducer({
	Position = UDim2.new(0, 8, 0, 4),
	AnchorPoint = Vector2.new(0, 0),
	UIListLayoutVerticalAlignment = Enum.VerticalAlignment.Top
}, {
	[require(Actions.ChatLayoutHorizontalAlignmentChanged).name] = function(Frame, p1) --[[ Line: 22 ]]
		-- upvalues: Dictionary (copy)
		local Position = Frame.Position
		local AnchorPoint = Frame.AnchorPoint
		
		if p1.value == Enum.HorizontalAlignment.Left then
			Position = UDim2.new(0, 8, Position.Y.Scale, Position.Y.Offset)
			AnchorPoint = Vector2.new(0, AnchorPoint.Y)
		elseif p1.value == Enum.HorizontalAlignment.Center then
			Position = UDim2.new(0.5, 0, Position.Y.Scale, Position.Y.Offset)
			AnchorPoint = Vector2.new(0.5, AnchorPoint.Y)
		elseif p1.value == Enum.HorizontalAlignment.Right then
			Position = UDim2.new(1, -8, Position.Y.Scale, Position.Y.Offset)
			AnchorPoint = Vector2.new(1, AnchorPoint.Y)
		end
		return Dictionary.join(Frame, { Position = Position, AnchorPoint = AnchorPoint })
	end,
	[require(Actions.ChatLayoutVerticalAlignmentChanged).name] = function(Frame, p1) --[[ Line: 43 ]]
		-- upvalues: Y (copy), Dictionary (copy)
		local Position = Frame.Position
		local AnchorPoint = Frame.AnchorPoint
		
		if p1.value == Enum.VerticalAlignment.Top then
			Position = UDim2.new(Position.X.Scale, Position.X.Offset, 0, 4)
			AnchorPoint = Vector2.new(AnchorPoint.X, 0)
		elseif p1.value == Enum.VerticalAlignment.Center then
			Position = UDim2.new(Position.X.Scale, Position.X.Offset, 0.5, -Y)
			AnchorPoint = Vector2.new(AnchorPoint.X, 0.5)
		elseif p1.value == Enum.VerticalAlignment.Bottom then
			Position = UDim2.new(Position.X.Scale, Position.X.Offset, 1, -4)
			AnchorPoint = Vector2.new(AnchorPoint.X, 1)
		end
		return Dictionary.join(Frame, {
			Position = Position,
			AnchorPoint = AnchorPoint,
			UIListLayoutVerticalAlignment = p1.value
		})
	end
})