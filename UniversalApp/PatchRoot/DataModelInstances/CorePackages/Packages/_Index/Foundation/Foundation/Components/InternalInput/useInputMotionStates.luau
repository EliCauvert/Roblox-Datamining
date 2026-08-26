local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local _ = require(foundation.Providers.Style.Tokens)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p1, p2)
	-- upvalues: flagsModule (ref), motionModule (ref), transitionPreset (ref)
	local var1
	local _ = nil
	local var2 = nil
	local _ = nil
	local _ = nil
	local var3 = nil
	local var4 = if p2 and p2.backgroundStyle then p2.backgroundStyle else p1.Color.Content.Default
	local var5 = if p2 and p2.checkedStyle then p2.checkedStyle else p1.Color.ActionSubEmphasis.Background
	
	if flagsModule.FoundationInternalInputBeta then
		var1 = p1.Color.Content.Emphasis
	else
		var2 = if p2 and p2.hoverStyle then p2.hoverStyle else p1.Color.Content.Emphasis
		var1 = if p2 and p2.labelStyle then p2.labelStyle else p1.Color.Content.Default
		var3 = if p2 and p2.labelHoverStyle then p2.labelHoverStyle else p1.Color.Content.Emphasis
	end
	local createState
	local t = {
		Default = motionModule.createState({
			backgroundStyle = {
				Color3 = var4.Color3,
				Transparency = if p2 and p2.backgroundStyle then p2.backgroundStyle.Transparency else 1
			},
			strokeStyle = var4,
			labelStyle = var1
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
			transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
		})
	}
	
	if flagsModule.FoundationInternalInputBeta then
		createState = nil
	else
		createState = motionModule.createState
		createState = createState({
			backgroundStyle = {
				Color3 = var2.Color3,
				Transparency = if p2 and p2.hoverStyle then p2.hoverStyle.Transparency else 1
			},
			strokeStyle = var2,
			labelStyle = var3
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0 }),
			transparency = motionModule.transition({ duration = 0, easingStyle = Enum.EasingStyle.Linear })
		})
	end
	t.Hover = createState
	t.Checked = motionModule.createState({
		backgroundStyle = var5,
		strokeStyle = var5,
		labelStyle = if flagsModule.FoundationInternalInputBeta then var1 else var3
	}, {
		default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
		transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
	})
	
	return t
end