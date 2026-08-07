local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p0) --[[ line: 11 | named "Gradient" ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("UIGradient", {
		Rotation = if p0.fillDirection == Enum.FillDirection.Vertical then 90 else 0,
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, if p0.top then 0 else 1),
			NumberSequenceKeypoint.new(0.5, if p0.top then 0 else 1),
			NumberSequenceKeypoint.new(0.50001, if p0.top then 1 else 0),
			NumberSequenceKeypoint.new(1, if p0.top then 1 else 0)
		})
	})
end