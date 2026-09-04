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
local var1 = require(parent.DataHydration).Friends.FriendsStore.get()
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
local fFlagSkipBlockModal = require(parent.SharedFlags).FFlagSkipBlockModal
local fFlagMigrateFriendshipStatusesRemainingActions = require(parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local var2 = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil

local function NO_OPT_CALLBACK() end

local function launchGameWithAnalytics(p1, p2, p3, p4, p5)
	-- upvalues: setGamePlaySession (ref), sessionType (ref), eventNames (ref), httpService (ref), discoveryAnalyticsModule (ref), analyticsService (ref), experienceService (ref)
	setGamePlaySession(p5, sessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
	p1(eventNames.JoinExperience, { profileUserId = p3 })
	local var3 = httpService:GenerateGUID(false)
	discoveryAnalyticsModule.Events.gamePlayIntent(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
		friendId = p3,
		pageName = p2,
		placeId = if p4 then p4.locationPlaceId else nil,
		rootPlaceId = if p4 then p4.locationRootPlaceId else nil,
		joinAttemptId = var3
	})
	experienceService:LaunchExperience({ userId = p3, joinAttemptId = var3 }, "PlayerContextualMenu")
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

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), roactRodux (ref), robloxAppHooksModule (ref), navigationModule (ref), appSessionService (ref), useLocalization (ref), t_1 (ref), toastRoduxModule (ref), reactModule (ref), setupFireEvent (ref), analyticsService (ref), useHttpRequestModule (ref), url (ref), getFFlagAppChatPCMFixBlocking (ref), fFlagUserBlockingApiPlayerContextMenuEnabledModule (ref), blockingModule (ref), name (ref), useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), userProfilesModule (ref), var2 (ref), recommendationContextType (ref), getPresenceIconModule (ref), getPresenceTextModule (ref), useRecommendationContextualInfoDisplay (ref), eventNames (ref), setGamePlaySession (ref), sessionType (ref), discoveryAnalyticsModule (ref), getCurrentRouteState (ref), appPage (ref), button (ref), buttonType (ref), launchGameWithAnalytics (ref), fFlagUserProfileConsoleUseNewReportFlowModule (ref), openDynamicAbuseReportModule (write), abuseVectorModule (write), closeCentralOverlay (write), fFlagSkipBlockModal (ref), fFlagMigrateFriendshipStatusesRemainingActions (ref), var1 (ref), friendsModule (ref), images (ref), playerContextualMenuVendorImagePath (ref), NO_OPT_CALLBACK (ref), dashModule (ref), playerContextualMenuComponentModule (ref)
	local var3 = cryoModule.Dictionary.union(t, p1)
	local var4 = roactRodux.useDispatch()
	local var5 = robloxAppHooksModule.useLocalUserId()
	local var6 = navigationModule.useNavigation()
	local var7 = robloxAppHooksModule.useRoactService(appSessionService)
	local var8 = useLocalization(t_1)
	local t_2 = {
		isLocalized = true,
		toastMessage = var8.SomethingIsWrong,
		toastType = toastRoduxModule.Enums.ToastType.NetworkingError
	}
	local var9 = reactModule.useMemo(function()
		-- upvalues: setupFireEvent (copy), analyticsService (copy), var5 (ref)
		return setupFireEvent({
			analytics = analyticsService,
			infoForAllEvents = { uid = var5 }
		})
	end, { var5 })
	local var10 = useHttpRequestModule()
	local var11, var12 = reactModule.useState({ status = "NotStarted", isPlayable = false })
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var12 (ref), var10 (ref), url (copy)
		if var3.subjectPresence and var3.subjectPresence.locationUniverseId then
			var12({ status = "Fetching", isPlayable = false })
			var10(url.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. var33.subjectPresence.locationUniverseId, "GET"):andThen(function(p2)
				-- upvalues: var12 (copy)
				if p2.responseBody and p2.responseBody[1] then
					var12({
						status = "Finished",
						isPlayable = p2.responseBody[1].isPlayable
					})
				end
			end):catch(function(_)
				-- upvalues: var12 (copy)
				var12({ status = "Failed", isPlayable = false })
			end)
		end
	end, { tostring(var3.subjectPresence) })
	local var13 = nil
	
	if getFFlagAppChatPCMFixBlocking() then
		var13 = roactRodux.useSelector(function(p2)
			-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var3 (ref)
			return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p2.PlayerContextualMenu.UserBlocking.isBlockedByMe else p2.PlayerContextualMenu.IsBlockedByMe)[var3.subjectUserId] == nil
		end)
		reactModule.useEffect(function()
			-- upvalues: var13 (write), var4 (ref), blockingModule (copy), var3 (ref), name (copy)
			if var13 then
				var4(blockingModule.IsBlockedById.API({ userId = var3.subjectUserId })):andThen(function() end):catch(function()
					-- upvalues: name (copy)
					name:warning("Failed to check if subject user is blocked")
				end)
			end
		end, { var13, var4, var3.subjectUserId })
	end
	local var14 = useDesignTokens(function(p2)
		-- upvalues: fFlagRenameDeprecatedUIBloxTokens (copy)
		return {
			iconEmphasis = if fFlagRenameDeprecatedUIBloxTokens then p2.Color.Content.Emphasis else p2.Semantic.Icon.Emphasis,
			onlinePresence = p2.Color.System.Success,
			joinEventButtonHeight = p2.Size.Size_1200
		}
	end)
	local var15 = userProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { var3.subjectUserId },
		query = userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
	})
	local var16 = ""
	local _ = ""
	local var17 = ""
	local var18 = ""
	
	if var15.data then
		local var19
		var16 = userProfilesModule.Selectors.getUsernameFromId(var15.data, var3.subjectUserId)
		local _ = userProfilesModule.Selectors.getDisplayNameFromId(var15.data, var3.subjectUserId)
		var17 = userProfilesModule.Selectors.getPlatformNameFromId(var15.data, var3.subjectUserId)
		
		if var2 then
			var18 = userProfilesModule.Selectors.getPlatformProfileIdFromId(var15.data, var3.subjectUserId)
		end
	end
	if var17 then
		var19 = var17 ~= ""
		var19 = nil
	else
		var19 = false
	end
	local recommendationContext = var3.recommendationContext
	local _ = recommendationContext ~= recommendationContextType.Contacts and ((if recommendationContext ~= recommendationContextType.Contacts then var3.contactName else nil) or "")
	local var20, var21 = getPresenceIconModule(var3.subjectPresence, var14)
	
	if var3.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
		var20 = nil
		var21 = nil
	end
	local var22 = if var3.robloxFriendshipStatus == Enum.FriendStatus.Friend then getPresenceTextModule(var3.subjectPresence) else nil
	
	if var3.recommendationContext then
		local var23 = useRecommendationContextualInfoDisplay({
			contextType = var3.recommendationContext,
			mutualFriendsCount = var3.mutualFriendsCount
		})
		var22 = var23.text
		var20 = var23.icon
	end
	local var24 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), var4 (ref), var7 (ref), setGamePlaySession (copy), sessionType (copy), discoveryAnalyticsModule (copy), analyticsService (copy), getCurrentRouteState (copy), var6 (ref), appPage (copy)
		var9(eventNames.ViewExperienceDetails, { profileUserId = var3.subjectUserId })
		var4(var3.closeCentralOverlayThunk())
		
		if var3.subjectPresence and var3.subjectPresence.locationUniverseId then
			local var25 = tostring(var3.subjectPresence.locationUniverseId)
			
			if var7 then
				setGamePlaySession(var7, sessionType.StructuralIdentifier.GameDetailSource, false)
			end
			discoveryAnalyticsModule.Events.gameDetailReferral(analyticsService.EventStream, discoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
				pg = getCurrentRouteState(var6).routeName,
				universeId = var25,
				pid = var3.subjectPresence.locationPlaceId,
				friendId = var3.subjectUserId
			})
			var6.navigate(appPage.ExperienceDetail, { detail = var25 })
		end
	end, {
		var9, var3.subjectUserId, var3.closeCentralOverlayThunk,
		var3.subjectPresence, var6, var7
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: var3 (ref), var11 (ref), reactModule (copy), button (copy), buttonType (copy), var24 (ref), var14 (ref), var8 (ref)
		local isInGame
		if not var3.enableExperienceCTAs then
			return function()
				-- upvalues: reactModule (copy)
				return reactModule.createElement("Folder")
			end
		elseif var3.subjectPresence then
			isInGame = var3.subjectPresence.status == "InGame"
			isInGame = nil
		else
			isInGame = false
		end
		return if isInGame and not var11.isPlayable then function()
			-- upvalues: reactModule (copy), button (copy), buttonType (copy), var24 (copy), var14 (copy), var8 (copy)
			return reactModule.createElement(button, {
				isLoading = false,
				layoutOrder = 100,
				buttonType = buttonType.PrimarySystem,
				onActivated = var24,
				size = UDim2.new(1, 0, 0, var14.joinEventButtonHeight),
				text = var8.ViewDetails
			})
		end else nil
	end, {
		var11,
		tostring(var3.subjectPresence),
		var3.enableExperienceCTAs
	})
	local var26 = if var3.robloxFriendshipStatus == Enum.FriendStatus.Friend and var3.subjectPresence and var3.subjectPresence.status == "InGame" then var8.Join else nil
	local var27 = reactModule.useCallback(function()
		-- upvalues: launchGameWithAnalytics (copy), var9 (ref), getCurrentRouteState (copy), var6 (ref), var3 (ref), var7 (ref)
		launchGameWithAnalytics(var9, getCurrentRouteState(var6).routeName, var3.subjectUserId, var3.subjectPresence, var7)
	end, {
		var9,
		var6,
		var3.subjectUserId,
		var3.subjectPresence,
		var7
	})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), var4 (ref), fFlagUserProfileConsoleUseNewReportFlowModule (copy), openDynamicAbuseReportModule (copy), abuseVectorModule (copy), closeCentralOverlay (copy), var6 (ref), appPage (copy)
		var9(eventNames.ReportPlayer, { profileUserId = var3.subjectUserId })
		
		if var3.onReportActivated then
			var3.onReportActivated()
			
			return
		end
		var4(var3.closeCentralOverlayThunk())
		
		if fFlagUserProfileConsoleUseNewReportFlowModule then
			var4(openDynamicAbuseReportModule({
				abuseVector = abuseVectorModule.UserProfile,
				targetId = var3.subjectUserId,
				onClose = function()
					-- upvalues: var4 (copy), closeCentralOverlay (copy)
					var4(closeCentralOverlay())
				end
			}))
			
			return
		end
		var6.navigate(appPage.ReportScreen, {
			reportData = {
				reportAbuseVector = "user",
				context = "profile",
				platform = "console",
				assetId = var3.subjectUserId
			}
		})
	end, {
		var4,
		var6,
		var3.subjectUserId,
		var3.closeCentralOverlayThunk,
		var3.onReportActivated
	})
	local var29 = if var2 then reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), var2 (copy), var18 (write)
		var9(eventNames.ViewPlatformProfile, { profileUserId = var3.subjectUserId })
		var2:ShowProfile(var18)
	end, {
		var18,
		var4,
		var6,
		var3.subjectUserId,
		var3.closeCentralOverlayThunk
	}) else nil
	local var30 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), fFlagSkipBlockModal (copy), var4 (ref), var6 (ref), appPage (copy), toastRoduxModule (copy), var8 (ref), blockingModule (copy), var5 (ref), t_2 (ref)
		var9(eventNames.BlockPlayer, { profileUserId = var3.subjectUserId })
		
		if fFlagSkipBlockModal and var3.skipBlockModal then
			var4(blockingModule.BlockUserById.API({ userId = var3.subjectUserId, currentUserId = var5 })):andThen(function()
				-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy), var3 (copy)
				var4(toastRoduxModule.Actions.SetCurrentToastMessage({
					isLocalized = true,
					toastMessage = var8.UserBlocked,
					toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
				}))
				var4(var3.closeCentralOverlayThunk())
			end):catch(function(_)
				-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
				var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
			end)
			
			return
		elseif var3.onBlockActivated then
			var3.onBlockActivated()
			
			return
		end
		var4(var3.closeCentralOverlayThunk())
		var6.push(appPage.BlockingModal, {
			navProps = {
				userId = var3.subjectUserId,
				onBlockSuccess = function()
					-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy)
					var4(toastRoduxModule.Actions.SetCurrentToastMessage({
						isLocalized = true,
						toastMessage = var8.UserBlocked,
						toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
					}))
				end
			}
		})
	end, {
		var8, var5, var4, var3.closeCentralOverlayThunk, var3.subjectUserId,
		var3.onBlockActivated,
		if fFlagSkipBlockModal then var3.skipBlockModal else nil
	})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), blockingModule (copy), var3 (ref), var5 (ref), toastRoduxModule (copy), t_2 (ref)
		var4(blockingModule.UnblockUserById.API({ userId = var3.subjectUserId, currentUserId = var5 })):andThen(function()
			-- upvalues: var4 (copy), var3 (copy)
			var4(var3.closeCentralOverlayThunk())
		end):catch(function(_)
			-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var5,
		var4,
		var3.closeCentralOverlayThunk,
		var3.subjectUserId
	})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), var4 (ref), friendsModule (copy), var5 (ref), toastRoduxModule (copy), var8 (ref), t_2 (ref)
		var9(eventNames.Unfriend, { profileUserId = var3.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var1.Unfriend(var3.subjectUserId) else var4(friendsModule.UnfriendTargetUserId.API({
			targetUserId = var3.subjectUserId,
			currentUserId = var5
		}))):andThen(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy), var3 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var8.ConnectionRemoved,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var4(var3.closeCentralOverlayThunk())
		end):catch(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var8,
		var5,
		var4,
		var3.subjectUserId,
		var3.closeCentralOverlayThunk
	})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), recommendationContextType (copy), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), var4 (ref), friendsModule (copy), var5 (ref), toastRoduxModule (copy), var8 (ref), t_2 (ref)
		var9(eventNames.RequestFriendship, { profileUserId = var3.subjectUserId })
		local contactId = var3.contactId
		local var34 = var3.recommendationContext == recommendationContextType.Contacts and contactId;
		(if fFlagMigrateFriendshipStatusesRemainingActions then if var34 then var1.RequestFriendship(contactId, var3.friendshipOriginSourceType, { isContact = true }) else var1.RequestFriendship(var3.subjectUserId, var3.friendshipOriginSourceType) else var4(if var34 then friendsModule.RequestFriendshipFromContactId.API({ contactId = contactId, currentUserId = var5 }) else friendsModule.RequestFriendshipFromUserId.API({
			targetUserId = var3.subjectUserId,
			currentUserId = var5,
			friendshipOriginSourceType = var3.friendshipOriginSourceType
		}))):andThen(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy), var3 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var8.ConnectionRequestSent,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var4(var3.closeCentralOverlayThunk())
		end):catch(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var8, var5, var4, var3.closeCentralOverlayThunk, var3.subjectUserId,
		var3.recommendationContext, var3.contactId, var3.friendshipOriginSourceType
	})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), var4 (ref), friendsModule (copy), var5 (ref), toastRoduxModule (copy), var8 (ref), t_2 (ref)
		var9(eventNames.AcceptFriendRequest, { profileUserId = var3.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var1.AcceptFriendRequest(var3.subjectUserId) else var4(friendsModule.AcceptFriendRequestFromUserId.API({
			targetUserId = var3.subjectUserId,
			currentUserId = var5
		}))):andThen(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy), var3 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var8.ConnectionAdded,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var4(var3.closeCentralOverlayThunk())
		end):catch(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var8,
		var5,
		var4,
		var3.closeCentralOverlayThunk,
		var3.subjectUserId
	})
	local var35 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), eventNames (copy), var3 (ref), fFlagMigrateFriendshipStatusesRemainingActions (copy), var1 (copy), var4 (ref), friendsModule (copy), var5 (ref), toastRoduxModule (copy), var8 (ref), t_2 (ref)
		var9(eventNames.IgnoreFriendRequest, { profileUserId = var3.subjectUserId });
		(if fFlagMigrateFriendshipStatusesRemainingActions then var1.DeclineFriendRequest(var3.subjectUserId) else var4(friendsModule.DeclineFriendRequestFromUserId.API({
			targetUserId = var3.subjectUserId,
			currentUserId = var5
		}))):andThen(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), var8 (copy), var3 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = var8.FriendRequestIgnored,
				toastType = toastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			var4(var3.closeCentralOverlayThunk())
		end):catch(function()
			-- upvalues: var4 (copy), toastRoduxModule (copy), t_2 (copy)
			var4(toastRoduxModule.Actions.SetCurrentToastMessage(t_2))
		end)
	end, {
		var8,
		var5,
		var4,
		var3.closeCentralOverlayThunk,
		var3.subjectUserId
	})
	local var36 = roactRodux.useSelector(function(p2)
		-- upvalues: fFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), var3 (ref)
		return (if fFlagUserBlockingApiPlayerContextMenuEnabledModule then p2.PlayerContextualMenu.UserBlocking.isBlockedByMe else p2.PlayerContextualMenu.IsBlockedByMe)[var3.subjectUserId] or false
	end)
	
	return reactModule.createElement(playerContextualMenuComponentModule, {
		headerProps = reactModule.useMemo(function()
			-- upvalues: ? (write), var15 (ref), var3 (ref), recommendationContextType (copy), var16 (write), var17 (write), var19 (ref), playerContextualMenuVendorImagePath (copy), var22 (write), var20 (write), var21 (write), var26 (ref), var27 (ref), var25 (ref)
			return {
				displayNameItem = { icon = nil, labelText = u392, isLoading = var15.loading },
				userNameItem = if var3.recommendationContext == recommendationContextType.Contacts then nil else {
					icon = nil,
					labelText = "@" .. var47,
					isLoading = var15.loading
				},
				vendorNameItem = if var17 == "" then nil else {
					labelText = var17 or "",
					icon = var19 and ({
						Image = playerContextualMenuVendorImagePath,
						ImageRectOffset = Vector2.zero,
						ImageRectSize = Vector2.zero
					} or nil),
					isLoading = var15.loading
				},
				contextText = var22,
				contextIcon = var20,
				contextIconColor = if var21 then var21.Color3 else nil,
				contextIconTransparency = if var21 then var21.Transparency else nil,
				joinEventText = var26,
				joinEventOnActivated = var27,
				renderJoinEventButton = var25
			}
		end, {
			var15, u864, var16, var17, var19, var20, var22, var21, var25, var26, var27,
			var3.recommendationContext
		}),
		buttonProps = reactModule.useMemo(function()
			-- upvalues: images (copy), var8 (ref), var28 (ref), playerContextualMenuVendorImagePath (copy), var29 (ref), var30 (ref), var13 (write), var31 (ref), var32 (ref), var33 (ref), NO_OPT_CALLBACK (copy), var34 (ref), var35 (ref), var36 (ref), var3 (ref), getFFlagAppChatPCMFixBlocking (copy), cryoModule (copy), var2 (copy), var18 (write), dashModule (copy)
			local t = {
				icon = images["icons/actions/feedback"],
				text = var8.Report,
				onActivated = var28
			}
			local t_1 = {
				icon = playerContextualMenuVendorImagePath,
				text = var8.ViewPlatformProfile,
				onActivated = var29
			}
			local t_2 = {
				icon = images["icons/actions/block"],
				text = var8.Block,
				onActivated = var30,
				disabled = var13
			}
			local t_3 = {
				icon = images["icons/actions/block"],
				text = var8.Unblock,
				onActivated = var31
			}
			local t_4 = {
				icon = images["icons/actions/friends/friendRemove"],
				text = var8.RemoveConnection,
				onActivated = var32
			}
			local t_5 = {
				icon = images["icons/actions/friends/friendAdd"],
				text = var8.AddConnection,
				onActivated = var33
			}
			local t_6 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var8.PendingRequest,
				onActivated = NO_OPT_CALLBACK
			}
			local t_7 = {
				icon = images["icons/actions/friends/friendpending"],
				text = var8.AcceptConnection,
				onActivated = var34
			}
			local t_8 = {
				icon = images["icons/actions/reject"],
				text = var8.IgnoreConnectionRequest,
				onActivated = var35
			}
			
			local function makeCtas()
				-- upvalues: var36 (copy), t_3 (ref), t_2 (ref), var3 (copy), t (ref), getFFlagAppChatPCMFixBlocking (copy), t_4 (ref), t_5 (ref), t_6 (ref), t_7 (ref), t_8 (ref), cryoModule (copy)
				local var37 = if var36 then t_3 else t_2
				local var38 = if var3.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
					t,
					if getFFlagAppChatPCMFixBlocking() then var37 else t_2,
					t_4
				} elseif var3.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if var3.contactId then { t_5 } else { t_5, t, var37 } elseif var3.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then { t_6, t, var37 } elseif var3.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then { t_7, t_8, t, var37 } else { t, var37 }
				
				if var3.additionalButtons then
					var38 = cryoModule.List.join(var38, var3.additionalButtons)
				end
				return var38
			end
			
			return if var2 and var2:IsProfileEnabled() and (var18 and var18 ~= "") then dashModule.append({ t_1 }, makeCtas()) else makeCtas()
		end, cryoModule.Dictionary.union(if var2 then {
			var3.robloxFriendshipStatus,
			var36,
			var18,
			var3.contactId,
			var3.additionalButtons
		} else {
			var3.robloxFriendshipStatus,
			var36,
			var3.contactId,
			var3.additionalButtons
		}, if getFFlagAppChatPCMFixBlocking() then { var13 } else {})),
		width = var3.width
	})
end