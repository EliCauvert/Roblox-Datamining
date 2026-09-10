local parent = script:FindFirstAncestor("BuildExperiencePlaytestLaunch").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local navigationModule = require(parent.Navigation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useNavigation = navigationModule.useNavigation
local useLocalization = localizationModule.Hooks.useLocalization
local appPage = robloxAppEnumsModule.AppPage
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local dialogSize = foundationModule.Enums.DialogSize

return function()
	-- upvalues: useDispatch (ref), useNavigation (ref), useAppPolicy (ref), useLocalization (ref), reactModule (ref), setCentralOverlay (ref), centralOverlayType (ref), dialogSize (ref), closeCentralOverlay (ref), appPage (ref), urlBuilder (ref)
	local var1 = useDispatch()
	local var2 = useNavigation()
	local var3 = useAppPolicy(function(p1)
		return p1.getWebViewSupport()
	end)
	local var4 = useLocalization({
		title = "Feature.Build.Action.Settings",
		body = "Feature.Build.Message.UpdateSettingsToPlaytest",
		updateSettings = "Feature.Build.Action.OpenSettings",
		cancel = "Feature.Build.Action.Cancel",
		ok = "CommonUI.Controls.Action.OK"
	})
	
	return reactModule.useCallback(function()
		-- upvalues: var1 (ref), setCentralOverlay (copy), centralOverlayType (copy), var4 (ref), var3 (ref), dialogSize (copy), closeCentralOverlay (copy), var2 (ref), appPage (copy), urlBuilder (copy)
		var1(setCentralOverlay(centralOverlayType.ConfirmationDialog, {
			orientButtonsVertically = true,
			showCloseButton = false,
			title = var4.title,
			body = var4.body,
			confirmButtonText = var4.updateSettings,
			cancelButtonText = if var3 then var4.cancel else var4.ok,
			hideConfirmButton = not var3,
			size = dialogSize.Small,
			onConfirm = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy), var2 (copy), appPage (copy), urlBuilder (copy), var4 (copy)
				var1(closeCentralOverlay())
				
				if var2 ~= nil then
					var2.push(appPage.GenericWebPage, {
						detail = urlBuilder.static.settings.account(),
						extraProps = { title = var4.updateSettings }
					})
				end
			end,
			onCancel = function()
				-- upvalues: var1 (copy), closeCentralOverlay (copy)
				var1(closeCentralOverlay())
			end
		}))
	end, {
		var1, var2, var3, var4.title, var4.body, var4.updateSettings, var4.cancel,
		var4.ok
	})
end