local motionModule = require(script.Motion)
local _ = require(script.Types)

return {
	createState = motionModule.createState,
	animate = motionModule.animate,
	transition = motionModule.transition,
	useMotion = require(script.Utility.useMotion),
	usePresence = require(script.AnimatePresence.usePresence),
	AnimatePresence = require(script.AnimatePresence.AnimatePresence),
	TransitionPreset = require(script.Enums.TransitionPreset)
}