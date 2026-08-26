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
local var1 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local friendsRecommendationsModule = require(parent_1.DataHydration.FriendsRecommendations)
local friendsRecommendationsStore = friendsRecommendationsModule.FriendsRecommendationsStore
local dataSource = friendsRecommendationsModule.Enums.DataSource
local var2 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var3 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p1)
	return {
		isContactImporterPolicyEnabled = p1.getContactImporterEnabled()
	}
end)(function(p1)
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), reactModule (ref), var1 (ref), useSignalState (ref), prefetchProfileNamesOnStartupV2 (ref), userIdExists (ref), var3 (ref), fFlagSocialCarouselMigrateRecommendations (ref), friendsRecommendationsStore (ref), dataSource (ref), useAutoSyncContacts (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var2 (ref), permissionsProtocol (ref)
	local var4 = useDispatch()
	local var5 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p1.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var6 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		local var7 = useSignalState(reactModule.useMemo(function()
			-- upvalues: var1 (copy)
			return var1.GetAllFriends()
		end, {}))
		var6 = if var7 then var7.friends else nil
		reactModule.useEffect(function()
			-- upvalues: var1 (copy)
			var1.GetOnlineFriends()
		end, {})
	end
	if prefetchProfileNamesOnStartupV2 then
		local var8 = var6
		reactModule.useEffect(function()
			-- upvalues: userIdExists (copy), var5 (ref), var8 (ref), var3 (copy)
			if userIdExists(var5) then
				local list = { tostring(var5) }
				
				if var8 then
					for i, v in var8 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var3.fetchNamesByUserIds(list)
			end
		end, { var5, var8 })
	end
	if fFlagSocialCarouselMigrateRecommendations then
		reactModule.useEffect(function()
			-- upvalues: getAppFeaturePolicies (copy), friendsRecommendationsStore (copy), dataSource (copy)
			if getAppFeaturePolicies().getSocialGraphSyncEnabled() then
				friendsRecommendationsStore.get().getFriendsRecommendations(dataSource.HomepageFriendsCarousel)
			end
		end, { var5 })
	end
	useAutoSyncContacts()
	reactModule.useEffect(function()
		-- upvalues: userIdExists (copy), var5 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var1 (copy), var4 (ref), networkingFriends (copy)
		if userIdExists(var5) then
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var1.GetFriendsCountByUserId(tostring(var5))
				
				return
			end
			var4(networkingFriends.GetFriendsCountFromUserId.API(var5))
		end
	end, { var5 })
	reactModule.useEffect(function()
		-- upvalues: userIdExists (copy), var5 (ref), var4 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var5) then
			var4(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var5 }))
			local var9 = messageBusService:Subscribe(realtimeMessageId, function()
				-- upvalues: var4 (copy), networkingFriends (copy), var5 (copy)
				var4(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var5 }))
			end, false, true)
			
			return function()
				-- upvalues: var9 (ref)
				var9:Disconnect()
			end
		end
		return function() end
	end, { var5 })
	local var9 = reactModule.useMemo(function()
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: appStorageService (copy), var2 (copy), permissionsProtocol (copy), var9 (ref)
		if appStorageService:GetItem(var2) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p2)
				-- upvalues: var9 (copy)
				var9.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p2 })
			end)
			appStorageService:SetItem(var2, "false")
			appStorageService:Flush()
		end
	end, { var5, var9 })
	
	return nil
end)