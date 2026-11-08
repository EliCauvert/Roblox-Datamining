local Parent = script:FindFirstAncestor("GameInvite").Parent
local ReactModule = require(Parent.React)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local DeeplinkConfirmationModal = require(Parent.NotificationsCommon).DeeplinkConfirmationModal
local UseGameInviteLeaveServerConfirmationViewModelModule = require(script.Parent.useGameInviteLeaveServerConfirmationViewModel)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: UseGameInviteLeaveServerConfirmationViewModelModule (copy), ReactModule (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), DeeplinkConfirmationModal (copy)
	local UseGameInviteLeaveServerConfirmationViewModelModuleResult = UseGameInviteLeaveServerConfirmationViewModelModule(p1)
	
	return ReactModule.createElement(FocusRoot, {
		isIsolated = true,
		isAutoFocusRoot = true,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = UseGameInviteLeaveServerConfirmationViewModelModuleResult.focusEventHandlers
	}, {
		Confirmation = ReactModule.createElement(DeeplinkConfirmationModal, {
			closeCallback = UseGameInviteLeaveServerConfirmationViewModelModuleResult.closeCallback,
			titleKey = UseGameInviteLeaveServerConfirmationViewModelModuleResult.titleKey,
			bodyKey = UseGameInviteLeaveServerConfirmationViewModelModuleResult.bodyKey
		})
	})
end