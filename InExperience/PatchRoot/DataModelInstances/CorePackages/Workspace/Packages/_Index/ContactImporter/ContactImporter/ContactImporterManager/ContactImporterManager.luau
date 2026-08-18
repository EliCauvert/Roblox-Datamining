local parent = script.Parent.Parent
local appStorageService = game:GetService("AppStorageService")
local messageBusService = game:GetService("MessageBusService")
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local socialCommonModule = require(parent_1.SocialCommon)
local socialLuaAnalyticsModule = require(parent_1.SocialLuaAnalytics)
local analyticsFactory = socialLuaAnalyticsModule.Analytics.AnalyticsFactory
local defaultAnalyticsService = socialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local eventTypes = socialLuaAnalyticsModule.Analytics.Enums.EventTypes
local contexts = socialLuaAnalyticsModule.Analytics.Enums.Contexts
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local useFetchContactImporterInfoOnce = require(parent.Utils).useFetchContactImporterInfoOnce
local useAutoSyncContacts = require(parent.Utils).useAutoSyncContacts
local userIdExists = socialCommonModule.Utils.userIdExists
local permissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol
local rolloutByApplicationId = require(parent_1.AppCommonLib).rolloutByApplicationId
local userProfilesModule = require(parent_1.UserProfiles)
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local universalAppPolicy = dependenciesModule.UniversalAppPolicy
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local networkingFriends = dependenciesModule.NetworkingFriends
local earlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local prefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local fFlagRegisterQRCodeKeyInEngine = require(parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var11 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local var12 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local var13 = rolloutByApplicationId(function() --[[ line: 47 ]]
	return game:DefineFastInt("CallFriendCountAtStartupRollout", 0)
end)
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var15 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p2) --[[ line: 190 ]]
	return {
		isContactImporterPolicyEnabled = p2.getContactImporterEnabled()
	}
end)(function(p0) --[[ line: 85 | named "Container" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), reactModule (ref), var11 (ref), useSignalState (ref), prefetchProfileNamesOnStartupV2 (ref), userIdExists (ref), var15 (ref), useAutoSyncContacts (ref), var13 (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var12 (ref), permissionsProtocol (ref)
	local var17 = useDispatch()
	local var18 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p0.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var19 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		local var20 = useSignalState(reactModule.useMemo(function() --[[ line: 98 ]]
			-- upvalues: var11 (copy)
			return var11.GetAllFriends()
		end, {}))
		var19 = if var20 then var20.friends else nil
		reactModule.useEffect(function() --[[ line: 105 ]]
			-- upvalues: var11 (copy)
			var11.GetOnlineFriends()
		end, {})
	end
	if prefetchProfileNamesOnStartupV2 then
		local var21 = var19
		reactModule.useEffect(function() --[[ line: 114 ]]
			-- upvalues: userIdExists (copy), var18 (ref), var21 (ref), var15 (copy)
			if userIdExists(var18) then
				local list = { tostring(var18) }
				
				if var21 then
					for i, v in var21 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var15.fetchNamesByUserIds(list)
			end
		end, { var18, var21 })
	end
	useAutoSyncContacts()
	
	if var13() then
		reactModule.useEffect(function() --[[ line: 135 ]]
			-- upvalues: userIdExists (copy), var18 (ref), var17 (ref), networkingFriends (copy)
			if userIdExists(var18) then
				var17(networkingFriends.GetFriendsCountFromUserId.API(var18))
			end
		end, { var18 })
	end
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: userIdExists (copy), var18 (ref), var17 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var18) then
			var17(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var18 }))
			local var24 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 147 ]]
				-- upvalues: var17 (copy), networkingFriends (copy), var18 (copy)
				var17(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var18 }))
			end, false, true)
			
			return function() --[[ line: 152 ]]
				-- upvalues: var24 (ref)
				var24:Disconnect()
			end
		end
		return function() --[[ line: 156 ]] end
	end, { var18 })
	local var22 = reactModule.useMemo(function() --[[ line: 159 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function() --[[ line: 169 ]]
		-- upvalues: appStorageService (copy), var12 (copy), permissionsProtocol (copy), var22 (ref)
		if appStorageService:GetItem(var12) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p1) --[[ line: 177 ]]
				-- upvalues: var22 (copy)
				var22.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p1 })
			end)
			appStorageService:SetItem(var12, "false")
			appStorageService:Flush()
		end
	end, { var18, var22 })
	
	return nil
end)