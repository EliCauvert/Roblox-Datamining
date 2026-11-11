local RoactMotionImplementation = script.Parent.RoactMotionImplementation

return {
	spring = require(RoactMotionImplementation.MotionSpecifier).spring,
	SimpleMotion = require(RoactMotionImplementation.SimpleMotion)
}