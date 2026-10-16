local Parent = script:FindFirstAncestor("AppBlox").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local _ = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local _ = require(script.Parent.CheckboxFeedbackFormModal)
local SnackbarWrapperModule = require(script.Parent.SnackbarWrapper)

return ReactModule.memo(function(p1) --[[ Line: 36 | Named "ProvideFeedbackToast" ]]
	-- upvalues: UseDispatchFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy), SnackbarWrapperModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		giveFeedback = "Feature.GameDetails.Action.GiveFeedback",
		helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
	})
	
	return ReactModule.createElement(SnackbarWrapperModule, {
		autoDismissDelaySeconds = 5,
		titleText = p1.toastTitle or UseLocalizationResult.helpUsImprove,
		icon = p1.toastIcon,
		buttonText = p1.toastButtonText or UseLocalizationResult.giveFeedback,
		onButtonActivated = ReactModule.useCallback(function() --[[ Line: 43 ]]
			-- upvalues: p1 (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
			if p1.onToastActivated then
				task.spawn(p1.onToastActivated)
			end
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.CheckboxFeedbackFormModal, p1.feedbackFormProps))
		end, {
			p1.onToastActivated,
			UseDispatchResult,
			p1.feedbackFormProps
		}),
		closeSnackbar = ReactModule.useCallback(function() --[[ Line: 50 ]]
			-- upvalues: p1 (copy), UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
			if p1.onToastDismissed then
				task.spawn(p1.onToastDismissed)
			end
			UseDispatchResult(CloseCentralOverlayFunction())
		end, { p1.onToastDismissed, UseDispatchResult })
	})
end)