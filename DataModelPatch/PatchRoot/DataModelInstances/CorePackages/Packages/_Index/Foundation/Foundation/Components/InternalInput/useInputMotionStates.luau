local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local _ = require(Foundation.Components.Types)
local _ = require(Foundation.Providers.Style.Tokens)
local FlagsModule = require(Foundation.Utility.Flags)
local _ = require(Parent.React)
local MotionModule = require(Parent.Motion)
local TransitionPreset = MotionModule.TransitionPreset

return function(p1, p2)
	-- upvalues: FlagsModule (copy), MotionModule (copy), TransitionPreset (copy)
	local BackgroundStyle = nil
	local LabelHoverStyle = nil
	local HoverStyle = nil
	local CheckedStyle = nil
	local LabelStyle = nil
	if FlagsModule.FoundationToggleVisualUpdate then
		BackgroundStyle = if p2 and p2.backgroundStyle then p2.backgroundStyle else p1.Color.Content.Default
		HoverStyle = if p2 and p2.hoverStyle then p2.hoverStyle else p1.Color.Content.Emphasis
		CheckedStyle = if p2 and p2.checkedStyle then p2.checkedStyle else p1.Color.ActionSubEmphasis.Background
		LabelStyle = if p2 and p2.labelStyle then p2.labelStyle else p1.Color.Content.Default
		LabelHoverStyle = if p2 and p2.labelHoverStyle then p2.labelHoverStyle else p1.Color.Content.Emphasis
	else
		BackgroundStyle = p1.Color.Content.Default
		HoverStyle = p1.Color.Content.Emphasis
		LabelStyle = p1.Color.Content.Default
		LabelHoverStyle = p1.Color.Content.Emphasis
		CheckedStyle = if p2 then p2 else p1.Color.ActionSubEmphasis.Background
	end
	return {
		Default = MotionModule.createState({
			backgroundStyle = {
				Color3 = BackgroundStyle.Color3,
				Transparency = if p2 and p2.backgroundStyle then p2.backgroundStyle.Transparency else 1
			},
			strokeStyle = BackgroundStyle,
			labelStyle = LabelStyle
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Hover = MotionModule.createState({
			backgroundStyle = {
				Color3 = HoverStyle.Color3,
				Transparency = if p2 and p2.hoverStyle then p2.hoverStyle.Transparency else 1
			},
			strokeStyle = HoverStyle,
			labelStyle = LabelHoverStyle
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0 }),
			transparency = MotionModule.transition({ duration = 0, easingStyle = Enum.EasingStyle.Linear })
		}),
		Checked = MotionModule.createState({
			backgroundStyle = CheckedStyle,
			strokeStyle = CheckedStyle,
			labelStyle = LabelHoverStyle
		}, {
			default = MotionModule.transition(TransitionPreset.Default, { duration = 0.2 }),
			transparency = MotionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end