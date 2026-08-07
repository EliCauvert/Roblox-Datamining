local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(parent.React)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p0, p1) --[[ line: 27 | named "useOptionSelectorGroupItemMotionStates" ]]
	-- upvalues: useTokensModule (ref), motionModule (ref), transitionPreset (ref)
	local var3 = useTokensModule()
	
	return {
		Default = motionModule.createState({ transparency = p0 or 0, textTransparency = p0 or 0 }, {
			iconTransparency = motionModule.transition(transitionPreset.Default, {
				easingStyle = Enum.EasingStyle.Linear,
				duration = var3.Time.Time_500
			}),
			transparency = motionModule.transition({
				easingStyle = Enum.EasingStyle.Linear,
				duration = var3.Time.Time_200
			}),
			default = motionModule.transition(transitionPreset.Default, { duration = var3.Time.Time_200 })
		}),
		Disabled = motionModule.createState({ transparency = p1, textTransparency = p1 }, {
			default = motionModule.transition({
				easingStyle = Enum.EasingStyle.Linear,
				duration = var3.Time.Time_100
			})
		})
	}
end