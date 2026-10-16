local Parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(Parent.React)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset

return function() --[[ Line: 24 | Named "useSpinnerMotionStates" ]]
	-- upvalues: MotionModule (copy), TransitionPreset (copy)
	return {
		Default = MotionModule.createState({ scale = 0, transparency = 1 }, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Loading = MotionModule.createState({ scale = 1, transparency = 0 }, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2, delay = 0.1 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end