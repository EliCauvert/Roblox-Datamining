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

local function _(p1, p2, p3)
	-- upvalues: reactModule (ref), cryoModule (ref), t_2 (ref), t (ref)
	return reactModule.useMemo(function()
		-- upvalues: p2 (ref), p1 (ref), cryoModule (copy), t_2 (copy), t (copy), p3 (ref)
		local var1 = p2 or {}
		
		if p1 then
			var1 = cryoModule.Dictionary.join(t_2, var1)
		end
		return cryoModule.Dictionary.join(t, var1, { ref = p3 })
	end, { p1, p2, p3 })
end

return function(p1)
	-- upvalues: t_1 (ref), reactModule (ref), reactFocusNavigationModule (ref), useDefaultFocusNavigationBindingsModule (ref), navigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), cryoModule (ref), t_2 (ref), t (ref)
	local customEventHandlers = p1.customEventHandlers or t_1
	local var1 = if p1.frameProps and p1.frameProps.ref then p1.frameProps.ref.current else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2, var3 = reactModule.useState(var1)
	var3 = useDefaultFocusNavigationBindingsModule(reactFocusNavigationModule.useEventHandlerMap(customEventHandlers, var3))
	local isFocusable = p1.isFocusable
	local var4 = navigationModule.useNavigationFocus()
	local var5 = (isFocusable == nil or isFocusable) and (var4 == nil or var4)
	local var6 = var3
	local var7 = reactFocusNavigationModule.useMostRecentFocusBehavior(var3)
	
	if p1.shouldRestoreFocus ~= nil or p1.shouldRestoreFocus then
		var6 = var7
	end
	useFocusNavigableSurfaceRegistryConnectionModule(var2, p1.surfaceIdentifier, var5)
	local isIsolated = p1.isIsolated
	local frameProps = p1.frameProps
	
	return reactModule.createElement("Frame", reactModule.useMemo(function()
		-- upvalues: frameProps (ref), isIsolated (ref), cryoModule (copy), t_2 (copy), t (copy), var6 (ref)
		local var8 = frameProps or {}
		
		if isIsolated then
			var8 = cryoModule.Dictionary.join(t_2, var8)
		end
		return cryoModule.Dictionary.join(t, var8, { ref = var6 })
	end, { isIsolated, frameProps, var6 }), p1.children)
end