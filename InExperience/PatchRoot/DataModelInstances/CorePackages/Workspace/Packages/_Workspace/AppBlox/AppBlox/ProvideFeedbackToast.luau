local parent = script:FindFirstAncestor("AppBlox").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local _ = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local useLocalization = localizationModule.Hooks.useLocalization
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local _ = require(script.Parent.CheckboxFeedbackFormModal)
local snackbarWrapperModule = require(script.Parent.SnackbarWrapper)

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), snackbarWrapperModule (ref)
	local var1 = useDispatch()
	local var2 = useLocalization({
		giveFeedback = "Feature.GameDetails.Action.GiveFeedback",
		helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
	})
	
	return reactModule.createElement(snackbarWrapperModule, {
		autoDismissDelaySeconds = 5,
		titleText = p1.toastTitle or var2.helpUsImprove,
		icon = p1.toastIcon,
		buttonText = p1.toastButtonText or var2.giveFeedback,
		onButtonActivated = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref), setCentralOverlay (copy), centralOverlayType (copy)
			if p1.onToastActivated then
				task.spawn(p1.onToastActivated)
			end
			var1(setCentralOverlay(centralOverlayType.CheckboxFeedbackFormModal, p1.feedbackFormProps))
		end, { p1.onToastActivated, var1, p1.feedbackFormProps }),
		closeSnackbar = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var1 (ref), closeCentralOverlay (copy)
			if p1.onToastDismissed then
				task.spawn(p1.onToastDismissed)
			end
			var1(closeCentralOverlay())
		end, { p1.onToastDismissed, var1 })
	})
end)