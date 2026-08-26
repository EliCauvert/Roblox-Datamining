local guiService = game:GetService("GuiService")
local parent = script:FindFirstAncestor("VerifiedParentalConsentDialog").Parent
local reactModule = require(parent.React)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceRegistry = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local useRegisterFocusNavigableSurface = focusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local useDeRegisterFocusNavigableSurface = focusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local useLastInputMethod = focusNavigationUtilsModule.useLastInputMethod
local useAutoFocus = focusNavigationUtilsModule.useAutoFocus
local useDescendantHasFocus = focusNavigationUtilsModule.useDescendantHasFocus

return function(p1)
	-- upvalues: reactModule (ref), useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), useAutoFocus (ref), useDescendantHasFocus (ref), useLastInputMethod (ref), guiService (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = useRegisterFocusNavigableSurface()
	local var4 = useDeRegisterFocusNavigableSurface()
	local var5 = useAutoFocus({ var1 }, 0.1)
	local var6 = useDescendantHasFocus(var1)
	local var7 = useLastInputMethod()
	local var8 = if var7 ~= "Gamepad" then var7 == "Keyboard" else true
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), p1 (ref), guiService (copy), var4 (ref)
		if var1 then
			var3(p1.focusNavigableSurfaceIdentifier, var1)
			guiService:AddSelectionParent(p1.selectionGroupName, var1)
		else
			var4(p1.focusNavigableSurfaceIdentifier, var1)
			guiService:RemoveSelectionGroup(p1.selectionGroupName)
			guiService.SelectedCoreObject = nil
		end
		return function()
			-- upvalues: var4 (copy), p1 (copy), var1 (copy), guiService (copy)
			var4(p1.focusNavigableSurfaceIdentifier, var1)
			guiService:RemoveSelectionGroup(p1.selectionGroupName)
			guiService.SelectedCoreObject = nil
		end
	end, {
		var1,
		p1.focusNavigableSurfaceIdentifier,
		p1.selectionGroupName
	})
	local var9 = var8 and (var1 and not var6)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var5 (ref)
		local var10 = if var9 then var5() else nil
		
		return function()
			-- upvalues: var10 (write)
			if var10 then
				var10.cancel()
			end
		end
	end, { var9, var5 })
	
	return var2
end