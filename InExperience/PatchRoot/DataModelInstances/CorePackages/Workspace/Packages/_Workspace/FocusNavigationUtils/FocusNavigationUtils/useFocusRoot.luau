local focusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local parent = focusNavigationUtils.Parent
local guiService = game:GetService("GuiService")
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local _ = require(focusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local useFocusNavigableSurfaceRegistryConnectionModule = require(focusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
local useAutoFocusModule = require(focusNavigationUtils.useAutoFocus)
local useDescendantHasFocusModule = require(focusNavigationUtils.useDescendantHasFocus)
local useLastInputModeModule = require(focusNavigationUtils.useLastInputMode)
local t = {}

return function(p0)
	-- upvalues: reactModule (ref), t (ref), reactFocusNavigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), useDescendantHasFocusModule (ref), useAutoFocusModule (ref), useLastInputModeModule (ref), guiService (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var9, var10 = reactModule.useState(nil)
	local var11 = var9
	local var12 = reactFocusNavigationModule.useEventHandlerMap(p0.eventHandlers or t, reactFocusNavigationModule.useEventMap(p0.eventMap or t, var10))
	local var13 = p0.isFocusable == nil or p0.isFocusable
	local var14 = if p0.shouldRestoreFocus == nil or p0.shouldRestoreFocus then reactFocusNavigationModule.useMostRecentFocusBehavior(var12) else var12
	useFocusNavigableSurfaceRegistryConnectionModule(var11, p0.surfaceIdentifier, var13)
	local var15 = useAutoFocusModule({ var11 }, 0.1)
	local var16 = p0.isAutoFocusRoot and (var13 and (useLastInputModeModule() == "Focus" and (var11 and not useDescendantHasFocusModule(var11))))
	reactModule.useEffect(function()
		-- upvalues: var16 (ref), var15 (ref)
		local var18 = if var16 then var15() else nil
		
		return function()
			-- upvalues: var18 (write)
			if var18 then
				var18.cancel()
			end
		end
	end, { var16, var15 })
	local var17 = reactModule.useRef(var11)
	reactModule.useEffect(function()
		-- upvalues: var11 (write), var17 (ref)
		if var11 then
			var17.current = var11
		end
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), guiService (copy)
		return function()
			-- upvalues: var17 (copy), guiService (copy)
			if not var17.current then return end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject then return end
			if selectedCoreObject:IsDescendantOf(var17.current) or not selectedCoreObject:IsDescendantOf(game) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, {})
	
	return var14
end