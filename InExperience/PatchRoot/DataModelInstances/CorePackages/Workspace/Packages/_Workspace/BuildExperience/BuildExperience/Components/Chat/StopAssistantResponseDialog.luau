local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local dialog = foundationModule.Dialog
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialogSize = foundationModule.Enums.DialogSize
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local useDefaultFocusBehavior = reactFocusNavigationModule.useDefaultFocusBehavior
local t = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t (ref), useDefaultFocusBehavior (ref), buttonVariant (ref), dialog (ref), dialogSize (ref)
	local var1 = useLocalization({
		cancel = localizationStringsModule.CHAT_STOP_CONFIRMATION_CANCEL,
		description = localizationStringsModule.CHAT_STOP_CONFIRMATION_DESCRIPTION,
		stop = localizationStringsModule.CHAT_STOP_CONFIRMATION_ACTION,
		title = localizationStringsModule.CHAT_STOP_CONFIRMATION_TITLE
	})
	local onCancel = p1.onCancel
	local var2, var3 = useDefaultFocusBehavior(useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), onCancel (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: onCancel (copy)
						onCancel()
						p2:cancel()
					end)
				}
			}
		end, { onCancel })
	}))
	
	return reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		testId = "stop-assistant-response-dialog",
		ref = var3,
		size = dialogSize.Small
	}, {
		Title = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.title }),
		Content = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			Description = reactModule.createElement(dialog.Text, { Text = var1.description })
		}),
		Actions = reactModule.createElement(dialog.Actions, reactModule.useMemo(function()
			-- upvalues: var1 (ref), buttonVariant (copy), p1 (ref), onCancel (ref), var2 (ref)
			return {
				LayoutOrder = 3,
				actions = {
					{
						text = var1.stop,
						variant = buttonVariant.Alert,
						onActivated = p1.onConfirm
					},
					{
						text = var1.cancel,
						variant = buttonVariant.Standard,
						onActivated = onCancel,
						ref = var2
					}
				}
			}
		end, {
			var1.cancel,
			var1.stop,
			onCancel,
			p1.onConfirm,
			var2
		}))
	})
end