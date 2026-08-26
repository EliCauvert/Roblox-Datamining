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

return function(p1)
	-- upvalues: reactModule (ref), t (ref), reactFocusNavigationModule (ref), useFocusNavigableSurfaceRegistryConnectionModule (ref), useDescendantHasFocusModule (ref), useAutoFocusModule (ref), useLastInputModeModule (ref), guiService (ref)
	local _ = nil
	local _ = nil
	local _ = nil
	local var1, var2 = reactModule.useState(nil)
	local var3 = var1
	local var4 = reactFocusNavigationModule.useEventHandlerMap(p1.eventHandlers or t, reactFocusNavigationModule.useEventMap(p1.eventMap or t, var2))
	local var5 = p1.isFocusable == nil or p1.isFocusable
	local var6 = if p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus then reactFocusNavigationModule.useMostRecentFocusBehavior(var4) else var4
	useFocusNavigableSurfaceRegistryConnectionModule(var3, p1.surfaceIdentifier, var5)
	local var7 = useAutoFocusModule({ var3 }, 0.1)
	local var8 = p1.isAutoFocusRoot and (var5 and (useLastInputModeModule() == "Focus" and (var3 and not useDescendantHasFocusModule(var3))))
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var7 (ref)
		local var9 = if var8 then var7() else nil
		
		return function()
			-- upvalues: var9 (write)
			if var9 then
				var9.cancel()
			end
		end
	end, { var8, var7 })
	local var9 = reactModule.useRef(var3)
	reactModule.useEffect(function()
		-- upvalues: var3 (write), var9 (ref)
		if var3 then
			var9.current = var3
		end
	end, { var3 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), guiService (copy)
		return function()
			-- upvalues: var9 (copy), guiService (copy)
			if not var9.current then return end
			local selectedCoreObject = guiService.SelectedCoreObject
			
			if not selectedCoreObject then return end
			if selectedCoreObject:IsDescendantOf(var9.current) or not selectedCoreObject:IsDescendantOf(game) then
				guiService.SelectedCoreObject = nil
			end
		end
	end, {})
	
	return var6
end