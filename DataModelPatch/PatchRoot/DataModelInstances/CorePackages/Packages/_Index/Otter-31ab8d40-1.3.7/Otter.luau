local _ = require(script.types)

return {
	createGroupMotor = require(script.createGroupMotor),
	createSingleMotor = require(script.createSingleMotor),
	ease = require(script.ease),
	spring = require(script.spring),
	instant = require(script.instant),
	__devAnimationStepSignal = require(script.AnimationStepSignal)
}