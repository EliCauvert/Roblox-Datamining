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

local function _(p1, p2, p3)
	-- upvalues: reactModule (ref), t_1 (ref), cryoModule (ref), t_2 (ref), t (ref)
	return reactModule.useMemo(function()
		-- upvalues: p2 (ref), t_1 (copy), p1 (ref), cryoModule (copy), t_2 (copy), t (copy), p3 (ref)
		local var1 = p2 or t_1
		
		if p1 then
			var1 = cryoModule.Dictionary.join(t_2, var1)
		end
		return cryoModule.Dictionary.join(t, var1, { ref = p3 })
	end, { p1, p2, p3 })
end

return function(p1)
	-- upvalues: fFlagFocusRootUseHooksModule (ref), useFocusRootModule (ref), reactModule (ref), baseFocusRootModule (ref), t_1 (ref), reactFocusNavigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), useDescendantHasFocusModule (ref), useAutoFocusModule (ref), useLastInputModeModule (ref), guiService (ref), cryoModule (ref), t_2 (ref), t (ref)
	if fFlagFocusRootUseHooksModule then
		return reactModule.createElement(baseFocusRootModule, {
			ref = useFocusRootModule(p1),
			isIsolated = p1.isIsolated,
			frameProps = p1.frameProps
		}, p1.children)
	end
	local var1 = if p1.frameProps and p1.frameProps.ref then p1.frameProps.ref.current else nil
	local _ = nil
	local _ = nil
	local _ = nil
	local var2, var3 = reactModule.useState(var1)
	local var4 = var2
	local var5 = reactFocusNavigationModule.useEventHandlerMap(p1.eventHandlers or t_1, reactFocusNavigationModule.useEventMap(p1.eventMap or t_1, var3))
	local var6 = p1.isFocusable == nil or p1.isFocusable
	local var7 = if p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus then reactFocusNavigationModule.useMostRecentFocusBehavior(var5) else var5
	useFocusNavigableSurfaceRegistryConnectionModule(var4, p1.surfaceIdentifier, var6)
	local var8 = useAutoFocusModule({ var4 }, 0.1)
	local var9 = p1.isAutoFocusRoot and (var6 and (useLastInputModeModule() == "Focus" and (var4 and not useDescendantHasFocusModule(var4))))
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var8 (ref)
		local var10 = if var9 then var8() else nil
		
		return function()
			-- upvalues: var10 (write)
			if var10 then
				var10.cancel()
			end
		end
	end, { var9, var8 })
	local var10 = reactModule.useRef(var4)
	reactModule.useEffect(function()
		-- upvalues: var4 (write), var10 (ref)
		if var4 then
			var10.current = var4
		end
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), guiService (copy)
		return function()
			-- upvalues: var10 (copy), guiService (copy)
			if not var10.current then return end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject then return end
			if selectedCoreObject:IsDescendantOf(var10.current) or not selectedCoreObject:IsDescendantOf(game) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, {})
	local isIsolated = p1.isIsolated
	local frameProps = p1.frameProps
	
	return reactModule.createElement("Frame", reactModule.useMemo(function()
		-- upvalues: frameProps (ref), t_1 (copy), isIsolated (ref), cryoModule (copy), t_2 (copy), t (copy), var7 (ref)
		local var11 = frameProps or t_1
		
		if isIsolated then
			var11 = cryoModule.Dictionary.join(t_2, var11)
		end
		return cryoModule.Dictionary.join(t, var11, { ref = var7 })
	end, { isIsolated, frameProps, var7 }), p1.children)
end