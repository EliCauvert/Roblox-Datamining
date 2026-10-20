local Parent = script:FindFirstAncestor("CurrencyTransfers").Parent
local ReactModule = require(Parent.React)
local InputHandlersModule = require(Parent.InputHandlers)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseFocusOnMountFunction = FocusNavigationUtilsModule.useFocusOnMount
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseMostRecentOrDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useMostRecentOrDefaultFocusBehavior
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(Callback)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseMostRecentOrDefaultFocusBehaviorFunction (copy), UseFocusOnMountFunction (copy)
	local UseMostRecentOrDefaultFocusBehaviorResult, UseMostRecentOrDefaultFocusBehaviorResult2 = UseMostRecentOrDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1)
						-- upvalues: Callback (upval)
						Callback()
						p1:cancel()
					end)
				}
			}
		end, { Callback })
	})))
	
	return UseMostRecentOrDefaultFocusBehaviorResult2, (UseFocusOnMountFunction(UseMostRecentOrDefaultFocusBehaviorResult))
end