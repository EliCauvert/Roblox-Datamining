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
local rolloutByApplicationId = require(parent_1.AppCommonLib).rolloutByApplicationId
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
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent_1.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var14 = if fFlagFriendSortedByPresenceSignalsImplementation then require(parent_1.DataHydration).Friends.FriendsStore.get() else nil
local var15 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local var16 = rolloutByApplicationId(function() --[[ line: 61 ]]
	return game:DefineFastInt("CallFriendCountAtStartupRollout", 0)
end)
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var18 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p2) --[[ line: 237 ]]
	return {
		isContactImporterPolicyEnabled = p2.getContactImporterEnabled()
	}
end)(function(p0) --[[ line: 99 | named "Container" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), paginatedFriendsCarouselIXPModule (ref), apolloFriendsModule (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), reactModule (ref), var14 (ref), useSignalState (ref), useQuery (ref), queries (ref), userIdExists (ref), cryoModule (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchProfileNamesOnStartupV2 (ref), var18 (ref), useAutoSyncContacts (ref), var16 (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var15 (ref), permissionsProtocol (ref)
	local var24
	local var20 = useDispatch()
	local var21 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p0.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var22 = nil
	local var23 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		var24, var25 = paginatedFriendsCarouselIXPModule.usePaginatedFriendsCarouselExperiment()
		local t_1 = {
			userId = var21,
			sort = if var24 and var25 then var25 else apolloFriendsModule.Enums.Sort.FriendshipScore
		}
		
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local var27 = useSignalState(reactModule.useMemo(function() --[[ line: 123 ]]
				-- upvalues: var14 (copy)
				return var14.GetAllFriends()
			end, {}))
			var23 = if var27 then var27.friends else nil
			reactModule.useEffect(function() --[[ line: 130 ]]
				-- upvalues: var14 (copy)
				var14.GetOnlineFriends()
			end, {})
		else
			var22 = useQuery(queries.allFriendsByUserId, {
				errorPolicy = "all",
				notifyOnNetworkStatusChange = true,
				skip = not var24 or not userIdExists(var21),
				variables = cryoModule.Dictionary.join(t_1, {
					pageCursor = "",
					pageLimit = fIntFriendsCarouselInitialFetchSize
				})
			})
			useQuery(queries.onlineFriendsByUserId, {
				notifyOnNetworkStatusChange = true,
				skip = not var24 or not userIdExists(var21),
				variables = t_1
			})
		end
	end
	if prefetchProfileNamesOnStartupV2 then
		var24 = if fFlagFriendSortedByPresenceSignalsImplementation then var23 else var22 and (var22.data and (var22.data.allFriendsByUserId and var22.data.allFriendsByUserId.friends))
		reactModule.useEffect(function() --[[ line: 161 ]]
			-- upvalues: userIdExists (copy), var21 (ref), var24 (ref), var18 (copy)
			if userIdExists(var21) then
				local list = { tostring(var21) }
				
				if var24 then
					for i, v in var24 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var18.fetchNamesByUserIds(list)
			end
		end, { var21, var24 })
	end
	useAutoSyncContacts()
	
	if var16() then
		reactModule.useEffect(function() --[[ line: 182 ]]
			-- upvalues: userIdExists (copy), var21 (ref), var20 (ref), networkingFriends (copy)
			if userIdExists(var21) then
				var20(networkingFriends.GetFriendsCountFromUserId.API(var21))
			end
		end, { var21 })
	end
	reactModule.useEffect(function() --[[ line: 189 ]]
		-- upvalues: userIdExists (copy), var21 (ref), var20 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var21) then
			var20(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var21 }))
			local var29 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 194 ]]
				-- upvalues: var20 (copy), networkingFriends (copy), var21 (copy)
				var20(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var21 }))
			end, false, true)
			
			return function() --[[ line: 199 ]]
				-- upvalues: var29 (ref)
				var29:Disconnect()
			end
		end
		return function() --[[ line: 203 ]] end
	end, { var21 })
	var24 = reactModule.useMemo(function() --[[ line: 206 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function() --[[ line: 216 ]]
		-- upvalues: appStorageService (copy), var15 (copy), permissionsProtocol (copy), var24 (ref)
		if appStorageService:GetItem(var15) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p1) --[[ line: 224 ]]
				-- upvalues: var24 (copy)
				var24.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p1 })
			end)
			appStorageService:SetItem(var15, "false")
			appStorageService:Flush()
		end
	end, { var21, var24 })
	
	return nil
end)