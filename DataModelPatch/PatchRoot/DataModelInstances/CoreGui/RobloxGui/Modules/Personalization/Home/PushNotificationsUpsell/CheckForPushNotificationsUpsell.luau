local IXPService = game:GetService("IXPService")
local Players = game:GetService("Players")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local Default = require(CorePackages.Workspace.Packages.LoggingProtocol).default
local WaitUntilIXPUserInitModule = require(Modules.LuaApp.Thunks.WaitUntilIXPUserInit)
local NotificationsUpsellModule = require(CorePackages.Workspace.Packages.NotificationsUpsell)
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local AppPageModule = require(Modules.LuaApp.AppPage)
local AppStartupModule = require(CorePackages.Workspace.Packages.AppStartup)
local UseLaunchContextFunction = AppStartupModule.Hooks.useLaunchContext
local LaunchContext = AppStartupModule.Enums.LaunchContext
local GetFStringPushUpsellVariantNameFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringPushUpsellVariantName
local GetFStringPushUpsellOnFirstTimeVariantNameFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringPushUpsellOnFirstTimeVariantName
local GetFFlagLuaAppPushSystemUpsellDevOverrideFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppPushSystemUpsellDevOverride
local GetFFlagLuaAppEnablePushUpsellOnFirstTimeFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnablePushUpsellOnFirstTime
local SetupPushNotificationsUpsell = NotificationsUpsellModule.setupPushNotificationsUpsell
local NotificationsUpsellConstants = NotificationsUpsellModule.NotificationsUpsellConstants
local PushUpsellEventConfig = NotificationsUpsellModule.PushUpsellEventConfig
local ModalEventConstants = NotificationsUpsellModule.ModalEventConstants

return function(_)
	-- upvalues: UseDispatchFunction (copy), UseLaunchContextFunction (copy), ReactModule (copy), LaunchContext (copy), UseUserExperimentFunction (copy), AppUserLayers (copy), GetFStringPushUpsellVariantNameFunction (copy), GetFStringPushUpsellOnFirstTimeVariantNameFunction (copy), UseSelectorFunction (copy), AppPageModule (copy), Players (copy), WaitUntilIXPUserInitModule (copy), IXPService (copy), GetFFlagLuaAppPushSystemUpsellDevOverrideFunction (copy), GetFFlagLuaAppEnablePushUpsellOnFirstTimeFunction (copy), SetupPushNotificationsUpsell (copy), NotificationsUpsellConstants (copy), ModalEventConstants (copy), Default (copy), PushUpsellEventConfig (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLaunchContextResult = UseLaunchContextFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(UseLaunchContextResult ~= nil and (UseLaunchContextResult == LaunchContext.SignUp or UseLaunchContextResult == LaunchContext.Login))
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.PushNotificationPrompt }, function(p1)
		-- upvalues: AppUserLayers (upval), GetFStringPushUpsellVariantNameFunction (upval), GetFStringPushUpsellOnFirstTimeVariantNameFunction (upval)
		local v1 = p1[AppUserLayers.PushNotificationPrompt] or {}
		
		return {
			pushUpsellVariant = v1[GetFStringPushUpsellVariantNameFunction()] or -1,
			pushUpsellOnFirstTimeVariant = v1[GetFStringPushUpsellOnFirstTimeVariantNameFunction()] or -1
		}
	end)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: AppPageModule (upval)
		return p1.Personalization.PageSessionTimestamp[AppPageModule.Home]
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), Players (upval), UseDispatchResult (copy), WaitUntilIXPUserInitModule (upval), IXPService (upval), UseStateResult2 (copy)
		if not UseStateResult then
			UseDispatchResult(WaitUntilIXPUserInitModule(IXPService, Players.LocalPlayer and Players.LocalPlayer.UserId or 0)):andThen(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseStateResult (copy), UseUserExperimentResult (copy), GetFFlagLuaAppPushSystemUpsellDevOverrideFunction (upval), GetFFlagLuaAppEnablePushUpsellOnFirstTimeFunction (upval), UseRefResult (copy), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval), IXPService (upval), AppUserLayers (upval), ModalEventConstants (upval), Default (upval), PushUpsellEventConfig (upval), AppPageModule (upval)
		local Flag = true
		
		if UseSelectorResult == nil then
			return function() end
		end
		if UseStateResult and UseUserExperimentResult.pushUpsellVariant ~= nil and UseUserExperimentResult.pushUpsellVariant > -1 or GetFFlagLuaAppPushSystemUpsellDevOverrideFunction() then
			if (not GetFFlagLuaAppEnablePushUpsellOnFirstTimeFunction() or UseUserExperimentResult.pushUpsellVariant ~= 1 or UseUserExperimentResult.pushUpsellOnFirstTimeVariant ~= 1) and UseRefResult.current then
				UseRefResult.current = false
				
				return function() end
			end
			local IsPushUpsellVariantMatch: boolean = not GetFFlagLuaAppPushSystemUpsellDevOverrideFunction() and UseUserExperimentResult.pushUpsellVariant == 2
			SetupPushNotificationsUpsell.ShouldShowUpsell(NotificationsUpsellConstants.ModalKey.PushUpsellHome, IsPushUpsellVariantMatch):andThen(function(Result)
				-- upvalues: Flag (ref), IXPService (upval), AppUserLayers (upval), UseUserExperimentResult (upval), GetFFlagLuaAppPushSystemUpsellDevOverrideFunction (upval), IsPushUpsellVariantMatch (copy), ModalEventConstants (upval), Default (upval), PushUpsellEventConfig (upval), AppPageModule (upval), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
				if Flag and Result then
					IXPService:LogUserLayerExposure(AppUserLayers.PushNotificationPrompt)
					
					if UseUserExperimentResult.pushUpsellVariant > 0 or GetFFlagLuaAppPushSystemUpsellDevOverrideFunction() then
						Default:logRobloxTelemetryEvent(PushUpsellEventConfig, {}, {
							[ModalEventConstants.ActionType] = ModalEventConstants.ShouldRequest,
							[ModalEventConstants.EntryPoint] = AppPageModule.Home
						}, if IsPushUpsellVariantMatch then ModalEventConstants.ModalContextPushEduUpsell else ModalEventConstants.ModalContextSysUpsell)
						SetupPushNotificationsUpsell.OpenModal(NotificationsUpsellConstants.ModalKey.PushUpsellHome, IsPushUpsellVariantMatch, AppPageModule.Home)
					end
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref), SetupPushNotificationsUpsell (upval), NotificationsUpsellConstants (upval)
			Flag = false
			SetupPushNotificationsUpsell.CloseModal(NotificationsUpsellConstants.ModalKey.PushUpsellHome)
		end
	end, { UseStateResult, UseSelectorResult })
	
	return nil
end