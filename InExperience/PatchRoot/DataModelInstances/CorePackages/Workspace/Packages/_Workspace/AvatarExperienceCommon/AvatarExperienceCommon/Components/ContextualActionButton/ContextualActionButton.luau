local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local IXPUtilsModule = require(parent.IXPUtils)
local useTokens = foundationModule.Hooks.useTokens
local usePulseAnimationBindingModule = require(avatarExperienceCommon.Hooks.usePulseAnimationBinding)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(parent.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p0) --[[ line: 18 ]]
	return if p0 then 0 else 0.2
end

local function useHoverBinding() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var8, var9 = reactModule.useBinding(false)
	
	return var8, reactModule.useCallback(function(p1) --[[ line: 26 ]]
		-- upvalues: foundationModule (copy), var9 (ref)
		if p1 == foundationModule.Enums.ControlState.Default then
			var9(false)
			
			return
		elseif p1 == foundationModule.Enums.ControlState.Hover then
			var9(true)
		end
	end, {})
end

return reactModule.forwardRef(function(p2, p3) --[[ line: 51 | named "ContextualActionButton" ]]
	-- upvalues: useTokens (ref), AXEnableAccessoryAdjustmentDuringTryOnIXP (ref), IXPUtilsModule (ref), usePulseAnimationBindingModule (ref), useHoverBinding (ref), reactModule (ref), foundationModule (ref), t (ref), getHoverTransparency (ref)
	local var10 = useTokens()
	local var11 = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then IXPUtilsModule.readTestVariable(AXEnableAccessoryAdjustmentDuringTryOnIXP.EnabledForUser) else nil
	local var12 = if AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then usePulseAnimationBindingModule(p2.enableFocusAnimation) else nil
	local var13, var14 = useHoverBinding()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "radius-circle clip auto-xy",
		ref = p3,
		backgroundStyle = var10.Color.OverMedia.OverMedia_0,
		LayoutOrder = p2.LayoutOrder,
		stateLayer = t,
		onStateChanged = if p2.disabled then nil else var14,
		onActivated = p2.onActivated,
		disabled = p2.disabled,
		selection = { Selectable = p2.Selectable or false }
	}, {
		HoverHandler = reactModule.createElement(foundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = if p2.size then UDim2.new(p2.size, p2.size) else UDim2.fromScale(1, 1),
			GroupTransparency = p2.GroupTransparencyOverwrite or var13:map(getHoverTransparency),
			backgroundStyle = var13:map(reactModule.useCallback(function(p4) --[[ line: 64 ]]
				-- upvalues: var10 (ref), p2 (ref)
				return if p4 then var10.Color.Shift.Shift_200 elseif p2.isActive then var10.Color.Shift.Shift_400 else {
					Transparency = 1,
					Color3 = var10.Color.Shift.Shift_200.Color3
				}
			end, { p2.isActive, var10 }))
		}, {
			Children = reactModule.createElement(reactModule.Fragment, nil, p2.children)
		}),
		UIStroke = if var11 and p2.enableFocusAnimation then reactModule.createElement("UIStroke", {
			Color = var10.Color.ActionEmphasis.Background.Color3,
			Thickness = var12 and var12:map(function(p5) --[[ line: 98 ]]
				return p5.thickness
			end),
			Transparency = var12 and var12:map(function(p6) --[[ line: 101 ]]
				return p6.transparency
			end)
		}) else nil
	})
end)