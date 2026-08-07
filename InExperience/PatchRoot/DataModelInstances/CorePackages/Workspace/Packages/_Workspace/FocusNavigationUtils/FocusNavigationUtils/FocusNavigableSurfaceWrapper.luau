local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent

if require(parent.SharedFlags).FFlagAppFocusWrapperRefactor then
	return require(focusNavigationUtils.AppFocusRoot)
end
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local cryoModule = require(parent.Cryo)
local navigationModule = require(parent.Navigation)
local _ = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useFocusNavigableSurfaceRegistryConnectionModule = require(focusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
local useDefaultFocusNavigationBindingsModule = require(focusNavigationUtils.useDefaultFocusNavigationBindings)
local t = {
	BackgroundTransparency = 1,
	SelectionGroup = true,
	Size = UDim2.fromScale(1, 1)
}
local t_1 = {}
local t_2 = {
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop
}

local function _(p0, p1, p2) --[[ line: 48 | named "useWrappedFrameProps" ]]
	-- upvalues: reactModule (ref), cryoModule (ref), t_2 (ref), t (ref)
	return reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: p1 (ref), p0 (ref), cryoModule (copy), t_2 (copy), t (copy), p2 (ref)
		local var10 = p1 or {}
		
		if p0 then
			var10 = cryoModule.Dictionary.join(t_2, var10)
		end
		return cryoModule.Dictionary.join(t, var10, { ref = p2 })
	end, { p0, p1, p2 })
end

return function(p3) --[[ line: 72 | named "FocusNavigableSurfaceWrapper" ]]
	-- upvalues: t_1 (ref), reactModule (ref), reactFocusNavigationModule (ref), useDefaultFocusNavigationBindingsModule (ref), navigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), cryoModule (ref), t_2 (ref), t (ref)
	local customEventHandlers = p3.customEventHandlers or t_1
	local var12 = if p3.frameProps and p3.frameProps.ref then p3.frameProps.ref.current else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var13, var14 = reactModule.useState(var12)
	var14 = useDefaultFocusNavigationBindingsModule(reactFocusNavigationModule.useEventHandlerMap(customEventHandlers, var14))
	local isFocusable = p3.isFocusable
	local var15 = navigationModule.useNavigationFocus()
	local var16 = (isFocusable == nil or isFocusable) and (var15 == nil or var15)
	local var17 = var14
	local var18 = reactFocusNavigationModule.useMostRecentFocusBehavior(var14)
	
	if p3.shouldRestoreFocus ~= nil or p3.shouldRestoreFocus then
		var17 = var18
	end
	useFocusNavigableSurfaceRegistryConnectionModule(var13, p3.surfaceIdentifier, var16)
	local isIsolated = p3.isIsolated
	local frameProps = p3.frameProps
	
	return reactModule.createElement("Frame", reactModule.useMemo(function() --[[ line: 50 ]]
		-- upvalues: frameProps (ref), isIsolated (ref), cryoModule (copy), t_2 (copy), t (copy), var17 (ref)
		local var10 = frameProps or {}
		
		if isIsolated then
			var10 = cryoModule.Dictionary.join(t_2, var10)
		end
		return cryoModule.Dictionary.join(t, var10, { ref = var17 })
	end, { isIsolated, frameProps, var17 }), p3.children)
end