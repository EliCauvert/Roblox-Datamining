local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p1, p2)
	-- upvalues: motionModule (ref), transitionPreset (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var1 = if p2 and p2.backgroundStyle then p2.backgroundStyle else p1.Color.Content.Default
	local var2 = if p2 and p2.checkedStyle then p2.checkedStyle else p1.Color.ActionSubEmphasis.Background
	local emphasis = p1.Color.Content.Emphasis
	
	return {
		Default = motionModule.createState({
			backgroundStyle = {
				Color3 = var1.Color3,
				Transparency = if p2 and p2.backgroundStyle then p2.backgroundStyle.Transparency else 1
			},
			strokeStyle = var1,
			labelStyle = emphasis
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Checked = motionModule.createState({
			backgroundStyle = var2,
			strokeStyle = var2,
			labelStyle = emphasis
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end