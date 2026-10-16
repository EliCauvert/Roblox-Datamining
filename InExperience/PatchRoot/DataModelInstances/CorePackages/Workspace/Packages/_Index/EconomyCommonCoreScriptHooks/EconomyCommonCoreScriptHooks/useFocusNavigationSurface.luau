local GuiService = game:GetService("GuiService")
local Parent = script:FindFirstAncestor("EconomyCommonCoreScriptHooks").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceRegistry = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry
local UseRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useRegisterFocusNavigableSurface
local UseDeRegisterFocusNavigableSurfaceFunction = FocusNavigableSurfaceRegistry.useDeRegisterFocusNavigableSurface
local UseLastInputMethodFunction = FocusNavigationUtilsModule.useLastInputMethod
local UseAutoFocusFunction = FocusNavigationUtilsModule.useAutoFocus
local UseDescendantHasFocusFunction = FocusNavigationUtilsModule.useDescendantHasFocus

return function(p1) --[[ Line: 22 | Named "useFocusNavigationSurface" ]]
	-- upvalues: ReactModule (copy), UseRegisterFocusNavigableSurfaceFunction (copy), UseDeRegisterFocusNavigableSurfaceFunction (copy), UseAutoFocusFunction (copy), UseDescendantHasFocusFunction (copy), UseLastInputMethodFunction (copy), GuiService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRegisterFocusNavigableSurfaceResult = UseRegisterFocusNavigableSurfaceFunction()
	local UseDeRegisterFocusNavigableSurfaceResult = UseDeRegisterFocusNavigableSurfaceFunction()
	local UseAutoFocusResult = UseAutoFocusFunction({ UseStateResult }, 0.1)
	local UseDescendantHasFocusResult = UseDescendantHasFocusFunction(UseStateResult)
	local UseLastInputMethodResult = UseLastInputMethodFunction()
	local IsGamepad: boolean = UseLastInputMethodResult == "Gamepad" or UseLastInputMethodResult == "Keyboard"
	ReactModule.useEffect(function() --[[ Line: 31 ]]
		-- upvalues: UseStateResult (copy), UseRegisterFocusNavigableSurfaceResult (copy), p1 (copy), GuiService (upval), UseDeRegisterFocusNavigableSurfaceResult (copy)
		if UseStateResult then
			UseRegisterFocusNavigableSurfaceResult(p1.focusNavigableSurfaceIdentifier, UseStateResult)
			GuiService:AddSelectionParent(p1.selectionGroupName, UseStateResult)
		else
			UseDeRegisterFocusNavigableSurfaceResult(p1.focusNavigableSurfaceIdentifier, UseStateResult)
			GuiService:RemoveSelectionGroup(p1.selectionGroupName)
			GuiService.SelectedCoreObject = nil
		end
		return function() --[[ Line: 42 ]]
			-- upvalues: UseDeRegisterFocusNavigableSurfaceResult (upval), p1 (upval), UseStateResult (upval), GuiService (upval)
			UseDeRegisterFocusNavigableSurfaceResult(p1.focusNavigableSurfaceIdentifier, UseStateResult)
			GuiService:RemoveSelectionGroup(p1.selectionGroupName)
			GuiService.SelectedCoreObject = nil
		end
	end, {
		UseStateResult,
		p1.focusNavigableSurfaceIdentifier,
		p1.selectionGroupName
	})
	local NoUseDescendantHasFocusResult: boolean = IsGamepad and (UseStateResult and not UseDescendantHasFocusResult)
	ReactModule.useEffect(function() --[[ Line: 52 ]]
		-- upvalues: NoUseDescendantHasFocusResult (copy), UseAutoFocusResult (copy)
		local UseAutoFocusResultResult = if NoUseDescendantHasFocusResult then UseAutoFocusResult() else nil
		
		return function() --[[ Line: 57 ]]
			-- upvalues: UseAutoFocusResultResult (ref)
			if UseAutoFocusResultResult then
				UseAutoFocusResultResult.cancel()
			end
		end
	end, { NoUseDescendantHasFocusResult, UseAutoFocusResult })
	
	return UseStateResult2
end