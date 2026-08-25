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

return function(p0)
	-- upvalues: reactModule (ref), useRegisterFocusNavigableSurface (ref), useDeRegisterFocusNavigableSurface (ref), useAutoFocus (ref), useDescendantHasFocus (ref), useLastInputMethod (ref), guiService (ref)
	local var3, var4 = reactModule.useState(nil)
	local var5 = useRegisterFocusNavigableSurface()
	local var6 = useDeRegisterFocusNavigableSurface()
	local var7 = useAutoFocus({ var3 }, 0.1)
	local var8 = useDescendantHasFocus(var3)
	local var9 = useLastInputMethod()
	local var10 = if var9 ~= "Gamepad" then var9 == "Keyboard" else true
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var5 (ref), p0 (ref), guiService (copy), var6 (ref)
		if var3 then
			var5(p0.focusNavigableSurfaceIdentifier, var3)
			guiService:AddSelectionParent(p0.selectionGroupName, var3)
		else
			var6(p0.focusNavigableSurfaceIdentifier, var3)
			guiService:RemoveSelectionGroup(p0.selectionGroupName)
			guiService.SelectedCoreObject = nil
		end
		return function()
			-- upvalues: var6 (copy), p0 (copy), var3 (copy), guiService (copy)
			var6(p0.focusNavigableSurfaceIdentifier, var3)
			guiService:RemoveSelectionGroup(p0.selectionGroupName)
			guiService.SelectedCoreObject = nil
		end
	end, {
		var3,
		p0.focusNavigableSurfaceIdentifier,
		p0.selectionGroupName
	})
	local var11 = var10 and (var3 and not var8)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var7 (ref)
		local var12 = if var11 then var7() else nil
		
		return function()
			-- upvalues: var12 (write)
			if var12 then
				var12.cancel()
			end
		end
	end, { var11, var7 })
	
	return var4
end