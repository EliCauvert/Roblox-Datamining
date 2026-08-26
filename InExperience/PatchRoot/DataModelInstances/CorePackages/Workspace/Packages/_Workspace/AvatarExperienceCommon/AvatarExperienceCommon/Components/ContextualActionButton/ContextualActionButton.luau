local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local t = {
	affordance = foundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p1)
	return if p1 then 0 else 0.2
end

local function useHoverBinding()
	-- upvalues: reactModule (ref), foundationModule (ref)
	local var1, var2 = reactModule.useBinding(false)
	
	return var1, reactModule.useCallback(function(p1)
		-- upvalues: foundationModule (copy), var2 (ref)
		if p1 == foundationModule.Enums.ControlState.Default then
			var2(false)
			
			return
		elseif p1 == foundationModule.Enums.ControlState.Hover then
			var2(true)
		end
	end, {})
end

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), useHoverBinding (ref), reactModule (ref), foundationModule (ref), t (ref), getHoverTransparency (ref)
	local var1 = useTokens()
	local var2, var3 = useHoverBinding()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "radius-circle clip auto-xy",
		ref = p2,
		backgroundStyle = var1.Color.OverMedia.OverMedia_0,
		LayoutOrder = p1.LayoutOrder,
		stateLayer = t,
		onStateChanged = if p1.disabled then nil else var3,
		onActivated = p1.onActivated,
		disabled = p1.disabled,
		selection = { Selectable = p1.Selectable or false }
	}, {
		HoverHandler = reactModule.createElement(foundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = if p1.size then UDim2.new(p1.size, p1.size) else UDim2.fromScale(1, 1),
			GroupTransparency = p1.GroupTransparencyOverwrite or var2:map(getHoverTransparency),
			backgroundStyle = var2:map(reactModule.useCallback(function(p3)
				-- upvalues: var1 (ref), p1 (ref)
				return if p3 then var1.Color.Shift.Shift_200 elseif p1.isActive then var1.Color.Shift.Shift_400 else {
					Transparency = 1,
					Color3 = var1.Color.Shift.Shift_200.Color3
				}
			end, { p1.isActive, var1 }))
		}, {
			Children = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		})
	})
end)