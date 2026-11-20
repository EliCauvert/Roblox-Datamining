local _ = require(script:FindFirstAncestor("ModelViewport").Types)

return {
	DefaultFieldOfViewDeg = 30,
	DefaultPadding = 1.05,
	DefaultDegreesPerPixel = 0.5,
	PitchHardLimitDeg = 85,
	ZoomBasePerStep = 1.15,
	PinchPixelsPerZoomStep = 50,
	GamepadDeadzone = 0.2,
	GamepadYawDegPerSecond = 120,
	GamepadPitchDegPerSecond = 90,
	GamepadZoomStepsPerSecond = 4,
	GamepadZoomAxisThreshold = 0.5,
	DefaultTransitionEasingStyle = Enum.EasingStyle.Quad,
	DefaultTransitionEasingDirection = Enum.EasingDirection.InOut,
	DefaultLighting = table.freeze({
		lightDirection = vector.create(-0.5, 0.20000000298023224, 0.20000000298023224),
		ambient = Color3.fromRGB(170, 170, 170),
		lightColor = Color3.fromRGB(250, 250, 250)
	})
}