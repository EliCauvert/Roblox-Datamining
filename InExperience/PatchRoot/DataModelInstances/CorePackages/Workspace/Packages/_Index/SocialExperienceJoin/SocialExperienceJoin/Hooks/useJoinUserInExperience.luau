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
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local socialJoinUseUnifiedPurchaseFlow = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false)
local gameJoinCardOnBeforeJoinCallback = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false)
local socialJoinPassPlaceIdToLaunch = game:DefineFastFlag("SocialJoinPassPlaceIdToLaunch", false)

return function(p0, p1) --[[ line: 66 ]]
	-- upvalues: useDispatch (ref), useRoactService (ref), appSessionService (ref), appGame (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useLocalUserId (ref), useSelector (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagEnableMobileGameJoinCard (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), getDeepValue (ref), constantsModule (ref), networkingGamesModule (ref), networkStatus (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckUpsellStateModule (ref), setGamePlaySession (ref), sessionType (ref), eventNamesModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), joinExperienceStatusModule (ref), promiseModule (ref), socialJoinUseUnifiedPurchaseFlow (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var19 (ref), navigateDown (ref), playabilityStatus (ref), gameJoinCardOnBeforeJoinCallback (ref), launchGame (ref), socialJoinPassPlaceIdToLaunch (ref)
	local var32
	local var24 = useDispatch()
	local var25 = useRoactService(appSessionService)
	local var26 = useRoactService(appGame)
	local var27 = reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), p1 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(p1.analyticProps)
	end, {})
	local var28 = useLocalUserId()
	local var29 = useSelector(function(p2) --[[ line: 89 ]]
		-- upvalues: fFlagEnableDesktopGameJoinCard (copy), fFlagEnableMobileGameJoinCard (copy), fFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), p1 (ref), getDeepValue (copy), constantsModule (copy), p0 (ref), networkingGamesModule (copy), networkStatus (copy)
		local var34 = if (fFlagEnableDesktopGameJoinCard or fFlagEnableMobileGameJoinCard or fFlagProfilePlatformPassPresenceToJoinUserInExperience) and p1.presence then p1.presence else getDeepValue(p2, `{constantsModule.RODUX_KEY}.Presence.byUserId.{p0}`)
		local var35 = if var34 and var34.universeId then tostring(var34.universeId) else ""
		local var36 = false
		
		if var35 ~= "" then
			var36 = if networkingGamesModule.GetExperiencesPlayabilityStatus.getStatus(p2, var35) ~= networkStatus.Fetching then if networkingGamesModule.GetExperiencesDetails.getStatus(p2, var35) ~= networkStatus.Fetching then networkingGamesModule.GetExperiencesProductInfo.getStatus(p2, var35) == networkStatus.Fetching else true else true
		end
		return {
			universeId = var35,
			presenceType = if var34 and var34.userPresenceType then var34.userPresenceType else "",
			lastLocation = if var34 and var34.lastLocation then var34.lastLocation else nil,
			placeId = if var34 and var34.placeId then tostring(var34.placeId) else "",
			rootPlaceId = if var34 and var34.rootPlaceId then tostring(var34.rootPlaceId) else "",
			gameId = if var34 and var34.gameId then tostring(var34.gameId) else "",
			isLoading = var36
		}
	end)
	local var30 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckUpsellStateModule(var29.universeId, p1.onAgeCheckCompletion) else nil
	local var31 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: var24 (ref), networkingGamesModule (copy), setGamePlaySession (copy), var25 (ref), sessionType (copy), var27 (ref), eventNamesModule (copy), var29 (ref), p0 (ref), var28 (ref), p1 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), joinExperienceStatusModule (copy), promiseModule (copy), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var30 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy), playabilityStatus (copy), gameJoinCardOnBeforeJoinCallback (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var26 (ref), constantsModule (copy)
		local _ = function(p3) --[[ line: 125 ]]
			-- upvalues: var24 (copy), networkingGamesModule (copy)
			return var24(networkingGamesModule.GetExperiencesDetails.API({ p3 }))
		end
		
		local var37 = function(p4) --[[ line: 129 ]]
			-- upvalues: var24 (copy), networkingGamesModule (copy)
			return var24(networkingGamesModule.GetExperiencesProductInfo.API({ p4 }))
		end
		
		local _ = function(p5) --[[ line: 133 ]]
			-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			return function(p6) --[[ line: 134 ]]
				-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), p5 (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var25, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var27.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var29.placeId,
					rootPlaceId = var29.rootPlaceId,
					gameInstanceId = var29.gameId,
					profileUserId = p0,
					uid = var28,
					joinAttemptId = p6,
					status = p5,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end
		end
		
		local var38 = function() --[[ line: 153 ]]
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), promiseModule (copy), var24 (copy), networkingGamesModule (copy), var37 (ref), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var30 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy)
			local purchaseRequired = joinExperienceStatusModule.PurchaseRequired;
			(function(p7) --[[ line: 134 ]]
				-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), purchaseRequired (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var25, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var27.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var29.placeId,
					rootPlaceId = var29.rootPlaceId,
					gameInstanceId = var29.gameId,
					profileUserId = p0,
					uid = var28,
					joinAttemptId = p7,
					status = purchaseRequired,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)()
			promiseModule.all(var24(networkingGamesModule.GetExperiencesDetails.API({ var29.universeId })), var37(var29.universeId)):andThen(function() --[[ line: 161 ]]
				-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), var29 (copy), var24 (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var30 (copy), appPage (copy), p0 (copy), p1 (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), navigateDown (copy)
				if socialJoinUseUnifiedPurchaseFlow then
					var24(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, {
						productPayload = {
							kind = "Experience",
							universeId = var29.universeId,
							experienceName = var29.lastLocation or "",
							experienceIconUrl = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", var29.universeId)
						},
						purchaseCallbacks = {
							onFlowComplete = function() --[[ line: 175 ]]
								-- upvalues: var24 (copy), closeCentralOverlay (copy)
								var24(closeCentralOverlay())
							end,
							onPurchaseSuccess = function() --[[ line: 178 ]]
								-- upvalues: var30 (copy)
								if var30 then
									var30.refetchPlayability()
								end
							end
						},
						purchaseAnalyticsMetadata = { surface = "JoinUserInExperience" }
					}))
					
					return
				end
				local t = {
					name = appPage.SocialPurchaseExperience,
					detail = var29.universeId,
					extraProps = { userId = p0, analyticProps = p1.analyticProps }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var19.down(var19.fromLegacyPage(t))
					
					return
				end
				var24(navigateDown(t))
			end)
		end
		
		local var39 = function() --[[ line: 206 ]]
			-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var19 (copy), var24 (copy), navigateDown (copy)
			local var41 = if socialJoinUseUnifiedPurchaseFlow then joinExperienceStatusModule.Unable else joinExperienceStatusModule.PurchaseRequired;
			(function(p8) --[[ line: 134 ]]
				-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), var41 (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var25, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var27.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var29.placeId,
					rootPlaceId = var29.rootPlaceId,
					gameInstanceId = var29.gameId,
					profileUserId = p0,
					uid = var28,
					joinAttemptId = p8,
					status = var41,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)(joinExperienceStatusModule.Unable)
			local t = {
				name = appPage.SocialUnableToJoinExperience,
				detail = var29.universeId,
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
			var24(navigateDown(t))
		end
		
		;(function(p12) --[[ line: 232 ]]
			-- upvalues: var30 (copy), promiseModule (copy), var24 (copy), networkingGamesModule (copy)
			return if var30 and var30.cachedPlayabilityStatus then promiseModule.resolve(var30.cachedPlayabilityStatus) else var24(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p12 })):andThen(function(p13) --[[ line: 237 ]]
				return p13.responseBody[1].playabilityStatus
			end)
		end)(var29.universeId):andThen(function(p10) --[[ line: 244 ]]
			-- upvalues: playabilityStatus (copy), var38 (ref), gameJoinCardOnBeforeJoinCallback (copy), p1 (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var26 (copy), constantsModule (copy), var30 (copy), var39 (ref)
			if p10 == playabilityStatus.PurchaseRequired.rawValue() then
				var38()
				
				return
			elseif p10 == playabilityStatus.Playable.rawValue() then
				if gameJoinCardOnBeforeJoinCallback and p1.onBeforeJoin then
					p1.onBeforeJoin()
				end
				local success = joinExperienceStatusModule.Success
				launchGame(if socialJoinPassPlaceIdToLaunch and var29.placeId ~= "" then var29.placeId else nil, nil, { userId = p0 }, var26, constantsModule.AnalyticsContext.PeopleListInHomePage, function(p11) --[[ line: 134 ]]
					-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), success (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
					setGamePlaySession(var25, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					var27.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
						placeId = var29.placeId,
						rootPlaceId = var29.rootPlaceId,
						gameInstanceId = var29.gameId,
						profileUserId = p0,
						uid = var28,
						joinAttemptId = p11,
						status = success,
						isHomePageCarousel = p1.isHomePageCarousel or false,
						absolutePosition = p1.homepageCarouselAbsolutePosition,
						friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
					})
				end)
				
				return
			elseif var30 and var30.ageCheckRequired then
				var30.joinAgeCheckUpsellFlow()
				
				return
			end
			var39()
		end):catch(function() --[[ line: 269 ]]
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			local failure = joinExperienceStatusModule.Failure;
			(function(p9) --[[ line: 134 ]]
				-- upvalues: setGamePlaySession (copy), var25 (copy), sessionType (copy), var27 (copy), eventNamesModule (copy), var29 (copy), p0 (copy), var28 (copy), failure (ref), p1 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var25, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var27.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var29.placeId,
					rootPlaceId = var29.rootPlaceId,
					gameInstanceId = var29.gameId,
					profileUserId = p0,
					uid = var28,
					joinAttemptId = p9,
					status = failure,
					isHomePageCarousel = p1.isHomePageCarousel or false,
					absolutePosition = p1.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p0 else nil
				})
			end)()
		end)
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var24, var29.universeId, var29.placeId, var29.rootPlaceId, var29.gameId,
		var29.lastLocation, p0, var28, var27, var25, var26, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, p1.analyticProps,
		p1.openGameDetailsPeekViewClosed, p1.onBeforeJoin, var30
	} else {
		var24, var29.universeId, var29.placeId, var29.rootPlaceId, var29.gameId, p0,
		var28, var27, var25, var26, p1.isHomePageCarousel,
		p1.homepageCarouselAbsolutePosition, var30
	})
	
	if var29.presenceType and var29.lastLocation then
		var32 = var29.universeId == ""
	end
	local var33 = if var30 then var29.isLoading or (not var30.playabilityChecked or var30.pendingParentalControlsResolution) else var29.isLoading
	
	return reactModule.useMemo(function() --[[ line: 324 ]]
		-- upvalues: var31 (ref), var30 (ref), var32 (ref), var33 (ref)
		return {
			joinExperience = var31,
			joinAgeCheckUpsellFlow = if var30 then var30.joinAgeCheckUpsellFlow else function() --[[ line: 329 ]] end,
			ageCheckRequired = if var30 then var30.ageCheckRequired else false,
			cachedPlayabilityStatus = if var30 then var30.cachedPlayabilityStatus else nil,
			playabilityFromCache = if var30 then var30.playabilityFromCache else false,
			isInExperience = var32,
			isLoading = var33
		}
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var31,
		var32,
		var33,
		var30,
		var32
	} else {
		var29.presenceType, var29.lastLocation, var31, var33, var30, var32
	})
end