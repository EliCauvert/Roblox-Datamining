local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIGradient", {
		Rotation = if p1.fillDirection == Enum.FillDirection.Vertical then 90 else 0,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, if p1.top then 0 else 1),
			NumberSequenceKeypoint.new(0.5, if p1.top then 0 else 1),
			NumberSequenceKeypoint.new(0.50001, if p1.top then 1 else 0),
			NumberSequenceKeypoint.new(1, if p1.top then 1 else 0)
		})
	})
end