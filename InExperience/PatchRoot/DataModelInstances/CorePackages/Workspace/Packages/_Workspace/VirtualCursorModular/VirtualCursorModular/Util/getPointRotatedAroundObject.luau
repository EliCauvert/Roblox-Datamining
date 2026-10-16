return function(p1, Frame: Frame): Vector2 --[[ Line: 2 | Named "RotatePointAroundObject" ]]
	local NewAbsolutePosition = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
	
	return Vector2.new(math.cos((math.rad(Frame.AbsoluteRotation))) * (p1 - NewAbsolutePosition).Magnitude + NewAbsolutePosition.X, math.sin((math.rad(Frame.AbsoluteRotation))) * (p1 - NewAbsolutePosition).Magnitude + NewAbsolutePosition.Y)
end