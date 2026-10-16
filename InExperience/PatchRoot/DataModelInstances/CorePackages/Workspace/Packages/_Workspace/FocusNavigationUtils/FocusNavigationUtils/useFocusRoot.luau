local FocusNavigationUtils = script:FindFirstAncestor("FocusNavigationUtils")
local Parent = FocusNavigationUtils.Parent
local GuiService = game:GetService("GuiService")
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum)
local UseFocusNavigableSurfaceRegistryConnectionModule = require(FocusNavigationUtils.useFocusNavigableSurfaceRegistryConnection)
local UseAutoFocusModule = require(FocusNavigationUtils.useAutoFocus)
local UseDescendantHasFocusModule = require(FocusNavigationUtils.useDescendantHasFocus)
local UseLastInputModeModule = require(FocusNavigationUtils.useLastInputMode)
local t = {}

return function(p1) --[[ Line: 44 | Named "useFocusRoot" ]]
	-- upvalues: ReactModule (copy), t (copy), ReactFocusNavigationModule (copy), UseFocusNavigableSurfaceRegistryConnectionModule (copy), UseDescendantHasFocusModule (copy), UseAutoFocusModule (copy), UseLastInputModeModule (copy), GuiService (copy)
	local UseStateResult = nil
	local UseStateResult2
	UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseEventHandlerMapResult = ReactFocusNavigationModule.useEventHandlerMap(p1.eventHandlers or t, (ReactFocusNavigationModule.useEventMap(p1.eventMap or t, UseStateResult2)))
	local NoIsFocusable = p1.isFocusable == nil or p1.isFocusable
	local NoShouldRestoreFocus = p1.shouldRestoreFocus == nil or p1.shouldRestoreFocus
	local UseMostRecentFocusBehaviorResult = ReactFocusNavigationModule.useMostRecentFocusBehavior(UseEventHandlerMapResult)
	local UseMostRecentFocusBehaviorResult1 = if NoShouldRestoreFocus then UseMostRecentFocusBehaviorResult else UseEventHandlerMapResult
	UseFocusNavigableSurfaceRegistryConnectionModule(UseStateResult, p1.surfaceIdentifier, NoIsFocusable)
	local UseDescendantHasFocusModuleResult = UseDescendantHasFocusModule(UseStateResult)
	local UseAutoFocusModuleResult = UseAutoFocusModule({ UseStateResult }, 0.1)
	local IsFocus = UseLastInputModeModule() == "Focus"
	local NoUseDescendantHasFocusModuleResult: boolean = p1.isAutoFocusRoot and (NoIsFocusable and (IsFocus and (UseStateResult and not UseDescendantHasFocusModuleResult)))
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: NoUseDescendantHasFocusModuleResult (copy), UseAutoFocusModuleResult (copy)
		local UseAutoFocusModuleResultResult = if NoUseDescendantHasFocusModuleResult then UseAutoFocusModuleResult() else nil
		
		return function() --[[ Line: 78 ]]
			-- upvalues: UseAutoFocusModuleResultResult (ref)
			if UseAutoFocusModuleResultResult then
				UseAutoFocusModuleResultResult.cancel()
			end
		end
	end, {
		NoUseDescendantHasFocusModuleResult,
		UseAutoFocusModuleResult
	})
	local UseRefResult = ReactModule.useRef(UseStateResult)
	ReactModule.useEffect(function() --[[ Line: 86 ]]
		-- upvalues: UseStateResult (ref), UseRefResult (copy)
		if UseStateResult then
			UseRefResult.current = UseStateResult
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 92 ]]
		-- upvalues: UseRefResult (copy), GuiService (upval)
		return function() --[[ Line: 93 ]]
			-- upvalues: UseRefResult (upval), GuiService (upval)
			if not UseRefResult.current then return end
			local SelectedCoreObject = GuiService.SelectedCoreObject
			
			if not SelectedCoreObject then return end
			if SelectedCoreObject:IsDescendantOf(UseRefResult.current) or not SelectedCoreObject:IsDescendantOf(game) then
				GuiService.SelectedCoreObject = nil
			end
		end
	end, {})
	
	return UseMostRecentFocusBehaviorResult1
end