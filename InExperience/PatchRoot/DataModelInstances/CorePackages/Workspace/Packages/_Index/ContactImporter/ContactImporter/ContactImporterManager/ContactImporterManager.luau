local parent = script.Parent.Parent
local appStorageService = game:GetService("AppStorageService")
local messageBusService = game:GetService("MessageBusService")
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local dashModule = require(parent_1.Dash)
local cryoModule = require(parent_1.Cryo)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local socialCommonModule = require(parent_1.SocialCommon)
local useQuery = require(parent_1.ApolloClient).useQuery
local apolloFriendsModule = require(parent_1.ApolloFriends)
local queries = require(parent_1.ApolloLocalState).queries
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
local paginatedFriendsCarouselIXPModule = require(parent.Experiments.PaginatedFriendsCarouselIXP)
local earlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local prefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local fIntFriendsCarouselInitialFetchSize = require(parent_1.SharedFlags).FIntFriendsCarouselInitialFetchSize
local fFlagRegisterQRCodeKeyInEngine = require(parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine
local fFlagFriendsCountDataHydrationMigrationEnabled = require(parent_1.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local fFlagAddFriendsPageUseSections = require(parent_1.SharedFlags).FFlagAddFriendsPageUseSections
local fFlagSocialCarouselMigrateRecommendations = require(parent_1.SharedFlags).FFlagSocialCarouselMigrateRecommendations
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent_1.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var1 = require(parent_1.DataHydration).Friends.FriendsStore.get()
local friendsRequestsStore = require(parent_1.DataHydration.FriendsRequests).FriendsRequestsStore
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
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), paginatedFriendsCarouselIXPModule (ref), apolloFriendsModule (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), reactModule (ref), var1 (ref), useSignalState (ref), useQuery (ref), queries (ref), userIdExists (ref), cryoModule (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchProfileNamesOnStartupV2 (ref), var3 (ref), fFlagSocialCarouselMigrateRecommendations (ref), friendsRecommendationsStore (ref), dataSource (ref), useAutoSyncContacts (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), networkingFriends (ref), fFlagAddFriendsPageUseSections (ref), friendsRequestsStore (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var2 (ref), permissionsProtocol (ref)
	local var4
	local var5 = useDispatch()
	local var6 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p1.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var7 = nil
	local var8 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		var4, var25 = paginatedFriendsCarouselIXPModule.usePaginatedFriendsCarouselExperiment()
		local t_1 = {
			userId = var6,
			sort = if var4 and var25 then var25 else apolloFriendsModule.Enums.Sort.FriendshipScore
		}
		
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local var9 = useSignalState(reactModule.useMemo(function()
				-- upvalues: var1 (copy)
				return var1.GetAllFriends()
			end, {}))
			var8 = if var9 then var9.friends else nil
			reactModule.useEffect(function()
				-- upvalues: var1 (copy)
				var1.GetOnlineFriends()
			end, {})
		else
			var7 = useQuery(queries.allFriendsByUserId, {
				errorPolicy = "all",
				notifyOnNetworkStatusChange = true,
				skip = not var4 or not userIdExists(var6),
				variables = cryoModule.Dictionary.join(t_1, {
					pageCursor = "",
					pageLimit = fIntFriendsCarouselInitialFetchSize
				})
			})
			useQuery(queries.onlineFriendsByUserId, {
				notifyOnNetworkStatusChange = true,
				skip = not var4 or not userIdExists(var6),
				variables = t_1
			})
		end
	end
	if prefetchProfileNamesOnStartupV2 then
		var4 = if fFlagFriendSortedByPresenceSignalsImplementation then var8 else var7 and (var7.data and (var7.data.allFriendsByUserId and var7.data.allFriendsByUserId.friends))
		reactModule.useEffect(function()
			-- upvalues: userIdExists (copy), var6 (ref), var4 (ref), var3 (copy)
			if userIdExists(var6) then
				local list = { tostring(var6) }
				
				if var4 then
					for i, v in var4 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var3.fetchNamesByUserIds(list)
			end
		end, { var6, var4 })
	end
	if fFlagSocialCarouselMigrateRecommendations then
		reactModule.useEffect(function()
			-- upvalues: getAppFeaturePolicies (copy), friendsRecommendationsStore (copy), dataSource (copy)
			if getAppFeaturePolicies().getSocialGraphSyncEnabled() then
				friendsRecommendationsStore.get().getFriendsRecommendations(dataSource.HomepageFriendsCarousel)
			end
		end, { var6 })
	end
	useAutoSyncContacts()
	reactModule.useEffect(function()
		-- upvalues: userIdExists (copy), var6 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var1 (copy), var5 (ref), networkingFriends (copy)
		if userIdExists(var6) then
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var1.GetFriendsCountByUserId(tostring(var6))
				
				return
			end
			var5(networkingFriends.GetFriendsCountFromUserId.API(var6))
		end
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: userIdExists (copy), var6 (ref), fFlagAddFriendsPageUseSections (copy), friendsRequestsStore (copy), var5 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if not userIdExists(var6) then
			return function() end
		elseif fFlagAddFriendsPageUseSections then
			friendsRequestsStore.get().getNewFriendsRequestCount()
		else
			var5(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var6 }))
		end
		local var10 = messageBusService:Subscribe(realtimeMessageId, function()
			-- upvalues: fFlagAddFriendsPageUseSections (copy), friendsRequestsStore (copy), var5 (copy), networkingFriends (copy), var6 (copy)
			if fFlagAddFriendsPageUseSections then
				friendsRequestsStore.get().refetchNewFriendRequestCount()
				
				return
			end
			var5(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var6 }))
		end, false, true)
		
		return function()
			-- upvalues: var10 (ref)
			var10:Disconnect()
		end
	end, { var6 })
	var4 = reactModule.useMemo(function()
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function()
		-- upvalues: appStorageService (copy), var2 (copy), permissionsProtocol (copy), var4 (ref)
		if appStorageService:GetItem(var2) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p2)
				-- upvalues: var4 (copy)
				var4.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p2 })
			end)
			appStorageService:SetItem(var2, "false")
			appStorageService:Flush()
		end
	end, { var6, var4 })
	
	return nil
end)