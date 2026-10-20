local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Parent.React)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset

return function(p1, TextTransparency)
	-- upvalues: UseTokensModule (copy), MotionModule (copy), TransitionPreset (copy)
	local UseTokensModuleResult = UseTokensModule()
	
	return {
		Default = MotionModule.createState({ transparency = p1 or 0, textTransparency = p1 or 0 }, {
			iconTransparency = MotionModule.transition(TransitionPreset.Default, {
				easingStyle = Enum.EasingStyle.Linear,
				duration = UseTokensModuleResult.Time.Time_500
			}),
			transparency = MotionModule.transition({
				easingStyle = Enum.EasingStyle.Linear,
				duration = UseTokensModuleResult.Time.Time_200
			}),
			default = MotionModule.transition(TransitionPreset.Default, { duration = UseTokensModuleResult.Time.Time_200 })
		}),
		Disabled = MotionModule.createState({
			transparency = TextTransparency,
			textTransparency = TextTransparency
		}, {
			default = MotionModule.transition({
				easingStyle = Enum.EasingStyle.Linear,
				duration = UseTokensModuleResult.Time.Time_100
			})
		})
	}
end