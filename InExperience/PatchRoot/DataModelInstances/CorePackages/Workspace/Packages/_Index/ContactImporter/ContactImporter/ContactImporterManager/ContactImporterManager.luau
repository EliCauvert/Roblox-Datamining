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
local fFlagSocialCarouselMigrateRecommendations = require(parent_1.SharedFlags).FFlagSocialCarouselMigrateRecommendations
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var11 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local friendsRecommendationsModule = require(parent_1.DataHydration.FriendsRecommendations)
local friendsRecommendationsStore = friendsRecommendationsModule.FriendsRecommendationsStore
local dataSource = friendsRecommendationsModule.Enums.DataSource
local var13 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var15 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p2) --[[ line: 204 ]]
	return {
		isContactImporterPolicyEnabled = p2.getContactImporterEnabled()
	}
end)(function(p0) --[[ line: 89 | named "Container" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), reactModule (ref), var11 (ref), useSignalState (ref), prefetchProfileNamesOnStartupV2 (ref), userIdExists (ref), var15 (ref), fFlagSocialCarouselMigrateRecommendations (ref), friendsRecommendationsStore (ref), dataSource (ref), useAutoSyncContacts (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var13 (ref), permissionsProtocol (ref)
	local var17 = useDispatch()
	local var18 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p0.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var19 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		local var20 = useSignalState(reactModule.useMemo(function() --[[ line: 102 ]]
			-- upvalues: var11 (copy)
			return var11.GetAllFriends()
		end, {}))
		var19 = if var20 then var20.friends else nil
		reactModule.useEffect(function() --[[ line: 109 ]]
			-- upvalues: var11 (copy)
			var11.GetOnlineFriends()
		end, {})
	end
	if prefetchProfileNamesOnStartupV2 then
		local var21 = var19
		reactModule.useEffect(function() --[[ line: 118 ]]
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
	if fFlagSocialCarouselMigrateRecommendations then
		reactModule.useEffect(function() --[[ line: 136 ]]
			-- upvalues: getAppFeaturePolicies (copy), friendsRecommendationsStore (copy), dataSource (copy)
			if getAppFeaturePolicies().getSocialGraphSyncEnabled() then
				friendsRecommendationsStore.get().getFriendsRecommendations(dataSource.HomepageFriendsCarousel)
			end
		end, { var18 })
	end
	useAutoSyncContacts()
	reactModule.useEffect(function() --[[ line: 146 ]]
		-- upvalues: userIdExists (copy), var18 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var11 (copy), var17 (ref), networkingFriends (copy)
		if userIdExists(var18) then
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var11.GetFriendsCountByUserId(tostring(var18))
				
				return
			end
			var17(networkingFriends.GetFriendsCountFromUserId.API(var18))
		end
	end, { var18 })
	reactModule.useEffect(function() --[[ line: 156 ]]
		-- upvalues: userIdExists (copy), var18 (ref), var17 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var18) then
			var17(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var18 }))
			local var24 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 161 ]]
				-- upvalues: var17 (copy), networkingFriends (copy), var18 (copy)
				var17(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var18 }))
			end, false, true)
			
			return function() --[[ line: 166 ]]
				-- upvalues: var24 (ref)
				var24:Disconnect()
			end
		end
		return function() --[[ line: 170 ]] end
	end, { var18 })
	local var22 = reactModule.useMemo(function() --[[ line: 173 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function() --[[ line: 183 ]]
		-- upvalues: appStorageService (copy), var13 (copy), permissionsProtocol (copy), var22 (ref)
		if appStorageService:GetItem(var13) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p1) --[[ line: 191 ]]
				-- upvalues: var22 (copy)
				var22.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p1 })
			end)
			appStorageService:SetItem(var13, "false")
			appStorageService:Flush()
		end
	end, { var18, var22 })
	
	return nil
end)