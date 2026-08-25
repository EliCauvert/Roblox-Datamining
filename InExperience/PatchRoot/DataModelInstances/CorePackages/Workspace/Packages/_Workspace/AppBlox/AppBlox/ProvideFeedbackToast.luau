local parent = script:FindFirstAncestor("AppBlox").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local UIBloxModule = require(parent.UIBlox)
local sharedFlagsModule = require(parent.SharedFlags)
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = localizationModule.Hooks.useLocalization
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local toast = UIBloxModule.App.Dialog.Toast
local _ = require(script.Parent.CheckboxFeedbackFormModal)
local snackbarWrapperModule = require(script.Parent.SnackbarWrapper)
local fFlagLuaAppUseSnackbarForProvideFeedbackToast = sharedFlagsModule.FFlagLuaAppUseSnackbarForProvideFeedbackToast

return reactModule.memo(function(p0)
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), snackbarWrapperModule (ref), useSelector (ref), toast (ref)
	local var9 = useDispatch()
	local var10 = useTokens()
	local var11 = useLocalization({
		giveFeedback = "Feature.GameDetails.Action.GiveFeedback",
		helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var9 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if p0.onToastActivated then
			task.spawn(p0.onToastActivated)
		end
		var9(setCentralOverlay(centralOverlayType.CheckboxFeedbackFormModal, p0.feedbackFormProps))
	end, { p0.onToastActivated, var9, p0.feedbackFormProps })
	local var13 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var9 (ref), closeCentralOverlay (copy)
		if p0.onToastDismissed then
			task.spawn(p0.onToastDismissed)
		end
		var9(closeCentralOverlay())
	end, { p0.onToastDismissed, var9 })
	
	return if fFlagLuaAppUseSnackbarForProvideFeedbackToast then reactModule.createElement(snackbarWrapperModule, {
		autoDismissDelaySeconds = 5,
		titleText = p0.toastTitle or var11.helpUsImprove,
		icon = p0.toastIcon,
		buttonText = p0.toastButtonText or var11.giveFeedback,
		onButtonActivated = var12,
		closeSnackbar = var13
	}) else reactModule.createElement(toast, {
		duration = 5,
		position = UDim2.new(0.5, 0, 0, useSelector(function(p1)
			return p1.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
		end).top + 20 + useSelector(function(p2)
			return p2.TopBar.statusBarHeight
		end)),
		toastContent = {
			swipeUpDismiss = true,
			buttonText = p0.toastButtonText or var11.giveFeedback,
			iconColorStyle = {
				Color = var10.Inverse.Surface.Surface_0.Color3,
				Transparency = var10.Inverse.Surface.Surface_0.Transparency
			},
			iconImage = p0.toastIcon,
			onActivated = var12,
			onAppeared = p0.onToastAppeared,
			onDismissed = var13,
			toastTitle = p0.toastTitle or var11.helpUsImprove,
			toastSubtitle = p0.toastSubtitle
		}
	})
end)