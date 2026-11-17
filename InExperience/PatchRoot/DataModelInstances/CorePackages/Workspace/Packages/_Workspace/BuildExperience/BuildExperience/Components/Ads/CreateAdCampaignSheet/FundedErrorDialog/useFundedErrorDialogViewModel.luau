local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local _ = require(script.Parent.FundedErrorDialogView)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseDefaultFocusBehaviorFunction = ReactFocusNavigationModule.useDefaultFocusBehavior
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy)
	local OnDismissFunction = p1.onDismiss
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnDismissFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: OnDismissFunction (upval)
						OnDismissFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnDismissFunction })
	})))
	
	return {
		title = p1.title,
		description = p1.description,
		retryText = p1.retryText,
		isRetryPending = p1.isRetryPending,
		dialogRef = UseDefaultFocusBehaviorResult2,
		retryRef = UseDefaultFocusBehaviorResult,
		onRetry = p1.onRetry,
		onDismiss = OnDismissFunction
	}
end