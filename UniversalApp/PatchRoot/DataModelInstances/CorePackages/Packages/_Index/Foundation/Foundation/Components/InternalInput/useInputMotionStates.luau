local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local _ = require(foundation.Providers.Style.Tokens)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p0, p1) --[[ line: 41 | named "useInputMotionStates" ]]
	-- upvalues: flagsModule (ref), motionModule (ref), transitionPreset (ref)
	local var3, var4, var5, var6, var7
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationToggleVisualUpdate then
		var3 = if p1 and p1.backgroundStyle then p1.backgroundStyle else p0.Color.Content.Default
		var4 = if p1 and p1.hoverStyle then p1.hoverStyle else p0.Color.Content.Emphasis
		var5 = if p1 and p1.checkedStyle then p1.checkedStyle else p0.Color.ActionSubEmphasis.Background
		var6 = if p1 and p1.labelStyle then p1.labelStyle else p0.Color.Content.Default
		var7 = if p1 and p1.labelHoverStyle then p1.labelHoverStyle else p0.Color.Content.Emphasis
	else
		var3 = p0.Color.Content.Default
		var4 = p0.Color.Content.Emphasis
		var6 = p0.Color.Content.Default
		var7 = p0.Color.Content.Emphasis
		var5 = p1 or p0.Color.ActionSubEmphasis.Background
	end
	return {
		Default = motionModule.createState({
			backgroundStyle = {
				Color3 = var3.Color3,
				Transparency = if p1 and p1.backgroundStyle then p1.backgroundStyle.Transparency else 1
			},
			strokeStyle = var3,
			labelStyle = var6
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		}),
		Hover = motionModule.createState({
			backgroundStyle = {
				Color3 = var4.Color3,
				Transparency = if p1 and p1.hoverStyle then p1.hoverStyle.Transparency else 1
			},
			strokeStyle = var4,
			labelStyle = var7
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0 }),
			transparency = motionModule.transition({ duration = 0, easingStyle = Enum.EasingStyle.Linear })
		}),
		Checked = motionModule.createState({
			backgroundStyle = var5,
			strokeStyle = var5,
			labelStyle = var7
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
end