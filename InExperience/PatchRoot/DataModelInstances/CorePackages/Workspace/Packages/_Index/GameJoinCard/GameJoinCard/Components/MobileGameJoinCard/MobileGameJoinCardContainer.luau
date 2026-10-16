local Parent = script.Parent.Parent.Parent.Parent
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local GameJoinCard = script:FindFirstAncestor("GameJoinCard")
local FFlagMobileGameJoinCardEDPFromTitleModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromTitle)
local FFlagMobileGameJoinCardEDPFromThumbnailModule = require(GameJoinCard.Flags.FFlagMobileGameJoinCardEDPFromThumbnail)
local FFlagGameJoinCardChatEntryPointModule = require(GameJoinCard.Flags.FFlagGameJoinCardChatEntryPoint)
local AnalyticsConstantsModule = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants)
local GameJoinCardButtonAction = AnalyticsConstantsModule.GameJoinCardButtonAction
local GameJoinCardSurface = AnalyticsConstantsModule.GameJoinCardSurface
local ViewEDPsourceValues = AnalyticsConstantsModule.viewEDPsourceValues
local ViewProfileSourceValues = AnalyticsConstantsModule.viewProfileSourceValues
local UseGameJoinCardAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useGameJoinCardAnalytics)
local UseAgeCheckUpsellAnalyticsModule = require(script.Parent.Parent.Parent.Analytics.useAgeCheckUpsellAnalytics)
local UseAgeCheckCompletionLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckCompletionLogger
local UseAgeCheckPressLoggerFunction = UseAgeCheckUpsellAnalyticsModule.useAgeCheckPressLogger
local GameJoinCardTelemetryModule = require(script.Parent.Parent.Parent.Telemetry.GameJoinCardTelemetry)
local FFlagMobileGameJoinCardThumbnailModule = require(script.Parent.Parent.Parent.Flags.FFlagMobileGameJoinCardThumbnail)
local FoundationModule = require(Parent.Foundation)
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailType = FoundationModule.Enums.ThumbnailType
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseQueryFunction = require(Parent.ApolloClient).useQuery
local ApolloLocalStateModule = require(Parent.ApolloLocalState)
local Players = game:GetService("Players")
local UserProfilesModule = require(Parent.UserProfiles)
local SocialCommonModule = require(Parent.SocialCommon)
local ChatEntryPointNames = SocialCommonModule.Enums.ChatEntryPointNames
local EnteredChatFromEntryPointFunction = SocialCommonModule.Actions.EnteredChatFromEntryPoint
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSocialCarouselUseProfileStore = SharedFlagsModule.FFlagSocialCarouselUseProfileStore
local FFlagUserProfilePlatformProfile = SharedFlagsModule.FFlagUserProfilePlatformProfile
local FFlagFriendSortedByPresenceSignalsImplementation = SharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local FFlagEnableSplitPane = SharedFlagsModule.FFlagEnableSplitPane
local FFlagGameJoinCardAnalyticsCardId = SharedFlagsModule.FFlagGameJoinCardAnalyticsCardId
local FFlagGameJoinCardSourceAttribution = SharedFlagsModule.FFlagGameJoinCardSourceAttribution
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor
local FFlagJoinUserCTAsIxpEnabled = SharedFlagsModule.FFlagJoinUserCTAsIxpEnabled
local FStringJoinUserCTAsIxpLayer = SharedFlagsModule.FStringJoinUserCTAsIxpLayer
local FFlagMobileGameJoinCardGamepadSupport = SharedFlagsModule.FFlagMobileGameJoinCardGamepadSupport
local IXPServiceWrapper = if FFlagJoinUserCTAsIxpEnabled then require(Parent.IXPServiceWrapper).IXPServiceWrapper else nil
local DataHydrationModule = require(Parent.DataHydration)
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = if FFlagSocialCarouselUseProfileStore then UserProfilesModule.Stores.UserProfileStore.get() else nil
local GameDetailModule = require(Parent.GameDetail)
local UseExperienceBannerImageFunction = GameDetailModule.useExperienceBannerImage
local OpenGameDetailsFunction = GameDetailModule.OpenGameDetails
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local GameDetailReferralFunction = DiscoveryAnalyticsModule.Events.gameDetailReferral
local PeopleListInHomePage = DiscoveryAnalyticsModule.Constants.Context.PeopleListInHomePage
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppGuiService = RoactServiceTagsModule.AppGuiService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local AppPage = RobloxAppEnumsModule.AppPage
local NotificationType = RobloxAppEnumsModule.NotificationType
local DependencyArrayFunction = RoactUtilsModule.Hooks.dependencyArray
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseJoinUserInExperienceFunction = require(Parent.SocialExperienceJoin).useJoinUserInExperience
local MobileGameJoinCardModule = require(script.Parent.MobileGameJoinCard)
local ActionsModule = require(GameJoinCard.Components.Actions)
local ContainsActionModule = require(GameJoinCard.Components.Actions.containsAction)
local UseJoinUserActionsModule = require(GameJoinCard.Hooks.useJoinUserActions)
local UseLogActionsResolveTimeModule = require(GameJoinCard.Telemetry.useLogActionsResolveTime)
local DataStatus = DataHydrationModule.DataStatus
local GetResult1 = DataHydrationModule.Presence.PresenceStore.get()
local FFlagProfileCTAHydratePresenceFromMetadataModule = require(Parent.DataHydration.FFlagProfileCTAHydratePresenceFromMetadata)
local config = {
	universeId = "",
	lastLocation = "",
	userPresenceType = "",
	placeId = "",
	rootPlaceId = "",
	gameId = ""
}
local config1 = { skipFetch = true }

return function() --[[ Line: 133 | Named "MobileGameJoinCardContainer" ]]
	-- upvalues: FFlagMobileGameJoinCardEDPFromTitleModule (copy), FFlagMobileGameJoinCardEDPFromThumbnailModule (copy), FFlagGameJoinCardChatEntryPointModule (copy), FFlagJoinabilityCTARefactor (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagMobileGameJoinCardGamepadSupport (copy), UseNavigationFocusFunction (copy), FFlagGameJoinCardSourceAttribution (copy), ReactModule (copy), FFlagGameJoinCardAnalyticsCardId (copy), HttpService (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), AppGuiService (copy), AppSessionService (copy), UseAppPolicyFunction (copy), Players (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), SignalsModule (copy), GetResult1 (copy), FFlagProfileCTAHydratePresenceFromMetadataModule (copy), config1 (copy), SignalsReactModule (copy), UseQueryFunction (copy), ApolloLocalStateModule (copy), FFlagJoinUserCTAsIxpEnabled (copy), IXPServiceWrapper (copy), FStringJoinUserCTAsIxpLayer (copy), UseGameJoinCardAnalyticsModule (copy), FFlagSocialCarouselUseProfileStore (copy), GetResult (copy), UserProfilesModule (copy), FFlagUserProfilePlatformProfile (copy), UseExperienceBannerImageFunction (copy), FFlagMobileGameJoinCardThumbnailModule (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), GameJoinCardTelemetryModule (copy), UseAgeCheckCompletionLoggerFunction (copy), UseJoinUserInExperienceFunction (copy), config (copy), UseJoinUserActionsModule (copy), UseLocalizationFunction (copy), ActionsModule (copy), UseLogActionsResolveTimeModule (copy), GameJoinCardSurface (copy), UseAgeCheckPressLoggerFunction (copy), DataStatus (copy), ContainsActionModule (copy), UserCtaAction (copy), GameJoinCardButtonAction (copy), GamePlayIntentFunction (copy), PeopleListInHomePage (copy), DependencyArrayFunction (copy), FFlagEnableSplitPane (copy), AppPage (copy), ViewProfileSourceValues (copy), SetGamePlaySessionFunction (copy), SessionType (copy), GameDetailReferralFunction (copy), OpenGameDetailsFunction (copy), ViewEDPsourceValues (copy), EnteredChatFromEntryPointFunction (copy), ChatEntryPointNames (copy), NotificationType (copy), MobileGameJoinCardModule (copy)
	local UseDispatchResult = if FFlagMobileGameJoinCardEDPFromTitleModule or FFlagMobileGameJoinCardEDPFromThumbnailModule or FFlagGameJoinCardChatEntryPointModule or FFlagJoinabilityCTARefactor then UseDispatchFunction() else nil
	local UseNavigationResult = UseNavigationFunction()
	local UseNavigationFocusResult = if FFlagMobileGameJoinCardGamepadSupport then UseNavigationFocusFunction() else nil
	local UserIdParam = UseNavigationResult.getParam("userId") or ""
	local HomepageCarouselAbsolutePositionParam = UseNavigationResult.getParam("homepageCarouselAbsolutePosition")
	local JoinSourceParam = if FFlagGameJoinCardSourceAttribution then UseNavigationResult.getParam("joinSource") else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 149 ]]
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end, { UseNavigationResult })
	local UseMemoResult = if FFlagGameJoinCardAnalyticsCardId then ReactModule.useMemo(function() --[[ Line: 154 ]]
		-- upvalues: HttpService (upval)
		return HttpService:GenerateGUID(false)
	end, {}) else nil
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGuiService)
	local UseRoactServiceResult2 = if FFlagMobileGameJoinCardEDPFromTitleModule or FFlagMobileGameJoinCardEDPFromThumbnailModule then UseRoactServiceFunction(AppSessionService) else nil
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1) --[[ Line: 164 ]]
		return p1.getCanUsePlatformChat()
	end)
	local Text = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId or "")
	local UseSignalStateResult = nil
	
	if FFlagFriendSortedByPresenceSignalsImplementation then
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 173 ]]
			-- upvalues: SignalsModule (upval), GetResult1 (upval), UserIdParam (copy), FFlagJoinabilityCTARefactor (upval), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), config1 (upval)
			return SignalsModule.createComputed(function(p1) --[[ Line: 174 ]]
				-- upvalues: GetResult1 (upval), UserIdParam (upval), FFlagJoinabilityCTARefactor (upval), FFlagProfileCTAHydratePresenceFromMetadataModule (upval), config1 (upval)
				return GetResult1.GetPresenceByUserId(UserIdParam, if FFlagJoinabilityCTARefactor and FFlagProfileCTAHydratePresenceFromMetadataModule then config1 else nil).data(p1)
			end)
		end, { UserIdParam })))
	else
		local UseQueryResult = UseQueryFunction(ApolloLocalStateModule.queries.onlineFriendsByUserId, {
			fetchPolicy = "cache-only",
			variables = { sort = 1, userId = Text }
		})
		UseSignalStateResult = ReactModule.useMemo(function() --[[ Line: 194 ]]
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
	ReactModule.useEffect(function() --[[ Line: 213 ]]
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
	ReactModule.useEffect(function() --[[ Line: 226 ]]
		-- upvalues: UserIdParam (copy), UseSignalStateResult (ref), FFlagJoinUserCTAsIxpEnabled (upval), IXPServiceWrapper (upval), FStringJoinUserCTAsIxpLayer (upval), UseGameJoinCardAnalyticsModule (upval), HomepageCarouselAbsolutePositionParam (copy), FFlagGameJoinCardAnalyticsCardId (upval), UseMemoResult (copy)
		if UserIdParam == "" then return end
		local Text = if UseSignalStateResult and UseSignalStateResult.universeId ~= nil and tostring(UseSignalStateResult.universeId) ~= "" then tostring(UseSignalStateResult.universeId) else nil
		
		if FFlagJoinUserCTAsIxpEnabled then
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringJoinUserCTAsIxpLayer)
		end
		UseGameJoinCardAnalyticsModule.logGameJoinCardPageLoaded({
			friendId = UserIdParam,
			universeId = Text,
			absolutePosition = HomepageCarouselAbsolutePositionParam,
			joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
		})
	end, {})
	local UseSignalStateResult1 = nil
	
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 248 ]]
			-- upvalues: GetResult (upval), UserIdParam (copy)
			return GetResult.fetchNamesByUserIds({ UserIdParam })
		end, { UserIdParam })
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 252 ]]
			-- upvalues: SignalsModule (upval), UseMemoResult1 (copy)
			return SignalsModule.createComputed(function(p1) --[[ Line: 253 ]]
				-- upvalues: UseMemoResult1 (upval)
				local UseMemoResultResult = UseMemoResult1(p1)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p1) else nil
			end)
		end, { UseMemoResult1 }))) or ""
	else
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { UserIdParam },
			query = if FFlagUserProfilePlatformProfile then UserProfilesModule.Queries.userProfilesCombinedNameByUserIds else UserProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		UseSignalStateResult1 = ReactModule.useMemo(function() --[[ Line: 269 ]]
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), UserIdParam (copy)
			return UseUserProfilesFetchResult.data and UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, UserIdParam) or ""
		end, { UseUserProfilesFetchResult.data, UserIdParam })
	end
	local Text1 = if UseSignalStateResult and UseSignalStateResult.rootPlaceId ~= nil then tostring(UseSignalStateResult.rootPlaceId) else nil
	local UseExperienceBannerImageResult = UseExperienceBannerImageFunction(UniverseId, Text1)
	local RbxThumb = if FFlagMobileGameJoinCardThumbnailModule and UniverseId ~= "" then GetRbxThumbFunction(ThumbnailType.GameIcon, UniverseId, ThumbnailSize.Medium) else nil
	ReactModule.useEffect(function() --[[ Line: 287 ]]
		-- upvalues: UniverseId (copy), GameJoinCardTelemetryModule (upval), UseExperienceBannerImageResult (copy)
		if UniverseId ~= "" then
			GameJoinCardTelemetryModule.logBannerLoadResult(UseExperienceBannerImageResult.status)
			
			return
		end
	end, { UseExperienceBannerImageResult.status, UniverseId })
	local UseJoinUserInExperienceResult = UseJoinUserInExperienceFunction(UserIdParam, {
		isHomePageCarousel = not FFlagGameJoinCardSourceAttribution or JoinSourceParam == nil,
		analyticProps = if FFlagGameJoinCardSourceAttribution then ReactModule.useMemo(function() --[[ Line: 302 ]]
			-- upvalues: JoinSourceParam (copy)
			return if JoinSourceParam == nil then nil else {
				context = JoinSourceParam.surface,
				subpage = JoinSourceParam.subpage
			}
		end, { JoinSourceParam }) else nil,
		joinAttemptOrigin = if FFlagGameJoinCardSourceAttribution and JoinSourceParam ~= nil then JoinSourceParam.surface else nil,
		presence = UseSignalStateResult or config,
		onBeforeJoin = ReactModule.useCallback(function() --[[ Line: 294 ]]
			-- upvalues: FFlagJoinabilityCTARefactor (upval), UseNavigationResult (copy)
			if not FFlagJoinabilityCTARefactor then
				UseNavigationResult.goBack()
			end
		end, { UseNavigationResult }),
		onAgeCheckCompletion = UseAgeCheckCompletionLoggerFunction(UniverseId)
	})
	local v1 = nil
	local Ready = nil
	local Localized = nil
	
	if FFlagJoinabilityCTARefactor then
		v1, Ready = UseJoinUserActionsModule(UserIdParam, true, `{tostring(UseSignalStateResult and UseSignalStateResult.userPresenceType)}:{tostring(UseSignalStateResult and UseSignalStateResult.universeId)}:{tostring(UseSignalStateResult and UseSignalStateResult.placeId)}:{tostring(UseSignalStateResult and UseSignalStateResult.rootPlaceId)}:{tostring(UseJoinUserInExperienceResult.ageCheckRequired)}`)
		Localized = UseLocalizationFunction(ActionsModule.TextKeys)
	end
	UseLogActionsResolveTimeModule(if FFlagJoinabilityCTARefactor then Ready else nil, true, GameJoinCardSurface.Mobile)
	local UseAgeCheckPressLoggerResult = UseAgeCheckPressLoggerFunction({
		userId = UserIdParam,
		universeId = UniverseId,
		absolutePosition = HomepageCarouselAbsolutePositionParam,
		joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil,
		joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
	})
	local ContainsActionModuleResult = if FFlagJoinabilityCTARefactor then Ready == DataStatus.Ready and ContainsActionModule(v1, UserCtaAction.UnlockExperience) else UseJoinUserInExperienceResult.ageCheckRequired == true
	ReactModule.useEffect(function() --[[ Line: 359 ]]
		-- upvalues: ContainsActionModuleResult (copy), UniverseId (copy), UseGameJoinCardAnalyticsModule (upval)
		if ContainsActionModuleResult and UniverseId ~= "" then
			UseGameJoinCardAnalyticsModule.logJoinCardAgeCheckUpsellImpression({ universeId = UniverseId })
			
			return
		end
	end, { ContainsActionModuleResult, UniverseId })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 368 ]]
		-- upvalues: UserIdParam (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), FFlagGameJoinCardAnalyticsCardId (upval), UseMemoResult (copy), UseSignalStateResult (ref), GamePlayIntentFunction (upval), UseRoactServiceResult (copy), PeopleListInHomePage (upval), HttpService (upval)
		if UserIdParam ~= "" then
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.JoinGame, {
				friendId = UserIdParam,
				universeId = if UniverseId == "" then nil else UniverseId,
				absolutePosition = HomepageCarouselAbsolutePositionParam,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
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
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 396 ]]
		-- upvalues: FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval), UserIdParam (copy)
		(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, { detail = UserIdParam })
	end, { UseNavigationResult, UserIdParam })
	local UseResult3 = ReactModule.useCallback(function(UserTile) --[[ Line: 403 ]]
		-- upvalues: UserIdParam (copy), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), FFlagGameJoinCardAnalyticsCardId (upval), UseMemoResult (copy), ViewProfileSourceValues (upval), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UseResult2 (copy)
		if UserIdParam ~= "" then
			local config = {
				friendId = UserIdParam,
				universeId = if UniverseId == "" then nil else UniverseId,
				absolutePosition = HomepageCarouselAbsolutePositionParam,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
			}
			
			if UserTile == ViewProfileSourceValues.UserTile then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromUserTile, config)
			elseif UserTile == ViewProfileSourceValues.ViewProfileButton then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.OpenProfileFromViewProfile, config)
			end
		end
		UseResult2()
	end, DependencyArrayFunction(UseResult2, UserIdParam, UniverseId, HomepageCarouselAbsolutePositionParam))
	local UseResult4 = if FFlagMobileGameJoinCardEDPFromTitleModule or FFlagMobileGameJoinCardEDPFromThumbnailModule then ReactModule.useCallback(function() --[[ Line: 429 ]]
		-- upvalues: UseSignalStateResult (ref), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), UseRoactServiceResult2 (copy), SetGamePlaySessionFunction (upval), SessionType (upval), GameDetailReferralFunction (upval), UseRoactServiceResult (copy), UserIdParam (copy), UseDispatchResult (copy), OpenGameDetailsFunction (upval), UseNavigationResult (copy)
		local RootPlaceId = UseSignalStateResult and UseSignalStateResult.rootPlaceId
		local UniverseId1 = if RootPlaceId == nil or tostring(RootPlaceId) == "" then UniverseId else tostring(RootPlaceId)
		local HomepageCarouselAbsolutePositionParam1 = HomepageCarouselAbsolutePositionParam or 0
		
		if UseRoactServiceResult2 then
			SetGamePlaySessionFunction(UseRoactServiceResult2, SessionType.StructuralIdentifier.GameDetailSource, false)
		end
		GameDetailReferralFunction(UseRoactServiceResult, "home", {
			ad = "no",
			pg = "home",
			rowOnPage = 1,
			tis = 1,
			friendId = UserIdParam,
			pid = UniverseId1,
			pos = HomepageCarouselAbsolutePositionParam1,
			sortPos = HomepageCarouselAbsolutePositionParam1,
			universeId = UniverseId
		})
		UseDispatchResult(OpenGameDetailsFunction(UniverseId, UseNavigationResult))
	end, {
		UseDispatchResult, UseNavigationResult, UniverseId, UseSignalStateResult,
		HomepageCarouselAbsolutePositionParam, UserIdParam, UseRoactServiceResult,
		UseRoactServiceResult2
	}) else nil
	local UseResult5 = if FFlagMobileGameJoinCardEDPFromTitleModule or FFlagMobileGameJoinCardEDPFromThumbnailModule then ReactModule.useCallback(function(Thumbnail) --[[ Line: 467 ]]
		-- upvalues: UserIdParam (copy), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), FFlagGameJoinCardAnalyticsCardId (upval), UseMemoResult (copy), ViewEDPsourceValues (upval), GameJoinCardButtonAction (upval), UseGameJoinCardAnalyticsModule (upval), UseResult4 (copy)
		if UserIdParam ~= "" then
			local config = {
				friendId = UserIdParam,
				universeId = if UniverseId == "" then nil else UniverseId,
				absolutePosition = HomepageCarouselAbsolutePositionParam,
				joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
			}
			local ViewExperienceDetailsFromThumbnail = if Thumbnail == ViewEDPsourceValues.Thumbnail then GameJoinCardButtonAction.ViewExperienceDetailsFromThumbnail elseif Thumbnail == ViewEDPsourceValues.Title then GameJoinCardButtonAction.ViewExperienceDetailsFromTitle else nil
			
			if ViewExperienceDetailsFromThumbnail then
				UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(ViewExperienceDetailsFromThumbnail, config)
			end
		end
		if UniverseId ~= "" then
			UseResult4()
		end
	end, {
		UseResult4,
		UniverseId,
		UserIdParam,
		HomepageCarouselAbsolutePositionParam,
		UseMemoResult
	}) else nil
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 491 ]]
		-- upvalues: UseResult1 (copy), UseJoinUserInExperienceResult (copy)
		UseResult1()
		UseJoinUserInExperienceResult.joinExperience()
	end, DependencyArrayFunction(UseResult1, UseJoinUserInExperienceResult))
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 496 ]]
		-- upvalues: UserIdParam (copy), UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UniverseId (copy), HomepageCarouselAbsolutePositionParam (copy), FFlagGameJoinCardAnalyticsCardId (upval), UseMemoResult (copy), FFlagGameJoinCardChatEntryPointModule (upval), UseDispatchResult (copy), EnteredChatFromEntryPointFunction (upval), ChatEntryPointNames (upval), UseRoactServiceResult1 (copy), NotificationType (upval)
		if UserIdParam == "" then return end
		UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.Chat, {
			friendId = UserIdParam,
			universeId = if UniverseId == "" then nil else UniverseId,
			absolutePosition = HomepageCarouselAbsolutePositionParam,
			joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
		})
		
		if FFlagGameJoinCardChatEntryPointModule then
			UseDispatchResult(EnteredChatFromEntryPointFunction(ChatEntryPointNames.GameJoinCard))
		end
		UseRoactServiceResult1:BroadcastNotification(UserIdParam, NotificationType.LAUNCH_CONVERSATION)
	end, DependencyArrayFunction(UserIdParam, UniverseId, HomepageCarouselAbsolutePositionParam, UseNavigationResult, UseRoactServiceResult1, UseDispatchResult))
	local v2 = nil
	local IsNotReadyMatch = false
	
	if FFlagJoinabilityCTARefactor then
		IsNotReadyMatch = Ready == DataStatus.NotReady
		local List = {}
		
		if Ready == DataStatus.Ready and Localized ~= nil then
			for _, value in ActionsModule.resolveJoinCardActions(v1, {
				localized = Localized,
				userId = UserIdParam,
				telemetry = {
					universeId = if UniverseId == "" then nil else UniverseId,
					absolutePosition = HomepageCarouselAbsolutePositionParam,
					joinGameCardId = if FFlagGameJoinCardAnalyticsCardId then UseMemoResult else nil
				},
				presence = {
					placeId = if UseSignalStateResult and UseSignalStateResult.placeId ~= nil then tostring(UseSignalStateResult.placeId) else nil,
					rootPlaceId = Text1
				},
				experience = {
					isLoading = UseJoinUserInExperienceResult.isLoading,
					isInExperience = UseJoinUserInExperienceResult.isInExperience,
					joinExperience = UseJoinUserInExperienceResult.joinExperience,
					playExperience = UseJoinUserInExperienceResult.playExperience
				},
				eventIngest = UseRoactServiceResult,
				dispatch = UseDispatchResult,
				guiService = UseRoactServiceResult1,
				navigation = UseNavigationResult,
				joinAgeCheckUpsellFlow = UseJoinUserInExperienceResult.joinAgeCheckUpsellFlow
			}) do
				if value.id ~= UserCtaAction.Chat or UseAppPolicyResult then
					if value.id == UserCtaAction.ViewProfile or value.id == UserCtaAction.Chat then
						value.keepOpenOnActivate = true
					end
					table.insert(List, value)
				end
			end
		end
		v2 = List
	end
	return ReactModule.createElement(MobileGameJoinCardModule, {
		isNavigationFocused = UseNavigationFocusResult,
		onClose = UseResult,
		onJoin = UseResult6,
		onViewProfile = UseResult3,
		onViewExperienceDetails = UseResult5,
		onChat = UseResult7,
		canUsePlatformChat = UseAppPolicyResult,
		userId = UserIdParam,
		universeId = UniverseId,
		homepageCarouselAbsolutePosition = HomepageCarouselAbsolutePositionParam,
		playerName = UseSignalStateResult1,
		experienceName = ExperienceName,
		bannerImageUrl = UseExperienceBannerImageResult.url,
		thumbnailImageUrl = RbxThumb,
		isLoading = UseJoinUserInExperienceResult.isLoading,
		isInExperience = UseJoinUserInExperienceResult.isInExperience,
		ageCheckRequired = UseJoinUserInExperienceResult.ageCheckRequired,
		onAgeCheckPressed = UseAgeCheckPressLoggerResult,
		wasPlayabilityCached = UseJoinUserInExperienceResult.playabilityFromCache,
		actions = if FFlagJoinabilityCTARefactor then v2 else {},
		areActionsLoading = if FFlagJoinabilityCTARefactor then IsNotReadyMatch else nil
	})
end