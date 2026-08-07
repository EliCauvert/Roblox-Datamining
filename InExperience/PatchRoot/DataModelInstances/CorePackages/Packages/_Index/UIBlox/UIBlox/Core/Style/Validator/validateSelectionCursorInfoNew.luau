local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.Color3,
	AnimatedColor = tModule.Color3,
	Transparency = tModule.numberConstrained(0, 1),
	GradientRotationSpeed = tModule.number,
	GradientColorSequence = tModule.ColorSequence,
	GradientTransparencySequence = tModule.NumberSequence,
	Rotation = tModule.number
})