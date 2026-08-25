local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p0)
	return if p0 then 0 else 0.2
end

local function useHoverBinding()
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var5, var6 = reactModule.useBinding(false)
	
	return var5, reactModule.useCallback(function(p1)
		-- upvalues: foundationModule (copy), var6 (ref)
		if p1 == foundationModule.Enums.ControlState.Default then
			var6(false)
			
			return
		elseif p1 == foundationModule.Enums.ControlState.Hover then
			var6(true)
		end
	end, {})
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: useTokens (ref), useHoverBinding (ref), reactModule (ref), foundationModule (ref), t (ref), getHoverTransparency (ref)
	local var7 = useTokens()
	local var8, var9 = useHoverBinding()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "radius-circle clip auto-xy",
		ref = p3,
		backgroundStyle = var7.Color.OverMedia.OverMedia_0,
		LayoutOrder = p2.LayoutOrder,
		stateLayer = t,
		onStateChanged = if p2.disabled then nil else var9,
		onActivated = p2.onActivated,
		disabled = p2.disabled,
		selection = { Selectable = p2.Selectable or false }
	}, {
		HoverHandler = reactModule.createElement(foundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = if p2.size then UDim2.new(p2.size, p2.size) else UDim2.fromScale(1, 1),
			GroupTransparency = p2.GroupTransparencyOverwrite or var8:map(getHoverTransparency),
			backgroundStyle = var8:map(reactModule.useCallback(function(p4)
				-- upvalues: var7 (ref), p2 (ref)
				return if p4 then var7.Color.Shift.Shift_200 elseif p2.isActive then var7.Color.Shift.Shift_400 else {
					Transparency = 1,
					Color3 = var7.Color.Shift.Shift_200.Color3
				}
			end, { p2.isActive, var7 }))
		}, {
			Children = reactModule.createElement(reactModule.Fragment, nil, p2.children)
		})
	})
end)