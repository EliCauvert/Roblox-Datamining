local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthModalShownFunction = AuthAnalyticsModule.Events.authModalShown
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local InputSize = FoundationModule.Enums.InputSize
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local InputHandlersModule = require(Parent.InputHandlers)
local config = {
	[Enum.KeyCode.ButtonA] = FocusNavigationEventNameEnum.Confirm,
	[Enum.KeyCode.Return] = FocusNavigationEventNameEnum.Confirm
}

local function useFocusNavigationBindings(p1)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval)
		return {
			[FocusNavigationEventNameEnum.Confirm] = {
				handler = InputHandlersModule.onRelease(function() end)
			}
		}
	end, {}), (ReactFocusNavigationModule.useEventMap(config, p1)))
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), useFocusNavigationBindings (copy), AuthModalShownFunction (copy), EventStreamConstants (copy), AuthButtonClickFunction (copy), Dialog (copy), DialogSize (copy), FoundationModule (copy), ButtonVariant (copy), InputSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		cancel = "Authentication.SignUp.Action.Cancel",
		confirm = "Authentication.SignUp.Action.ExitModalLeave",
		title = "Authentication.SignUp.Label.ExitModalTitle",
		subtitle = "Authentication.SignUp.Label.ExitModalSubtitle"
	})
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusNavigationBindingsResult = useFocusNavigationBindings(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy), AuthModalShownFunction (upval), EventStreamConstants (upval)
		UseFocusGuiObjectResult(UseRefResult.current)
		AuthModalShownFunction(EventStreamConstants.Context.SignUpExitModal, EventStreamConstants.State.Success)
	end, {})
	
	return ReactModule.createElement(Dialog.Root, {
		hasBackdrop = true,
		size = DialogSize.Small,
		ref = UseFocusNavigationBindingsResult
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, { text = UseLocalizationResult.title }),
		DialogContent = ReactModule.createElement(Dialog.Content, {}, {
			DialogView = ReactModule.createElement(FoundationModule.View, { tag = "col fill auto-xy items-start gap-medium" }, {
				DialogText = ReactModule.createElement(Dialog.Text, { LayoutOrder = 1, Text = UseLocalizationResult.subtitle }),
				PrimaryButton = ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 2,
					text = UseLocalizationResult.confirm,
					variant = ButtonVariant.Alert,
					size = InputSize.Small,
					width = UDim.new(1, 0),
					TextTruncate = Enum.TextTruncate.None,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
						AuthButtonClickFunction(EventStreamConstants.Context.SignUpExitModal, EventStreamConstants.Button.SignUpExitModalLeave)
						p1.onConfirm()
					end, { p1.onConfirm })
				}),
				SecondaryButton = ReactModule.createElement(FoundationModule.Button, {
					LayoutOrder = 3,
					text = UseLocalizationResult.cancel,
					variant = ButtonVariant.Standard,
					size = InputSize.Small,
					width = UDim.new(1, 0),
					TextTruncate = Enum.TextTruncate.None,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
						AuthButtonClickFunction(EventStreamConstants.Context.SignUpExitModal, EventStreamConstants.Button.SignUpExitModalCancel)
						p1.onClose()
					end, { p1.onClose }),
					ref = UseRefResult
				})
			})
		})
	})
end