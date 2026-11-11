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
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagEnableDesktopGameJoinCard = require(Parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local FFlagProfilePlatformPassPresenceToJoinUserInExperience = require(Parent.SharedFlags).FFlagProfilePlatformPassPresenceToJoinUserInExperience
local FFlagJoinCardAgeCheckUpsell = require(Parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local CentralOverlayModule = require(Parent.CentralOverlay)
local SetCentralOverlayFunction = CentralOverlayModule.Actions.SetCentralOverlay
local CloseCentralOverlayFunction = CentralOverlayModule.Thunks.CloseCentralOverlay
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local SocialJoinUseUnifiedPurchaseFlow = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false)
local GameJoinCardOnBeforeJoinCallback = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false)
local SocialJoinPassPlaceIdToLaunch = game:DefineFastFlag("SocialJoinPassPlaceIdToLaunch", false)

return function(UserId, p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppSessionService (copy), AppGame (copy), ReactModule (copy), InitializeSocialExperienceJoinAnalyticsModule (copy), UseLocalUserIdFunction (copy), UseSelectorFunction (copy), FFlagEnableDesktopGameJoinCard (copy), FFlagEnableMobileGameJoinCard (copy), FFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), GetDeepValueFunction (copy), ConstantsModule (copy), NetworkingGamesModule (copy), NetworkStatus (copy), FFlagJoinCardAgeCheckUpsell (copy), UseAgeCheckUpsellStateModule (copy), SetGamePlaySessionFunction (copy), SessionType (copy), EventNamesModule (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (copy), JoinExperienceStatusModule (copy), PromiseModule (copy), SocialJoinUseUnifiedPurchaseFlow (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), CloseCentralOverlayFunction (copy), AppPage (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownFunction (copy), PlayabilityStatus (copy), GameJoinCardOnBeforeJoinCallback (copy), LaunchGameFunction (copy), SocialJoinPassPlaceIdToLaunch (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppGame)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: InitializeSocialExperienceJoinAnalyticsModule (upval), p1 (copy)
		return InitializeSocialExperienceJoinAnalyticsModule(p1.analyticProps)
	end, {})
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: FFlagEnableDesktopGameJoinCard (upval), FFlagEnableMobileGameJoinCard (upval), FFlagProfilePlatformPassPresenceToJoinUserInExperience (upval), p1 (copy), GetDeepValueFunction (upval), ConstantsModule (upval), UserId (copy), NetworkingGamesModule (upval), NetworkStatus (upval)
		local Presence = if (FFlagEnableDesktopGameJoinCard or FFlagEnableMobileGameJoinCard or FFlagProfilePlatformPassPresenceToJoinUserInExperience) and p1.presence then p1.presence else GetDeepValueFunction(p2, `{ConstantsModule.RODUX_KEY}.Presence.byUserId.{UserId}`)
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
	local UseAgeCheckUpsellStateModuleResult = if FFlagJoinCardAgeCheckUpsell then UseAgeCheckUpsellStateModule(UseSelectorResult.universeId, p1.onAgeCheckCompletion) else nil
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), NetworkingGamesModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (copy), SessionType (upval), UseMemoResult (copy), EventNamesModule (upval), UseSelectorResult (copy), UserId (copy), UseLocalUserIdResult (copy), p1 (copy), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), JoinExperienceStatusModule (upval), PromiseModule (upval), SocialJoinUseUnifiedPurchaseFlow (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), CloseCentralOverlayFunction (upval), UseAgeCheckUpsellStateModuleResult (copy), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval), PlayabilityStatus (upval), GameJoinCardOnBeforeJoinCallback (upval), LaunchGameFunction (upval), SocialJoinPassPlaceIdToLaunch (upval), UseRoactServiceResult1 (copy), ConstantsModule (upval)
		local function _(p2)
			-- upvalues: UseDispatchResult (upval), NetworkingGamesModule (upval)
			return UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ p2 }))
		end
		
		local function v46(UniverseId)
			-- upvalues: UseDispatchResult (upval), NetworkingGamesModule (upval)
			return UseDispatchResult(NetworkingGamesModule.GetExperiencesProductInfo.API({ UniverseId }))
		end
		
		local _ = function(Status)
			-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
			return function(JoinAttemptId)
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Status (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Status,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end
		end
		
		local function v48()
			-- upvalues: JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), PromiseModule (upval), UseDispatchResult (upval), NetworkingGamesModule (upval), v46 (copy), SocialJoinUseUnifiedPurchaseFlow (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval), CloseCentralOverlayFunction (upval), UseAgeCheckUpsellStateModuleResult (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), NavigateDownFunction (upval)
			local PurchaseRequired = JoinExperienceStatusModule.PurchaseRequired;
			(function(JoinAttemptId)
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), PurchaseRequired (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = PurchaseRequired,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if FFlagProfilePlatformImproveGameDetailsAnalytics then UserId else nil
				})
			end)()
			PromiseModule.all(UseDispatchResult(NetworkingGamesModule.GetExperiencesDetails.API({ UseSelectorResult.universeId })), v46(UseSelectorResult.universeId)):andThen(function()
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
							onFlowComplete = function()
								-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
								UseDispatchResult(CloseCentralOverlayFunction())
							end,
							onPurchaseSuccess = function()
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
		
		local function v49()
			-- upvalues: SocialJoinUseUnifiedPurchaseFlow (upval), JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), AppPage (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (upval), NavigateDownFunction (upval)
			local Unable = if SocialJoinUseUnifiedPurchaseFlow then JoinExperienceStatusModule.Unable else JoinExperienceStatusModule.PurchaseRequired;
			(function(JoinAttemptId)
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Unable (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Unable,
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
		
		;(function(p2)
			-- upvalues: UseAgeCheckUpsellStateModuleResult (upval), PromiseModule (upval), UseDispatchResult (upval), NetworkingGamesModule (upval)
			return if UseAgeCheckUpsellStateModuleResult and UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus then PromiseModule.resolve(UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus) else UseDispatchResult(NetworkingGamesModule.GetExperiencesPlayabilityStatus.API({ p2 })):andThen(function(Result)
				return Result.responseBody[1].playabilityStatus
			end)
		end)(UseSelectorResult.universeId):andThen(function(Result)
			-- upvalues: PlayabilityStatus (upval), v48 (copy), GameJoinCardOnBeforeJoinCallback (upval), p1 (upval), JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval), LaunchGameFunction (upval), SocialJoinPassPlaceIdToLaunch (upval), UseRoactServiceResult1 (upval), ConstantsModule (upval), UseAgeCheckUpsellStateModuleResult (upval), v49 (copy)
			if Result == PlayabilityStatus.PurchaseRequired.rawValue() then
				v48()
				
				return
			end
			if Result == PlayabilityStatus.Playable.rawValue() then
				if GameJoinCardOnBeforeJoinCallback and p1.onBeforeJoin then
					p1.onBeforeJoin()
				end
				local Success = JoinExperienceStatusModule.Success
				LaunchGameFunction(if SocialJoinPassPlaceIdToLaunch and UseSelectorResult.placeId ~= "" then UseSelectorResult.placeId else nil, nil, { userId = UserId }, UseRoactServiceResult1, ConstantsModule.AnalyticsContext.PeopleListInHomePage, function(JoinAttemptId)
					-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Success (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
					SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
						placeId = UseSelectorResult.placeId,
						rootPlaceId = UseSelectorResult.rootPlaceId,
						gameInstanceId = UseSelectorResult.gameId,
						profileUserId = UserId,
						uid = UseLocalUserIdResult,
						joinAttemptId = JoinAttemptId,
						status = Success,
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
				v49()
			end
		end):catch(function()
			-- upvalues: JoinExperienceStatusModule (upval), SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
			local Failure = JoinExperienceStatusModule.Failure;
			(function(JoinAttemptId)
				-- upvalues: SetGamePlaySessionFunction (upval), UseRoactServiceResult (upval), SessionType (upval), UseMemoResult (upval), EventNamesModule (upval), UseSelectorResult (upval), UserId (upval), UseLocalUserIdResult (upval), Failure (copy), p1 (upval), FFlagProfilePlatformImproveGameDetailsAnalytics (upval)
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				UseMemoResult.fireAnalyticsEvent(EventNamesModule.JoinExperience, {
					placeId = UseSelectorResult.placeId,
					rootPlaceId = UseSelectorResult.rootPlaceId,
					gameInstanceId = UseSelectorResult.gameId,
					profileUserId = UserId,
					uid = UseLocalUserIdResult,
					joinAttemptId = JoinAttemptId,
					status = Failure,
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
		UseAgeCheckUpsellStateModuleResult
	} else {
		UseDispatchResult, UseSelectorResult.universeId, UseSelectorResult.placeId,
		UseSelectorResult.rootPlaceId, UseSelectorResult.gameId, UserId,
		UseLocalUserIdResult, UseMemoResult, UseRoactServiceResult,
		UseRoactServiceResult1, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, UseAgeCheckUpsellStateModuleResult
	})
	local IsNotUniverseIdMatch: boolean = UseSelectorResult.presenceType and UseSelectorResult.lastLocation and UseSelectorResult.universeId ~= "" or false
	local IsLoading = if UseAgeCheckUpsellStateModuleResult then UseSelectorResult.isLoading or (not UseAgeCheckUpsellStateModuleResult.playabilityChecked or UseAgeCheckUpsellStateModuleResult.pendingParentalControlsResolution) else UseSelectorResult.isLoading
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult (copy), UseAgeCheckUpsellStateModuleResult (copy), IsNotUniverseIdMatch (copy), IsLoading (copy)
		return {
			joinExperience = UseResult,
			joinAgeCheckUpsellFlow = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.joinAgeCheckUpsellFlow else function() end,
			ageCheckRequired = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.ageCheckRequired else false,
			cachedPlayabilityStatus = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.cachedPlayabilityStatus else nil,
			playabilityFromCache = if UseAgeCheckUpsellStateModuleResult then UseAgeCheckUpsellStateModuleResult.playabilityFromCache else false,
			isInExperience = IsNotUniverseIdMatch,
			isLoading = IsLoading
		}
	end, if SocialJoinUseUnifiedPurchaseFlow then {
		UseResult,
		IsNotUniverseIdMatch,
		IsLoading,
		UseAgeCheckUpsellStateModuleResult,
		IsNotUniverseIdMatch
	} else {
		UseSelectorResult.presenceType, UseSelectorResult.lastLocation, UseResult,
		IsLoading, UseAgeCheckUpsellStateModuleResult, IsNotUniverseIdMatch
	})
end