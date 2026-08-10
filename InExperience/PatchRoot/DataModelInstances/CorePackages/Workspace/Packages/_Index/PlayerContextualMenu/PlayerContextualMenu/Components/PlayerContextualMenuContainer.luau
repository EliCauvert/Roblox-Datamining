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
local var27 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil

local function NO_OPT_CALLBACK() --[[ line: 104 ]] end

local function launchGameWithAnalytics(p0, p1, p2, p3, p4) --[[ line: 106 ]]
	-- upvalues: setGamePlaySession (ref), sessionType (ref), eventNames (ref), httpService (ref), discoveryAnalyticsModule (ref), analyticsService (ref), experienceService (ref)
	setGamePlaySession(p4, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
	p0(eventNames.JoinExperience, { profileUserId = p2 })
	local var32 = httpService:GenerateGUID(false)
	discoveryAnalyticsModule.Events.gamePlayIntent(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
		friendId = p2,
		pageName = p1,
		placeId = if p3 then p3.locationPlaceId else nil,
		rootPlaceId = if p3 then p3.locationRootPlaceId else nil,
		joinAttemptId = var32
	})
	experienceService:LaunchExperience({ userId = p2, joinAttemptId = var32 }, "PlayerContextualMenu")
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

return function(p5) --[[ line: 210 | named "PlayerContextualMenuContainer" ]]
	-- upvalues: cryoModule (ref), t (ref), roactRodux (ref), robloxAppHooksModule (ref), navigationModule (ref), appSessionService (ref), useLocalization (ref), t_1 (ref), toastRoduxModule (ref), reactModule (ref), setupFireEvent (ref), analyticsService (ref), useHttpRequestModule (ref), url (ref), getFFlagAppChatPCMFixBlocking (ref), fFlagUserBlockingApiPlayerContextMenuEnabledModule (ref), blockingModule (ref), name (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), userProfilesModule (ref), var27 (ref), recommendationContextType (ref), getPresenceIconModule (ref), getPresenceTextModule (ref), useRecommendationContextualInfoDisplay (ref), eventNames (ref), setGamePlaySession (ref), sessionType (ref), discoveryAnalyticsModule (ref), getCurrentRouteState (ref), appPage (ref), button (ref), buttonType (ref), launchGameWithAnalytics (ref), fFlagUserProfileConsoleUseNewReportFlowModule (ref), openDynamicAbuseReportModule (write), abuseVectorModule (write), closeCentralOverlay (write), fFlagSkipBlockModal (ref), friendsModule (ref), images (ref), playerContextualMenuVendorImagePath (ref), NO_OPT_CALLBACK (ref), dashModule (ref), playerContextualMenuComponentModule (ref), fFlagPCMAcceptWidthAsProp (ref)
	local var33 = cryoModule.Dictionary.union(t, p5)
	local var34 = roactRodux.useDispatch()
	local var35 = robloxAppHooksModule.useLocalUserId()
	local var36 = navigationModule.useNavigation()
	local var37 = robloxAppHooksModule.useRoactService(appSessionService)
	local var38 = useLocalization(t_1)
	local t_2 = {
		isLocalized = true,
		toastMessage = var38.SomethingIsWrong,
		toastType = toastRoduxModule.Enums.ToastType.NetworkingError
	}
	local var40 = reactModule.useMemo(function() --[[ line: 226 ]]
		-- upvalues: setupFireEvent (copy), analyticsService (copy), var35 (ref)
		return setupFireEvent({
			analytics = analyticsService,
			infoForAllEvents = { uid = var35 }
		})
	end, { var35 })
	local var41 = useHttpRequestModule()
	local var42, var43 = reactModule.useState({ status = "NotStarted", isPlayable = false })
	reactModule.useEffect(function() --[[ line: 242 ]]
		-- upvalues: var33 (ref), var43 (ref), var41 (ref), url (copy)
		if var33.subjectPresence and var33.subjectPresence.locationUniverseId then
			var43({ status = "Fetching", isPlayable = false })
			var41(url.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. var33.subjectPresence.locationUniverseId, "GET"):andThen(function(p6) --[[ line: 254 ]]
				-- upvalues: var43 (copy)
				if p6.responseBody and p6.responseBody[1] then
					var43({
						status = "Finished",
						isPlayable = p6.responseBody[1].isPlayable
					})
				end
			end):catch(function(_) --[[ line: 262 ]]
				-- upvalues: var43 (copy)
				var43({ status = "Failed", isPlayable = false })
			end)
		end
	end, { tostring(var33.subjectPresence) })
	local var44 = nil
	
	if getFFlagAppChatPCMFixBlocking() then
		var44 = roactRodux.useSelector(function(p7) --[[ line: 274 ]]
			-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var33 (ref)
			return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p7.PlayerContextualMenu.UserBlocking.isBlockedByMe else p7.PlayerContextualMenu.IsBlockedByMe)[var33.subjectUserId] == nil
		end)
		reactModule.useEffect(function() --[[ line: 282 ]]
			-- upvalues: var44 (write), var34 (ref), blockingModule (copy), var33 (ref), name (copy)
			if var44 then
				var34(blockingModule.IsBlockedById.API({ userId = var33.subjectUserId })):andThen(function() --[[ line: 287 ]] end):catch(function() --[[ line: 288 ]]
					-- upvalues: name (copy)
					name:warning("Failed to check if subject user is blocked")
				end)
			end
		end, { var44, var34, var33.subjectUserId })
	end
	local var45 = useDesignTokens(function(p8) --[[ line: 295 ]]
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (copy)
		return {
			iconEmphasis = if fFlagRenameDeprecatedUIBloxTokens then p8.Color.Content.Emphasis else p8.Semantic.Icon.Emphasis,
			onlinePresence = p8.Color.System.Success,
			joinEventButtonHeight = p8.Size.Size_1200
		}
	end)
	local var46 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var33.subjectUserId },
		query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
	})
	local var47 = ""
	local _ = ""
	local var48 = ""
	local var49 = ""
	
	if var46.data then
		local var50
		var47 = userProfilesModule.Selectors.getUsernameFromId(var46.data, var33.subjectUserId)
		local _ = userProfilesModule.Selectors.getDisplayNameFromId(var46.data, var33.subjectUserId)
		var48 = userProfilesModule.Selectors.getPlatformNameFromId(var46.data, var33.subjectUserId)
		
		if var27 then
			var49 = userProfilesModule.Selectors.getPlatformProfileIdFromId(var46.data, var33.subjectUserId)
		end
	end
	if var48 then
		var50 = var48 ~= ""
		var50 = nil
	else
		var50 = false
	end
	local recommendationContext = var33.recommendationContext
	local _ = recommendationContext ~= recommendationContextType.Contacts and ((if recommendationContext ~= recommendationContextType.Contacts then var33.contactName else nil) or "")
	local var51, var52 = getPresenceIconModule(var33.subjectPresence, var45)
	
	if var33.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
		var51 = nil
		var52 = nil
	end
	local var53 = if var33.robloxFriendshipStatus == Enum.FriendStatus.Friend then getPresenceTextModule(var33.subjectPresence) else nil
	
	if var33.recommendationContext then
		local var54 = useRecommendationContextualInfoDisplay({
			contextType = var33.recommendationContext,
			mutualFriendsCount = var33.mutualFriendsCount
		})
		var53 = var54.text
		var51 = var54.icon
	end
	local var55 = reactModule.useCallback(function() --[[ line: 348 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), var37 (ref), setGamePlaySession (copy), sessionType (copy), discoveryAnalyticsModule (copy), analyticsService (copy), getCurrentRouteState (copy), var36 (ref), appPage (copy)
		var40(eventNames.ViewExperienceDetails, { profileUserId = var33.subjectUserId })
		var34(var33.closeCentralOverlayThunk())
		
		if var33.subjectPresence and var33.subjectPresence.locationUniverseId then
			local var68 = tostring(var33.subjectPresence.locationUniverseId)
			
			if var37 then
				setGamePlaySession(var37, sessionType.StructuralIdentifier.GameDetailSource, false)
			end
			discoveryAnalyticsModule.Events.gameDetailReferral(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
				pg = getCurrentRouteState(var36).routeName,
				universeId = var68,
				pid = var33.subjectPresence.locationPlaceId,
				friendId = var33.subjectUserId
			})
			var36.navigate(appPage.ExperienceDetail, { detail = var68 })
		end
	end, {
		var40, var33.subjectUserId, var33.closeCentralOverlayThunk,
		var33.subjectPresence, var36, var37
	})
	local var56 = reactModule.useMemo(function() --[[ line: 386 ]]
		-- upvalues: var33 (ref), var42 (ref), reactModule (copy), button (copy), buttonType (copy), var55 (ref), var45 (ref), var38 (ref)
		local isInGame
		if not var33.enableExperienceCTAs then
			return function() --[[ line: 411 ]]
				-- upvalues: reactModule (copy)
				return reactModule.createElement("Folder")
			end
		elseif var33.subjectPresence then
			isInGame = var33.subjectPresence.status == "InGame"
			isInGame = nil
		else
			isInGame = false
		end
		return if isInGame and not var42.isPlayable then function() --[[ line: 394 ]]
			-- upvalues: reactModule (copy), button (copy), buttonType (copy), var55 (copy), var45 (copy), var38 (copy)
			return reactModule.createElement(button, {
				isLoading = false,
				layoutOrder = 100,
				buttonType = buttonType.PrimarySystem,
				onActivated = var55,
				size = UDim2.new(1, 0, 0, var45.joinEventButtonHeight),
				text = var38.ViewDetails
			})
		end else nil
	end, {
		var42,
		tostring(var33.subjectPresence),
		var33.enableExperienceCTAs
	})
	local var57 = if var33.robloxFriendshipStatus == Enum.FriendStatus.Friend and var33.subjectPresence and var33.subjectPresence.status == "InGame" then var38.Join else nil
	local var58 = reactModule.useCallback(function() --[[ line: 429 ]]
		-- upvalues: launchGameWithAnalytics (copy), var40 (ref), getCurrentRouteState (copy), var36 (ref), var33 (ref), var37 (ref)
		launchGameWithAnalytics(var40, getCurrentRouteState(var36).routeName, var33.subjectUserId, var33.subjectPresence, var37)
	end, {
		var40,
		var36,
		var33.subjectUserId,
		var33.subjectPresence,
		var37
	})
	local var59 = reactModule.useCallback(function() --[[ line: 439 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), fFlagUserProfileConsoleUseNewReportFlowModule (copy), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var36 (ref), appPage (copy)
		var40(eventNames.ReportPlayer, { profileUserId = var33.subjectUserId })
		
		if var33.onReportActivated then
			var33.onReportActivated()
			
			return
		end
		var34(var33.closeCentralOverlayThunk())
		
		if fFlagUserProfileConsoleUseNewReportFlowModule then
			var34(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.UserProfile,
				targetId = var33.subjectUserId,
				onClose = function() --[[ line: 450 ]]
					-- upvalues: var34 (copy), closeCentralOverlay (copy)
					var34(closeCentralOverlay())
				end
			}))
			
			return
		end
		var36.navigate(appPage.ReportScreen, {
			reportData = {
				reportAbuseVector = "user",
				context = "profile",
				platform = "console",
				assetId = var33.subjectUserId
			}
		})
	end, {
		var34,
		var36,
		var33.subjectUserId,
		var33.closeCentralOverlayThunk,
		var33.onReportActivated
	})
	local var60 = if var27 then reactModule.useCallback(function() --[[ line: 475 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var27 (copy), var49 (write)
		var40(eventNames.ViewPlatformProfile, { profileUserId = var33.subjectUserId })
		var27:ShowProfile(var49)
	end, {
		var49,
		var34,
		var36,
		var33.subjectUserId,
		var33.closeCentralOverlayThunk
	}) else nil
	local var61 = reactModule.useCallback(function() --[[ line: 483 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), fFlagSkipBlockModal (copy), var34 (ref), var36 (ref), appPage (copy), toastRoduxModule (copy), var38 (ref), blockingModule (copy), var35 (ref), t_2 (ref)
		var40(eventNames.BlockPlayer, { profileUserId = var33.subjectUserId })
		
		if fFlagSkipBlockModal and var33.skipBlockModal then
			var34(blockingModule.BlockUserById.API({ userId = var33.subjectUserId, currentUserId = var35 })):andThen(function() --[[ line: 509 ]]
				-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy), var33 (copy)
				var34(toastRoduxModule.Actions.SetCurrentToastMessage({
					isLocalized = true,
					toastMessage = var38.UserBlocked,
					toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
				}))
				var34(var33.closeCentralOverlayThunk())
			end):catch(function(_) --[[ line: 517 ]]
				-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
				var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
			end)
			
			return
		elseif var33.onBlockActivated then
			var33.onBlockActivated()
			
			return
		end
		var34(var33.closeCentralOverlayThunk())
		var36.push(appPage.BlockingModal, {
			navProps = {
				userId = var33.subjectUserId,
				onBlockSuccess = function() --[[ line: 494 ]]
					-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy)
					var34(toastRoduxModule.Actions.SetCurrentToastMessage({
						isLocalized = true,
						toastMessage = var38.UserBlocked,
						toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
					}))
				end
			}
		})
	end, {
		var38, var35, var34, var33.closeCentralOverlayThunk, var33.subjectUserId,
		var33.onBlockActivated,
		if fFlagSkipBlockModal then var33.skipBlockModal else nil
	})
	local var62 = reactModule.useCallback(function() --[[ line: 531 ]]
		-- upvalues: var34 (ref), blockingModule (copy), var33 (ref), var35 (ref), toastRoduxModule (copy), t_2 (ref)
		var34(blockingModule.UnblockUserById.API({ userId = var33.subjectUserId, currentUserId = var35 })):andThen(function() --[[ line: 536 ]]
			-- upvalues: var34 (copy), var33 (copy)
			var34(var33.closeCentralOverlayThunk())
		end):catch(function(_) --[[ line: 539 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var35,
		var34,
		var33.closeCentralOverlayThunk,
		var33.subjectUserId
	})
	local var63 = reactModule.useCallback(function() --[[ line: 544 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), friendsModule (copy), var35 (ref), toastRoduxModule (copy), var38 (ref), t_2 (ref)
		var40(eventNames.Unfriend, { profileUserId = var33.subjectUserId })
		var34(friendsModule.UnfriendTargetUserId.API({
			targetUserId = var33.subjectUserId,
			currentUserId = var35
		})):andThen(function() --[[ line: 551 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy), var33 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var38.ConnectionRemoved,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var34(var33.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 559 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var38,
		var35,
		var34,
		var33.subjectUserId,
		var33.closeCentralOverlayThunk
	})
	local var64 = reactModule.useCallback(function() --[[ line: 565 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), recommendationContextType (copy), friendsModule (copy), var35 (ref), toastRoduxModule (copy), var38 (ref), t_2 (ref)
		var40(eventNames.RequestFriendship, { profileUserId = var33.subjectUserId })
		var34(if var33.recommendationContext == recommendationContextType.Contacts and var33.contactId then friendsModule.RequestFriendshipFromContactId.API({ contactId = var33.contactId, currentUserId = var35 }) else friendsModule.RequestFriendshipFromUserId.API({
			targetUserId = var33.subjectUserId,
			currentUserId = var35,
			friendshipOriginSourceType = var33.friendshipOriginSourceType
		})):andThen(function() --[[ line: 577 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy), var33 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var38.ConnectionRequestSent,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var34(var33.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 585 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var38, var35, var34, var33.closeCentralOverlayThunk, var33.subjectUserId,
		var33.recommendationContext, var33.contactId, var33.friendshipOriginSourceType
	})
	local var65 = reactModule.useCallback(function() --[[ line: 601 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), friendsModule (copy), var35 (ref), toastRoduxModule (copy), var38 (ref), t_2 (ref)
		var40(eventNames.AcceptFriendRequest, { profileUserId = var33.subjectUserId })
		var34(friendsModule.AcceptFriendRequestFromUserId.API({
			targetUserId = var33.subjectUserId,
			currentUserId = var35
		})):andThen(function() --[[ line: 608 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy), var33 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var38.ConnectionAdded,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var34(var33.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 616 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var38,
		var35,
		var34,
		var33.closeCentralOverlayThunk,
		var33.subjectUserId
	})
	local var66 = reactModule.useCallback(function() --[[ line: 621 ]]
		-- upvalues: var40 (ref), eventNames (copy), var33 (ref), var34 (ref), friendsModule (copy), var35 (ref), toastRoduxModule (copy), var38 (ref), t_2 (ref)
		var40(eventNames.IgnoreFriendRequest, { profileUserId = var33.subjectUserId })
		var34(friendsModule.DeclineFriendRequestFromUserId.API({
			targetUserId = var33.subjectUserId,
			currentUserId = var35
		})):andThen(function() --[[ line: 628 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), var38 (copy), var33 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var38.FriendRequestIgnored,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var34(var33.closeCentralOverlayThunk())
		end):catch(function() --[[ line: 636 ]]
			-- upvalues: var34 (copy), toastRoduxModule (copy), t_2 (copy)
			var34(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var38,
		var35,
		var34,
		var33.closeCentralOverlayThunk,
		var33.subjectUserId
	})
	local var67 = roactRodux.useSelector(function(p9) --[[ line: 641 ]]
		-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var33 (ref)
		return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p9.PlayerContextualMenu.UserBlocking.isBlockedByMe else p9.PlayerContextualMenu.IsBlockedByMe)[var33.subjectUserId] or false
	end)
	
	return reactModule.createElement(playerContextualMenuComponentModule, {
		headerProps = reactModule.useMemo(function() --[[ line: 783 ]]
			-- upvalues: ? (write), var46 (ref), var33 (ref), recommendationContextType (copy), var47 (write), var48 (write), var50 (ref), playerContextualMenuVendorImagePath (copy), var53 (write), var51 (write), var52 (write), var57 (ref), var58 (ref), var56 (ref)
			return {
				displayNameItem = { icon = nil, labelText = u382, isLoading = var46.loading },
				userNameItem = if var33.recommendationContext == recommendationContextType.Contacts then nil else {
					icon = nil,
					labelText = "@" .. var47,
					isLoading = var46.loading
				},
				vendorNameItem = if var48 == "" then nil else {
					labelText = var48 or "",
					icon = var50 and ({
						Image = playerContextualMenuVendorImagePath,
						ImageRectOffset = Vector2.zero,
						ImageRectSize = Vector2.zero
					} or nil),
					isLoading = var46.loading
				},
				contextText = var53,
				contextIcon = var51,
				contextIconColor = if var52 then var52.Color3 else nil,
				contextIconTransparency = if var52 then var52.Transparency else nil,
				joinEventText = var57,
				joinEventOnActivated = var58,
				renderJoinEventButton = var56
			}
		end, {
			var46, u845, var47, var48, var50, var51, var53, var52, var56, var57, var58,
			var33.recommendationContext
		}),
		buttonProps = reactModule.useMemo(function() --[[ line: 650 ]]
			-- upvalues: images (copy), var38 (ref), var59 (ref), playerContextualMenuVendorImagePath (copy), var60 (ref), var61 (ref), var44 (write), var62 (ref), var63 (ref), var64 (ref), NO_OPT_CALLBACK (copy), var65 (ref), var66 (ref), var67 (ref), var33 (ref), getFFlagAppChatPCMFixBlocking (copy), cryoModule (copy), var27 (copy), var49 (write), dashModule (copy)
			local t = {
				icon = images["icons/actions/feedback"],
				text = var38.Report,
				onActivated = var59
			}
			local t_1 = {
				icon = playerContextualMenuVendorImagePath,
				text = var38.ViewPlatformProfile,
				onActivated = var60
			}
			local t_2 = {
				icon = images["icons/actions/block"],
				text = var38.Block,
				onActivated = var61,
				disabled = var44
			}
			local t_3 = {
				icon = images["icons/actions/block"],
				text = var38.Unblock,
				onActivated = var62
			}
			local t_4 = {
				icon = images["icons/actions/friends/friendRemove"],
				text = var38.RemoveConnection,
				onActivated = var63
			}
			local t_5 = {
				icon = images["icons/actions/friends/friendAdd"],
				text = var38.AddConnection,
				onActivated = var64
			}
			local t_6 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var38.PendingRequest,
				onActivated = NO_OPT_CALLBACK
			}
			local t_7 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var38.AcceptConnection,
				onActivated = var65
			}
			local t_8 = {
				icon = images["icons/actions/reject"],
				text = var38.IgnoreConnectionRequest,
				onActivated = var66
			}
			
			local function makeCtas() --[[ line: 706 ]]
				-- upvalues: var67 (copy), t_3 (ref), t_2 (ref), var33 (copy), t (ref), getFFlagAppChatPCMFixBlocking (copy), t_4 (ref), t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref), cryoModule (copy)
				local var80 = if var67 then t_3 else t_2
				local var81 = if var33.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
					t,
					if getFFlagAppChatPCMFixBlocking() then var80 else t_2,
					t_4
				} elseif var33.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if var33.contactId then { t_5 } else { t_5, t, var80 } elseif var33.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then { t_6, t, var80 } elseif var33.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then { t_7, t_8, t, var80 } else { t, var80 }
				
				if var33.additionalButtons then
					var81 = cryoModule.List.join(var81, var33.additionalButtons)
				end
				return var81
			end
			
			return if var27 and var27:IsProfileEnabled() and (var49 and var49 ~= "") then dashModule.append({ t_1 }, makeCtas()) else makeCtas()
		end, cryoModule.Dictionary.union(if var27 then {
			var33.robloxFriendshipStatus,
			var67,
			var49,
			var33.contactId,
			var33.additionalButtons
		} else {
			var33.robloxFriendshipStatus,
			var67,
			var33.contactId,
			var33.additionalButtons
		}, if getFFlagAppChatPCMFixBlocking() then { var44 } else {})),
		width = if fFlagPCMAcceptWidthAsProp then var33.width else UDim.new(0, 400)
	})
end