local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Components.Types)
local _ = require(foundation.Providers.Style.Tokens)
local flagsModule = require(foundation.Utility.Flags)
local _ = require(parent.React)
local motionModule = require(parent.Motion)
local transitionPreset = motionModule.TransitionPreset

return function(p0, p1)
	-- upvalues: flagsModule (ref), motionModule (ref), transitionPreset (ref)
	local var7
	local _ = nil
	local var3 = nil
	local _ = nil
	local _ = nil
	local var4 = nil
	local var5 = if p1 and p1.backgroundStyle then p1.backgroundStyle else p0.Color.Content.Default
	local var6 = if p1 and p1.checkedStyle then p1.checkedStyle else p0.Color.ActionSubEmphasis.Background
	
	if flagsModule.FoundationInternalInputBeta then
		var7 = p0.Color.Content.Emphasis
	else
		var3 = if p1 and p1.hoverStyle then p1.hoverStyle else p0.Color.Content.Emphasis
		var7 = if p1 and p1.labelStyle then p1.labelStyle else p0.Color.Content.Default
		var4 = if p1 and p1.labelHoverStyle then p1.labelHoverStyle else p0.Color.Content.Emphasis
	end
	local createState
	local t = {
		Default = motionModule.createState({
			backgroundStyle = {
				Color3 = var5.Color3,
				Transparency = if p1 and p1.backgroundStyle then p1.backgroundStyle.Transparency else 1
			},
			strokeStyle = var5,
			labelStyle = var7
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
				Color3 = var3.Color3,
				Transparency = if p1 and p1.hoverStyle then p1.hoverStyle.Transparency else 1
			},
			strokeStyle = var3,
			labelStyle = var4
		}, {
			default = motionModule.transition(transitionPreset.Default, { duration = 0 }),
			transparency = motionModule.transition({ duration = 0, easingStyle = Enum.EasingStyle.Linear })
		})
	end
	t.Hover = createState
	t.Checked = motionModule.createState({
		backgroundStyle = var6,
		strokeStyle = var6,
		labelStyle = if flagsModule.FoundationInternalInputBeta then var7 else var4
	}, {
		default = motionModule.transition(transitionPreset.Default, { duration = 0.2 }),
		transparency = motionModule.transition({ duration = 0.2, easingStyle = Enum.EasingStyle.Linear })
	})
	
	return t
end