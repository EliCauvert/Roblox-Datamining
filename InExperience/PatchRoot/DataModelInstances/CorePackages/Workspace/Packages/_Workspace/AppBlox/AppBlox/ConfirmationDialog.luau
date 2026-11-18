local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Orientation = FoundationModule.Enums.Orientation
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppPlayButtonPrivatePT = SharedFlagsModule.FFlagLuaAppPlayButtonPrivatePT
local FFlagAppBloxConfirmationDialogBackCloses = SharedFlagsModule.FFlagAppBloxConfirmationDialogBackCloses
local FFlagSplitPaneUnsavedDialogAlertStyle = SharedFlagsModule.FFlagSplitPaneUnsavedDialogAlertStyle
local FFlagAppBloxConfirmationDialogConfirmVariant = SharedFlagsModule.FFlagAppBloxConfirmationDialogConfirmVariant
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), FFlagAppBloxConfirmationDialogBackCloses (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), FFlagLuaAppPlayButtonPrivatePT (copy), FFlagAppBloxConfirmationDialogConfirmVariant (copy), ButtonVariant (copy), FFlagSplitPaneUnsavedDialogAlertStyle (copy), Dialog (copy), FFlagEnableSplitPane (copy), Orientation (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	local OnClose = FFlagAppBloxConfirmationDialogBackCloses and p1.onClose or p1.onCancel
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnClose (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: OnClose (upval)
						OnClose()
						p2:cancel()
					end)
				}
			}
		end, { OnClose })
	})))
	local v1 = nil
	
	if FFlagLuaAppPlayButtonPrivatePT then
		local config = {
			variant = if FFlagAppBloxConfirmationDialogConfirmVariant and p1.confirmButtonVariant then p1.confirmButtonVariant else ButtonVariant.Emphasis,
			text = p1.confirmButtonText or UseLocalizationResult.confirmButtonText,
			onActivated = p1.onConfirm,
			ref = UseDefaultFocusBehaviorResult
		}
		local config1 = {
			variant = if FFlagSplitPaneUnsavedDialogAlertStyle and p1.cancelButtonVariant then p1.cancelButtonVariant else ButtonVariant.Standard,
			text = p1.cancelButtonText or UseLocalizationResult.cancelButtonText,
			onActivated = p1.onCancel,
			ref = if p1.hideConfirmButton then UseDefaultFocusBehaviorResult else nil
		}
		v1 = if p1.hideConfirmButton then { config1 } else { config, config1 }
	end
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = not FFlagEnableSplitPane or p1.hasBackdrop == nil or p1.hasBackdrop,
		disablePortal = p1.disablePortal,
		size = if FFlagLuaAppPlayButtonPrivatePT then p1.size else nil,
		ref = UseDefaultFocusBehaviorResult2,
		onClose = if FFlagEnableSplitPane or FFlagAppBloxConfirmationDialogBackCloses then if p1.onClose == nil then if p1.showCloseButton then p1.onCancel else nil else p1.onClose elseif p1.showCloseButton then p1.onCancel else nil
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = p1.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = if FFlagLuaAppPlayButtonPrivatePT and p1.orientButtonsVertically then Orientation.Vertical else nil,
			actions = if FFlagLuaAppPlayButtonPrivatePT then v1 else {
				{
					variant = if FFlagAppBloxConfirmationDialogConfirmVariant and p1.confirmButtonVariant then p1.confirmButtonVariant else ButtonVariant.Emphasis,
					text = p1.confirmButtonText or UseLocalizationResult.confirmButtonText,
					onActivated = p1.onConfirm,
					ref = UseDefaultFocusBehaviorResult
				},
				{
					variant = if FFlagSplitPaneUnsavedDialogAlertStyle and p1.cancelButtonVariant then p1.cancelButtonVariant else ButtonVariant.Standard,
					text = p1.cancelButtonText or UseLocalizationResult.cancelButtonText,
					onActivated = p1.onCancel
				}
			}
		})
	})
end