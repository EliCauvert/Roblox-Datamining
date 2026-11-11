local Parent = script.Parent.Parent.Parent.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local UseGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local UseAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local UseAgeCheckCompletionLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local UseAgeCheckPressLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local GameJoinCardTelemetryModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTelemetry)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseQueryFunction = require(Parent.ApolloClient).useQuery
local ApolloLocalStateModule = require(Parent.ApolloLocalState)
local Players = game:GetService("Players")
local UserProfilesModule = require(Parent.UserProfiles)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSocialCarouselUseProfileStore = SharedFlagsModule.FFlagSocialCarouselUseProfileStore
local FFlagFriendSortedByPresenceSignalsImplementation = SharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local FFlagJoinCardAgeCheckUpsell = SharedFlagsModule.FFlagJoinCardAgeCheckUpsell
local DataHydrationModule = require(Parent.DataHydration)
local SignalsModule = if FFlagSocialCarouselUseProfileStore or FFlagFriendSortedByPresenceSignalsImplementation then require(Parent.Signals) else nil
local SignalsReactModule = if FFlagSocialCarouselUseProfileStore or FFlagFriendSortedByPresenceSignalsImplementation then require(Parent.SignalsReact) else nil
local GetResult = if FFlagSocialCarouselUseProfileStore then UserProfilesModule.Stores.UserProfileStore.get() else nil
local UseExperienceBannerImageFunction = require(Parent.GameDetail).useExperienceBannerImage
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local PeopleListInHomePage = DiscoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppGuiService = RoactServiceTagsModule.AppGuiService
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AppPage = RobloxAppEnumsModule.AppPage
local NotificationType = RobloxAppEnumsModule.NotificationType
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local MobileGameJoinCardModule = require(script.Parent.MobileGameJoinCard)
local GetResult1 = if FFlagFriendSortedByPresenceSignalsImplementation then DataHydrationModule.Presence.PresenceStore.get() else nil
local config = {
	universeId = "",
	lastLocation = "",
	userPresenceType = "",
	placeId = "",
	rootPlaceId = "",
	gameId = ""
}

return function()
	-- upvalues: UseNavigationFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppGuiService (copy), UseAppPolicyFunction (copy), Players (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), ReactModule (copy), SignalsModule (copy), GetResult1 (copy), SignalsReactModule (copy), UseQueryFunction (copy), ApolloLocalStateModule (copy), UseGameJoinCardAnalyticsModule (copy), FFlagSocialCarouselUseProfileStore (copy), GetResult (copy), UserProfilesModule (copy), UseExperienceBannerImageFunction (copy), GameJoinCardTelemetryModule (copy), FFlagJoinCardAgeCheckUpsell (copy), UseAgeCheckCompletionLoggerFunction (copy), UseJoinUserInExperienceFunction (copy), config (copy), UseAgeCheckPressLoggerFunction (copy), GameJoinCardButtonAction (copy), GamePlayIntentFunction (copy), PeopleListInHomePage (copy), HttpService (copy), DependencyArrayFunction (copy), AppPage (copy), ViewProfileSourceValues (copy), NotificationType (copy), MobileGameJoinCardModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UserIdParam = UseNavigationResult.getParam("userId") or ""
	local HomepageCarouselAbsolutePositionParam = UseNavigationResult.getParam("homepageCarouselAbsolutePosition")
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGuiService)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getCanUsePlatformChat()
	end)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or "")
	local UseSignalStateResult = nil
	
	if FFlagFriendSortedByPresenceSignalsImplementation then
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), GetResult1 (upval), UserIdParam (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: GetResult1 (upval), UserIdParam (upval)
				return GetResult1.GetPresenceByUserId(UserIdParam).data(p1)
			end)
		end, { UserIdParam })))
	else
		local UseQueryResult = UseQueryFunction(ApolloLocalStateModule.queries.onlineFriendsByUserId, {
			fetchPolicy = "cache-only",
			variables = { sort = 1, userId = Text }
		})
		UseSignalStateResult = ReactModule.useMemo(function()
			-- upvalues: UseQueryResult (copy), UserIdParam (copy)
			local OnlineFriendsByUserId = UseQueryResult.data and UseQueryResult.data.onlineFriendsByUserId
			
			if not OnlineFriendsByUserId then
				return nil
			end
			for _, value in OnlineFriendsByUserId do
				if value.id == UserIdParam then
					return value.presence
				end
			end
			return nil
		end, { UseQueryResult.data, UserIdParam })
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState({ universeId = "", experienceName = "" })
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (ref), UseStateResult2 (copy)
		if UseSignalStateResult and tostring(UseSignalStateResult.universeId) ~= "" then
			UseStateResult2({
				universeId = tostring(UseSignalStateResult.universeId),
				experienceName = UseSignalStateResult.lastLocation
			})
			
			return
		end
	end, { UseSignalStateResult })
	local UniverseId = UseStateResult.universeId
	local ExperienceName = UseStateResult.experienceName
	ReactModule.useEffect(function()
		-- upvalues: UserIdParam (copy), UseSignalStateResult (ref), UseGameJoinCardAnalyticsModule (upval), HomepageCarouselAbsolutePositionParam (copy)
		if UserIdParam ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
				friendId = UserIdParam,
				universeId = if UseSignalStateResult and UseSignalStateResult.universeId ~= nil and tostring(UseSignalStateResult.universeId) ~= "" then tostring(UseSignalStateResult.universeId) else nil,
				absolutePosition = HomepageCarouselAbsolutePositionParam
			})
			
			return
		end
	end, {})
	local UseSignalStateResult1 = nil
	
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: GetResult (upval), UserIdParam (copy)
			return GetResult.fetchNamesByUserIds({ UserIdParam })
		end, { UserIdParam })
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy)
			return SignalsModule.createComputed(function(p1)
				-- upvalues: UseMemoResult (upval)
				local UseMemoResultResult = UseMemoResult(p1)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p1) else nil
			end)
		end, { UseMemoResult }))) or ""
	else
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { UserIdParam },
			query = UserProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		UseSignalStateResult1 = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), UserIdParam (copy)
			return UseUserProfilesFetchResult.data and UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UserIdParam) or ""
		end, { UseUserProfilesFetchResult.data, UserIdParam })
	end
	local UseExperienceBannerImageResult = UseExperienceBannerImageFunction(UniverseId, if UseSignalStateResult and UseSignalStateResult.rootPlaceId ~= nil then tostring(UseSignalStateResult.rootPlaceId) else nil)
	ReactModule.useEffect(function()
		-- upvalues: UniverseId (copy), GameJoinCardTelemetryModule (upval), UseExperienceBannerImageResult (copy)
		if UniverseId ~= "" then
			GameJoinCardTelemetryModule.logBannerLoadResult(UseExperienceBannerImageResult.status)
			
			return
		end
	end, { UseExperienceBannerImageResult.status, UniverseId })
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(UserIdParam, {
		isHomePageCarousel = true,
		presence = UseSignalStateResult or config,
		onBeforeJoin = ReactModule.useCallback(function()
			-- upvalues: UseNavigationResult (copy)
			UseNavigationResult.goBack()
		end, { UseNavigationResult }),
		onAgeCheckCompletion = if FFlagJoinCardAgeCheckUpsell then UseAgeCheckCompletionLoggerFunction(UniverseId) else nil
	})
	local UseAgeCheckPressLoggerResult = if FFlagJoinCardAgeCheckUpsell then UseAgeCheckPressLoggerFunction({
		userId = UserIdParam,
		universeId = UniverseId,
		absolutePosition = HomepageCarouselAbsolutePositionParam,
		joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
	}) else nil
	local IsAgeCheckRequired: boolean = FFlagJoinCardAgeCheckUpsell and UseJoinUserInExperienceResult.ageCheckRequired == true
	ReactModule.useEffect(function()
		-- upvalues: IsAgeCheckRequired (copy), UniverseId (copy), UseGameJoinCardAnalyticsModule (upval)
		if IsAgeCheckRequired and UniverseId ~= "" then
			UseGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = UniverseId })
			
			return
		end
	end, { IsAgeCheckRequired, UniverseId })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UserIdParam (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), UseSignalStateResult (ref), GamePlayIntentFunction (upval), UseRoactServiceResult (copy), PeopleListInHomePage (upval), HttpService (upval)
		if UserIdParam ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.JoinGame, {
				friendId = UserIdParam,
				universeId = if UniverseId == "" then nil else UniverseId,
				absolutePosition = HomepageCarouselAbsolutePositionParam
			})
		end
		if UserIdParam == "" or not UseSignalStateResult then return end
		local Text: string = if UseSignalStateResult.placeId == nil or tostring(UseSignalStateResult.placeId) == "" then "" else tostring(UseSignalStateResult.placeId)
		local Number: number? = tonumber(UseSignalStateResult.rootPlaceId)
		
		if Text ~= "" and Number ~= nil then
			GamePlayIntentFunction(UseRoactServiceResult, PeopleListInHomePage, {
				placeId = Text,
				rootPlaceId = Number,
				friendId = UserIdParam,
				joinAttemptId = HttpService:GenerateGUID(false)
			})
			
			return
		end
	end, DependencyArrayFunction(UserIdParam, UniverseId, HomepageCarouselAbsolutePositionParam, UseSignalStateResult))
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPage (upval), UserIdParam (copy)
		UseNavigationResult.navigate(AppPage.ProfilePlatform, { detail = UserIdParam })
	end, { UseNavigationResult, UserIdParam })
	
	return ReactModule.createElement(MobileGameJoinCardModule, {
		onClose = UseResult,
		onJoin = ReactModule.useCallback(function()
			-- upvalues: UseResult1 (copy), UseJoinUserInExperienceResult (copy)
			UseResult1()
			UseJoinUserInExperienceResult.joinExperience()
		end, DependencyArrayFunction(UseResult1, UseJoinUserInExperienceResult)),
		onViewProfile = ReactModule.useCallback(function(UserTile)
			-- upvalues: UserIdParam (copy), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), ViewProfileSourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UseResult2 (copy)
			if UserIdParam ~= "" then
				local config = {
					friendId = UserIdParam,
					universeId = if UniverseId == "" then nil else UniverseId,
					absolutePosition = HomepageCarouselAbsolutePositionParam
				}
				
				if UserTile == ViewProfileSourceValues.UserTile then
					UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromUserTile, config)
				elseif UserTile == ViewProfileSourceValues.ViewProfileButton then
					UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, config)
				end
			end
			UseResult2()
		end, DependencyArrayFunction(UseResult2, UserIdParam, UniverseId, HomepageCarouselAbsolutePositionParam)),
		onChat = ReactModule.useCallback(function()
			-- upvalues: UserIdParam (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), UseRoactServiceResult1 (copy), NotificationType (upval)
			if UserIdParam ~= "" then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, {
					friendId = UserIdParam,
					universeId = if UniverseId == "" then nil else UniverseId,
					absolutePosition = HomepageCarouselAbsolutePositionParam
				})
				UseRoactServiceResult1:BroadcastNotification(UserIdParam, NotificationType.LAUNCH_CONVERSATION)
				
				return
			end
		end, DependencyArrayFunction(UserIdParam, UniverseId, HomepageCarouselAbsolutePositionParam, UseNavigationResult, UseRoactServiceResult1)),
		canUsePlatformChat = UseAppPolicyResult,
		userId = UserIdParam,
		universeId = UniverseId,
		homepageCarouselAbsolutePosition = HomepageCarouselAbsolutePositionParam,
		playerName = UseSignalStateResult1,
		experienceName = ExperienceName,
		bannerImageUrl = UseExperienceBannerImageResult.url,
		isLoading = UseJoinUserInExperienceResult.isLoading,
		isInExperience = UseJoinUserInExperienceResult.isInExperience,
		ageCheckRequired = if FFlagJoinCardAgeCheckUpsell then UseJoinUserInExperienceResult.ageCheckRequired else nil,
		onAgeCheckPressed = UseAgeCheckPressLoggerResult,
		wasPlayabilityCached = UseJoinUserInExperienceResult.playabilityFromCache
	})
end