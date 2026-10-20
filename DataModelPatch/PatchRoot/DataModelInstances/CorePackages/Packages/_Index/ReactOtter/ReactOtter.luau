local OtterModule = require(script.Parent.Otter)

return {
	useAnimatedBinding = require(script.useAnimatedBinding),
	useMotor = require(script.useMotor),
	ease = OtterModule.ease,
	spring = OtterModule.spring,
	instant = OtterModule.instant
}