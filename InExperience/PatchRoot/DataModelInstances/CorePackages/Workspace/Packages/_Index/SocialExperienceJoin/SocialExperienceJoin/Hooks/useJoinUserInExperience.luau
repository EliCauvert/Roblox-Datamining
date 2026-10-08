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
local fFlagGameJoinCardSourceAttribution = require(parent.SharedFlags).FFlagGameJoinCardSourceAttribution
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor
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
	-- upvalues: useDispatch (ref), useRoactService (ref), appSessionService (ref), appGame (ref), reactModule (ref), initializeSocialExperienceJoinAnalyticsModule (ref), useLocalUserId (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (ref), var2 (ref), t (ref), useSelector (ref), getDeepValue (ref), constantsModule (ref), networkingGamesModule (ref), networkStatus (ref), useAgeCheckUpsellStateModule (ref), setGamePlaySession (ref), sessionType (ref), eventNamesModule (ref), fFlagJoinabilityCTARefactor (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (ref), joinExperienceStatusModule (ref), promiseModule (ref), socialJoinUseUnifiedPurchaseFlow (ref), setCentralOverlay (ref), centralOverlayType (ref), closeCentralOverlay (ref), appPage (ref), fFlagSignalsNavP3Dispatch (ref), var1 (ref), navigateDown (ref), playabilityStatus (ref), gameJoinCardOnBeforeJoinCallback (ref), launchGame (ref), socialJoinPassPlaceIdToLaunch (ref), fFlagGameJoinCardSourceAttribution (ref)
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
		-- upvalues: p2 (ref), fFlagSocialExperienceJoinPresenceStoreMigrationModule (copy), var9 (write), getDeepValue (copy), constantsModule (copy), p1 (ref), networkingGamesModule (copy), networkStatus (copy)
		local var11 = if p2.presence then p2.presence elseif fFlagSocialExperienceJoinPresenceStoreMigrationModule then var9 else getDeepValue(p3, `{constantsModule.RODUX_KEY}.Presence.byUserId.{p1}`)
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
	local var11 = useAgeCheckUpsellStateModule(var10.universeId, p2.onAgeCheckCompletion)
	local var12 = reactModule.useCallback(function(p3)
		-- upvalues: var4 (ref), networkingGamesModule (copy), setGamePlaySession (copy), var5 (ref), sessionType (copy), var7 (ref), eventNamesModule (copy), var10 (ref), p1 (ref), var8 (ref), fFlagJoinabilityCTARefactor (copy), p2 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), joinExperienceStatusModule (copy), promiseModule (copy), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var11 (ref), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy), playabilityStatus (copy), gameJoinCardOnBeforeJoinCallback (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var6 (ref), fFlagGameJoinCardSourceAttribution (copy), constantsModule (copy)
		local _ = function(p4)
			-- upvalues: var4 (copy), networkingGamesModule (copy)
			return var4(networkingGamesModule.GetExperiencesDetails.API({ p4 }))
		end
		
		local var13 = function(p4)
			-- upvalues: var4 (copy), networkingGamesModule (copy)
			return var4(networkingGamesModule.GetExperiencesProductInfo.API({ p4 }))
		end
		
		local _ = function(p4)
			-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagJoinabilityCTARefactor (copy), p3 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			return function(p5)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), p4 (ref), fFlagJoinabilityCTARefactor (copy), p3 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p5,
					status = p4,
					followUser = if fFlagJoinabilityCTARefactor then tostring(p3) else nil,
					isHomePageCarousel = p2.isHomePageCarousel or false,
					absolutePosition = p2.homepageCarouselAbsolutePosition,
					friendId = if fFlagProfilePlatformImproveGameDetailsAnalytics then p1 else nil
				})
			end
		end
		
		local var14 = function()
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagJoinabilityCTARefactor (copy), p3 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), promiseModule (copy), var4 (copy), networkingGamesModule (copy), var13 (ref), socialJoinUseUnifiedPurchaseFlow (copy), setCentralOverlay (copy), centralOverlayType (copy), closeCentralOverlay (copy), var11 (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), navigateDown (copy)
			local purchaseRequired = joinExperienceStatusModule.PurchaseRequired;
			(function(p4)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), purchaseRequired (ref), fFlagJoinabilityCTARefactor (copy), p3 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p4,
					status = purchaseRequired,
					followUser = if fFlagJoinabilityCTARefactor then tostring(p3) else nil,
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
			-- upvalues: socialJoinUseUnifiedPurchaseFlow (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagJoinabilityCTARefactor (copy), p3 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), appPage (copy), fFlagSignalsNavP3Dispatch (copy), var1 (copy), var4 (copy), navigateDown (copy)
			local var16 = if socialJoinUseUnifiedPurchaseFlow then joinExperienceStatusModule.Unable else joinExperienceStatusModule.PurchaseRequired;
			(function(p4)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), var16 (ref), fFlagJoinabilityCTARefactor (copy), p3 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p4,
					status = var16,
					followUser = if fFlagJoinabilityCTARefactor then tostring(p3) else nil,
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
		
		;(function(p4)
			-- upvalues: var11 (copy), promiseModule (copy), var4 (copy), networkingGamesModule (copy)
			return if var11 and var11.cachedPlayabilityStatus then promiseModule.resolve(var11.cachedPlayabilityStatus) else var4(networkingGamesModule.GetExperiencesPlayabilityStatus.API({ p4 })):andThen(function(p5)
				return p5.responseBody[1].playabilityStatus
			end)
		end)(var10.universeId):andThen(function(p4)
			-- upvalues: playabilityStatus (copy), var14 (ref), gameJoinCardOnBeforeJoinCallback (copy), p2 (copy), joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagJoinabilityCTARefactor (copy), p3 (ref), fFlagProfilePlatformImproveGameDetailsAnalytics (copy), launchGame (copy), socialJoinPassPlaceIdToLaunch (copy), var6 (copy), fFlagGameJoinCardSourceAttribution (copy), constantsModule (copy), var11 (copy), var15 (ref)
			if p4 == playabilityStatus.PurchaseRequired.rawValue() then
				var14()
				
				return
			elseif p4 == playabilityStatus.Playable.rawValue() then
				if gameJoinCardOnBeforeJoinCallback and p2.onBeforeJoin then
					p2.onBeforeJoin()
				end
				local success = joinExperienceStatusModule.Success
				launchGame(if fFlagJoinabilityCTARefactor and not p3 then var10.rootPlaceId elseif socialJoinPassPlaceIdToLaunch and var10.placeId ~= "" then var10.placeId else nil, nil, if p3 then { userId = p1 } else nil, var6, if fFlagGameJoinCardSourceAttribution then p2.joinAttemptOrigin or constantsModule.AnalyticsContext.PeopleListInHomePage else constantsModule.AnalyticsContext.PeopleListInHomePage, function(p5)
					-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), success (ref), fFlagJoinabilityCTARefactor (copy), p3 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
					setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
					var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
						placeId = var10.placeId,
						rootPlaceId = var10.rootPlaceId,
						gameInstanceId = var10.gameId,
						profileUserId = p1,
						uid = var8,
						joinAttemptId = p5,
						status = success,
						followUser = if fFlagJoinabilityCTARefactor then tostring(p3) else nil,
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
			-- upvalues: joinExperienceStatusModule (copy), setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), fFlagJoinabilityCTARefactor (copy), p3 (ref), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
			local failure = joinExperienceStatusModule.Failure;
			(function(p4)
				-- upvalues: setGamePlaySession (copy), var5 (copy), sessionType (copy), var7 (copy), eventNamesModule (copy), var10 (copy), p1 (copy), var8 (copy), failure (ref), fFlagJoinabilityCTARefactor (copy), p3 (copy), p2 (copy), fFlagProfilePlatformImproveGameDetailsAnalytics (copy)
				setGamePlaySession(var5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
				var7.fireAnalyticsEvent(eventNamesModule.JoinExperience, {
					placeId = var10.placeId,
					rootPlaceId = var10.rootPlaceId,
					gameInstanceId = var10.gameId,
					profileUserId = p1,
					uid = var8,
					joinAttemptId = p4,
					status = failure,
					followUser = if fFlagJoinabilityCTARefactor then tostring(p3) else nil,
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
		p2.openGameDetailsPeekViewClosed, p2.onBeforeJoin,
		if fFlagGameJoinCardSourceAttribution then p2.joinAttemptOrigin else nil, var11
	} else {
		var4, var10.universeId, var10.placeId, var10.rootPlaceId, var10.gameId, p1,
		var8, var7, var5, var6, p2.isHomePageCarousel,
		p2.homepageCarouselAbsolutePosition,
		if fFlagGameJoinCardSourceAttribution then p2.joinAttemptOrigin else nil, var11
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(true)
	end, { var12 })
	local var14 = if fFlagJoinabilityCTARefactor then reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, { var12 }) else nil
	
	if var10.presenceType and var10.lastLocation then
		var3 = var10.universeId == ""
	end
	local var15 = if var11 then var10.isLoading or (not var11.playabilityChecked or var11.pendingParentalControlsResolution) else var10.isLoading
	
	return reactModule.useMemo(function()
		-- upvalues: var13 (ref), fFlagJoinabilityCTARefactor (copy), var14 (write), var11 (ref), var3 (ref), var15 (ref)
		return {
			joinExperience = var13,
			playExperience = if fFlagJoinabilityCTARefactor then var14 else nil,
			joinAgeCheckUpsellFlow = if var11 then var11.joinAgeCheckUpsellFlow else function() end,
			ageCheckRequired = if var11 then var11.ageCheckRequired else false,
			cachedPlayabilityStatus = if var11 then var11.cachedPlayabilityStatus else nil,
			playabilityFromCache = if var11 then var11.playabilityFromCache else false,
			isInExperience = var3,
			isLoading = var15
		}
	end, if socialJoinUseUnifiedPurchaseFlow then {
		var13, if fFlagJoinabilityCTARefactor then var14 else nil, var3, var15, var11,
		var3
	} else {
		var10.presenceType, var10.lastLocation, var13,
		if fFlagJoinabilityCTARefactor then var14 else nil, var15, var11, var3
	})
end