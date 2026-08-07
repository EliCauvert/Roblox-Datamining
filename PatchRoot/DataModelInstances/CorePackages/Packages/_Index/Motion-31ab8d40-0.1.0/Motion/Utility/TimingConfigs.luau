-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:52 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.Types)
local transitionPresetModule = require(parent.Enums.TransitionPreset)
local t = {
	presets = {
		[transitionPresetModule.Default] = {
			duration = 0.3,
			delay = 0,
			easingStyle = { 0.2, 0, 0, 1 }
		},
		[transitionPresetModule.Quick] = {
			duration = 0.05,
			delay = 0,
			easingStyle = { 0.2, 0, 0, 1 }
		},
		[transitionPresetModule.Slow] = { duration = 1, delay = 0, easingStyle = { 0.2, 0, 0, 1 } }
	}
}

function t.getDefaultTransition() --[[ line: 28 ]]
	-- upvalues: t (ref), transitionPresetModule (ref)
	local default = t.presets[transitionPresetModule.Default]
	
	return {
		duration = default.duration,
		easingStyle = default.easingStyle,
		delay = default.delay
	}
end

function t.createDefaultTransitionState() --[[ line: 39 ]]
	-- upvalues: t (ref)
	return { default = t.getDefaultTransition() }
end

return t