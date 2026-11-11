local CorePackages = game:GetService("CorePackages")
local Modules = script:FindFirstAncestor("Modules")
local AppNotificationService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppNotificationService
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local PermissionsProtocol = require(CorePackages.Workspace.Packages.PermissionsProtocol).PermissionsProtocol
local ProfileQRCodeModule = require(CorePackages.Workspace.Packages.ProfileQRCode)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local OverlayTypeModule = require(Modules.LuaApp.Enum.OverlayType)
local RobloxEventReceiver = require(CorePackages.Workspace.Packages.RealtimeDelivery).RobloxEventReceiver
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local SettingsRoute = require(CorePackages.Workspace.Packages.LinkingProtocol).Enums.SettingsRoute
local SetTabBarVisibleFunction = require(CorePackages.Workspace.Packages.AppTabBarRodux).Actions.SetTabBarVisible
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local FFlagQRCodeScannerDeeplinkEnabledForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRCodeScannerDeeplinkEnabledForAll
local FFlagQRInSearchScanner = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchScanner
local FFlagQRInSearchProfileQR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagQRInSearchProfileQR
local FFlagSocialCarouselShareQREnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSocialCarouselShareQREnabled
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceModule (copy), AppNotificationService (copy), ReactModule (copy), RobloxEventReceiver (copy), FFlagQRInSearchScanner (copy), FFlagQRInSearchProfileQR (copy), SetTabBarVisibleFunction (copy), FFlagSocialCarouselShareQREnabled (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), FFlagQRCodeScannerDeeplinkEnabledForAll (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), PermissionsProtocol (copy), AppPageModule (copy), NavigateDownModule (copy), SetCentralOverlayModule (copy), OverlayTypeModule (copy), SettingsRoute (copy), RoactModule (copy), ProfileQRCodeModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppNotificationService)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: RobloxEventReceiver (upval), UseRoactServiceModuleResult (copy)
		return RobloxEventReceiver.new(UseRoactServiceModuleResult)
	end, { UseRoactServiceModuleResult })
	
	if FFlagQRInSearchScanner or FFlagQRInSearchProfileQR then
		ReactModule.useEffect(function()
			-- upvalues: UseDispatchResult (copy), SetTabBarVisibleFunction (upval)
			UseDispatchResult(SetTabBarVisibleFunction(false))
		end, { UseDispatchResult })
	end
	local UseUserExperimentResult = if FFlagQRCodeScannerDeeplinkEnabledForAll then nil else UseUserExperimentFunction({ AppUserLayers.ProfileQRCodeScannerLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.ProfileQRCodeScannerLayer] or {}).systemSettingsDeeplinkEnabled
	end, false)
	
	return RoactModule.createElement(ProfileQRCodeModule.ProfileQRCodeEntryPoint, {
		robloxEventReceiver = UseMemoResult,
		source = p1.source,
		onClose = ReactModule.useCallback(function()
			-- upvalues: FFlagSocialCarouselShareQREnabled (upval), p1 (copy), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackModule (upval)
			if FFlagSocialCarouselShareQREnabled and p1.onClose then
				p1.onClose()
				
				return
			end
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(true)
				
				return
			else
				UseDispatchResult(NavigateBackModule(true))
			end
		end, {
			if FFlagSocialCarouselShareQREnabled then p1.onClose else nil,
			if FFlagSocialCarouselShareQREnabled then UseDispatchResult else nil
		}),
		openQrCodeScanner = ReactModule.useCallback(function()
			-- upvalues: PermissionsProtocol (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateDownModule (upval), FFlagQRCodeScannerDeeplinkEnabledForAll (upval), UseUserExperimentResult (copy), SetCentralOverlayModule (upval), OverlayTypeModule (upval), SettingsRoute (upval)
			PermissionsProtocol.default:checkOrRequestPermissions({ PermissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(Result)
				-- upvalues: PermissionsProtocol (upval), AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownModule (upval), FFlagQRCodeScannerDeeplinkEnabledForAll (upval), UseUserExperimentResult (upval), SetCentralOverlayModule (upval), OverlayTypeModule (upval), SettingsRoute (upval)
				if Result == PermissionsProtocol.Status.AUTHORIZED then
					local config = { name = AppPageModule.ScanQrCode }
					
					if FFlagSignalsNavP3Dispatch then
						NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
						
						return
					else
						UseDispatchResult(NavigateDownModule(config))
						
						return
					end
				elseif FFlagQRCodeScannerDeeplinkEnabledForAll or UseUserExperimentResult then
					UseDispatchResult(SetCentralOverlayModule(OverlayTypeModule.SettingsPermissionInteractiveAlert, { settingsRoute = SettingsRoute.Camera }))
					
					return
				else
					UseDispatchResult(SetCentralOverlayModule(OverlayTypeModule.CameraPermissionPrompt))
				end
			end)
		end, { UseUserExperimentResult })
	})
end