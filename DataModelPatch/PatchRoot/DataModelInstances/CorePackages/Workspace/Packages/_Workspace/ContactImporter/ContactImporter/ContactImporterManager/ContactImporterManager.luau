local Parent = script.Parent.Parent
local CoreGui = game:GetService("CoreGui")
local AppStorageService = game:GetService("AppStorageService")
local MessageBusService = game:GetService("MessageBusService")
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local ReactModule = require(Parent1.React)
local RoactModule = require(Parent1.Roact)
local DashModule = require(Parent1.Dash)
local CryoModule = require(Parent1.Cryo)
local UseQueryFunction = require(Parent1.ApolloClient).useQuery
local ApolloFriendsModule = require(Parent1.ApolloFriends)
local Queries = require(Parent1.ApolloLocalState).queries
local SocialLuaAnalyticsModule = require(Parent1.SocialLuaAnalytics)
local AnalyticsFactory = SocialLuaAnalyticsModule.Analytics.AnalyticsFactory
local DefaultAnalyticsService = SocialLuaAnalyticsModule.Analytics.DefaultAnalyticsService
local ContactsToast = require(Parent1.ContactsToast).ContactsToast
local ContactsToastIXP = require(Parent1.ContactsToast).ContactsToastIXP
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseFetchContactImporterInfoOnceFunction = require(Parent.Utils).useFetchContactImporterInfoOnce
local UseAutoSyncContactsFunction = require(Parent.Utils).useAutoSyncContacts
local GetContactImporterParams = require(Parent.Utils).getContactImporterParams
local UserIdExistsFunction = require(Parent1.SocialCommon).Utils.userIdExists
local PermissionsProtocol = require(Parent1.PermissionsProtocol).PermissionsProtocol
local UserProfilesModule = require(Parent1.UserProfiles)
local UseLocalUserIdFunction = require(Parent1.RobloxAppHooks).useLocalUserId
local GetAppFeaturePoliciesFunction = require(Parent1.UniversalAppPolicy).getAppFeaturePolicies
local NetworkingFriends = DependenciesModule.NetworkingFriends
local GetFFlagContactsToastEnabledFunction = require(Parent1.SharedFlags).GetFFlagContactsToastEnabled
local PaginatedFriendsCarouselIXPModule = require(Parent.Experiments.PaginatedFriendsCarouselIXP)
local EarlierFetchTimeForFriendsCarouselV1 = game:DefineFastFlag("EarlierFetchTimeForFriendsCarousel_v1", false)
local PrefetchProfileNamesOnStartupV2 = game:DefineFastFlag("PrefetchProfileNamesOnStartup_v2", false)
local FIntFriendsCarouselInitialFetchSize = require(Parent1.SharedFlags).FIntFriendsCarouselInitialFetchSize
local FFlagRegisterQRCodeKeyInEngine = require(Parent1.SharedFlags).FFlagRegisterQRCodeKeyInEngine
local FFlagFriendSortedByPresenceSignalsImplementation = require(Parent1.SharedFlags).FFlagFriendSortedByPresenceSignalsImplementation
local UseSignalStateFunction = require(Parent1.SignalsReact).useSignalState
local DataHydrationModule = require(Parent1.DataHydration)
local GetResult = if FFlagFriendSortedByPresenceSignalsImplementation then DataHydrationModule.Friends.FriendsStore.get() else nil
local ProfileQrCodeCameraSettingsModalSeen: string = if FFlagRegisterQRCodeKeyInEngine then "ProfileQrCodeCameraSettingsModalSeen" else "ScreenshotEventTracking"
local RolloutByApplicationIdResult = require(Parent1.AppCommonLib).rolloutByApplicationId(function()
	return game:DefineFastInt("CallFriendCountAtStartupRollout", 0)
end)
local RealtimeMessageId = MessageBusService:GetMessageId("Realtime", "appResume")
local GetResult1 = if PrefetchProfileNamesOnStartupV2 then UserProfilesModule.Stores.UserProfileStore.get() else nil
local EventStream = {
	ProfileQRCodeCameraSettingsModalSeen = {
		context = SocialLuaAnalyticsModule.Analytics.Enums.Contexts.ProfileQRCode,
		eventType = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes.SettingsModalSeenSinceLastAppStart,
		formatRulesForAdditionalInfo = { cameraPermissionResponseStatus = DashModule.identity }
	}
}

return DependenciesModule.UniversalAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagContactsToastEnabledFunction (copy), ContactsToastIXP (copy)
	return {
		isContactImporterPolicyEnabled = p1.getContactImporterEnabled(),
		isContactsToastPolicyEnabled = if GetFFlagContactsToastEnabledFunction() or ContactsToastIXP.FFlagContactsToastExperimentEnabled then p1.getContactsToastEnabled() else false
	}
end)(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseLocalUserIdFunction (copy), GetAppFeaturePoliciesFunction (copy), UseFetchContactImporterInfoOnceFunction (copy), EarlierFetchTimeForFriendsCarouselV1 (copy), PaginatedFriendsCarouselIXPModule (copy), ApolloFriendsModule (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), ReactModule (copy), GetResult (copy), UseSignalStateFunction (copy), UseQueryFunction (copy), Queries (copy), UserIdExistsFunction (copy), CryoModule (copy), FIntFriendsCarouselInitialFetchSize (copy), PrefetchProfileNamesOnStartupV2 (copy), GetResult1 (copy), UseAutoSyncContactsFunction (copy), RolloutByApplicationIdResult (copy), NetworkingFriends (copy), MessageBusService (copy), RealtimeMessageId (copy), AnalyticsFactory (copy), EventStream (copy), DefaultAnalyticsService (copy), AppStorageService (copy), ProfileQrCodeCameraSettingsModalSeen (copy), PermissionsProtocol (copy), GetFFlagContactsToastEnabledFunction (copy), ContactsToastIXP (copy), RoactModule (copy), CoreGui (copy), ContactsToast (copy), DashModule (copy), GetContactImporterParams (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	UseFetchContactImporterInfoOnceFunction({
		policyIsEnabled = p1.isContactImporterPolicyEnabled or GetAppFeaturePoliciesFunction().getContactImporterEnabled()
	})
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
	UseAutoSyncContactsFunction()
	
	if RolloutByApplicationIdResult() then
		ReactModule.useEffect(function()
			-- upvalues: UserIdExistsFunction (upval), UseLocalUserIdResult (copy), UseDispatchResult (copy), NetworkingFriends (upval)
			if UserIdExistsFunction(UseLocalUserIdResult) then
				UseDispatchResult(NetworkingFriends.GetFriendsCountFromUserId.API(UseLocalUserIdResult))
			end
		end, { UseLocalUserIdResult })
	end
	ReactModule.useEffect(function()
		-- upvalues: UserIdExistsFunction (upval), UseLocalUserIdResult (copy), UseDispatchResult (copy), NetworkingFriends (upval), MessageBusService (upval), RealtimeMessageId (upval)
		if UserIdExistsFunction(UseLocalUserIdResult) then
			UseDispatchResult(NetworkingFriends.GetNewFriendRequestsCount.API({ currentUserId = UseLocalUserIdResult }))
			local SubscribeResult = MessageBusService:Subscribe(RealtimeMessageId, function()
				-- upvalues: UseDispatchResult (upval), NetworkingFriends (upval), UseLocalUserIdResult (upval)
				UseDispatchResult(NetworkingFriends.GetNewFriendRequestsCount.API({ currentUserId = UseLocalUserIdResult }))
			end, false, true)
			
			return function()
				-- upvalues: SubscribeResult (copy)
				SubscribeResult:Disconnect()
			end
		else
			return function() end
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
	
	return if GetFFlagContactsToastEnabledFunction() or ContactsToastIXP.FFlagContactsToastExperimentEnabled and ContactsToastIXP.useContactsToastVariant() then ReactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		ReactModule.createElement(ContactsToast, DashModule.join(p1, {
			getContactImporterParams = GetContactImporterParams,
			isContactsToastPolicyEnabled = p1.isContactsToastPolicyEnabled
		}))
	}) else nil
end)