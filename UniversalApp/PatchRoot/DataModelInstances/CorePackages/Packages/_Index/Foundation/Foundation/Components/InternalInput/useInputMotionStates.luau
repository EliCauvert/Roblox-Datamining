local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Parent.React)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset

return function(p1, p2) --[[ Line: 38 | Named "useInputMotionStates" ]]
	-- upvalues: MotionModule (copy), TransitionPreset (copy)
	local BackgroundStyle = if p2 and p2.backgroundStyle then p2.backgroundStyle else p1.Color.Content.Default
	local CheckedStyle = if p2 and p2.checkedStyle then p2.checkedStyle else p1.Color.ActionSubEmphasis.Background
	local Emphasis = p1.Color.Content.Emphasis
	
	return {
		Default = MotionModule.createState({
			backgroundStyle = {
				Color3 = BackgroundStyle.Color3,
				Transparency = if p2 and p2.backgroundStyle then p2.backgroundStyle.Transparency else 1
			},
			strokeStyle = BackgroundStyle,
			labelStyle = Emphasis
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Checked = MotionModule.createState({
			backgroundStyle = CheckedStyle,
			strokeStyle = CheckedStyle,
			labelStyle = Emphasis
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end