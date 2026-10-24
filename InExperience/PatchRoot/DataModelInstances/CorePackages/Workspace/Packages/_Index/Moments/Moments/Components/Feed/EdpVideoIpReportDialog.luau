local Parent = script:FindFirstAncestor("Moments").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local _ = require(Parent.ReactFocusNavigation)
local Dialog = FoundationModule.Dialog
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local config = {
	["continue"] = "Feature.Moments.Action.Continue",
	cancel = "Feature.Moments.Action.Cancel",
	dialogTitle = "Feature.Moments.Title.EDPMomentIPReportInstructions",
	dialogBody = "Feature.Moments.Body.EDPMomentIPReportInstructions"
}

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), EventMap (copy), Dialog (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local OnCancelFunction = p1.onCancel
	
	return ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "moments-edp-video-ip-report-dialog",
		ref = UseFocusRootFunction({
			isAutoFocusRoot = true,
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
		}),
		onClose = p1.onCancel,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.dialogTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			DialogText = ReactModule.createElement(Dialog.Text, { Text = UseLocalizationResult.dialogBody })
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					testId = "moments-edp-video-ip-report-continue",
					text = UseLocalizationResult["continue"],
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = p1.onContinue
				},
				{
					testId = "moments-edp-video-ip-report-cancel",
					text = UseLocalizationResult.cancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = p1.onCancel
				}
			}
		})
	})
end