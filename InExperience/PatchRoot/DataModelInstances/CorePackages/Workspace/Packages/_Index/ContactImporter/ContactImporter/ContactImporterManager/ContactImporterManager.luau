local parent = script.Parent.Parent
local coreGuiService = game:GetService("CoreGui")
local appStorageService = game:GetService("AppStorageService")
local messageBusService = game:GetService("MessageBusService")
local parent_1 = parent.Parent
local dependenciesModule = require(parent.dependencies)
local reactModule = require(parent_1.React)
local roactModule = require(parent_1.Roact)
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
local contactsToast = require(parent_1.ContactsToast).ContactsToast
local contactsToastIXP = require(parent_1.ContactsToast).ContactsToastIXP
local useDispatch = require(parent_1.RoactUtils).Hooks.RoactRodux.useDispatch
local useFetchContactImporterInfoOnce = require(parent.Utils).useFetchContactImporterInfoOnce
local useAutoSyncContacts = require(parent.Utils).useAutoSyncContacts
local getContactImporterParams = require(parent.Utils).getContactImporterParams
local userIdExists = socialCommonModule.Utils.userIdExists
local permissionsProtocol = require(parent_1.PermissionsProtocol).PermissionsProtocol
local rolloutByApplicationId = require(parent_1.AppCommonLib).rolloutByApplicationId
local userProfilesModule = require(parent_1.UserProfiles)
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local universalAppPolicy = dependenciesModule.UniversalAppPolicy
local getAppFeaturePolicies = require(parent_1.UniversalAppPolicy).getAppFeaturePolicies
local networkingFriends = dependenciesModule.NetworkingFriends
local getFFlagContactsToastEnabled = require(parent_1.SharedFlags).GetFFlagContactsToastEnabled
local paginatedFriendsCarouselIXPModule = require(parent.Experiments.PaginatedFriendsCarouselIXP)
local earlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local prefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local fIntFriendsCarouselInitialFetchSize = require(parent_1.SharedFlags).FIntFriendsCarouselInitialFetchSize
local fFlagRegisterQRCodeKeyInEngine = require(parent_1.SharedFlags).FFlagRegisterQRCodeKeyInEngine
local fFlagFriendSortedByPresenceSignalsImplementation = require(parent_1.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local useSignalState = require(parent_1.SignalsReact).useSignalState
local var16 = if fFlagFriendSortedByPresenceSignalsImplementation then require(parent_1.DataHydration).Friends.FriendsStore.get() else nil
local var17 = if fFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local var18 = rolloutByApplicationId(function() --[[ line: 67 ]]
	return game:DefineFastInt("CallFriendCountAtStartupRollout", 0)
end)
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")
local var20 = if prefetchProfileNamesOnStartupV2 then userProfilesModule.Stores.UserProfileStore.get() else nil
local t = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = contexts.ProfileQRCode,
		eventType = eventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = dashModule.identity }
	}
}

return universalAppPolicy.connect(function(p2) --[[ line: 257 ]]
	-- upvalues: getFFlagContactsToastEnabled (ref), contactsToastIXP (ref)
	return {
		isContactImporterPolicyEnabled = p2.getContactImporterEnabled(),
		isContactsToastPolicyEnabled = if getFFlagContactsToastEnabled() or contactsToastIXP.FFlagContactsToastExperimentEnabled then p2.getContactsToastEnabled() else false
	}
end)(function(p0) --[[ line: 106 | named "Container" ]]
	-- upvalues: useDispatch (ref), useLocalUserId (ref), getAppFeaturePolicies (ref), useFetchContactImporterInfoOnce (ref), earlierFetchTimeForFriendsCarouselV1 (ref), paginatedFriendsCarouselIXPModule (ref), apolloFriendsModule (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), reactModule (ref), var16 (ref), useSignalState (ref), useQuery (ref), queries (ref), userIdExists (ref), cryoModule (ref), fIntFriendsCarouselInitialFetchSize (ref), prefetchProfileNamesOnStartupV2 (ref), var20 (ref), useAutoSyncContacts (ref), var18 (ref), networkingFriends (ref), messageBusService (ref), realtimeMessageId (ref), analyticsFactory (ref), t (ref), defaultAnalyticsService (ref), appStorageService (ref), var17 (ref), permissionsProtocol (ref), getFFlagContactsToastEnabled (ref), contactsToastIXP (ref), roactModule (ref), coreGuiService (ref), contactsToast (ref), dashModule (ref), getContactImporterParams (ref)
	local var26
	local var22 = useDispatch()
	local var23 = useLocalUserId()
	useFetchContactImporterInfoOnce({
		policyIsEnabled = p0.isContactImporterPolicyEnabled or getAppFeaturePolicies().getContactImporterEnabled()
	})
	local var24 = nil
	local var25 = nil
	
	if earlierFetchTimeForFriendsCarouselV1 then
		var26, var27 = paginatedFriendsCarouselIXPModule.usePaginatedFriendsCarouselExperiment()
		local t_1 = {
			userId = var23,
			sort = if var26 and var27 then var27 else apolloFriendsModule.Enums.Sort.FriendshipScore
		}
		
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local var29 = useSignalState(reactModule.useMemo(function() --[[ line: 130 ]]
				-- upvalues: var16 (copy)
				return var16.GetAllFriends()
			end, {}))
			var25 = if var29 then var29.friends else nil
			reactModule.useEffect(function() --[[ line: 137 ]]
				-- upvalues: var16 (copy)
				var16.GetOnlineFriends()
			end, {})
		else
			var24 = useQuery(queries.allFriendsByUserId, {
				errorPolicy = "all",
				notifyOnNetworkStatusChange = true,
				skip = not var26 or not userIdExists(var23),
				variables = cryoModule.Dictionary.join(t_1, {
					pageCursor = "",
					pageLimit = fIntFriendsCarouselInitialFetchSize
				})
			})
			useQuery(queries.onlineFriendsByUserId, {
				notifyOnNetworkStatusChange = true,
				skip = not var26 or not userIdExists(var23),
				variables = t_1
			})
		end
	end
	if prefetchProfileNamesOnStartupV2 then
		var26 = if fFlagFriendSortedByPresenceSignalsImplementation then var25 else var24 and (var24.data and (var24.data.allFriendsByUserId and var24.data.allFriendsByUserId.friends))
		reactModule.useEffect(function() --[[ line: 168 ]]
			-- upvalues: userIdExists (copy), var23 (ref), var26 (ref), var20 (copy)
			if userIdExists(var23) then
				local list = { tostring(var23) }
				
				if var26 then
					for i, v in var26 do
						if v and v.id then
							table.insert(list, tostring(v.id))
						end
					end
				end
				var20.fetchNamesByUserIds(list)
			end
		end, { var23, var26 })
	end
	useAutoSyncContacts()
	
	if var18() then
		reactModule.useEffect(function() --[[ line: 189 ]]
			-- upvalues: userIdExists (copy), var23 (ref), var22 (ref), networkingFriends (copy)
			if userIdExists(var23) then
				var22(networkingFriends.GetFriendsCountFromUserId.API(var23))
			end
		end, { var23 })
	end
	reactModule.useEffect(function() --[[ line: 196 ]]
		-- upvalues: userIdExists (copy), var23 (ref), var22 (ref), networkingFriends (copy), messageBusService (copy), realtimeMessageId (copy)
		if userIdExists(var23) then
			var22(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var23 }))
			local var31 = messageBusService:Subscribe(realtimeMessageId, function() --[[ line: 201 ]]
				-- upvalues: var22 (copy), networkingFriends (copy), var23 (copy)
				var22(networkingFriends.GetNewFriendRequestsCount.API({ currentUserId = var23 }))
			end, false, true)
			
			return function() --[[ line: 206 ]]
				-- upvalues: var31 (ref)
				var31:Disconnect()
			end
		end
		return function() --[[ line: 210 ]] end
	end, { var23 })
	var26 = reactModule.useMemo(function() --[[ line: 213 ]]
		-- upvalues: analyticsFactory (copy), t (copy), defaultAnalyticsService (copy)
		return analyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = t },
			analyticsImpl = { EventStream = defaultAnalyticsService.EventStream }
		})()
	end, {})
	reactModule.useEffect(function() --[[ line: 223 ]]
		-- upvalues: appStorageService (copy), var17 (copy), permissionsProtocol (copy), var26 (ref)
		if appStorageService:GetItem(var17) == "true" then
			permissionsProtocol.default:checkOrRequestPermissions({ permissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(p1) --[[ line: 231 ]]
				-- upvalues: var26 (copy)
				var26.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = p1 })
			end)
			appStorageService:SetItem(var17, "false")
			appStorageService:Flush()
		end
	end, { var23, var26 })
	
	return if getFFlagContactsToastEnabled() or contactsToastIXP.FFlagContactsToastExperimentEnabled and contactsToastIXP.useContactsToastVariant() then reactModule.createElement(roactModule.Portal, { target = coreGuiService }, {
		reactModule.createElement(contactsToast, dashModule.join(p0, {
			getContactImporterParams = getContactImporterParams,
			isContactsToastPolicyEnabled = p0.isContactsToastPolicyEnabled
		}))
	}) else nil
end)