local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UsePinInputStateWhileOpenModule = require(Parent.Hooks.usePinInputStateWhileOpen)
local EventNamesModule = require(Parent.Analytics.EventNames)
local PermissionPromptFinishedModule = require(Parent.Thunks.PermissionPromptFinished)
local FFlagCapturePermissionsPromptFreeMouseModule = require(Parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

return function(p1)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UsePinInputStateWhileOpenModule (copy), FFlagCapturePermissionsPromptFreeMouseModule (copy), ReactModule (copy), EventNamesModule (copy), PermissionPromptFinishedModule (copy), Dialog (copy), DialogSize (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		allow = "Feature.Captures.Action.Allow",
		allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures",
		allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		dontAllow = "Feature.Captures.Action.DontAllow"
	})
	UsePinInputStateWhileOpenModule(FFlagCapturePermissionsPromptFreeMouseModule)
	ReactModule.useEffect(function()
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturePermissionsPromptViewed)
	end, {})
	
	return ReactModule.createElement(Dialog.Root, { size = DialogSize.Small }, {
		ModalFix = if FFlagCapturePermissionsPromptFreeMouseModule then ReactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}) else nil,
		DialogTitle = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-top-small"
		}, {
			DialogTitleText = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small text-wrap",
				Text = UseLocalizationResult.allowAccessToCapturesTitle
			})
		}),
		DialogContent = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-none"
		}, {
			DialogContentText = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-small text-wrap padding-bottom-xsmall",
				Text = UseLocalizationResult.allowAccessToCapturesBody
			}),
			Buttons = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center auto-xy gap-medium"
			}, {
				AcceptButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.allow,
					variant = ButtonVariant.Emphasis,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), PermissionPromptFinishedModule (upval), p1 (copy)
						UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturePermissionsPromptAccepted)
						UseDispatchResult(PermissionPromptFinishedModule(p1.promptId, true))
					end, { p1.promptId }),
					size = InputSize.Small,
					width = UDim.new(0.45, 0)
				}),
				RejectButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.dontAllow,
					variant = ButtonVariant.Standard,
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), PermissionPromptFinishedModule (upval), p1 (copy)
						UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturePermissionsPromptRejected)
						UseDispatchResult(PermissionPromptFinishedModule(p1.promptId, false))
					end, { p1.promptId }),
					size = InputSize.Small,
					width = UDim.new(0.45, 0)
				})
			})
		})
	})
end