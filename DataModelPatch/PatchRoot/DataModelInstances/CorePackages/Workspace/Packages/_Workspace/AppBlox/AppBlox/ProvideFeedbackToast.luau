local Parent = script:FindFirstAncestor("AppBlox").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local Toast = require(Parent.UIBlox).App.Dialog.Toast
local _ = require(script.Parent.CheckboxFeedbackFormModal)
local SnackbarWrapperModule = require(script.Parent.SnackbarWrapper)
local FFlagLuaAppUseSnackbarForProvideFeedbackToast = require(Parent.SharedFlags).FFlagLuaAppUseSnackbarForProvideFeedbackToast

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy), FFlagLuaAppUseSnackbarForProvideFeedbackToast (copy), SnackbarWrapperModule (copy), UseSelectorFunction (copy), Toast (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		giveFeedback = "Feature.GameDetails.Action.GiveFeedback",
		helpUsImprove = "Feature.GameDetails.Message.HelpImproveExperience"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		if p1.onToastActivated then
			task.spawn(p1.onToastActivated)
		end
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.CheckboxFeedbackFormModal, p1.feedbackFormProps))
	end, {
		p1.onToastActivated,
		UseDispatchResult,
		p1.feedbackFormProps
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		if p1.onToastDismissed then
			task.spawn(p1.onToastDismissed)
		end
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { p1.onToastDismissed, UseDispatchResult })
	
	return if FFlagLuaAppUseSnackbarForProvideFeedbackToast then ReactModule.createElement(SnackbarWrapperModule, {
		autoDismissDelaySeconds = 5,
		titleText = p1.toastTitle or UseLocalizationResult.helpUsImprove,
		icon = p1.toastIcon,
		buttonText = p1.toastButtonText or UseLocalizationResult.giveFeedback,
		onButtonActivated = UseResult,
		closeSnackbar = UseResult1
	}) else ReactModule.createElement(Toast, {
		duration = 5,
		position = UDim2.new(0.5, 0, 0, UseSelectorFunction(function(p2)
			return p2.GlobalGuiInset or { left = 0, top = 0, right = 0, bottom = 0 }
		end).top + 20 + UseSelectorFunction(function(p2)
			return p2.TopBar.statusBarHeight
		end)),
		toastContent = {
			swipeUpDismiss = true,
			buttonText = p1.toastButtonText or UseLocalizationResult.giveFeedback,
			iconColorStyle = {
				Color = UseTokensResult.Inverse.Surface.Surface_0.Color3,
				Transparency = UseTokensResult.Inverse.Surface.Surface_0.Transparency
			},
			iconImage = p1.toastIcon,
			onActivated = UseResult,
			onAppeared = p1.onToastAppeared,
			onDismissed = UseResult1,
			toastTitle = p1.toastTitle or UseLocalizationResult.helpUsImprove,
			toastSubtitle = p1.toastSubtitle
		}
	})
end)