local socialExperienceJoin = script:FindFirstAncestor("SocialExperienceJoin")
local parent = socialExperienceJoin.Parent
local gameLaunchModule = require(parent.GameLaunch)
local luaSocialLibrariesDepsModule = require(parent.LuaSocialLibrariesDeps)
local navigationRoduxModule = require(parent.NavigationRodux)
local promiseModule = require(parent.Promise)
local reactModule = require(parent.React)
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactUtilsModule = require(parent.RoactUtils)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local gamesModule = require(socialExperienceJoin.Rodux.Games)
local eventNamesModule = require(socialExperienceJoin.Analytics.EventNames)
local joinExperienceStatusModule = require(socialExperienceJoin.Analytics.JoinExperienceStatus)
local initializeSocialExperienceJoinAnalyticsModule = require(socialExperienceJoin.Analytics.initializeSocialExperienceJoinAnalytics)
local constantsModule = require(socialExperienceJoin.Common.Constants)
local networkingGamesModule = require(socialExperienceJoin.Networking.NetworkingGames)
local myRoduxNetworkingModule = require(socialExperienceJoin.Networking.myRoduxNetworking)
local useAgeCheckUpsellStateModule = require(script.Parent.useAgeCheckUpsellState)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local playabilityStatus = gamesModule.Enums.PlayabilityStatus
local networkStatus = myRoduxNetworkingModule.Enum.NetworkStatus
local launchGame = gameLaunchModule.LaunchGame
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local appSessionService = roactServiceTagsModule.AppSessionService
local useRoactService = robloxAppHooksModule.useRoactService
local appPage = robloxAppEnumsModule.AppPage
local navigateDown = navigationRoduxModule.Thunks.NavigateDown
local fFlagSignalsNavP3Dispatch = require(parent.SharedFlags).FFlagSignalsNavP3Dispatch
local var19 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appGame = roactServiceTagsModule.AppGame
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local getDeepValue = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Dictionary.getDeepValue
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = require(parent.SharedFlags).FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local fFlagSocialExperienceJoinPresenceStoreMigrationModule = require(socialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration)
local var21 = if fFlagSocialExperienceJoinPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local socialJoinUseUnifiedPurchaseFlow = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false)
local gameJoinCardOnBeforeJoinCallback = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false)
local socialJoinPassPlaceIdToLaunch = game:DefineFastFlag("SocialJoinPassPlaceIdToLaunch", false)
local t = { skipFetch = true }

return function(p0, p1) --[[ line: 74 ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), appSessionService (ref), appGame (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useLocalUserId (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (ref), var21 (ref), t (ref), useSelector (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagEnableMobileGameJoinCard (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), getDeepValue (ref), constantsModule (ref), networkingGamesModule (ref), networkStatus (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckUpsellStateModule (ref), setGamePlaySession (ref), sessionType (ref), eventNamesModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), joinExperienceStatusModule (ref), promiseModule (ref), socialJoinUseUnifiedPurchaseFlow (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var19 (ref), navigateDown (ref), playabilityStatus (ref), gameJoinCardOnBeforeJoinCallback (ref), launchGame (ref), socialJoinPassPlaceIdToLaunch (ref)
	local var36
	local var27 = useDispatch()
	local var28 = useRoactService(appSessionService)
	local var29 = useRoactService(appGame)
	local var30 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), p1 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(p1.analyticProps)
	end, {})
	local var31 = useLocalUserId()
	local var32 = if fFlagSocialExperienceJoinPresenceStoreMigrationModule then var21(p0, t) else nil
	local var33 = useSelector(function(p2) --[[ line: 103 ]]
		-- upvalues: fFlagEnableDesktopGameJoinCard (copy), fFlagEnableMobileGameJoinCard (copy), fFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), p1 (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (copy), var32 (write), getDeepValue (copy), constantsModule (copy), p0 (ref), networkingGamesModule (copy), networkStatus (copy)
		local var38 = if (fFlagEnableDesktopGameJoinCard or fFlagEnableMobileGameJoinCard or fFlagProfilePlatformPassPresenceToJoinUserInExperience) and p1.presence then p1.presence elseif fFlagSocialExperienceJoinPresenceStoreMigrationModule then var32 else getDeepValue(p2, `{constantsModule.RODUX_KEY}.Presence.byUserId.{p0}`)
		local var39 = if var38 and var38.universeId then tostring(var38.universeId) else ""
		local var40 = false
		
		if var39 ~= "" then
			var40 = if networkingGamesModule.GetExperiencesPlayabilityStatus.getStatus(p2, var39) ~= networkStatus.Fetching then if networkingGamesModule.GetExperiencesDetails.getStatus(p2, var39) ~= networkStatus.Fetching then networkingGamesModule.GetExperiencesProductInfo.getStatus(p2, var39) == networkStatus.Fetching else true else true
		end
		return {
			universeId = var39,
			presenceType = if var38 and var38.userPresenceType then var38.userPresenceType else "",
			lastLocation = if var38 and var38.lastLocation then var38.lastLocation else nil,
			placeId = if var38 and var38.placeId then tostring(var38.placeId) else "",
			rootPlaceId = if var38 and var38.rootPlaceId then tostring(var38.rootPlaceId) else "",
			gameId = if var38 and var38.gameId then tostring(var38.gameId) else "",
			isLoading = var40
		}
	end)
	local var34 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckUpsellStateModule(var33.universeId, p1.onAgeCheckCompletion) else nil
	local var35 = reactModule.useCallback(function() --[[ line: 140 ]]
		-- upvalues: var27 (ref), networkingGamesModule (copy), setGamePlaySession (copy), var28 (ref), sessionType (copy), var30 (ref), eventNamesModule (copy), var33 (ref), p0 (ref), var31 (ref), p1 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), joinExperienceStatusModule (copy), promiseModule (copy), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var34 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy), playabilityStatus (copy), gameJoinCardOnBeforeJoinCallback (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var29 (ref), constantsModule (copy)
		local _ = function(p3) --[[ line: 141 ]]
			-- upvalues: var27 (copy), networkingGamesModule (copy)
			return var27(networkingGamesModule.GetExperiencesDetails.API({ p3 }))
		end
		
		local var41 = function(p4) --[[ line: 145 ]]
			-- upvalues: var27 (copy), networkingGamesModule (copy)
			return var27(networkingGamesModule.GetExperiencesProductInfo.API({ p4 }))
		end
		
		local _ = function(p5) --[[ line: 149 ]]
			-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			return function(p6) --[[ line: 150 ]]
				-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), p5 (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var28, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var30.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var33.placeId,
					rootPlaceId = var33.rootPlaceId,
					gameInstanceId = var33.gameId,
					profileUserId = p0,
					uid = var31,
					joinAttemptId = p6,
					status = p5,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end
		end
		
		local var42 = function() --[[ line: 169 ]]
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), promiseModule (copy), var27 (copy), networkingGamesModule (copy), var41 (ref), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var34 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy)
			local purchaseRequired = joinExperienceStatusModule.PurchaseRequired;
			(function(p7) --[[ line: 150 ]]
				-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), purchaseRequired (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var28, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var30.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var33.placeId,
					rootPlaceId = var33.rootPlaceId,
					gameInstanceId = var33.gameId,
					profileUserId = p0,
					uid = var31,
					joinAttemptId = p7,
					status = purchaseRequired,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)()
			promiseModule.all(var27(networkingGamesModule.GetExperiencesDetails.API({ var33.universeId })), var41(var33.universeId)):andThen(function() --[[ line: 177 ]]
				-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), var33 (copy), var27 (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var34 (copy), appPage (copy), p0 (copy), p1 (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy)
				if socialJoinUseUnifiedPurchaseFlow then
					var27(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, {
						productPayload = {
							kind = "Experience",
							universeId = var33.universeId,
							experienceName = var33.lastLocation or "",
							experienceIconUrl = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", var33.universeId)
						},
						purchaseCallbacks = {
							onFlowComplete = function() --[[ line: 191 ]]
								-- upvalues: var27 (copy), closeCentralOverlay (copy)
								var27(closeCentralOverlay())
							end,
							onPurchaseSuccess = function() --[[ line: 194 ]]
								-- upvalues: var34 (copy)
								if var34 then
									var34.refetchPlayability()
								end
							end
						},
						purchaseAnalyticsMetadata = { surface = "JoinUserInExperience" }
					}))
					
					return
				end
				local t = {
					name = appPage.SocialPurchaseExperience,
					detail = var33.universeId,
					extraProps = { userId = p0, analyticProps = p1.analyticProps }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var19.down(var19.fromLegacyPage(t))
					
					return
				end
				var27(navigateDown(t))
			end)
		end
		
		local var43 = function() --[[ line: 222 ]]
			-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), var27 (copy), navigateDown (copy)
			local var45 = if socialJoinUseUnifiedPurchaseFlow then joinExperienceStatusModule.Unable else joinExperienceStatusModule.PurchaseRequired;
			(function(p8) --[[ line: 150 ]]
				-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), var45 (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var28, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var30.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var33.placeId,
					rootPlaceId = var33.rootPlaceId,
					gameInstanceId = var33.gameId,
					profileUserId = p0,
					uid = var31,
					joinAttemptId = p8,
					status = var45,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)(joinExperienceStatusModule.Unable)
			local t = {
				name = appPage.SocialUnableToJoinExperience,
				detail = var33.universeId,
				extraProps = {
					userId = p0,
					analyticProps = p1.analyticProps,
					openGameDetailsPeekViewClosed = p1.openGameDetailsPeekViewClosed
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var19.down(var19.fromLegacyPage(t))
				
				return
			end
			var27(navigateDown(t))
		end
		
		;(function(p12) --[[ line: 248 ]]
			-- upvalues: var34 (copy), promiseModule (copy), var27 (copy), networkingGamesModule (copy)
			return if var34 and var34.cachedPlayabilityStatus then promiseModule.resolve(var34.cachedPlayabilityStatus) else var27(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p12 })):andThen(function(p13) --[[ line: 253 ]]
				return p13.responseBody[1].playabilityStatus
			end)
		end)(var33.universeId):andThen(function(p10) --[[ line: 260 ]]
			-- upvalues: playabilityStatus (copy), var42 (ref), gameJoinCardOnBeforeJoinCallback (copy), p1 (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var29 (copy), constantsModule (copy), var34 (copy), var43 (ref)
			if p10 == playabilityStatus.PurchaseRequired.rawValue() then
				var42()
				
				return
			elseif p10 == playabilityStatus.Playable.rawValue() then
				if gameJoinCardOnBeforeJoinCallback and p1.onBeforeJoin then
					p1.onBeforeJoin()
				end
				local success = joinExperienceStatusModule.Success
				launchGame(if socialJoinPassPlaceIdToLaunch and var33.placeId ~= "" then var33.placeId else nil, nil, { userId = p0 }, var29, constantsModule.AnalyticsContext.PeopleListInHomePage, function(p11) --[[ line: 150 ]]
					-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), success (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
					setGamePlaySession(var28, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					var30.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
						placeId = var33.placeId,
						rootPlaceId = var33.rootPlaceId,
						gameInstanceId = var33.gameId,
						profileUserId = p0,
						uid = var31,
						joinAttemptId = p11,
						status = success,
						isHomePageCarousel = p1.isHomePageCarousel or false,
						absolutePosition = p1.homepageCarouselAbsolutePosition,
						friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
					})
				end)
				
				return
			elseif var34 and var34.ageCheckRequired then
				var34.joinAgeCheckUpsellFlow()
				
				return
			end
			var43()
		end):catch(function() --[[ line: 285 ]]
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			local failure = joinExperienceStatusModule.Failure;
			(function(p9) --[[ line: 150 ]]
				-- upvalues: setGamePlaySession (copy), var28 (copy), sessionType (copy), var30 (copy), eventNamesModule (copy), var33 (copy), p0 (copy), var31 (copy), failure (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var28, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var30.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var33.placeId,
					rootPlaceId = var33.rootPlaceId,
					gameInstanceId = var33.gameId,
					profileUserId = p0,
					uid = var31,
					joinAttemptId = p9,
					status = failure,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)()
		end)
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var27, var33.universeId, var33.placeId, var33.rootPlaceId, var33.gameId,
		var33.lastLocation, p0, var31, var30, var28, var29, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, p1.analyticProps,
		p1.openGameDetailsPeekViewClosed, p1.onBeforeJoin, var34
	} else {
		var27, var33.universeId, var33.placeId, var33.rootPlaceId, var33.gameId, p0,
		var31, var30, var28, var29, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, var34
	})
	
	if var33.presenceType and var33.lastLocation then
		var36 = var33.universeId == ""
	end
	local var37 = if var34 then var33.isLoading or (not var34.playabilityChecked or var34.pendingParentalControlsResolution) else var33.isLoading
	
	return reactModule.useMemo(function() --[[ line: 340 ]]
		-- upvalues: var35 (ref), var34 (ref), var36 (ref), var37 (ref)
		return {
			joinExperience = var35,
			joinAgeCheckUpsellFlow = if var34 then var34.joinAgeCheckUpsellFlow else function() --[[ line: 345 ]] end,
			ageCheckRequired = if var34 then var34.ageCheckRequired else false,
			cachedPlayabilityStatus = if var34 then var34.cachedPlayabilityStatus else nil,
			playabilityFromCache = if var34 then var34.playabilityFromCache else false,
			isInExperience = var36,
			isLoading = var37
		}
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var35,
		var36,
		var37,
		var34,
		var36
	} else {
		var33.presenceType, var33.lastLocation, var35, var37, var34, var36
	})
end