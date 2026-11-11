local Parent = script:FindFirstAncestor("Foundation").Parent
local _ = require(Parent.React)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset

return function(p1, TextTransparency)
	-- upvalues: MotionModule (copy), TransitionPreset (copy)
	return {
		Default = MotionModule.createState({
			iconScale = 1,
			transparency = p1 or 0,
			textTransparency = p1 or 0
		}, {
			iconTransparency = MotionModule.transition(TransitionPreset.Default, { duration = 0.5, easingStyle = Enum.EasingStyle.Linear }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear }),
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 })
		}),
		Loading = MotionModule.createState({
			transparency = 0,
			textTransparency = 1,
			iconTransparency = 1,
			iconScale = 0
		}, {
			iconTransparency = MotionModule.transition(TransitionPreset.Default, { duration = 0.2, easingStyle = Enum.EasingStyle.Linear }),
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 })
		}),
		Disabled = MotionModule.createState({
			transparency = TextTransparency,
			textTransparency = TextTransparency
		}, {
			default = MotionModule.transition({ duration = 0.1, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end