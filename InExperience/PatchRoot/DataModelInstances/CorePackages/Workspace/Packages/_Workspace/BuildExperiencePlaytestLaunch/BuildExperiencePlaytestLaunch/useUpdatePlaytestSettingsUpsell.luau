local Parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local CentralOverlayModule = require(Parent.CentralOverlay)
local ReactModule = require(Parent.React)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppPage = RobloxAppEnumsModule.AppPage
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local DialogSize = require(Parent.Foundation).Enums.DialogSize

return function()
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAppPolicyFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), DialogSize (copy), CloseCentralOverlayFunction (copy), AppPage (copy), UrlBuilder (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getWebViewSupport()
	end)
	local FeatureBuildActionSettings = UseLocalizationFunction({
		title = "Feature.Build.Action.Settings",
		body = "Feature.Build.Message.UpdateSettingsToPlaytest",
		updateSettings = "Feature.Build.Action.OpenSettings",
		cancel = "Feature.Build.Action.Cancel",
		ok = "CommonUI.Controls.Action.OK"
	})
	
	return (ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), FeatureBuildActionSettings (copy), UseAppPolicyResult (copy), DialogSize (upval), CloseCentralOverlayFunction (upval), UseNavigationResult (copy), AppPage (upval), UrlBuilder (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.ConfirmationDialog, {
			orientButtonsVertically = true,
			showCloseButton = false,
			title = FeatureBuildActionSettings.title,
			body = FeatureBuildActionSettings.body,
			confirmButtonText = FeatureBuildActionSettings.updateSettings,
			cancelButtonText = if UseAppPolicyResult then FeatureBuildActionSettings.cancel else FeatureBuildActionSettings.ok,
			hideConfirmButton = not UseAppPolicyResult,
			size = DialogSize.Small,
			onConfirm = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval), UseNavigationResult (upval), AppPage (upval), UrlBuilder (upval), FeatureBuildActionSettings (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
				
				if UseNavigationResult ~= nil then
					UseNavigationResult.push(AppPage.GenericWebPage, {
						detail = UrlBuilder.static.settings.account(),
						extraProps = { title = FeatureBuildActionSettings.updateSettings }
					})
				end
			end,
			onCancel = function()
				-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
				UseDispatchResult(CloseCentralOverlayFunction())
			end
		}))
	end, {
		UseDispatchResult, UseNavigationResult, UseAppPolicyResult,
		FeatureBuildActionSettings.title, FeatureBuildActionSettings.body,
		FeatureBuildActionSettings.updateSettings, FeatureBuildActionSettings.cancel,
		FeatureBuildActionSettings.ok
	}))
end