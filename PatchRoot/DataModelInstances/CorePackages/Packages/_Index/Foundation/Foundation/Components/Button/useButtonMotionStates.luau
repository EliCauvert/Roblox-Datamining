-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p0, p1) --[[ line: 27 | named "useButtonMotionStates" ]]
	-- upvalues: motionModule (ref), transitionPreset (ref)
	return {
		Default = motionModule.createState({
			iconScale = 1,
			transparency = p0 or 0,
			textTransparency = p0 or 0
		}, {
			iconTransparency = motionModule.transition(transitionPreset.Default, { duration = 0.5, easingStyle = Enum.EasingStyle.Linear }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear }),
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 })
		}),
		Loading = motionModule.createState({
			transparency = 0,
			textTransparency = 1,
			iconTransparency = 1,
			iconScale = 0
		}, {
			iconTransparency = motionModule.transition(transitionPreset.Default, { duration = 0.2, easingStyle = Enum.EasingStyle.Linear }),
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 })
		}),
		Disabled = motionModule.createState({ transparency = p1, textTransparency = p1 }, {
			default = motionModule.transition({ duration = 0.1, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end