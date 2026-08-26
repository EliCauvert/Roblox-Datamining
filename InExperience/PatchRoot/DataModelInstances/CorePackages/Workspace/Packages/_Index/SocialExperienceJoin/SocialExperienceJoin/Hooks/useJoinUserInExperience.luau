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
local var1 = if fFlagSignalsNavP3Dispatch then require(parent.RobloxAppNavigation).NavigationCommands else nil
local appGame = roactServiceTagsModule.AppGame
local useLocalUserId = robloxAppHooksModule.useLocalUserId
local getDeepValue = luaSocialLibrariesDepsModule.SocialLibraries.config({}).Dictionary.getDeepValue
local fFlagProfilePlatformImproveGameDetailsAnalytics = require(parent.SharedFlags).FFlagProfilePlatformImproveGameDetailsAnalytics
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagProfilePlatformPassPresenceToJoinUserInExperience = require(parent.SharedFlags).FFlagProfilePlatformPassPresenceToJoinUserInExperience
local fFlagJoinCardAgeCheckUpsell = require(parent.SharedFlags).FFlagJoinCardAgeCheckUpsell
local fFlagSocialExperienceJoinPresenceStoreMigrationModule = require(socialExperienceJoin.Flags.FFlagSocialExperienceJoinPresenceStoreMigration)
local var2 = if fFlagSocialExperienceJoinPresenceStoreMigrationModule then require(parent.FriendsCommon).Hooks.useGetPresenceByUserId else nil
local centralOverlayModule = require(parent.CentralOverlay)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local socialJoinUseUnifiedPurchaseFlow = game:DefineFastFlag("SocialJoinUseUnifiedPurchaseFlow", false)
local gameJoinCardOnBeforeJoinCallback = game:DefineFastFlag("GameJoinCardOnBeforeJoinCallback", false)
local socialJoinPassPlaceIdToLaunch = game:DefineFastFlag("SocialJoinPassPlaceIdToLaunch", false)
local t = { skipFetch = true }

return function(p1, p2)
	-- upvalues: useDispatch (ref), useRoactService (ref), appSessionService (ref), appGame (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useLocalUserId (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (ref), var2 (ref), t (ref), useSelector (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagEnableMobileGameJoinCard (ref), fFlagProfilePlatformPassPresenceToJoinUserInExperience (ref), getDeepValue (ref), constantsModule (ref), networkingGamesModule (ref), networkStatus (ref), fFlagJoinCardAgeCheckUpsell (ref), useAgeCheckUpsellStateModule (ref), setGamePlaySession (ref), sessionType (ref), eventNamesModule (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), joinExperienceStatusModule (ref), promiseModule (ref), socialJoinUseUnifiedPurchaseFlow (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), playabilityStatus (ref), gameJoinCardOnBeforeJoinCallback (ref), launchGame (ref), socialJoinPassPlaceIdToLaunch (ref)
	local var3
	local var4 = useDispatch()
	local var5 = useRoactService(appSessionService)
	local var6 = useRoactService(appGame)
	local var7 = reactModule.useMemo(function()
		-- upvalues: initializeSocialExperienceJoinAnalyticsModule (copy), p2 (ref)
		return initializeSocialExperienceJoinAnalyticsModule(p2.analyticProps)
	end, {})
	local var8 = useLocalUserId()
	local var9 = if fFlagSocialExperienceJoinPresenceStoreMigrationModule then var2(p1, t) else nil
	local var10 = useSelector(function(p3)
		-- upvalues: fFlagEnableDesktopGameJoinCard (copy), fFlagEnableMobileGameJoinCard (copy), fFlagProfilePlatformPassPresenceToJoinUserInExperience (copy), p2 (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (copy), var9 (write), getDeepValue (copy), constantsModule (copy), p1 (ref), networkingGamesModule (copy), networkStatus (copy)
		local var11 = if (fFlagEnableDesktopGameJoinCard or fFlagEnableMobileGameJoinCard or fFlagProfilePlatformPassPresenceToJoinUserInExperience) and p2.presence then p2.presence elseif fFlagSocialExperienceJoinPresenceStoreMigrationModule then var9 else getDeepValue(p3, `{constantsModule.RODUX_KEY}.Presence.byUserId.{p1}`)
		local var12 = if var11 and var11.universeId then tostring(var11.universeId) else ""
		local var13 = false
		
		if var12 ~= "" then
			var13 = if networkingGamesModule.GetExperiencesPlayabilityStatus.getStatus(p3, var12) ~= networkStatus.Fetching then if networkingGamesModule.GetExperiencesDetails.getStatus(p3, var12) ~= networkStatus.Fetching then networkingGamesModule.GetExperiencesProductInfo.getStatus(p3, var12) == networkStatus.Fetching else true else true
		end
		return {
			universeId = var12,
			presenceType = if var11 and var11.userPresenceType then var11.userPresenceType else "",
			lastLocation = if var11 and var11.lastLocation then var11.lastLocation else nil,
			placeId = if var11 and var11.placeId then tostring(var11.placeId) else "",
			rootPlaceId = if var11 and var11.rootPlaceId then tostring(var11.rootPlaceId) else "",
			gameId = if var11 and var11.gameId then tostring(var11.gameId) else "",
			isLoading = var13
		}
	end)
	local var11 = if fFlagJoinCardAgeCheckUpsell then useAgeCheckUpsellStateModule(var10.universeId, p2.onAgeCheckCompletion) else nil
	local var12 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), networkingGamesModule (copy), setGamePlaySession (copy), var5 (ref), sessionType (copy), var7 (ref), eventNamesModule (copy), var10 (ref), p1 (ref), var8 (ref), p2 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), joinExperienceStatusModule (copy), promiseModule (copy), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var11 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), playabilityStatus (copy), gameJoinCardOnBeforeJoinCallback (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var6 (ref), constantsModule (copy)
		local _ = function(p3)
			-- upvalues: var4 (copy), networkingGamesModule (copy)
			return var4(networkingGamesModule.GetExperiencesDetails.API({ p3 }))
		end
		
		local var13 = function(p3)
			-- upvalues: var4 (copy), networkingGamesModule (copy)
			return var4(networkingGamesModule.GetExperiencesProductInfo.API({ p3 }))
		end
		
		local _ = function(p3)
			-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			return function(p4)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p3 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p4,
					status = p3,
					isHomePageCarousel = p2.isHomePageCarousel or false,
					absolutePosition = p2.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
				})
			end
		end
		
		local var14 = function()
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), promiseModule (copy), var4 (copy), networkingGamesModule (copy), var13 (ref), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var11 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
			local purchaseRequired = joinExperienceStatusModule.PurchaseRequired;
			(function(p3)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), purchaseRequired (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p3,
					status = purchaseRequired,
					isHomePageCarousel = p2.isHomePageCarousel or false,
					absolutePosition = p2.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
				})
			end)()
			promiseModule.all(var4(networkingGamesModule.GetExperiencesDetails.API({ var10.universeId })), var13(var10.universeId)):andThen(function()
				-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), var10 (copy), var4 (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var11 (copy), appPage (copy), p1 (copy), p2 (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
				if socialJoinUseUnifiedPurchaseFlow then
					var4(setCentralOverlay(centralOverlayType.UnifiedProductPurchaseModal, {
						productPayload = {
							kind = "Experience",
							universeId = var10.universeId,
							experienceName = var10.lastLocation or "",
							experienceIconUrl = string.format("rbxthumb://type=GameIcon&id=%s&w=150&h=150", var10.universeId)
						},
						purchaseCallbacks = {
							onFlowComplete = function()
								-- upvalues: var4 (copy), closeCentralOverlay (copy)
								var4(closeCentralOverlay())
							end,
							onPurchaseSuccess = function()
								-- upvalues: var11 (copy)
								if var11 then
									var11.refetchPlayability()
								end
							end
						},
						purchaseAnalyticsMetadata = { surface = "JoinUserInExperience" }
					}))
					
					return
				end
				local t = {
					name = appPage.SocialPurchaseExperience,
					detail = var10.universeId,
					extraProps = { userId = p1, analyticProps = p2.analyticProps }
				}
				
				if fFlagSignalsNavP3Dispatch then
					var1.down(var1.fromLegacyPage(t))
					
					return
				end
				var4(navigateDown(t))
			end)
		end
		
		local var15 = function()
			-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (copy), navigateDown (copy)
			local var16 = if socialJoinUseUnifiedPurchaseFlow then joinExperienceStatusModule.Unable else joinExperienceStatusModule.PurchaseRequired;
			(function(p3)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), var16 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p3,
					status = var16,
					isHomePageCarousel = p2.isHomePageCarousel or false,
					absolutePosition = p2.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
				})
			end)(joinExperienceStatusModule.Unable)
			local t = {
				name = appPage.SocialUnableToJoinExperience,
				detail = var10.universeId,
				extraProps = {
					userId = p1,
					analyticProps = p2.analyticProps,
					openGameDetailsPeekViewClosed = p2.openGameDetailsPeekViewClosed
				}
			}
			
			if fFlagSignalsNavP3Dispatch then
				var1.down(var1.fromLegacyPage(t))
				
				return
			end
			var4(navigateDown(t))
		end
		
		;(function(p3)
			-- upvalues: var11 (copy), promiseModule (copy), var4 (copy), networkingGamesModule (copy)
			return if var11 and var11.cachedPlayabilityStatus then promiseModule.resolve(var11.cachedPlayabilityStatus) else var4(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p3 })):andThen(function(p4)
				return p4.responseBody[1].playabilityStatus
			end)
		end)(var10.universeId):andThen(function(p3)
			-- upvalues: playabilityStatus (copy), var14 (ref), gameJoinCardOnBeforeJoinCallback (copy), p2 (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var6 (copy), constantsModule (copy), var11 (copy), var15 (ref)
			if p3 == playabilityStatus.PurchaseRequired.rawValue() then
				var14()
				
				return
			elseif p3 == playabilityStatus.Playable.rawValue() then
				if gameJoinCardOnBeforeJoinCallback and p2.onBeforeJoin then
					p2.onBeforeJoin()
				end
				local success = joinExperienceStatusModule.Success
				launchGame(if socialJoinPassPlaceIdToLaunch and var10.placeId ~= "" then var10.placeId else nil, nil, { userId = p1 }, var6, constantsModule.AnalyticsContext.PeopleListInHomePage, function(p4)
					-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), success (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
					setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
						placeId = var10.placeId,
						rootPlaceId = var10.rootPlaceId,
						gameInstanceId = var10.gameId,
						profileUserId = p1,
						uid = var8,
						joinAttemptId = p4,
						status = success,
						isHomePageCarousel = p2.isHomePageCarousel or false,
						absolutePosition = p2.homepageCarouselAbsolutePosition,
						friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
					})
				end)
				
				return
			elseif var11 and var11.ageCheckRequired then
				var11.joinAgeCheckUpsellFlow()
				
				return
			end
			var15()
		end):catch(function()
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			local failure = joinExperienceStatusModule.Failure;
			(function(p3)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), failure (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p3,
					status = failure,
					isHomePageCarousel = p2.isHomePageCarousel or false,
					absolutePosition = p2.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
				})
			end)()
		end)
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var4, var10.universeId, var10.placeId, var10.rootPlaceId, var10.gameId,
		var10.lastLocation, p1, var8, var7, var5, var6, p2.isHomePageCarousel,
		p2.homepageCarouselAbsolutePosition, p2.analyticProps,
		p2.openGameDetailsPeekViewClosed, p2.onBeforeJoin, var11
	} else {
		var4, var10.universeId, var10.placeId, var10.rootPlaceId, var10.gameId, p1,
		var8, var7, var5, var6, p2.isHomePageCarousel,
		p2.homepageCarouselAbsolutePosition, var11
	})
	
	if var10.presenceType and var10.lastLocation then
		var3 = var10.universeId == ""
	end
	local var13 = if var11 then var10.isLoading or (not var11.playabilityChecked or var11.pendingParentalControlsResolution) else var10.isLoading
	
	return reactModule.useMemo(function()
		-- upvalues: var12 (ref), var11 (ref), var3 (ref), var13 (ref)
		return {
			joinExperience = var12,
			joinAgeCheckUpsellFlow = if var11 then var11.joinAgeCheckUpsellFlow else function() end,
			ageCheckRequired = if var11 then var11.ageCheckRequired else false,
			cachedPlayabilityStatus = if var11 then var11.cachedPlayabilityStatus else nil,
			playabilityFromCache = if var11 then var11.playabilityFromCache else false,
			isInExperience = var3,
			isLoading = var13
		}
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var12,
		var3,
		var13,
		var11,
		var3
	} else {
		var10.presenceType, var10.lastLocation, var12, var13, var11, var3
	})
end