local httpService = game:GetService("HttpService")
local playerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local parent = playerContextualMenu.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local userProfilesModule = require(parent.UserProfiles)
local url = require(parent.Http).Url
local roactRodux = require(parent.RoactUtils).Hooks.RoactRodux
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local appPage = require(parent.RobloxAppEnums).AppPage
local useLocalization = require(parent.Localization).Hooks.useLocalization
local toastRoduxModule = require(parent.ToastRodux)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local navigationModule = require(parent.Navigation)
local getCurrentRouteState = navigationModule.getCurrentRouteState
local experienceService = require(parent.ExperienceService).ExperienceService
local appSessionService = require(parent.RoactServiceTags).AppSessionService
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local dashModule = require(parent.Dash)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local name = require(parent.Loggers).Logger:new(script.Name)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagConnectionsToFriendsRename = sharedFlagsModule.FFlagConnectionsToFriendsRename
local getFFlagAppChatPCMFixBlocking = sharedFlagsModule.getFFlagAppChatPCMFixBlocking
local fFlagRenameDeprecatedUIBloxTokens = sharedFlagsModule.FFlagRenameDeprecatedUIBloxTokens
local recommendationContextType = require(parent.FriendsRodux).config({ keyPath = "PlayerContextualMenu.Friends" }).Enums.RecommendationContextType
local useRecommendationContextualInfoDisplay = require(parent.SocialCommon).Hooks.useRecommendationContextualInfoDisplay
local _ = require(script.Parent.Types)
local getPresenceIconModule = require(script.Parent.getPresenceIcon)
local getPresenceTextModule = require(script.Parent.getPresenceText)
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useDesignTokens = require(parent.Style).useDesignTokens
local analyticsModule = require(playerContextualMenu.Analytics)
local setupFireEvent = analyticsModule.setupFireEvent
local eventNames = analyticsModule.EventNames
local analyticsService = analyticsModule.AnalyticsService
local friendsModule = require(playerContextualMenu.Http.Friends)
local blockingModule = require(playerContextualMenu.Http.Blocking)
local playerContextualMenuComponentModule = require(playerContextualMenu.Components.PlayerContextualMenuComponent)
local useHttpRequestModule = require(script.Parent.HttpRequest.useHttpRequest)
local _ = require(parent.FriendsNetworking).Enums
local var21 = require(parent.DataHydration).Friends.FriendsStore.get()
local fFlagUserProfileConsoleUseNewReportFlowModule = require(playerContextualMenu.Flags.FFlagUserProfileConsoleUseNewReportFlow)
local closeCentralOverlay = nil
local abuseVectorModule = nil
local openDynamicAbuseReportModule = nil

if fFlagUserProfileConsoleUseNewReportFlowModule then
	closeCentralOverlay = require(parent.CentralOverlay).Thunks.CloseCentralOverlay
	abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
	openDynamicAbuseReportModule = require(parent.GenericAbuseReporting.OpenDynamicAbuseReport)
end
local playerContextualMenuVendorImagePath = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local fFlagUserBlockingApiPlayerContextMenuEnabledModule = require(playerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled)
local fFlagPCMAcceptWidthAsProp = game:DefineFastFlag("FFlagPCMAcceptWidthAsProp", false)
local fFlagSkipBlockModal = require(parent.SharedFlags).FFlagSkipBlockModal
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var28 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil

local function NO_OPT_CALLBACK() --[[ line: 108 ]] end

local function launchGameWithAnalytics(p0, p1, p2, p3, p4) --[[ line: 110 ]]
	-- upvalues: setGamePlaySession (ref), sessionType (ref), eventNames (ref), httpService (ref), discoveryAnalyticsModule (ref), analyticsService (ref), experienceService (ref)
	setGamePlaySession(p4, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
	p0(eventNames.JoinExperience, { profileUserId = p2 })
	local var33 = httpService:GenerateGUID(false)
	discoveryAnalyticsModule.Events.gamePlayIntent(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
		friendId = p2,
		pageName = p1,
		placeId = if p3 then p3.locationPlaceId else nil,
		rootPlaceId = if p3 then p3.locationRootPlaceId else nil,
		joinAttemptId = var33
	})
	experienceService:LaunchExperience({ userId = p2, joinAttemptId = var33 }, "PlayerContextualMenu")
end

local t = { enableExperienceCTAs = true, width = UDim.new(0, 400) }
local t_1 = {
	Block = "Feature.Friends.Action.Block",
	Unblock = "Feature.Friends.Action.Unblock",
	Chat = "CommonUI.Features.Label.Chat",
	Join = "Feature.Chat.Drawer.Join",
	PendingRequest = "Feature.Friends.Action.PendingRequest",
	Report = "Feature.Catalog.Action.Report",
	ViewDetails = "Feature.Profile.Label.ViewDetails",
	ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile",
	FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored",
	SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong",
	UserBlocked = "Feature.Profile.Action.UserBlocked",
	AcceptConnection = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.AcceptFriend" else "CommonUI.Features.Label.AcceptConnection",
	AddConnection = if fFlagConnectionsToFriendsRename then "Feature.Profile.Label.AddFriend" else "CommonUI.Features.Label.AddConnection",
	IgnoreConnectionRequest = if fFlagConnectionsToFriendsRename then "Feature.AddFriends.Action.IgnoreFriendRequest" else "Feature.AddFriends.Action.IgnoreConnectionRequest",
	RemoveConnection = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.Unfriend" else "CommonUI.Features.Label.RemoveConnection",
	ConnectionAdded = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded",
	ConnectionRequestSent = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent",
	ConnectionRemoved = if fFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRemoved" else "Feature.Friends.Label.ConnectionRemoved"
}

return function(p5) --[[ line: 214 | named "PlayerContextualMenuContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), roactRodux (ref), robloxAppHooksModule (ref), navigationModule (ref), appSessionService (ref), useLocalization (ref), t_1 (ref), toastRoduxModule (ref), reactModule (ref), setupFireEvent (ref), analyticsService (ref), useHttpRequestModule (ref), url (ref), getFFlagAppChatPCMFixBlocking (ref), fFlagUserBlockingApiPlayerContextMenuEnabledModule (ref), blockingModule (ref), name (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), userProfilesModule (ref), var28 (ref), recommendationContextType (ref), getPresenceIconModule (ref), getPresenceTextModule (ref), useRecommendationContextualInfoDisplay (ref), eventNames (ref), setGamePlaySession (ref), sessionType (ref), discoveryAnalyticsModule (ref), getCurrentRouteState (ref), appPage (ref), button (ref), buttonType (ref), launchGameWithAnalytics (ref), fFlagUserProfileConsoleUseNewReportFlowModule (ref), openDynamicAbuseReportModule (write), abuseVectorModule (write), closeCentralOverlay (write), fFlagSkipBlockModal (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var21 (ref), friendsModule (ref), images (ref), playerContextualMenuVendorImagePath (ref), NO_OPT_CALLBACK (ref), dashModule (ref), playerContextualMenuComponentModule (ref), fFlagPCMAcceptWidthAsProp (ref)
	local var34 = cryoModule.Dictionary.union(t, p5)
	local var35 = roactRodux.useDispatch()
	local var36 = robloxAppHooksModule.useLocalUserId()
	local var37 = navigationModule.useNavigation()
	local var38 = robloxAppHooksModule.useRoactService(appSessionService)
	local var39 = useLocalization(t_1)
	local t_2 = {
		isLocalized = true,
		toastMessage = var39.SomethingIsWrong,
		toastType = toastRoduxModule.Enums.ToastType.NetworkingError
	}
	local var41 = reactModule.useMemo(function() --[[ line: 230 ]]
		-- upvalues: setupFireEvent (copy), analyticsService (copy), var36 (ref)
		return setupFireEvent({
			analytics = analyticsService,
			infoForAllEvents = { uid = var36 }
		})
	end, { var36 })
	local var42 = useHttpRequestModule()
	local var43, var44 = reactModule.useState({ status = "NotStarted", isPlayable = false })
	reactModule.useEffect(function() --[[ line: 246 ]]
		-- upvalues: var34 (ref), var44 (ref), var42 (ref), url (copy)
		if var34.subjectPresence and var34.subjectPresence.locationUniverseId then
			var44({ status = "Fetching", isPlayable = false })
			var42(url.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. var34.subjectPresence.locationUniverseId, "GET"):andThen(function(p6) --[[ line: 258 ]]
				-- upvalues: var44 (copy)
				if p6.responseBody and p6.responseBody[1] then
					var44({
						status = "Finished",
						isPlayable = p6.responseBody[1].isPlayable
					})
				end
			end):catch(function(_) --[[ line: 266 ]]
				-- upvalues: var44 (copy)
				var44({ status = "Failed", isPlayable = false })
			end)
		end
	end, { tostring(var34.subjectPresence) })
	local var45 = nil
	
	if getFFlagAppChatPCMFixBlocking() then
		var45 = roactRodux.useSelector(function(p7) --[[ line: 278 ]]
			-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var34 (ref)
			return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p7.PlayerContextualMenu.UserBlocking.isBlockedByMe else p7.PlayerContextualMenu.IsBlockedByMe)[var34.subjectUserId] == nil
		end)
		reactModule.useEffect(function() --[[ line: 286 ]]
			-- upvalues: var45 (write), var35 (ref), blockingModule (copy), var34 (ref), name (copy)
			if var45 then
				var35(blockingModule.IsBlockedById.API({ userId = var34.subjectUserId })):andThen(function() --[[ line: 291 ]] end):catch(function() --[[ line: 292 ]]
					-- upvalues: name (copy)
					name:warning("Failed to check if subject user is blocked")
				end)
			end
		end, { var45, var35, var34.subjectUserId })
	end
	local var46 = useDesignTokens(function(p8) --[[ line: 299 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (copy)
		return {
			iconEmphasis = if fFlagRenameDeprecatedUIBloxTokens then p8.Color.Content.Emphasis else p8.Semantic.Icon.Emphasis,
			onlinePresence = p8.Color.System.Success,
			joinEventButtonHeight = p8.Size.Size_1200
		}
	end)
	local var47 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var34.subjectUserId },
		query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
	})
	local var48 = ""
	local _ = ""
	local var49 = ""
	local var50 = ""
	
	if var47.data then
		local var51
		var48 = userProfilesModule.Selectors.getUsernameFromId(var47.data, var34.subjectUserId)
		local _ = userProfilesModule.Selectors.getDisplayNameFromId(var47.data, var34.subjectUserId)
		var49 = userProfilesModule.Selectors.getPlatformNameFromId(var47.data, var34.subjectUserId)
		
		if var28 then
			var50 = userProfilesModule.Selectors.getPlatformProfileIdFromId(var47.data, var34.subjectUserId)
		end
	end
	if var49 then
		var51 = var49 ~= ""
		var51 = nil
	else
		var51 = false
	end
	local recommendationContext = var34.recommendationContext
	local _ = recommendationContext ~= recommendationContextType.Contacts and ((if recommendationContext ~= recommendationContextType.Contacts then var34.contactName else nil) or "")
	local var52, var53 = getPresenceIconModule(var34.subjectPresence, var46)
	
	if var34.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
		var52 = nil
		var53 = nil
	end
	local var54 = if var34.robloxFriendshipStatus == Enum.FriendStatus.Friend then getPresenceTextModule(var34.subjectPresence) else nil
	
	if var34.recommendationContext then
		local var55 = useRecommendationContextualInfoDisplay({
			contextType = var34.recommendationContext,
			mutualFriendsCount = var34.mutualFriendsCount
		})
		var54 = var55.text
		var52 = var55.icon
	end
	local var56 = reactModule.useCallback(function() --[[ line: 352 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), var35 (ref), var38 (ref), setGamePlaySession (copy), sessionType (copy), discoveryAnalyticsModule (copy), analyticsService (copy), getCurrentRouteState (copy), var37 (ref), appPage (copy)
		var41(eventNames.ViewExperienceDetails, { profileUserId = var34.subjectUserId })
		var35(var34.closeCentralOverlayThunk())
		
		if var34.subjectPresence and var34.subjectPresence.locationUniverseId then
			local var69 = tostring(var34.subjectPresence.locationUniverseId)
			
			if var38 then
				setGamePlaySession(var38, sessionType.StructuralIdentifier.GameDetailSource, false)
			end
			discoveryAnalyticsModule.Events.gameDetailReferral(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
				pg = getCurrentRouteState(var37).routeName,
				universeId = var69,
				pid = var34.subjectPresence.locationPlaceId,
				friendId = var34.subjectUserId
			})
			var37.navigate(appPage.ExperienceDetail, { detail = var69 })
		end
	end, {
		var41, var34.subjectUserId, var34.closeCentralOverlayThunk,
		var34.subjectPresence, var37, var38
	})
	local var57 = reactModule.useMemo(function() --[[ line: 390 ]]
		-- upvalues: var34 (ref), var43 (ref), reactModule (copy), button (copy), buttonType (copy), var56 (ref), var46 (ref), var39 (ref)
		local isInGame
		if not var34.enableExperienceCTAs then
			return function() --[[ line: 415 ]]
				-- upvalues: reactModule (copy)
				return reactModule.createElement("Folder")
			end
		elseif var34.subjectPresence then
			isInGame = var34.subjectPresence.status == "InGame"
			isInGame = nil
		else
			isInGame = false
		end
		return if isInGame and not var43.isPlayable then function() --[[ line: 398 ]]
			-- upvalues: reactModule (copy), button (copy), buttonType (copy), var56 (copy), var46 (copy), var39 (copy)
			return reactModule.createElement(button, {
				isLoading = false,
				layoutOrder = 100,
				buttonType = buttonType.PrimarySystem,
				onActivated = var56,
				size = UDim2.new(1, 0, 0, var46.joinEventButtonHeight),
				text = var39.ViewDetails
			})
		end else nil
	end, {
		var43,
		tostring(var34.subjectPresence),
		var34.enableExperienceCTAs
	})
	local var58 = if var34.robloxFriendshipStatus == Enum.FriendStatus.Friend and var34.subjectPresence and var34.subjectPresence.status == "InGame" then var39.Join else nil
	local var59 = reactModule.useCallback(function() --[[ line: 433 ]]
		-- upvalues: launchGameWithAnalytics (copy), var41 (ref), getCurrentRouteState (copy), var37 (ref), var34 (ref), var38 (ref)
		launchGameWithAnalytics(var41, getCurrentRouteState(var37).routeName, var34.subjectUserId, var34.subjectPresence, var38)
	end, {
		var41,
		var37,
		var34.subjectUserId,
		var34.subjectPresence,
		var38
	})
	local var60 = reactModule.useCallback(function() --[[ line: 443 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), var35 (ref), fFlagUserProfileConsoleUseNewReportFlowModule (copy), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var37 (ref), appPage (copy)
		var41(eventNames.ReportPlayer, { profileUserId = var34.subjectUserId })
		
		if var34.onReportActivated then
			var34.onReportActivated()
			
			return
		end
		var35(var34.closeCentralOverlayThunk())
		
		if fFlagUserProfileConsoleUseNewReportFlowModule then
			var35(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.UserProfile,
				targetId = var34.subjectUserId,
				onClose = function() --[[ line: 454 ]]
					-- upvalues: var35 (copy), closeCentralOverlay (copy)
					var35(closeCentralOverlay())
				end
			}))
			
			return
		end
		var37.navigate(appPage.ReportScreen, {
			reportData = {
				reportAbuseVector = "user",
				context = "profile",
				platform = "console",
				assetId = var34.subjectUserId
			}
		})
	end, {
		var35,
		var37,
		var34.subjectUserId,
		var34.closeCentralOverlayThunk,
		var34.onReportActivated
	})
	local var61 = if var28 then reactModule.useCallback(function() --[[ line: 479 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), var28 (copy), var50 (write)
		var41(eventNames.ViewPlatformProfile, { profileUserId = var34.subjectUserId })
		var28:ShowProfile(var50)
	end, {
		var50,
		var35,
		var37,
		var34.subjectUserId,
		var34.closeCentralOverlayThunk
	}) else nil
	local var62 = reactModule.useCallback(function() --[[ line: 487 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), fFlagSkipBlockModal (copy), var35 (ref), var37 (ref), appPage (copy), toastRoduxModule (copy), var39 (ref), blockingModule (copy), var36 (ref), t_2 (ref)
		var41(eventNames.BlockPlayer, { profileUserId = var34.subjectUserId })
		
		if fFlagSkipBlockModal and var34.skipBlockModal then
			var35(blockingModule.BlockUserById.API({ userId = var34.subjectUserId, currentUserId = var36 })):andThen(function() --[[ line: 513 ]]
				-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy), var34 (copy)
				var35(toastRoduxModule.Actions.SetCurrentToastMessage({
					isLocalized = true,
					toastMessage = var39.UserBlocked,
					toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
				}))
				var35(var34.closeCentralOverlayThunk())
			end):catch(function(_) --[[ line: 521 ]]
				-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
				var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
			end)
			
			return
		elseif var34.onBlockActivated then
			var34.onBlockActivated()
			
			return
		end
		var35(var34.closeCentralOverlayThunk())
		var37.push(appPage.BlockingModal, {
			navProps = {
				userId = var34.subjectUserId,
				onBlockSuccess = function() --[[ line: 498 ]]
					-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy)
					var35(toastRoduxModule.Actions.SetCurrentToastMessage({
						isLocalized = true,
						toastMessage = var39.UserBlocked,
						toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
					}))
				end
			}
		})
	end, {
		var39, var36, var35, var34.closeCentralOverlayThunk, var34.subjectUserId,
		var34.onBlockActivated,
		if fFlagSkipBlockModal then var34.skipBlockModal else nil
	})
	local var63 = reactModule.useCallback(function() --[[ line: 535 ]]
		-- upvalues: var35 (ref), blockingModule (copy), var34 (ref), var36 (ref), toastRoduxModule (copy), t_2 (ref)
		var35(blockingModule.UnblockUserById.API({ userId = var34.subjectUserId, currentUserId = var36 })):andThen(function() --[[ line: 540 ]]
			-- upvalues: var35 (copy), var34 (copy)
			var35(var34.closeCentralOverlayThunk())
		end):catch(function(_) --[[ line: 543 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var36,
		var35,
		var34.closeCentralOverlayThunk,
		var34.subjectUserId
	})
	local var64 = reactModule.useCallback(function() --[[ line: 548 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var21 (copy), var35 (ref), friendsModule (copy), var36 (ref), toastRoduxModule (copy), var39 (ref), t_2 (ref)
		var41(eventNames.Unfriend, { profileUserId = var34.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var21.Unfriend(var34.subjectUserId) else var35(friendsModule.UnfriendTargetUserId.API({
			targetUserId = var34.subjectUserId,
			currentUserId = var36
		}))):andThen(function() --[[ line: 558 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy), var34 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var39.ConnectionRemoved,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var35(var34.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 566 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var39,
		var36,
		var35,
		var34.subjectUserId,
		var34.closeCentralOverlayThunk
	})
	local var65 = reactModule.useCallback(function() --[[ line: 572 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), recommendationContextType (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var21 (copy), var35 (ref), friendsModule (copy), var36 (ref), toastRoduxModule (copy), var39 (ref), t_2 (ref)
		var41(eventNames.RequestFriendship, { profileUserId = var34.subjectUserId })
		local contactId = var34.contactId
		local var71 = var34.recommendationContext == recommendationContextType.Contacts and contactId;
		(if fFlagMigrateFriendshipStatusesRemainingActions then if var71 then var21.RequestFriendship(contactId, var34.friendshipOriginSourceType, { isContact = true }) else var21.RequestFriendship(var34.subjectUserId, var34.friendshipOriginSourceType) else var35(if var71 then friendsModule.RequestFriendshipFromContactId.API({ contactId = contactId, currentUserId = var36 }) else friendsModule.RequestFriendshipFromUserId.API({
			targetUserId = var34.subjectUserId,
			currentUserId = var36,
			friendshipOriginSourceType = var34.friendshipOriginSourceType
		}))):andThen(function() --[[ line: 595 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy), var34 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var39.ConnectionRequestSent,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var35(var34.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 603 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var39, var36, var35, var34.closeCentralOverlayThunk, var34.subjectUserId,
		var34.recommendationContext, var34.contactId, var34.friendshipOriginSourceType
	})
	local var66 = reactModule.useCallback(function() --[[ line: 619 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var21 (copy), var35 (ref), friendsModule (copy), var36 (ref), toastRoduxModule (copy), var39 (ref), t_2 (ref)
		var41(eventNames.AcceptFriendRequest, { profileUserId = var34.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var21.AcceptFriendRequest(var34.subjectUserId) else var35(friendsModule.AcceptFriendRequestFromUserId.API({
			targetUserId = var34.subjectUserId,
			currentUserId = var36
		}))):andThen(function() --[[ line: 629 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy), var34 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var39.ConnectionAdded,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var35(var34.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 637 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var39,
		var36,
		var35,
		var34.closeCentralOverlayThunk,
		var34.subjectUserId
	})
	local var67 = reactModule.useCallback(function() --[[ line: 642 ]]
		-- upvalues: var41 (ref), eventNames (copy), var34 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var21 (copy), var35 (ref), friendsModule (copy), var36 (ref), toastRoduxModule (copy), var39 (ref), t_2 (ref)
		var41(eventNames.IgnoreFriendRequest, { profileUserId = var34.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var21.DeclineFriendRequest(var34.subjectUserId) else var35(friendsModule.DeclineFriendRequestFromUserId.API({
			targetUserId = var34.subjectUserId,
			currentUserId = var36
		}))):andThen(function() --[[ line: 652 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), var39 (copy), var34 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var39.FriendRequestIgnored,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var35(var34.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 660 ]]
			-- upvalues: var35 (copy), toastRoduxModule (copy), t_2 (copy)
			var35(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var39,
		var36,
		var35,
		var34.closeCentralOverlayThunk,
		var34.subjectUserId
	})
	local var68 = roactRodux.useSelector(function(p9) --[[ line: 665 ]]
		-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var34 (ref)
		return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p9.PlayerContextualMenu.UserBlocking.isBlockedByMe else p9.PlayerContextualMenu.IsBlockedByMe)[var34.subjectUserId] or false
	end)
	
	return reactModule.createElement(playerContextualMenuComponentModule, {
		headerProps = reactModule.useMemo(function() --[[ line: 807 ]]
			-- upvalues: ? (write), var47 (ref), var34 (ref), recommendationContextType (copy), var48 (write), var49 (write), var51 (ref), playerContextualMenuVendorImagePath (copy), var54 (write), var52 (write), var53 (write), var58 (ref), var59 (ref), var57 (ref)
			return {
				displayNameItem = { icon = nil, labelText = u392, isLoading = var47.loading },
				userNameItem = if var34.recommendationContext == recommendationContextType.Contacts then nil else {
					icon = nil,
					labelText = "@" .. var48,
					isLoading = var47.loading
				},
				vendorNameItem = if var49 == "" then nil else {
					labelText = var49 or "",
					icon = var51 and ({
						Image = playerContextualMenuVendorImagePath,
						ImageRectOffset = Vector2.zero,
						ImageRectSize = Vector2.zero
					} or nil),
					isLoading = var47.loading
				},
				contextText = var54,
				contextIcon = var52,
				contextIconColor = if var53 then var53.Color3 else nil,
				contextIconTransparency = if var53 then var53.Transparency else nil,
				joinEventText = var58,
				joinEventOnActivated = var59,
				renderJoinEventButton = var57
			}
		end, {
			var47, u870, var48, var49, var51, var52, var54, var53, var57, var58, var59,
			var34.recommendationContext
		}),
		buttonProps = reactModule.useMemo(function() --[[ line: 674 ]]
			-- upvalues: images (copy), var39 (ref), var60 (ref), playerContextualMenuVendorImagePath (copy), var61 (ref), var62 (ref), var45 (write), var63 (ref), var64 (ref), var65 (ref), NO_OPT_CALLBACK (copy), var66 (ref), var67 (ref), var68 (ref), var34 (ref), getFFlagAppChatPCMFixBlocking (copy), cryoModule (copy), var28 (copy), var50 (write), dashModule (copy)
			local t = {
				icon = images["icons/actions/feedback"],
				text = var39.Report,
				onActivated = var60
			}
			local t_1 = {
				icon = playerContextualMenuVendorImagePath,
				text = var39.ViewPlatformProfile,
				onActivated = var61
			}
			local t_2 = {
				icon = images["icons/actions/block"],
				text = var39.Block,
				onActivated = var62,
				disabled = var45
			}
			local t_3 = {
				icon = images["icons/actions/block"],
				text = var39.Unblock,
				onActivated = var63
			}
			local t_4 = {
				icon = images["icons/actions/friends/friendRemove"],
				text = var39.RemoveConnection,
				onActivated = var64
			}
			local t_5 = {
				icon = images["icons/actions/friends/friendAdd"],
				text = var39.AddConnection,
				onActivated = var65
			}
			local t_6 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var39.PendingRequest,
				onActivated = NO_OPT_CALLBACK
			}
			local t_7 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var39.AcceptConnection,
				onActivated = var66
			}
			local t_8 = {
				icon = images["icons/actions/reject"],
				text = var39.IgnoreConnectionRequest,
				onActivated = var67
			}
			
			local function makeCtas() --[[ line: 730 ]]
				-- upvalues: var68 (copy), t_3 (ref), t_2 (ref), var34 (copy), t (ref), getFFlagAppChatPCMFixBlocking (copy), t_4 (ref), t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref), cryoModule (copy)
				local var82 = if var68 then t_3 else t_2
				local var83 = if var34.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
					t,
					if getFFlagAppChatPCMFixBlocking() then var82 else t_2,
					t_4
				} elseif var34.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if var34.contactId then { t_5 } else { t_5, t, var82 } elseif var34.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then { t_6, t, var82 } elseif var34.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then { t_7, t_8, t, var82 } else { t, var82 }
				
				if var34.additionalButtons then
					var83 = cryoModule.List.join(var83, var34.additionalButtons)
				end
				return var83
			end
			
			return if var28 and var28:IsProfileEnabled() and (var50 and var50 ~= "") then dashModule.append({ t_1 }, makeCtas()) else makeCtas()
		end, cryoModule.Dictionary.union(if var28 then {
			var34.robloxFriendshipStatus,
			var68,
			var50,
			var34.contactId,
			var34.additionalButtons
		} else {
			var34.robloxFriendshipStatus,
			var68,
			var34.contactId,
			var34.additionalButtons
		}, if getFFlagAppChatPCMFixBlocking() then { var45 } else {})),
		width = if fFlagPCMAcceptWidthAsProp then var34.width else UDim.new(0, 400)
	})
end