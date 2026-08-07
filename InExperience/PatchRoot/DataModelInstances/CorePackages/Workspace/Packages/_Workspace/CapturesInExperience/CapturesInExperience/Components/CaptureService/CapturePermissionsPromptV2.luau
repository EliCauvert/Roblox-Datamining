local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local foundationModule = require(parent_1.Foundation)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local dialog = foundationModule.Dialog
local dialogSize = foundationModule.Enums.DialogSize
local inputSize = foundationModule.Enums.InputSize
local text = foundationModule.Text
local view = foundationModule.View
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local usePinInputStateWhileOpenModule = require(parent.Hooks.usePinInputStateWhileOpen)
local eventNamesModule = require(parent.Analytics.EventNames)
local permissionPromptFinishedModule = require(parent.Thunks.PermissionPromptFinished)
local fFlagCapturePermissionsPromptFreeMouseModule = require(parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

return function(p0) --[[ line: 34 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), usePinInputStateWhileOpenModule (ref), fFlagCapturePermissionsPromptFreeMouseModule (ref), reactModule (ref), eventNamesModule (ref), permissionPromptFinishedModule (ref), dialog (ref), dialogSize (ref), view (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var9 = useAnalyticsModule()
	local var10 = useDispatch()
	local var11 = useLocalization({
		allow = "Feature.Captures.Action.Allow",
		allowAccessToCapturesBody = "Feature.Captures.Body.AllowAccessToCaptures",
		allowAccessToCapturesTitle = "Feature.Captures.Title.AllowAccessToCaptures",
		dontAllow = "Feature.Captures.Action.DontAllow"
	})
	usePinInputStateWhileOpenModule(fFlagCapturePermissionsPromptFreeMouseModule)
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: var9 (ref), eventNamesModule (copy)
		var9.fireEvent(eventNamesModule.CapturePermissionsPromptViewed)
	end, {})
	
	return reactModule.createElement(dialog.Root, { size = dialogSize.Small }, {
		ModalFix = if fFlagCapturePermissionsPromptFreeMouseModule then reactModule.createElement("ImageButton", {
			BackgroundTransparency = 1,
			Modal = true,
			Size = UDim2.new(0, 0, 0, 0)
		}) else nil,
		DialogTitle = reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-top-small"
		}, {
			DialogTitleText = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small text-wrap",
				Text = var11.allowAccessToCapturesTitle
			})
		}),
		DialogContent = reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "col align-x-center align-y-center auto-y gap-small size-full-0 margin-none"
		}, {
			DialogContentText = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-body-small text-wrap padding-bottom-xsmall",
				Text = var11.allowAccessToCapturesBody
			}),
			Buttons = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "row align-x-center align-y-center auto-xy gap-medium"
			}, {
				AcceptButton = reactModule.createElement(button, {
					text = var11.allow,
					variant = buttonVariant.Emphasis,
					onActivated = reactModule.useCallback(function() --[[ line: 54 ]]
						-- upvalues: var9 (ref), eventNamesModule (copy), var10 (ref), permissionPromptFinishedModule (copy), p0 (ref)
						var9.fireEvent(eventNamesModule.CapturePermissionsPromptAccepted)
						var10(permissionPromptFinishedModule(p0.promptId, true))
					end, { p0.promptId }),
					size = inputSize.Small,
					width = UDim.new(0.45, 0)
				}),
				RejectButton = reactModule.createElement(button, {
					text = var11.dontAllow,
					variant = buttonVariant.Standard,
					onActivated = reactModule.useCallback(function() --[[ line: 60 ]]
						-- upvalues: var9 (ref), eventNamesModule (copy), var10 (ref), permissionPromptFinishedModule (copy), p0 (ref)
						var9.fireEvent(eventNamesModule.CapturePermissionsPromptRejected)
						var10(permissionPromptFinishedModule(p0.promptId, false))
					end, { p0.promptId }),
					size = inputSize.Small,
					width = UDim.new(0.45, 0)
				})
			})
		})
	})
end