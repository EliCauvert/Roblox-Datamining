local Parent = script.Parent.Parent
local AppStorageService = game:GetService("AppStorageService")
local MessageBusService = game:GetService("MessageBusService")
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local UseQueryFunction = require(Parent1.ApolloClient).useQuery
local ApolloFriendsModule = require(Parent1.ApolloFriends)
local Queries = require(Parent1.ApolloLocalState).queries
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseFetchContactImporterInfoOnceFunction = require(Parent.Utils).useFetchContactImporterInfoOnce
local UseAutoSyncContactsFunction = require(Parent.Utils).useAutoSyncContacts
local UserIdExistsFunction = require(Parent1.SocialCommon).Utils.userIdExists
local PermissionsProtocol = require(Parent1.PermissionsProtocol).PermissionsProtocol
local UserProfilesModule = require(Parent1.UserProfiles)
local UseLocalUserIdFunction = require(Parent1.RobloxAppHooks).useLocalUserId
local GetAppFeaturePoliciesFunction = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies
local NetworkingFriends = DependenciesModule.NetworkingFriends
local PaginatedFriendsCarouselIXPModule = require(Parent.Experiments.PaginatedFriendsCarouselIXP)
local EarlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local PrefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local FFlagGateContactAutoSyncByPolicyModule = require(Parent.Flags.FFlagGateContactAutoSyncByPolicy)
local FIntFriendsCarouselInitialFetchSize = require(Parent1.SharedFlags).FIntFriendsCarouselInitialFetchSize
local FFlagFriendsCountDataHydrationMigrationEnabled = require(Parent1.SharedFlags).FFlagFriendsCountDataHydrationMigrationEnabled
local FFlagAddFriendsPageUseSections = require(Parent1.SharedFlags).FFlagAddFriendsPageUseSections
local FFlagSocialCarouselMigrateRecommendations = require(Parent1.SharedFlags).FFlagSocialCarouselMigrateRecommendations
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent1.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState
local GetResult = require(Parent1.DataHydration).Friends.FriendsStore.get()
local FriendsRequestsStore = require(Parent1.DataHydration.FriendsRequests).FriendsRequestsStore
local FriendsRecommendationsModule = require(Parent1.DataHydration.FriendsRecommendations)
local FriendsRecommendationsStore = FriendsRecommendationsModule.FriendsRecommendationsStore
local DataSource = FriendsRecommendationsModule.Enums.DataSource
local ProfileQrCodeCameraSettingsModalSeen: string = if require(Parent1.SharedFlags).FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")
local GetResult1 = if PrefetchProfileNamesOnStartupV2 then UserProfilesModule.Stores.UserProfileStore.get() else nil
local EventStream = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.ProfileQRCode,
		eventType = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = {
			cameraPermissionResponseStatus = require(Parent1.Dash).identity
		}
	}
}

return DependenciesModule.UniversalAppPolicy.connect(function(p1)
	return {
		isContactImporterPolicyEnabled = p1.getContactImporterEnabled()
	}
end)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), GetAppFeaturePoliciesFunction (copy), UseFetchContactImporterInfoOnceFunction (copy), EarlierFetchTimeForFriendsCarouselV1 (copy), PaginatedFriendsCarouselIXPModule (copy), ApolloFriendsModule (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), ReactModule (copy), GetResult (copy), UseSignalStateFunction (copy), UseQueryFunction (copy), Queries (copy), UserIdExistsFunction (copy), CryoModule (copy), FIntFriendsCarouselInitialFetchSize (copy), PrefetchProfileNamesOnStartupV2 (copy), GetResult1 (copy), FFlagSocialCarouselMigrateRecommendations (copy), FriendsRecommendationsStore (copy), DataSource (copy), FFlagGateContactAutoSyncByPolicyModule (copy), UseAutoSyncContactsFunction (copy), FFlagFriendsCountDataHydrationMigrationEnabled (copy), NetworkingFriends (copy), FFlagAddFriendsPageUseSections (copy), FriendsRequestsStore (copy), MessageBusService (copy), RealtimeMessageId (copy), AnalyticsFactory (copy), EventStream (copy), DefaultAnalyticsService (copy), AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy), PermissionsProtocol (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local IsContactImporterPolicyEnabled = p1.isContactImporterPolicyEnabled or GetAppFeaturePoliciesFunction().getContactImporterEnabled()
	UseFetchContactImporterInfoOnceFunction({ policyIsEnabled = IsContactImporterPolicyEnabled })
	local v1 = nil
	local Friends = nil
	
	if EarlierFetchTimeForFriendsCarouselV1 then
		local UsePaginatedFriendsCarouselExperimentResult, UsePaginatedFriendsCarouselExperimentResult2 = PaginatedFriendsCarouselIXPModule.usePaginatedFriendsCarouselExperiment()
		local Variables = {
			userId = UseLocalUserIdResult,
			sort = if UsePaginatedFriendsCarouselExperimentResult and UsePaginatedFriendsCarouselExperimentResult2 then UsePaginatedFriendsCarouselExperimentResult2 else ApolloFriendsModule.Enums.Sort.FriendshipScore
		}
		
		if FFlagFriendSortedByPresenceSignalsImplementation then
			local UseSignalStateResult = UseSignalStateFunction((ReactModule.useMemo(function()
				-- upvalues: GetResult (upval)
				return GetResult.GetAllFriends()
			end, {})))
			Friends = UseSignalStateResult and UseSignalStateResult.friends or nil
			ReactModule.useEffect(function()
				-- upvalues: GetResult (upval)
				GetResult.GetOnlineFriends()
			end, {})
		else
			v1 = UseQueryFunction(Queries.allFriendsByUserId, {
				errorPolicy = "all",
				notifyOnNetworkStatusChange = true,
				skip = not UsePaginatedFriendsCarouselExperimentResult or not UserIdExistsFunction(UseLocalUserIdResult),
				variables = CryoModule.Dictionary.join(Variables, {
					pageCursor = "",
					pageLimit = FIntFriendsCarouselInitialFetchSize
				})
			})
			UseQueryFunction(Queries.onlineFriendsByUserId, {
				notifyOnNetworkStatusChange = true,
				skip = not UsePaginatedFriendsCarouselExperimentResult or not UserIdExistsFunction(UseLocalUserIdResult),
				variables = Variables
			})
		end
	end
	if PrefetchProfileNamesOnStartupV2 then
		local Friends1 = if FFlagFriendSortedByPresenceSignalsImplementation then Friends else v1 and (v1.data and (v1.data.allFriendsByUserId and v1.data.allFriendsByUserId.friends))
		ReactModule.useEffect(function()
			-- upvalues: UserIdExistsFunction (upval), UseLocalUserIdResult (copy), Friends1 (copy), GetResult1 (upval)
			if UserIdExistsFunction(UseLocalUserIdResult) then
				local List = { (tostring(UseLocalUserIdResult)) }
				
				if Friends1 then
					for _, value in Friends1 do
						if value and value.id then
							table.insert(List, (tostring(value.id)))
						end
					end
				end
				GetResult1.fetchNamesByUserIds(List)
			end
		end, { UseLocalUserIdResult, Friends1 })
	end
	if FFlagSocialCarouselMigrateRecommendations then
		ReactModule.useEffect(function()
			-- upvalues: GetAppFeaturePoliciesFunction (upval), FriendsRecommendationsStore (upval), DataSource (upval)
			if GetAppFeaturePoliciesFunction().getSocialGraphSyncEnabled() then
				FriendsRecommendationsStore.get().getFriendsRecommendations(DataSource.HomepageFriendsCarousel)
			end
		end, { UseLocalUserIdResult })
	end
	if FFlagGateContactAutoSyncByPolicyModule then
		UseAutoSyncContactsFunction(IsContactImporterPolicyEnabled)
	else
		UseAutoSyncContactsFunction()
	end
	ReactModule.useEffect(function()
		-- upvalues: UserIdExistsFunction (upval), UseLocalUserIdResult (copy), FFlagFriendsCountDataHydrationMigrationEnabled (upval), GetResult (upval), UseDispatchResult (copy), NetworkingFriends (upval)
		if UserIdExistsFunction(UseLocalUserIdResult) then
			if FFlagFriendsCountDataHydrationMigrationEnabled then
				GetResult.GetFriendsCountByUserId((tostring(UseLocalUserIdResult)))
				
				return
			end
			UseDispatchResult(NetworkingFriends.GetFriendsCountFromUserId.API(UseLocalUserIdResult))
		end
	end, { UseLocalUserIdResult })
	ReactModule.useEffect(function()
		-- upvalues: UserIdExistsFunction (upval), UseLocalUserIdResult (copy), FFlagAddFriendsPageUseSections (upval), FriendsRequestsStore (upval), UseDispatchResult (copy), NetworkingFriends (upval), MessageBusService (upval), RealtimeMessageId (upval)
		if not UserIdExistsFunction(UseLocalUserIdResult) then
			return function() end
		end
		if FFlagAddFriendsPageUseSections then
			FriendsRequestsStore.get().getNewFriendsRequestCount()
		else
			UseDispatchResult(NetworkingFriends.GetNewFriendRequestsCount.API({ currentUserId = UseLocalUserIdResult }))
		end
		local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, function()
			-- upvalues: FFlagAddFriendsPageUseSections (upval), FriendsRequestsStore (upval), UseDispatchResult (upval), NetworkingFriends (upval), UseLocalUserIdResult (upval)
			if FFlagAddFriendsPageUseSections then
				FriendsRequestsStore.get().refetchNewFriendRequestCount()
				
				return
			else
				UseDispatchResult(NetworkingFriends.GetNewFriendRequestsCount.API({ currentUserId = UseLocalUserIdResult }))
			end
		end, false, true)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			SubscribeResult:Disconnect()
		end
	end, { UseLocalUserIdResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AnalyticsFactory (upval), EventStream (upval), DefaultAnalyticsService (upval)
		return AnalyticsFactory.setUpAnalyticsFactory({
			eventLists = { EventStream = EventStream },
			analyticsImpl = { EventStream = DefaultAnalyticsService.EventStream }
		})()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: AppStorageService (upval), ProfileQrCodeCameraSettingsModalSeen (upval), PermissionsProtocol (upval), UseMemoResult (copy)
		if AppStorageService:GetItem(ProfileQrCodeCameraSettingsModalSeen) == "true" then
			PermissionsProtocol.default:checkOrRequestPermissions({ PermissionsProtocol.Permissions.CAMERA_ACCESS }):andThen(function(Result)
				-- upvalues: UseMemoResult (upval)
				UseMemoResult.fireAnalyticsEvent("ProfileQRCodeCameraSettingsModalSeen", { cameraPermissionResponseStatus = Result })
			end)
			AppStorageService:SetItem(ProfileQrCodeCameraSettingsModalSeen, "false")
			AppStorageService:Flush()
		end
	end, { UseLocalUserIdResult, UseMemoResult })
	
	return nil
end)