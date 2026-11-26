local VRGesturesMathModule = {
	FIRST_PERSON_THRESHOLD_DISTANCE = 5,
	HEAD_OFFSET_FORWARD_RATIO = 0.125,
	HEAD_OFFSET_HEIGHT_RATIO = 0.25
}

function VRGesturesMathModule.isVRFirstPerson(p1, p2, p3, p4): boolean
	-- upvalues: VRGesturesMathModule (copy)
	return (p1 - p2).Magnitude <= (if p4 then VRGesturesMathModule.FIRST_PERSON_THRESHOLD_DISTANCE * p3 else VRGesturesMathModule.FIRST_PERSON_THRESHOLD_DISTANCE)
end

function VRGesturesMathModule.getThirdPersonHeadTargetPosition(p1)
	-- upvalues: VRGesturesMathModule (copy)
	return (p1 * CFrame.new(0, p1.Position.Y * VRGesturesMathModule.HEAD_OFFSET_HEIGHT_RATIO, -p1.Position.Y * VRGesturesMathModule.HEAD_OFFSET_FORWARD_RATIO)).Position
end

return VRGesturesMathModule