local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local IXPService = game:GetService("IXPService")
local IXPServiceWrapper = require(Parent.IXPServiceWrapper).IXPServiceWrapper
local AnalyticsModule = require(AddFriends.Analytics)
local AnalyticsSetupFunction = AnalyticsModule.AnalyticsSetup
local EventNames = AnalyticsModule.EventNames
local Namespaces = AnalyticsModule.Namespaces
local SessionUtilModule = require(AddFriends.Analytics.sessionUtil)
local SocialCommonModule = require(Parent.SocialCommon)
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AddFriendsStateModule = require(Parent.AddFriendsState)
local AddFriendsSelectorFunction = AddFriendsStateModule.AddFriendsSelector
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local RoduxFriends = AddFriendsStateModule.RoduxFriends
local RoduxAnalytics = AddFriendsStateModule.RoduxAnalytics
local FriendsNetworking = AddFriendsStateModule.Networking.FriendsNetworking
local NetworkingGamesModule = require(AddFriends.Networking.NetworkingGames)
local NetworkingPresenceModule = require(AddFriends.Networking.NetworkingPresence)
local RecommendationSourceEnum = SocialCommonModule.Enums.RecommendationSourceEnum
local RECOMMENDATIONSESSIONIDKEY = require(AddFriends.Common.Constants).RECOMMENDATION_SESSION_ID_KEY
local GetSessionIdByKeyFunction = RoduxAnalytics.Selectors.getSessionIdByKey
local GetFriendRecommendationsFromStateModule = require(script.Parent.getFriendRecommendationsFromState)
local GetFriendRequestsFromStateModule = require(script.Parent.getFriendRequestsFromState)
local ShowMoreSectionTypeEnumModule = require(AddFriends.Enums.ShowMoreSectionTypeEnum)
local ContextualInfoTypes = SocialCommonModule.Enums.ContextualInfoTypes
local ReportPromiseLoadingTimeWrapperFunction = require(Parent.SocialLuaAnalytics).Analytics.Timing.reportPromiseLoadingTimeWrapper
local ResponsiveModule = require(Parent.Responsive)
local BreakpointConfig = ResponsiveModule.BreakpointConfig
local ToastRoduxModule = require(Parent.ToastRodux)
local AddFriendsPageModule = require(script.Parent.Parent.AddFriendsPage)
local UseFAEUpsellOnAfpModule = require(script.Parent.Parent.FaeUpsellOnAfp.useFAEUpsellOnAfp)
local _ = require(script.Parent.Parent.AddFriendsTile.getFriendRequestHandlersExtraProps)
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local FFlagConnectionsHubLayerExposure = require(Parent.SharedFlags).FFlagConnectionsHubLayerExposure
local FFlagFixCohubExposureLayer = require(Parent.SharedFlags).FFlagFixCohubExposureLayer
local FFlagAddFriendsPYMKPresence = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresence
local FFlagAddFriendsPYMKPresenceAnalytics = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled
local FFlagAddFriendsSessionId = require(Parent.SharedFlags).FFlagAddFriendsSessionId
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagAddFriendsPageFAEUpsell = require(Parent.SharedFlags).FFlagAddFriendsPageFAEUpsell
local FFlagAddFriendsPresenceStoreMigration = require(Parent.SharedFlags).FFlagAddFriendsPresenceStoreMigration

return function(p1)
	-- upvalues: FFlagAddFriendsPageFAEUpsell (copy), UseFAEUpsellOnAfpModule (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), UseLocalUserIdFunction (copy), UseSelectorFunction (copy), GetFriendRecommendationsFromStateModule (copy), GetSessionIdByKeyFunction (copy), RECOMMENDATIONSESSIONIDKEY (copy), GetFriendRequestsFromStateModule (copy), AddFriendsSelectorFunction (copy), ReactModule (copy), AnalyticsSetupFunction (copy), FriendsNetworking (copy), PromiseModule (copy), DashModule (copy), FFlagAddFriendsSessionId (copy), SessionUtilModule (copy), NetworkingGamesModule (copy), RecommendationSourceEnum (copy), ContextualInfoTypes (copy), RoduxFriends (copy), RoduxAnalytics (copy), FFlagAddFriendsPYMKPresence (copy), FFlagAddFriendsPresenceStoreMigration (copy), NetworkingPresenceModule (copy), FFlagAddFriendsPYMKPresenceAnalytics (copy), EventNames (copy), BreakpointConfig (copy), ResponsiveModule (copy), ToastRoduxModule (copy), FFlagAddFriendsUserListEnabled (copy), ReportPromiseLoadingTimeWrapperFunction (copy), Namespaces (copy), ShowMoreSectionTypeEnumModule (copy), FFlagConnectionsHubLayerExposure (copy), FFlagFixCohubExposureLayer (copy), IXPServiceWrapper (copy), AppUserLayers (copy), IXPService (copy), AddFriendsPageModule (copy)
	if FFlagAddFriendsPageFAEUpsell then
		UseFAEUpsellOnAfpModule()
	end
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		networkErrorText = "Feature.Toast.NetworkingError.SomethingIsWrong",
		requestIgnoredText = "Feature.AddFriends.Action.RequestIgnored",
		allRequestsIgnoredText = "Feature.Profile.Action.AllRequestsIgnored",
		allRequestsIgnoredBackgroundedText = "Feature.AddFriends.Label.DeclineAllBackgrounded",
		friendAddedText = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded",
		requestSentText = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent"
	})
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult = UseSelectorFunction(GetFriendRecommendationsFromStateModule)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: GetSessionIdByKeyFunction (upval), RECOMMENDATIONSESSIONIDKEY (upval)
		return GetSessionIdByKeyFunction(p2)(RECOMMENDATIONSESSIONIDKEY)
	end)
	local UseSelectorResult2 = UseSelectorFunction(GetFriendRequestsFromStateModule)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval)
		return AddFriendsSelectorFunction(p2, "Friends.requests.nextPageCursor")
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: AnalyticsSetupFunction (upval), UseLocalUserIdResult (copy), UseSelectorResult1 (copy)
		return AnalyticsSetupFunction({
			infoForAllEvents = {
				uid = UseLocalUserIdResult,
				recommendationSessionId = UseSelectorResult1
			}
		}).fireAnalyticsEvent
	end, { UseLocalUserIdResult, UseSelectorResult1 })
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), FriendsNetworking (upval)
		return UseDispatchResult(FriendsNetworking.GetFriendRequestsCount.API(p2))
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(CurrentUserId)
		-- upvalues: UseDispatchResult (copy), FriendsNetworking (upval)
		return UseDispatchResult(FriendsNetworking.ClearNewFriendRequests.API({ currentUserId = CurrentUserId }))
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: PromiseModule (upval), DashModule (upval), FFlagAddFriendsSessionId (upval), SessionUtilModule (upval), UseDispatchResult (copy), FriendsNetworking (upval), NetworkingGamesModule (upval)
		local function v65(List)
			local UserIds = {}
			local UniverseIds = {}
			
			for _, value in pairs(List) do
				table.insert(UserIds, value.id)
				local SourceUniverseId = value.friendRequest.sourceUniverseId
				
				if SourceUniverseId ~= nil and SourceUniverseId ~= 0 then
					table.insert(UniverseIds, SourceUniverseId)
				end
			end
			return { userIds = UserIds, universeIds = UniverseIds }
		end
		
		return PromiseModule.new(function(Callback, p3)
			-- upvalues: p2 (ref), DashModule (upval), FFlagAddFriendsSessionId (upval), SessionUtilModule (upval), UseDispatchResult (upval), FriendsNetworking (upval), v65 (copy), NetworkingGamesModule (upval), PromiseModule (upval)
			p2 = DashModule.join(p2 or {}, {
				currentUserId = p2.localUserId,
				sessionId = if FFlagAddFriendsSessionId then SessionUtilModule.getSessionId() else nil
			})
			UseDispatchResult(FriendsNetworking.GetFriendRequests.API(p2)):andThen(function(Result)
				-- upvalues: v65 (upval), UseDispatchResult (upval), FriendsNetworking (upval), NetworkingGamesModule (upval), PromiseModule (upval), Callback (copy), p3 (copy)
				local v1 = v65(Result.responseBody.data)
				local List = {}
				
				if next(v1.userIds) ~= nil then
					table.insert(List, UseDispatchResult(FriendsNetworking.GetFollowingExists.API({ targetUserIds = v1.userIds })))
				end
				if next(v1.universeIds) ~= nil then
					table.insert(List, UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API(v1.universeIds)))
				end
				PromiseModule.all(List):andThen(function()
					-- upvalues: Callback (upval), Result (copy)
					Callback(Result)
				end):catch(p3)
			end):catch(p3)
		end)
	end, { UseDispatchResult })
	local UseResult3 = ReactModule.useCallback(function(p3)
		-- upvalues: UseDispatchResult (copy), FriendsNetworking (upval), RecommendationSourceEnum (upval), DashModule (upval), ContextualInfoTypes (upval), RoduxFriends (upval), RoduxAnalytics (upval), RECOMMENDATIONSESSIONIDKEY (upval), PromiseModule (upval), FFlagAddFriendsPYMKPresence (upval), FFlagAddFriendsPresenceStoreMigration (upval), NetworkingPresenceModule (upval), FFlagAddFriendsPYMKPresenceAnalytics (upval), UseMemoResult (copy), EventNames (upval)
		return UseDispatchResult(FriendsNetworking.GetFriendRecommendationsFromUserId.API({
			targetUserId = p3.localUserId,
			source = RecommendationSourceEnum.AddFriendsPage
		})):andThen(function(Result)
			-- upvalues: DashModule (upval), ContextualInfoTypes (upval), UseDispatchResult (upval), RoduxFriends (upval), RecommendationSourceEnum (upval), RoduxAnalytics (upval), RECOMMENDATIONSESSIONIDKEY (upval), PromiseModule (upval)
			UseDispatchResult(RoduxFriends.Actions.RecommendationSourceCreated({
				source = RecommendationSourceEnum.AddFriendsPage,
				recommendationIds = DashModule.map(Result.responseBody.data, function(p4)
					-- upvalues: ContextualInfoTypes (upval)
					return if p4.contextType == ContextualInfoTypes.Contacts then p4.contactId else p4.id
				end)
			}))
			UseDispatchResult(RoduxAnalytics.Actions.SessionIdUpdated({
				sessionKey = RECOMMENDATIONSESSIONIDKEY,
				sessionId = Result.responseBody.recommendationRequestId
			}))
			
			return PromiseModule.resolve(Result)
		end):andThen(function(Result)
			-- upvalues: FFlagAddFriendsPYMKPresence (upval), FFlagAddFriendsPresenceStoreMigration (upval), DashModule (upval), ContextualInfoTypes (upval), UseDispatchResult (upval), NetworkingPresenceModule (upval), FFlagAddFriendsPYMKPresenceAnalytics (upval), UseMemoResult (upval), EventNames (upval), PromiseModule (upval)
			if not FFlagAddFriendsPYMKPresence or FFlagAddFriendsPresenceStoreMigration then return end
			local ReduceResult = DashModule.reduce(Result.responseBody.data, function(List, p4)
				-- upvalues: ContextualInfoTypes (upval)
				if p4.contextType ~= ContextualInfoTypes.Contacts then
					table.insert(List, p4.id)
				end
				return List
			end, {})
			
			if #ReduceResult > 0 then
				UseDispatchResult(NetworkingPresenceModule.GetPresencesFromUserIds.API(ReduceResult))
				
				if FFlagAddFriendsPYMKPresenceAnalytics then
					UseMemoResult(EventNames.PYMKUserPresenceLoad)
				end
			end
			return PromiseModule.resolve()
		end)
	end, {
		UseDispatchResult,
		if FFlagAddFriendsPYMKPresenceAnalytics then UseMemoResult else nil
	})
	local IsMinWidthForBelow = BreakpointConfig.getMinWidthFor(ResponsiveModule.Keys.Medium) <= UseSelectorFunction(function(p3)
		return p3.ScreenSize
	end).X
	local UseResult4 = ReactModule.useCallback(function(): number
		-- upvalues: IsMinWidthForBelow (copy)
		return if IsMinWidthForBelow then 50 else 25
	end, { IsMinWidthForBelow })
	local UseResult5 = ReactModule.useCallback(function(_, p3, LoadingTime)
		-- upvalues: UseMemoResult (copy), EventNames (upval)
		UseMemoResult(EventNames.AddFriendsPageLoadingTime, {
			status = p3.status,
			loadingTime = LoadingTime,
			statValue = LoadingTime
		})
		local Entry = p3.result[3]
		local CountData = nil
		
		if Entry then
			local Data = Entry.responseBody.data or {}
			CountData = Data and #Data
		else
			CountData = 0
		end
		UseMemoResult(EventNames.PageLoad, { recommendationCount = CountData, status = p3.status })
	end, { UseMemoResult })
	local UseResult6 = ReactModule.useCallback(function(p3)
		-- upvalues: UseDispatchResult (copy), ToastRoduxModule (upval)
		if p3 then
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = p3.toastTitle,
				toastIcon = p3.iconImage
			}))
			
			return
		end
	end, { UseNavigationResult })
	local UseResult7 = ReactModule.useCallback(function(Callback, p3)
		-- upvalues: UseResult6 (copy), UseLocalizationResult (copy)
		return function(...)
			-- upvalues: Callback (copy), UseResult6 (upval), p3 (copy), UseLocalizationResult (upval)
			return Callback(...):andThen(function()
				-- upvalues: UseResult6 (upval), p3 (upval)
				UseResult6(p3)
			end):catch(function()
				-- upvalues: UseResult6 (upval), UseLocalizationResult (upval)
				UseResult6({ toastTitle = UseLocalizationResult.networkErrorText })
			end)
		end
	end, { UseResult6, UseLocalizationResult.networkErrorText })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: PromiseModule (upval), UseResult (copy), UseLocalUserIdResult (copy), UseResult2 (copy), FFlagAddFriendsUserListEnabled (upval), UseResult4 (copy), UseResult3 (copy)
		return PromiseModule.all({
			UseResult(UseLocalUserIdResult),
			UseResult2({
				isRefresh = true,
				localUserId = UseLocalUserIdResult,
				limit = if FFlagAddFriendsUserListEnabled then 25 else UseResult4()
			}),
			UseResult3({ localUserId = UseLocalUserIdResult })
		})
	end, {})
	local UseResult9 = ReactModule.useCallback(UseResult7(function()
		-- upvalues: FFlagAddFriendsSessionId (upval), SessionUtilModule (upval), ReportPromiseLoadingTimeWrapperFunction (upval), UseResult8 (copy), UseResult5 (copy), PromiseModule (upval)
		if FFlagAddFriendsSessionId then
			SessionUtilModule.initializeSession()
		end
		return ReportPromiseLoadingTimeWrapperFunction(UseResult8, function()
			return { fetch = "add_friends_page_load" }
		end, { fireEvent = UseResult5 })():andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.resolve(Result)
		end):catch(function(_) end)
	end), { UseResult3, UseResult2, UseResult, UseLocalUserIdResult })
	local UseResult10 = ReactModule.useCallback(UseResult7(function(Cursor)
		-- upvalues: UseResult2 (copy), FFlagAddFriendsUserListEnabled (upval), UseResult4 (copy), UseLocalUserIdResult (copy)
		return UseResult2({
			limit = if FFlagAddFriendsUserListEnabled then 25 else UseResult4(),
			cursor = Cursor,
			localUserId = UseLocalUserIdResult
		})
	end), {
		if FFlagAddFriendsUserListEnabled then nil else UseResult4
	})
	local UseResult11 = ReactModule.useCallback(function(FriendRequests)
		-- upvalues: UseMemoResult (copy), EventNames (upval), Namespaces (upval)
		UseMemoResult(EventNames.ShowMoreBtnClick, {
			namespace = if FriendRequests == Namespaces.FriendRequests then Namespaces.FriendRequests else Namespaces.PYMK
		})
	end, { UseMemoResult })
	local UseResult12 = ReactModule.useCallback(function(p3)
		-- upvalues: UseSelectorResult3 (copy), UseResult10 (copy), UseResult11 (copy), ShowMoreSectionTypeEnumModule (upval)
		if UseSelectorResult3 then
			UseResult10(UseSelectorResult3, p3)
		end
		UseResult11(ShowMoreSectionTypeEnumModule.FriendRequests)
	end, { UseSelectorResult2, UseResult10, UseSelectorResult3 })
	local UseResult13 = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), EventNames (upval)
		UseMemoResult(EventNames.UserSearchClick)
	end, { UseMemoResult })
	ReactModule.useEffect(function()
		-- upvalues: FFlagConnectionsHubLayerExposure (upval), FFlagFixCohubExposureLayer (upval), IXPServiceWrapper (upval), AppUserLayers (upval), IXPService (upval), UseResult9 (copy), UseResult1 (copy), UseLocalUserIdResult (copy), FFlagAddFriendsSessionId (upval), SessionUtilModule (upval)
		if FFlagConnectionsHubLayerExposure then
			if FFlagFixCohubExposureLayer then
				IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AppUserLayers.ConnectionsHubExposureLayer)
			else
				IXPService:LogFlagLinkedUserLayerExposure(AppUserLayers.ConnectionsHubExposureLayer)
			end
		end
		UseResult9()
		UseResult1(UseLocalUserIdResult)
		
		return function()
			-- upvalues: UseResult1 (upval), UseLocalUserIdResult (upval), FFlagAddFriendsSessionId (upval), SessionUtilModule (upval)
			UseResult1(UseLocalUserIdResult)
			
			if FFlagAddFriendsSessionId then
				SessionUtilModule.destroySession()
			end
		end
	end, {})
	local CountUseSelectorResult: number = UseSelectorResult and #UseSelectorResult or 0
	
	return ReactModule.createElement(AddFriendsPageModule, {
		initialRequestsRows = if FFlagAddFriendsUserListEnabled then if CountUseSelectorResult > 0 then 10 else 25 elseif CountUseSelectorResult > 0 then 5 else 6,
		requestsPageSize = if FFlagAddFriendsUserListEnabled then 25 else UseResult4(),
		navigateToLuaAppPages = p1.navigateToLuaAppPages,
		friendRecommendationsSessionId = UseSelectorResult1,
		friendRecommendations = UseSelectorResult,
		friendRequests = UseSelectorResult2,
		handleLoadMoreRequests = UseResult12,
		refreshPage = UseResult9,
		fireSearchbarPressedEvent = UseResult13,
		fireOnShowMore = UseResult11
	})
end