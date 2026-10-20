local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local StateLayer = {
	affordance = FoundationModule.Enums.StateLayerAffordance.None
}

local function getHoverTransparency(p1): number
	return if p1 then 0 else 0.2
end

local function useHoverBinding()
	-- upvalues: ReactModule (copy), FoundationModule (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	
	return UseBindingResult, (ReactModule.useCallback(function(Default)
		-- upvalues: FoundationModule (upval), UseBindingResult2 (copy)
		if Default == FoundationModule.Enums.ControlState.Default then
			UseBindingResult2(false)
			
			return
		end
		if Default == FoundationModule.Enums.ControlState.Hover then
			UseBindingResult2(true)
		end
	end, {}))
end

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), useHoverBinding (copy), ReactModule (copy), FoundationModule (copy), StateLayer (copy), getHoverTransparency (copy)
	local UseTokensResult = UseTokensFunction()
	local UseHoverBindingResult, UseHoverBindingResult2 = useHoverBinding()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "radius-circle clip auto-xy",
		ref = Ref,
		backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
		LayoutOrder = Frame.LayoutOrder,
		stateLayer = StateLayer,
		onStateChanged = if Frame.disabled then nil else UseHoverBindingResult2,
		onActivated = Frame.onActivated,
		disabled = Frame.disabled,
		selection = { Selectable = Frame.Selectable or false }
	}, {
		HoverHandler = ReactModule.createElement(FoundationModule.View, {
			tag = "padding-small radius-circle clip auto-xy",
			Size = if Frame.size then UDim2.new(Frame.size, Frame.size) else UDim2.fromScale(1, 1),
			GroupTransparency = Frame.GroupTransparencyOverwrite or UseHoverBindingResult:map(getHoverTransparency),
			backgroundStyle = UseHoverBindingResult:map((ReactModule.useCallback(function(p1)
				-- upvalues: UseTokensResult (copy), Frame (copy)
				return if p1 then UseTokensResult.Color.Shift.Shift_200 elseif Frame.isActive then UseTokensResult.Color.Shift.Shift_400 else {
					Transparency = 1,
					Color3 = UseTokensResult.Color.Shift.Shift_200.Color3
				}
			end, { Frame.isActive, UseTokensResult })))
		}, {
			Children = ReactModule.createElement(ReactModule.Fragment, nil, Frame.children)
		})
	})
end)