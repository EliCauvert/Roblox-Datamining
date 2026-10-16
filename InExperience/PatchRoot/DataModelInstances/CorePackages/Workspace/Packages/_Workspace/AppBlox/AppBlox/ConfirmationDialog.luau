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
local FFlagAppBloxConfirmationDialogFocusNav = SharedFlagsModule.FFlagAppBloxConfirmationDialogFocusNav
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane

return function(p1) --[[ Line: 61 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagAppBloxConfirmationDialogFocusNav (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), FFlagLuaAppPlayButtonPrivatePT (copy), ButtonVariant (copy), Dialog (copy), FFlagEnableSplitPane (copy), Orientation (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "CommonUI.Controls.Action.Cancel"
	})
	local Ref = nil
	local v1 = nil
	
	if FFlagAppBloxConfirmationDialogFocusNav then
		local OnCancelFunction = p1.onCancel
		v1, Ref = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
			isAutoFocusRoot = true,
			shouldRestoreFocus = false,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
			eventMap = EventMap,
			eventHandlers = ReactModule.useMemo(function() --[[ Line: 74 ]]
				-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCancelFunction (copy)
				return {
					[FocusNavigationEventNameEnum.NavigateBack] = {
						handler = InputHandlersModule.onRelease(function(p2) --[[ Line: 80 ]]
							-- upvalues: OnCancelFunction (upval)
							OnCancelFunction()
							p2:cancel()
						end)
					}
				}
			end, { OnCancelFunction })
		})))
	end
	local Ref1 = v1
	local v2 = nil
	
	if FFlagLuaAppPlayButtonPrivatePT then
		local config = {
			variant = ButtonVariant.Emphasis,
			text = p1.confirmButtonText or UseLocalizationResult.confirmButtonText,
			onActivated = p1.onConfirm,
			ref = Ref1
		}
		local config1 = {
			variant = ButtonVariant.Standard,
			text = p1.cancelButtonText or UseLocalizationResult.cancelButtonText,
			onActivated = p1.onCancel,
			ref = if p1.hideConfirmButton then Ref1 else nil
		}
		v2 = if p1.hideConfirmButton then { config1 } else { config, config1 }
	end
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = not FFlagEnableSplitPane or p1.hasBackdrop == nil or p1.hasBackdrop,
		disablePortal = p1.disablePortal,
		size = if FFlagLuaAppPlayButtonPrivatePT then p1.size else nil,
		ref = Ref,
		onClose = if FFlagEnableSplitPane and p1.onClose ~= nil then p1.onClose elseif p1.showCloseButton then p1.onCancel else nil
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = p1.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, nil, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = p1.body })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			orientation = if FFlagLuaAppPlayButtonPrivatePT and p1.orientButtonsVertically then Orientation.Vertical else nil,
			actions = if FFlagLuaAppPlayButtonPrivatePT then v2 else {
				{
					variant = ButtonVariant.Emphasis,
					text = p1.confirmButtonText or UseLocalizationResult.confirmButtonText,
					onActivated = p1.onConfirm,
					ref = Ref1
				},
				{
					variant = ButtonVariant.Standard,
					text = p1.cancelButtonText or UseLocalizationResult.cancelButtonText,
					onActivated = p1.onCancel
				}
			}
		})
	})
end