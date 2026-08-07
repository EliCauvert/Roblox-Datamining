local parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function() --[[ line: 24 | named "useSpinnerMotionStates" ]]
	-- upvalues: motionModule (ref), transitionPreset (ref)
	return {
		Default = motionModule.createState({ scale = 0, transparency = 1 }, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Loading = motionModule.createState({ scale = 1, transparency = 0 }, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2, delay = 0.1 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end