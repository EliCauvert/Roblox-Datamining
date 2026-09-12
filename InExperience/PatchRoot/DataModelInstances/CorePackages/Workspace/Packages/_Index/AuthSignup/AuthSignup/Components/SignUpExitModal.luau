local parent = script:FindFirstAncestor("AuthSignup").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local authAnalyticsModule = require(parent.AuthAnalytics)
local authModalShown = authAnalyticsModule.Events.authModalShown
local authButtonClick = authAnalyticsModule.Events.authButtonClick
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local inputSize = foundationModule.Enums.InputSize
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useFocusGuiObject = reactFocusNavigationModule.useFocusGuiObject
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local inputHandlersModule = require(parent.InputHandlers)
local t = {
	[Enum.KeyCode.ButtonA] = focusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = focusNavigationEventNameEnum.Confirm
}

local function useFocusNavigationBindings(p1)
	-- upvalues: reactFocusNavigationModule (ref), t (ref), reactModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref)
	return reactFocusNavigationModule.useEventHandlerMap(reactModule.useMemo(function()
		-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy)
		return {
			[focusNavigationEventNameEnum.Confirm] = {
				handler = inputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), reactFocusNavigationModule.useEventMap(t, p1))
end

return function(value)
	-- upvalues: useLocalization (ref), useFocusGuiObject (ref), reactModule (ref), useFocusNavigationBindings (ref), authModalShown (ref), eventStreamConstants (ref), authButtonClick (ref), dialog (ref), dialogSize (ref), foundationModule (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useLocalization({
		cancel = "Authentication.SignUp.Action.Cancel",
		confirm = "Authentication.SignUp.Action.ExitModalLeave",
		title = "Authentication.SignUp.Label.ExitModalTitle",
		subtitle = "Authentication.SignUp.Label.ExitModalSubtitle"
	})
	local var2 = useFocusGuiObject()
	local var3 = reactModule.useRef(nil)
	local var4 = useFocusNavigationBindings(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), authModalShown (copy), eventStreamConstants (copy)
		var2(var3.current)
		authModalShown(eventStreamConstants.Context.SignUpExitModal, eventStreamConstants.State.Success)
	end, {})
	
	return reactModule.createElement(dialog.Root, { hasBackdrop = true, size = dialogSize.Small, ref = var4 }, {
		DialogTitle = reactModule.createElement(dialog.Title, { text = var1.title }),
		DialogContent = reactModule.createElement(dialog.Content, {}, {
			DialogView = reactModule.createElement(foundationModule.View, { tag = "col fill auto-xy items-start gap-medium" }, {
				DialogText = reactModule.createElement(dialog.Text, { LayoutOrder = 1, Text = var1.subtitle }),
				PrimaryButton = reactModule.createElement(foundationModule.Button, {
					LayoutOrder = 2,
					text = var1.confirm,
					variant = buttonVariant.Alert,
					size = inputSize.Small,
					width = UDim.new(1, 0),
					TextTruncate = Enum.TextTruncate.None,
					onActivated = reactModule.useCallback(function()
						-- upvalues: authButtonClick (copy), eventStreamConstants (copy), value (ref)
						authButtonClick(eventStreamConstants.Context.SignUpExitModal, eventStreamConstants.Button.SignUpExitModalLeave)
						value.onConfirm()
					end, { value.onConfirm })
				}),
				SecondaryButton = reactModule.createElement(foundationModule.Button, {
					LayoutOrder = 3,
					text = var1.cancel,
					variant = buttonVariant.Standard,
					size = inputSize.Small,
					width = UDim.new(1, 0),
					TextTruncate = Enum.TextTruncate.None,
					onActivated = reactModule.useCallback(function()
						-- upvalues: authButtonClick (copy), eventStreamConstants (copy), value (ref)
						authButtonClick(eventStreamConstants.Context.SignUpExitModal, eventStreamConstants.Button.SignUpExitModalCancel)
						value.onClose()
					end, { value.onClose }),
					ref = var3
				})
			})
		})
	})
end