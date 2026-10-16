local TModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return TModule.strictInterface({
	Color = TModule.Color3,
	AnimatedColor = TModule.Color3,
	Transparency = TModule.numberConstrained(0, 1),
	GradientRotationSpeed = TModule.number,
	GradientColorSequence = TModule.ColorSequence,
	GradientTransparencySequence = TModule.NumberSequence,
	Rotation = TModule.number
})