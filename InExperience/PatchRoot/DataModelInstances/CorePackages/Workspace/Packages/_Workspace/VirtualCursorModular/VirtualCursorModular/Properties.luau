local t = {
	SpeedAdjustmentTarget = 0.5,
	CursorRadius = 40,
	SelectionRadius = 40,
	SnapRadius = 80,
	OcclusionRadiusScale = 0.7,
	MaxSpeedRelative = 0.7,
	ThumbstickDeadzone = 0.2,
	ScrollingRadius = 15,
	ScrollingSlowDown = 0.25,
	ScrollingSpeed = 1000,
	SnapFrictionStrength = 0,
	SnapTrackingStrength = 0,
	SnapCenteringStrength = 0.8,
	SnapExpireTime = 0.5
}
setmetatable(t, {
	__index = function(_, p0)
		error(string.format("%q is not a valid member of properties", tostring(p0)), 2)
	end
})

return t