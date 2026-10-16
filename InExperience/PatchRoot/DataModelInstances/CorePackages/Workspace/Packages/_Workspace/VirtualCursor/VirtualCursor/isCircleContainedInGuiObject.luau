return function(p1, p2, Frame: Frame): boolean --[[ Line: 1 ]]
	local ScaledAbsoluteSize = 0.5 * Frame.AbsoluteSize
	local Offset = p1 - (Frame.AbsolutePosition + ScaledAbsoluteSize)
	local AngleDelta = math.atan2(Offset.Y, Offset.X) - math.rad(Frame.AbsoluteRotation)
	local ScaledMagnitude = Offset.Magnitude * Vector2.new(math.cos(AngleDelta), (math.sin(AngleDelta)))
	
	return -ScaledAbsoluteSize.X <= ScaledMagnitude.X - p2 and (ScaledMagnitude.X + p2 <= ScaledAbsoluteSize.X and -ScaledAbsoluteSize.Y <= ScaledMagnitude.Y - p2) and ScaledMagnitude.Y + p2 <= ScaledAbsoluteSize.Y
end