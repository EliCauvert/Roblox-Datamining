local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local Dialog = FoundationModule.Dialog
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local DialogSize = FoundationModule.Enums.DialogSize
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseDefaultFocusBehaviorFunction = require(Parent.ReactFocusNavigation).useDefaultFocusBehavior
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), UseDefaultFocusBehaviorFunction (copy), ButtonVariant (copy), Dialog (copy), DialogSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = LocalizationStringsModule.CHAT_STOP_CONFIRMATION_CANCEL,
		description = LocalizationStringsModule.CHAT_STOP_CONFIRMATION_DESCRIPTION,
		stop = LocalizationStringsModule.CHAT_STOP_CONFIRMATION_ACTION,
		title = LocalizationStringsModule.CHAT_STOP_CONFIRMATION_TITLE
	})
	local OnCancelFunction = p1.onCancel
	local UseDefaultFocusBehaviorResult, UseDefaultFocusBehaviorResult2 = UseDefaultFocusBehaviorFunction((UseFocusRootFunction({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = EventMap,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), OnCancelFunction (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: OnCancelFunction (upval)
						OnCancelFunction()
						p2:cancel()
					end)
				}
			}
		end, { OnCancelFunction })
	})))
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "stop-assistant-response-dialog",
		ref = UseDefaultFocusBehaviorResult2,
		size = DialogSize.Small
	}, {
		Title = ReactModule.createElement(Dialog.Title, { LayoutOrder = 1, text = UseLocalizationResult.title }),
		Content = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			Description = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.description })
		}),
		Actions = ReactModule.createElement(Dialog.Actions, (ReactModule.useMemo(function()
			-- upvalues: UseLocalizationResult (copy), ButtonVariant (upval), p1 (copy), OnCancelFunction (copy), UseDefaultFocusBehaviorResult (copy)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = UseLocalizationResult.stop,
						variant = ButtonVariant.Alert,
						onActivated = p1.onConfirm
					},
					{
						text = UseLocalizationResult.cancel,
						variant = ButtonVariant.Standard,
						onActivated = OnCancelFunction,
						ref = UseDefaultFocusBehaviorResult
					}
				}
			}
		end, {
			UseLocalizationResult.cancel,
			UseLocalizationResult.stop,
			OnCancelFunction,
			p1.onConfirm,
			UseDefaultFocusBehaviorResult
		})))
	})
end