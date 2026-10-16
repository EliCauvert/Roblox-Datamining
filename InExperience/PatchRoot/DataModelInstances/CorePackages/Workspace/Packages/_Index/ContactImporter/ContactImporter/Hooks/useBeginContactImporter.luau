local Parent = script:FindFirstAncestor("ContactImporter").Parent
local IXPService = game:GetService("IXPService")
local MessageBusService = game:GetService("MessageBusService")
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local PromiseModule = require(Parent.Promise)
local PermissionsProtocol = require(Parent.PermissionsProtocol).PermissionsProtocol
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local Default = PermissionsProtocol.default
local list = { PermissionsProtocol.Permissions.CONTACTS_ACCESS }
local EnumScreens = require(Parent.SocialModalsCommon).EnumScreens
local SettingsRoute = require(Parent.LinkingProtocol).Enums.SettingsRoute
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagCIDeeplinkEnabledForAll = SharedFlagsModule.FFlagCIDeeplinkEnabledForAll
local FFlagCiDeprecateFindFriendsModal = SharedFlagsModule.FFlagCiDeprecateFindFriendsModal
local FFlagAddFriendsPageFAEUpsell = SharedFlagsModule.FFlagAddFriendsPageFAEUpsell
local AutoPromptStatusModule = require(script.Parent.Parent.Signals.autoPromptStatus)
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")

return function(p1) --[[ Line: 39 | Named "useBeginContactImporter" ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), UseAppPolicyFunction (copy), GetDeepValueFunction (copy), EnumScreens (copy), FFlagCIDeeplinkEnabledForAll (copy), RoactAppExperimentModule (copy), AppUserLayers (copy), PermissionsProtocol (copy), FFlagAddFriendsPageFAEUpsell (copy), AutoPromptStatusModule (copy), Default (copy), list (copy), PromiseModule (copy), FFlagCiDeprecateFindFriendsModal (copy), SettingsRoute (copy), IXPService (copy), MessageBusService (copy), RealtimeMessageId (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2) --[[ Line: 43 ]]
		return p2.getContactImporterEnabled()
	end)
	local EntryPoint = p1 and p1.entryPoint or nil
	local IsContactImporterMatch = (GetDeepValueFunction(UseNavigationResult, "state.routeName") or {}) == EnumScreens.ContactImporter
	local UseAppPolicyResult1 = UseAppPolicyFunction(function(p2) --[[ Line: 51 ]]
		return p2.getContactImporterEncouraged()
	end)
	local UseUserExperimentResult = if FFlagCIDeeplinkEnabledForAll then nil else RoactAppExperimentModule.useUserExperiment({
		AppUserLayers.ContactImporterDevicePermissionNeededModalExposure
	}, function(p2) --[[ Line: 61 ]]
		-- upvalues: AppUserLayers (upval)
		return (p2[AppUserLayers.ContactImporterDevicePermissionNeededModalExposure] or {}).systemSettingsDeeplinkEnabled
	end, false)
	local NoUseAppPolicyResult1 = not UseAppPolicyResult1
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 70 ]]
		-- upvalues: PermissionsProtocol (upval), UseStateResult2 (copy), UseNavigationResult (copy), EnumScreens (upval), EntryPoint (copy)
		local IsStatusMatch = p2.status == PermissionsProtocol.Status.AUTHORIZED
		UseStateResult2(IsStatusMatch)
		
		if IsStatusMatch then
			UseNavigationResult.navigate(EnumScreens.ContactsList, { shouldUpdateUserSettings = true, entrypoint = EntryPoint })
		end
	end, { UseNavigationResult, EntryPoint })
	local UseResult1 = ReactModule.useCallback(function(p2) --[[ Line: 82 ]]
		-- upvalues: PermissionsProtocol (upval), UseStateResult2 (copy), FFlagAddFriendsPageFAEUpsell (upval), AutoPromptStatusModule (upval), UseAppPolicyResult1 (copy), Default (upval), list (upval), UseResult (copy), PromiseModule (upval)
		local Status = p2.status
		
		if Status == PermissionsProtocol.Status.AUTHORIZED then
			UseStateResult2(true)
			
			if FFlagAddFriendsPageFAEUpsell then
				AutoPromptStatusModule.setStatus(false)
			end
		elseif Status == PermissionsProtocol.Status.DENIED then
			if UseAppPolicyResult1 then
				if FFlagAddFriendsPageFAEUpsell then
					local ClockTime = os.clock()
					Default:requestPermissions(list):andThen(function(Result) --[[ Line: 101 ]]
						-- upvalues: ClockTime (copy), PermissionsProtocol (upval), AutoPromptStatusModule (upval)
						AutoPromptStatusModule.setStatus(os.clock() - ClockTime >= 0.5 or Result.status == PermissionsProtocol.Status.AUTHORIZED)
						
						return Result
					end):andThen(UseResult)
				else
					Default:requestPermissions(list):andThen(UseResult)
				end
			elseif FFlagAddFriendsPageFAEUpsell then
				AutoPromptStatusModule.setStatus(false)
			end
		elseif FFlagAddFriendsPageFAEUpsell then
			AutoPromptStatusModule.setStatus(false)
		end
		return PromiseModule.resolve(p2.status)
	end, { UseResult, UseAppPolicyResult1 })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: FFlagCiDeprecateFindFriendsModal (upval), IsContactImporterMatch (copy), Default (upval), list (upval), PermissionsProtocol (upval), UseStateResult2 (copy), UseNavigationResult (copy), EnumScreens (upval), EntryPoint (copy), SettingsRoute (upval), UseAppPolicyResult1 (copy), UseStateResult (copy), FFlagCIDeeplinkEnabledForAll (upval), IXPService (upval), AppUserLayers (upval), UseUserExperimentResult (ref), NoUseAppPolicyResult1 (copy)
		if FFlagCiDeprecateFindFriendsModal and IsContactImporterMatch then
			Default:requestPermissions(list):andThen(function(Result) --[[ Line: 123 ]]
				-- upvalues: PermissionsProtocol (upval), UseStateResult2 (upval), UseNavigationResult (upval), EnumScreens (upval), EntryPoint (upval), SettingsRoute (upval)
				if Result.status == PermissionsProtocol.Status.AUTHORIZED then
					UseStateResult2(true)
					UseNavigationResult.replace(EnumScreens.ContactsList, { entrypoint = EntryPoint })
					
					return
				else
					UseNavigationResult.replace(EnumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = SettingsRoute.Contacts })
				end
			end)
			
			return
		end
		if UseAppPolicyResult1 then
			if UseStateResult then
				UseNavigationResult.navigate(EnumScreens.ContactsList, { entrypoint = EntryPoint })
				
				return
			end
			if not FFlagCIDeeplinkEnabledForAll then
				IXPService:LogUserLayerExposure(AppUserLayers.ContactImporterDevicePermissionNeededModalExposure)
			end
			if UseUserExperimentResult or FFlagCIDeeplinkEnabledForAll then
				UseNavigationResult.navigate(EnumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = SettingsRoute.Contacts })
				
				return
			else
				UseNavigationResult.navigate(EnumScreens.ContactsRevokedAccessDialog)
				
				return
			end
		elseif NoUseAppPolicyResult1 then
			Default:requestPermissions(list):andThen(function(Result) --[[ Line: 154 ]]
				-- upvalues: PermissionsProtocol (upval), UseNavigationResult (upval), EnumScreens (upval), EntryPoint (upval), FFlagCIDeeplinkEnabledForAll (upval), IXPService (upval), AppUserLayers (upval), UseUserExperimentResult (upval), SettingsRoute (upval)
				if Result.status == PermissionsProtocol.Status.AUTHORIZED then
					UseNavigationResult.navigate(EnumScreens.ContactsList, { entrypoint = EntryPoint })
					
					return
				end
				if not FFlagCIDeeplinkEnabledForAll then
					IXPService:LogUserLayerExposure(AppUserLayers.ContactImporterDevicePermissionNeededModalExposure)
				end
				if UseUserExperimentResult or FFlagCIDeeplinkEnabledForAll then
					UseNavigationResult.navigate(EnumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = SettingsRoute.Contacts })
					
					return
				else
					UseNavigationResult.navigate(EnumScreens.ContactsRevokedAccessDialog)
				end
			end)
			
			return
		else
		end
	end, {
		UseStateResult, UseAppPolicyResult, UseAppPolicyResult1, NoUseAppPolicyResult1,
		EntryPoint, UseUserExperimentResult
	})
	ReactModule.useEffect(function() --[[ Line: 189 ]]
		-- upvalues: FFlagAddFriendsPageFAEUpsell (upval), AutoPromptStatusModule (upval), Default (upval), list (upval), UseAppPolicyResult (copy), UseAppPolicyResult1 (copy), NoUseAppPolicyResult1 (copy), UseResult1 (copy)
		if FFlagAddFriendsPageFAEUpsell then
			AutoPromptStatusModule.setStatus(nil)
		end
		local HasPermissions = Default:hasPermissions(list)
		
		if UseAppPolicyResult and (UseAppPolicyResult1 or NoUseAppPolicyResult1) then
			HasPermissions:andThen(UseResult1)
		elseif FFlagAddFriendsPageFAEUpsell then
			AutoPromptStatusModule.setStatus(false)
		end
		return if FFlagAddFriendsPageFAEUpsell then function() --[[ Line: 203 ]]
			-- upvalues: AutoPromptStatusModule (upval)
			AutoPromptStatusModule.setStatus(nil)
		end else nil
	end, {
		UseAppPolicyResult,
		UseAppPolicyResult1,
		NoUseAppPolicyResult1
	})
	ReactModule.useEffect(function() --[[ Line: 211 ]]
		-- upvalues: UseUserExperimentResult (ref), FFlagCIDeeplinkEnabledForAll (upval), MessageBusService (upval), RealtimeMessageId (upval), Default (upval), list (upval), PermissionsProtocol (upval), UseStateResult2 (copy)
		if UseUserExperimentResult or FFlagCIDeeplinkEnabledForAll then
			local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, function() --[[ Line: 213 ]]
				-- upvalues: Default (upval), list (upval), PermissionsProtocol (upval), UseStateResult2 (upval)
				Default:hasPermissions(list):andThen(function(Result) --[[ Line: 214 ]]
					-- upvalues: PermissionsProtocol (upval), UseStateResult2 (upval)
					if Result and Result.status == PermissionsProtocol.Status.AUTHORIZED then
						UseStateResult2(true)
					end
				end)
			end, false, true)
			
			return function() --[[ Line: 221 ]]
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:Disconnect()
			end
		else
			return nil
		end
	end, { UseUserExperimentResult })
	
	if not UseAppPolicyResult then
		return nil, nil
	elseif UseAppPolicyResult1 or NoUseAppPolicyResult1 then
		return UseStateResult, UseResult2
	else
		return nil, nil
	end
end