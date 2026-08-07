local otterModule = require(script.Parent.Otter)

return {
	useAnimatedBinding = require(script.useAnimatedBinding),
	useMotor = require(script.useMotor),
	ease = otterModule.ease,
	spring = otterModule.spring,
	instant = otterModule.instant
}