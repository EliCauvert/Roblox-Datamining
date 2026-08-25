local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useFocusRootModule = require(script.Parent.useFocusRoot)
local baseFocusRootModule = require(focusNavigationUtils.BaseFocusRoot)
local fFlagFocusRootUseHooksModule = require(script.Parent.FFlagFocusRootUseHooks)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local _ = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useFocusNavigableSurfaceRegistryConnectionModule = require(focusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
local useAutoFocusModule = require(focusNavigationUtils.useAutoFocus)
local useDescendantHasFocusModule = require(focusNavigationUtils.useDescendantHasFocus)
local useLastInputModeModule = require(focusNavigationUtils.useLastInputMode)
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

local function _(p0, p1, p2)
	-- upvalues: reactModule (ref), t_1 (ref), cryoModule (ref), t_2 (ref), t (ref)
	return reactModule.useMemo(function()
		-- upvalues: p1 (ref), t_1 (copy), p0 (ref), cryoModule (copy), t_2 (copy), t (copy), p2 (ref)
		local var15 = p1 or t_1
		
		if p0 then
			var15 = cryoModule.Dictionary.join(t_2, var15)
		end
		return cryoModule.Dictionary.join(t, var15, { ref = p2 })
	end, { p0, p1, p2 })
end

return function(p3)
	-- upvalues: fFlagFocusRootUseHooksModule (ref), useFocusRootModule (ref), reactModule (ref), baseFocusRootModule (ref), t_1 (ref), reactFocusNavigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), useDescendantHasFocusModule (ref), useAutoFocusModule (ref), useLastInputModeModule (ref), guiService (ref), cryoModule (ref), t_2 (ref), t (ref)
	if fFlagFocusRootUseHooksModule then
		return reactModule.createElement(baseFocusRootModule, {
			ref = useFocusRootModule(p3),
			isIsolated = p3.isIsolated,
			frameProps = p3.frameProps
		}, p3.children)
	end
	local var16 = if p3.frameProps and p3.frameProps.ref then p3.frameProps.ref.current else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var17, var18 = reactModule.useState(var16)
	local var19 = var17
	local var20 = reactFocusNavigationModule.useEventHandlerMap(p3.eventHandlers or t_1, reactFocusNavigationModule.useEventMap(p3.eventMap or t_1, var18))
	local var21 = p3.isFocusable == nil or p3.isFocusable
	local var22 = if p3.shouldRestoreFocus == nil or p3.shouldRestoreFocus then reactFocusNavigationModule.useMostRecentFocusBehavior(var20) else var20
	useFocusNavigableSurfaceRegistryConnectionModule(var19, p3.surfaceIdentifier, var21)
	local var23 = useAutoFocusModule({ var19 }, 0.1)
	local var24 = p3.isAutoFocusRoot and (var21 and (useLastInputModeModule() == "Focus" and (var19 and not useDescendantHasFocusModule(var19))))
	reactModule.useEffect(function()
		-- upvalues: var24 (ref), var23 (ref)
		local var26 = if var24 then var23() else nil
		
		return function()
			-- upvalues: var26 (write)
			if var26 then
				var26.cancel()
			end
		end
	end, { var24, var23 })
	local var25 = reactModule.useRef(var19)
	reactModule.useEffect(function()
		-- upvalues: var19 (write), var25 (ref)
		if var19 then
			var25.current = var19
		end
	end, { var19 })
	reactModule.useEffect(function()
		-- upvalues: var25 (ref), guiService (copy)
		return function()
			-- upvalues: var25 (copy), guiService (copy)
			if not var25.current then return end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject then return end
			if selectedCoreObject:IsDescendantOf(var25.current) or not selectedCoreObject:IsDescendantOf(game) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, {})
	local isIsolated = p3.isIsolated
	local frameProps = p3.frameProps
	
	return reactModule.createElement("Frame", reactModule.useMemo(function()
		-- upvalues: frameProps (ref), t_1 (copy), isIsolated (ref), cryoModule (copy), t_2 (copy), t (copy), var22 (ref)
		local var15 = frameProps or t_1
		
		if isIsolated then
			var15 = cryoModule.Dictionary.join(t_2, var15)
		end
		return cryoModule.Dictionary.join(t, var15, { ref = var22 })
	end, { isIsolated, frameProps, var22 }), p3.children)
end