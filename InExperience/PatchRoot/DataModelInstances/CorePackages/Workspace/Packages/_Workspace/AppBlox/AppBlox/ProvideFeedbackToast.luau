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

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), useTokens (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), fFlagLuaAppUseSnackbarForProvideFeedbackToast (ref), snackbarWrapperModule (ref), useSelector (ref), toast (ref)
	local var1 = useDispatch()
	local var2 = useTokens()
	local var3 = useLocalization({
		giveFeedback = "Feature.GameDetails.Action.GiveFeedback",
		helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), setCentralOverlay (copy), centralOverlayType (copy)
		if p1.onToastActivated then
			task.spawn(p1.onToastActivated)
		end
		var1(setCentralOverlay(centralOverlayType.CheckboxFeedbackFormModal, p1.feedbackFormProps))
	end, { p1.onToastActivated, var1, p1.feedbackFormProps })
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), closeCentralOverlay (copy)
		if p1.onToastDismissed then
			task.spawn(p1.onToastDismissed)
		end
		var1(closeCentralOverlay())
	end, { p1.onToastDismissed, var1 })
	
	return if fFlagLuaAppUseSnackbarForProvideFeedbackToast then reactModule.createElement(snackbarWrapperModule, {
		autoDismissDelaySeconds = 5,
		titleText = p1.toastTitle or var3.helpUsImprove,
		icon = p1.toastIcon,
		buttonText = p1.toastButtonText or var3.giveFeedback,
		onButtonActivated = var4,
		closeSnackbar = var5
	}) else reactModule.createElement(toast, {
		duration = 5,
		position = UDim2.new(0.5, 0, 0, useSelector(function(p2)
			return p2.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
		end).top + 20 + useSelector(function(p2)
			return p2.TopBar.statusBarHeight
		end)),
		toastContent = {
			swipeUpDismiss = true,
			buttonText = p1.toastButtonText or var3.giveFeedback,
			iconColorStyle = {
				Color = var2.Inverse.Surface.Surface_0.Color3,
				Transparency = var2.Inverse.Surface.Surface_0.Transparency
			},
			iconImage = p1.toastIcon,
			onActivated = var4,
			onAppeared = p1.onToastAppeared,
			onDismissed = var5,
			toastTitle = p1.toastTitle or var3.helpUsImprove,
			toastSubtitle = p1.toastSubtitle
		}
	})
end)