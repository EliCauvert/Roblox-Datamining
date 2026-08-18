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
local userProfilesModule = require(parent_1.UserProfiles)
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local universalAppPolicy = dependenciesModule.UniversalAppPolicy
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local networkingFriends = dependenciesModule.NetworkingFriends
local earlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local prefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local fFlagRegisterQRCodeKeyInEngine = require(parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine
local fFlagFriendsCountDataHydrationMigrationEnabled = require(parent_1.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var11 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local var12 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var14 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p2) --[[ line: 189 ]]
	return {
		isContactImporterPolicyEnabled = p2.getContactImporterEnabled()
	}
end)(function(p0) --[[ line: 82 | named "Container" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), reactModule (ref), var11 (ref), useSignalState (ref), prefetchProfileNamesOnStartupV2 (ref), userIdExists (ref), var14 (ref), useAutoSyncContacts (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var12 (ref), permissionsProtocol (ref)
	local var16 = useDispatch()
	local var17 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p0.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var18 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		local var19 = useSignalState(reactModule.useMemo(function() --[[ line: 95 ]]
			-- upvalues: var11 (copy)
			return var11.GetAllFriends()
		end, {}))
		var18 = if var19 then var19.friends else nil
		reactModule.useEffect(function() --[[ line: 102 ]]
			-- upvalues: var11 (copy)
			var11.GetOnlineFriends()
		end, {})
	end
	if prefetchProfileNamesOnStartupV2 then
		local var20 = var18
		reactModule.useEffect(function() --[[ line: 111 ]]
			-- upvalues: userIdExists (copy), var17 (ref), var20 (ref), var14 (copy)
			if userIdExists(var17) then
				local list = { tostring(var17) }
				
				if var20 then
					for i, v in var20 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var14.fetchNamesByUserIds(list)
			end
		end, { var17, var20 })
	end
	useAutoSyncContacts()
	reactModule.useEffect(function() --[[ line: 131 ]]
		-- upvalues: userIdExists (copy), var17 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var11 (copy), var16 (ref), networkingFriends (copy)
		if userIdExists(var17) then
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var11.GetFriendsCountByUserId(tostring(var17))
				
				return
			end
			var16(networkingFriends.GetFriendsCountFromUserId.API(var17))
		end
	end, { var17 })
	reactModule.useEffect(function() --[[ line: 141 ]]
		-- upvalues: userIdExists (copy), var17 (ref), var16 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var17) then
			var16(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var17 }))
			local var23 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 146 ]]
				-- upvalues: var16 (copy), networkingFriends (copy), var17 (copy)
				var16(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var17 }))
			end, false, true)
			
			return function() --[[ line: 151 ]]
				-- upvalues: var23 (ref)
				var23:Disconnect()
			end
		end
		return function() --[[ line: 155 ]] end
	end, { var17 })
	local var21 = reactModule.useMemo(function() --[[ line: 158 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function() --[[ line: 168 ]]
		-- upvalues: appStorageService (copy), var12 (copy), permissionsProtocol (copy), var21 (ref)
		if appStorageService:GetItem(var12) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p1) --[[ line: 176 ]]
				-- upvalues: var21 (copy)
				var21.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p1 })
			end)
			appStorageService:SetItem(var12, "false")
			appStorageService:Flush()
		end
	end, { var17, var21 })
	
	return nil
end)