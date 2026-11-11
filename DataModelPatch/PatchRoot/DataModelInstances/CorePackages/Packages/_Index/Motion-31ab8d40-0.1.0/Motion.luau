local MotionModule = require(script.Motion)
local _ = require(script.Types)

return {
	createState = MotionModule.createState,
	animate = MotionModule.animate,
	transition = MotionModule.transition,
	useMotion = require(script.Utility.useMotion),
	usePresence = require(script.AnimatePresence.usePresence),
	AnimatePresence = require(script.AnimatePresence.AnimatePresence),
	TransitionPreset = require(script.Enums.TransitionPreset)
}