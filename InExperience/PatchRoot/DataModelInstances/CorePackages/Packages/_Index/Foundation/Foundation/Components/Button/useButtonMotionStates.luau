local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p1, p2)
	-- upvalues: motionModule (ref), transitionPreset (ref)
	return {
		Default = motionModule.createState({
			iconScale = 1,
			transparency = p1 or 0,
			textTransparency = p1 or 0
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
		Disabled = motionModule.createState({ transparency = p2, textTransparency = p2 }, {
			default = motionModule.transition({ duration = 0.1, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end