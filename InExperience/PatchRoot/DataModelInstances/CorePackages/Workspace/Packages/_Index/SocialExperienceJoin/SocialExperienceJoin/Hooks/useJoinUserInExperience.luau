local SocialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local Parent = SocialExperienceJoin.Parent
local PromiseModule = require(Parent.Promise)
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactUtilsModule = require(Parent.RoactUtils)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local EventNamesModule = require(SocialExperienceJoin.Analytics.EventNames)
local JoinExperienceStatusModule = require(SocialExperienceJoin.Analytics.JoinExperienceStatus)
local InitializeSocialExperienceJoinAnalyticsModule = require(SocialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local ConstantsModule = require(SocialExperienceJoin.Common.Constants)
local NetworkingGamesModule = require(SocialExperienceJoin.Networking.NetworkingGames)
local UseAgeCheckUpsellStateModule = require(script.Parent.useAgeCheckUpsellState)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local PlayabilityStatus = require(SocialExperienceJoin.Rodux.Games).Enums.PlayabilityStatus
local NetworkStatus = require(SocialExperienceJoin.Networking.myRoduxNetworking).Enum.NetworkStatus
local LaunchGameFunction = require(Parent.GameLaunch).LaunchGame
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local AppSessionService = RoactServiceTagsModule.AppSessionService
local UseRoactServiceFunction = RobloxAppHooksModule.useRoactService
local AppPage = RobloxAppEnumsModule.AppPage
local NavigateDownFunction = require(Parent.NavigationRodux).Thunks.NavigateDown
local FFlagSignalsNavP3Dispatch = require(Parent.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(Parent.RobloxAppNavigation).NavigationCommands else nil
local AppGame = RoactServiceTagsModule.AppGame
local UseLocalUserIdFunction = RobloxAppHooksModule.useLocalUserId
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local FFlagProfilePlatformImproveGameDetailsAnalytics = require(Parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local FFlagGameJoinCardSourceAttribution = require(Parent.SharedFlags).FFlagGameJoinCardSourceAttribution
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor
local FFlagSocialExperienceJoinPresenceStoreMigrationModule = require(SocialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration)
local UseGetPresenceByUserId = if FFlagSocialExperienceJoinPresenceStoreMigrationModule then require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SocialJoinUseUnifiedPurchaseFlow = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false)
local GameJoinCardOnBeforeJoinCallback = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false)
local SocialJoinPassPlaceIdToLaunch = game:DefineFastFlag("SocialJoinPassPlaceIdToLaunch", false)
local config = { skipFetch = true }

return function(UserId, p1) --[[ Line: 71 ]]
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), AppGame (copy), ReactModule (copy), InitializeSocialExperienceJoinAnalyticsModule (copy), UseLocalUserIdFunction (copy), FFlagSocialExperienceJoinPresenceStoreMigrationModule (copy), UseGetPresenceByUserId (copy), config (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy), NetworkingGamesModule (copy), NetworkStatus (copy), UseAgeCheckUpsellStateModule (copy), SetGamePlaySessionFunction (copy), SessionType (copy), EventNamesModule (copy), FFlagJoinabilityCTARefactor (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), JoinExperienceStatusModule (copy), PromiseModule (copy), SocialJoinUseUnifiedPurchaseFlow (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), PlayabilityStatus (copy), GameJoinCardOnBeforeJoinCallback (copy), LaunchGameFunction (copy), SocialJoinPassPlaceIdToLaunch (copy), FFlagGameJoinCardSourceAttribution (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGame)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 91 ]]
		-- upvalues: InitializeSocialExperienceJoinAnalyticsModule (upval), p1 (copy)
		return InitializeSocialExperienceJoinAnalyticsModule(p1.analyticProps)
	end, {})
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseGetPresenceByUserIdResult = if FFlagSocialExperienceJoinPresenceStoreMigrationModule then UseGetPresenceByUserId(UserId, config) else nil
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 102 ]]
		-- upvalues: p1 (copy), FFlagSocialExperienceJoinPresenceStoreMigrationModule (upval), UseGetPresenceByUserIdResult (ref), GetDeepValueFunction (upval), ConstantsModule (upval), UserId (copy), NetworkingGamesModule (upval), NetworkStatus (upval)
		local Presence = if p1.presence then p1.presence elseif FFlagSocialExperienceJoinPresenceStoreMigrationModule then UseGetPresenceByUserIdResult else GetDeepValueFunction(p2, `{ConstantsModule.RODUX_KEY}.Presence.byUserId.{UserId}`)
		local Text: string = if Presence and Presence.universeId then tostring(Presence.universeId) else ""
		
		return {
			universeId = Text,
			presenceType = if Presence and Presence.userPresenceType then Presence.userPresenceType else "",
			lastLocation = if Presence and Presence.lastLocation then Presence.lastLocation else nil,
			placeId = if Presence and Presence.placeId then tostring(Presence.placeId) else "",
			rootPlaceId = if Presence and Presence.rootPlaceId then tostring(Presence.rootPlaceId) else "",
			gameId = if Presence and Presence.gameId then tostring(Presence.gameId) else "",
			isLoading = Text ~= "" and (NetworkingGamesModule.GetExperiencesPlayabilityStatus.getStatus(p2, Text) == NetworkStatus.Fetching or (NetworkingGamesModule.GetExperiencesDetails.getStatus(p2, Text) == NetworkStatus.Fetching or NetworkingGamesModule.GetExperiencesProductInfo.getStatus(p2, Text) == NetworkStatus.Fetching))
		}
	end)
	local UseAgeCheckUpsellStateModuleResult = UseAgeCheckUpsellStateModule(UseSelectorResult.universeId, p1.onAgeCheckCompletion)
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 136 ]]
		-- upvalues: UseDispatchResult (copy), NetworkingGamesModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (copy), SessionType (upval), UseMemoResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UserId (copy), UseLocalUserIdResult (copy), FFlagJoinabilityCTARefactor (upval), p1 (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), JoinExperienceStatusModule (upval), PromiseModule (upval), SocialJoinUseUnifiedPurchaseFlow (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), CloseCentralOverlayFunction (upval), UseAgeCheckUpsellStateModuleResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), PlayabilityStatus (upval), GameJoinCardOnBeforeJoinCallback (upval), LaunchGameFunction (upval), SocialJoinPassPlaceIdToLaunch (upval), UseRoactServiceResult1 (copy), FFlagGameJoinCardSourceAttribution (upval), ConstantsModule (upval)
		local function _(p3) --[[ Line: 137 ]]
			-- upvalues: UseDispatchResult (upval), NetworkingGamesModule (upval)
			return UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ p3 }))
		end
		
		local function v50(UniverseId) --[[ Line: 141 ]]
			-- upvalues: UseDispatchResult (upval), NetworkingGamesModule (upval)
			return UseDispatchResult(NetworkingGamesModule.GetExperiencesProductInfo.API({ UniverseId }))
		end
		
		local _ = function(Status) --[[ Line: 145 ]]
			-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagJoinabilityCTARefactor (upval), p2 (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
			return function(JoinAttemptId) --[[ Line: 146 ]]
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Status (copy), FFlagJoinabilityCTARefactor (upval), p2 (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Status,
					followUser = if FFlagJoinabilityCTARefactor then tostring(p2) else nil,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end
		end
		
		local function v52() --[[ Line: 168 ]]
			-- upvalues: JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagJoinabilityCTARefactor (upval), p2 (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), PromiseModule (upval), UseDispatchResult (upval), NetworkingGamesModule (upval), v50 (copy), SocialJoinUseUnifiedPurchaseFlow (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), CloseCentralOverlayFunction (upval), UseAgeCheckUpsellStateModuleResult (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
			local PurchaseRequired = JoinExperienceStatusModule.PurchaseRequired;
			(function(JoinAttemptId) --[[ Line: 146 ]]
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), PurchaseRequired (copy), FFlagJoinabilityCTARefactor (upval), p2 (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = PurchaseRequired,
					followUser = if FFlagJoinabilityCTARefactor then tostring(p2) else nil,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end)()
			PromiseModule.all(UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ UseSelectorResult.universeId })), v50(UseSelectorResult.universeId)):andThen(function() --[[ Line: 176 ]]
				-- upvalues: SocialJoinUseUnifiedPurchaseFlow (upval), UseSelectorResult (upval), UseDispatchResult (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), CloseCentralOverlayFunction (upval), UseAgeCheckUpsellStateModuleResult (upval), AppPage (upval), UserId (upval), p1 (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
				if SocialJoinUseUnifiedPurchaseFlow then
					UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.UnifiedProductPurchaseModal, {
						productPayload = {
							kind = "Experience",
							universeId = UseSelectorResult.universeId,
							experienceName = UseSelectorResult.lastLocation or "",
							experienceIconUrl = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", UseSelectorResult.universeId)
						},
						purchaseCallbacks = {
							onFlowComplete = function() --[[ Line: 190 ]]
								-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
								UseDispatchResult(CloseCentralOverlayFunction())
							end,
							onPurchaseSuccess = function() --[[ Line: 193 ]]
								-- upvalues: UseAgeCheckUpsellStateModuleResult (upval)
								if UseAgeCheckUpsellStateModuleResult then
									UseAgeCheckUpsellStateModuleResult.refetchPlayability()
								end
							end
						},
						purchaseAnalyticsMetadata = { surface = "JoinUserInExperience" }
					}))
					
					return
				end
				local config = {
					name = AppPage.SocialPurchaseExperience,
					detail = UseSelectorResult.universeId,
					extraProps = { userId = UserId, analyticProps = p1.analyticProps }
				}
				
				if FFlagSignalsNavP3Dispatch then
					NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
					
					return
				else
					UseDispatchResult(NavigateDownFunction(config))
				end
			end)
		end
		
		local function v53() --[[ Line: 221 ]]
			-- upvalues: SocialJoinUseUnifiedPurchaseFlow (upval), JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagJoinabilityCTARefactor (upval), p2 (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
			local Unable = if SocialJoinUseUnifiedPurchaseFlow then JoinExperienceStatusModule.Unable else JoinExperienceStatusModule.PurchaseRequired;
			(function(JoinAttemptId) --[[ Line: 146 ]]
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Unable (copy), FFlagJoinabilityCTARefactor (upval), p2 (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Unable,
					followUser = if FFlagJoinabilityCTARefactor then tostring(p2) else nil,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end)(JoinExperienceStatusModule.Unable)
			local config = {
				name = AppPage.SocialUnableToJoinExperience,
				detail = UseSelectorResult.universeId,
				extraProps = {
					userId = UserId,
					analyticProps = p1.analyticProps,
					openGameDetailsPeekViewClosed = p1.openGameDetailsPeekViewClosed
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				UseDispatchResult(NavigateDownFunction(config))
			end
		end
		
		;(function(p3) --[[ Line: 247 ]]
			-- upvalues: UseAgeCheckUpsellStateModuleResult (upval), PromiseModule (upval), UseDispatchResult (upval), NetworkingGamesModule (upval)
			return if UseAgeCheckUpsellStateModuleResult and UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus then PromiseModule.resolve(UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus) else UseDispatchResult(NetworkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(Result) --[[ Line: 252 ]]
				return Result.responseBody[1].playabilityStatus
			end)
		end)(UseSelectorResult.universeId):andThen(function(Result) --[[ Line: 259 ]]
			-- upvalues: PlayabilityStatus (upval), v52 (copy), GameJoinCardOnBeforeJoinCallback (upval), p1 (upval), JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagJoinabilityCTARefactor (upval), p2 (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), LaunchGameFunction (upval), SocialJoinPassPlaceIdToLaunch (upval), UseRoactServiceResult1 (upval), FFlagGameJoinCardSourceAttribution (upval), ConstantsModule (upval), UseAgeCheckUpsellStateModuleResult (upval), v53 (copy)
			if Result == PlayabilityStatus.PurchaseRequired.rawValue() then
				v52()
				
				return
			end
			if Result == PlayabilityStatus.Playable.rawValue() then
				if GameJoinCardOnBeforeJoinCallback and p1.onBeforeJoin then
					p1.onBeforeJoin()
				end
				local Success = JoinExperienceStatusModule.Success
				LaunchGameFunction(if FFlagJoinabilityCTARefactor and not p2 then UseSelectorResult.rootPlaceId elseif SocialJoinPassPlaceIdToLaunch and UseSelectorResult.placeId ~= "" then UseSelectorResult.placeId else nil, nil, if p2 then { userId = UserId } else nil, UseRoactServiceResult1, FFlagGameJoinCardSourceAttribution and p1.joinAttemptOrigin or ConstantsModule.AnalyticsContext.PeopleListInHomePage, function(JoinAttemptId) --[[ Line: 146 ]]
					-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Success (copy), FFlagJoinabilityCTARefactor (upval), p2 (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
					SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
						placeId = UseSelectorResult.placeId,
						rootPlaceId = UseSelectorResult.rootPlaceId,
						gameInstanceId = UseSelectorResult.gameId,
						profileUserId = UserId,
						uid = UseLocalUserIdResult,
						joinAttemptId = JoinAttemptId,
						status = Success,
						followUser = if FFlagJoinabilityCTARefactor then tostring(p2) else nil,
						isHomePageCarousel = p1.isHomePageCarousel or false,
						absolutePosition = p1.homepageCarouselAbsolutePosition,
						friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
					})
				end)
				
				return
			elseif UseAgeCheckUpsellStateModuleResult and UseAgeCheckUpsellStateModuleResult.ageCheckRequired then
				UseAgeCheckUpsellStateModuleResult.joinAgeCheckUpsellFlow()
				
				return
			else
				v53()
			end
		end):catch(function() --[[ Line: 289 ]]
			-- upvalues: JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagJoinabilityCTARefactor (upval), p2 (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
			local Failure = JoinExperienceStatusModule.Failure;
			(function(JoinAttemptId) --[[ Line: 146 ]]
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Failure (copy), FFlagJoinabilityCTARefactor (upval), p2 (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Failure,
					followUser = if FFlagJoinabilityCTARefactor then tostring(p2) else nil,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end)()
		end)
	end, if SocialJoinUseUnifiedPurchaseFlow then {
		UseDispatchResult, UseSelectorResult.universeId, UseSelectorResult.placeId,
		UseSelectorResult.rootPlaceId, UseSelectorResult.gameId,
		UseSelectorResult.lastLocation, UserId, UseLocalUserIdResult, UseMemoResult,
		UseRoactServiceResult, UseRoactServiceResult1, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, p1.analyticProps,
		p1.openGameDetailsPeekViewClosed, p1.onBeforeJoin,
		if FFlagGameJoinCardSourceAttribution then p1.joinAttemptOrigin else nil,
		UseAgeCheckUpsellStateModuleResult
	} else {
		UseDispatchResult, UseSelectorResult.universeId, UseSelectorResult.placeId,
		UseSelectorResult.rootPlaceId, UseSelectorResult.gameId, UserId,
		UseLocalUserIdResult, UseMemoResult, UseRoactServiceResult,
		UseRoactServiceResult1, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition,
		if FFlagGameJoinCardSourceAttribution then p1.joinAttemptOrigin else nil,
		UseAgeCheckUpsellStateModuleResult
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 333 ]]
		-- upvalues: UseResult (copy)
		UseResult(true)
	end, { UseResult })
	local UseResult2 = if FFlagJoinabilityCTARefactor then ReactModule.useCallback(function() --[[ Line: 339 ]]
		-- upvalues: UseResult (copy)
		UseResult(false)
	end, { UseResult }) else nil
	local IsNotUniverseIdMatch: boolean = UseSelectorResult.presenceType and UseSelectorResult.lastLocation and UseSelectorResult.universeId ~= "" or false
	local IsLoading = if UseAgeCheckUpsellStateModuleResult then UseSelectorResult.isLoading or (not UseAgeCheckUpsellStateModuleResult.playabilityChecked or UseAgeCheckUpsellStateModuleResult.pendingParentalControlsResolution) else UseSelectorResult.isLoading
	
	return ReactModule.useMemo(function() --[[ Line: 357 ]]
		-- upvalues: UseResult1 (copy), FFlagJoinabilityCTARefactor (upval), UseResult2 (ref), UseAgeCheckUpsellStateModuleResult (copy), IsNotUniverseIdMatch (copy), IsLoading (copy)
		return {
			joinExperience = UseResult1,
			playExperience = if FFlagJoinabilityCTARefactor then UseResult2 else nil,
			joinAgeCheckUpsellFlow = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.joinAgeCheckUpsellFlow else function() --[[ Line: 363 ]] end,
			ageCheckRequired = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.ageCheckRequired else false,
			cachedPlayabilityStatus = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus else nil,
			playabilityFromCache = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.playabilityFromCache else false,
			isInExperience = IsNotUniverseIdMatch,
			isLoading = IsLoading
		}
	end, if SocialJoinUseUnifiedPurchaseFlow then {
		UseResult1, if FFlagJoinabilityCTARefactor then UseResult2 else nil,
		IsNotUniverseIdMatch, IsLoading, UseAgeCheckUpsellStateModuleResult,
		IsNotUniverseIdMatch
	} else {
		UseSelectorResult.presenceType, UseSelectorResult.lastLocation, UseResult1,
		if FFlagJoinabilityCTARefactor then UseResult2 else nil, IsLoading,
		UseAgeCheckUpsellStateModuleResult, IsNotUniverseIdMatch
	})
end