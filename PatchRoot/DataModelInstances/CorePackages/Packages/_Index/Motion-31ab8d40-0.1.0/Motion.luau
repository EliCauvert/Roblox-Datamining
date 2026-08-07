-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

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