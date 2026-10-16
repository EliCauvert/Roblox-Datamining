local HttpService = game:GetService("HttpService")
local PlayerContextualMenu = script:FindFirstAncestor("PlayerContextualMenu")
local Parent = PlayerContextualMenu.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UserProfilesModule = require(Parent.UserProfiles)
local Url = require(Parent.Http).Url
local RoactRodux = require(Parent.RoactUtils).Hooks.RoactRodux
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ToastRoduxModule = require(Parent.ToastRodux)
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local NavigationModule = require(Parent.Navigation)
local GetCurrentRouteStateFunction = NavigationModule.getCurrentRouteState
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local AppSessionService = require(Parent.RoactServiceTags).AppSessionService
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local DashModule = require(Parent.Dash)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local NewResult = require(Parent.Loggers).Logger:new(script.Name)
local GetFFlagAppChatPCMFixBlockingFunction = require(Parent.SharedFlags).getFFlagAppChatPCMFixBlocking
local RecommendationContextType = require(Parent.FriendsRodux).config({ keyPath = "PlayerContextualMenu.Friends" }).Enums.RecommendationContextType
local UseRecommendationContextualInfoDisplayFunction = require(Parent.SocialCommon).Hooks.useRecommendationContextualInfoDisplay
local _ = require(script.Parent.Types)
local GetPresenceIconModule = require(script.Parent.getPresenceIcon)
local GetPresenceTextModule = require(script.Parent.getPresenceText)
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local AnalyticsModule = require(PlayerContextualMenu.Analytics)
local SetupFireEventFunction = AnalyticsModule.setupFireEvent
local EventNames = AnalyticsModule.EventNames
local AnalyticsService = AnalyticsModule.AnalyticsService
local FriendsModule = require(PlayerContextualMenu.Http.Friends)
local BlockingModule = require(PlayerContextualMenu.Http.Blocking)
local PlayerContextualMenuComponentModule = require(PlayerContextualMenu.Components.PlayerContextualMenuComponent)
local UseHttpRequestModule = require(script.Parent.HttpRequest.useHttpRequest)
local _ = require(Parent.FriendsNetworking).Enums
local GetResult = require(Parent.DataHydration).Friends.FriendsStore.get()
local FFlagUserProfileConsoleUseNewReportFlowModule = require(PlayerContextualMenu.Flags.FFlagUserProfileConsoleUseNewReportFlow)
local CloseCentralOverlayFunction = nil
local AbuseVectorModule = nil
local Callback = nil

if FFlagUserProfileConsoleUseNewReportFlowModule then
	CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
	AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
	Callback = require(Parent.GenericAbuseReporting.OpenDynamicAbuseReport)
end
local PlayerContextualMenuVendorImagePath = game:DefineFastString("PlayerContextualMenuVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local FFlagUserBlockingApiPlayerContextMenuEnabledModule = require(PlayerContextualMenu.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled)
local FFlagSkipBlockModal = require(Parent.SharedFlags).FFlagSkipBlockModal
local FFlagMigrateFriendshipStatusesRemainingActions = require(Parent.SharedFlags).FFlagMigrateFriendshipStatusesRemainingActions
local PlatformFriendsService = if game:GetEngineFeature("PlatformFriendsService") and game:GetEngineFeature("PlatformFriendsProfile") then game:GetService("PlatformFriendsService") else nil

local function NO_OPT_CALLBACK() --[[ Line: 105 ]] end

local function launchGameWithAnalytics(Callback: (any, any) -> (), PageName, FriendId, SubjectPresence, UseRoactServiceResult) --[[ Line: 107 ]]
	-- upvalues: SetGamePlaySessionFunction (copy), SessionType (copy), EventNames (copy), HttpService (copy), DiscoveryAnalyticsModule (copy), AnalyticsService (copy), ExperienceService (copy)
	SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GamePlayFromFriendsList, true)
	Callback(EventNames.JoinExperience, { profileUserId = FriendId })
	local Guid = HttpService:GenerateGUID(false)
	DiscoveryAnalyticsModule.Events.gamePlayIntent(AnalyticsService.EventStream, DiscoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
		friendId = FriendId,
		pageName = PageName,
		placeId = if SubjectPresence then SubjectPresence.locationPlaceId else nil,
		rootPlaceId = if SubjectPresence then SubjectPresence.locationRootPlaceId else nil,
		joinAttemptId = Guid
	})
	ExperienceService:LaunchExperience({ userId = FriendId, joinAttemptId = Guid }, "PlayerContextualMenu")
end

local config = { enableExperienceCTAs = true, width = UDim.new(0, 400) }
local config1 = {
	AcceptConnection = "Feature.Friends.Action.AcceptFriend",
	AddConnection = "Feature.Profile.Label.AddFriend",
	IgnoreConnectionRequest = "Feature.AddFriends.Action.IgnoreFriendRequest",
	RemoveConnection = "Feature.Friends.Action.Unfriend",
	Block = "Feature.Friends.Action.Block",
	Unblock = "Feature.Friends.Action.Unblock",
	Chat = "CommonUI.Features.Label.Chat",
	Join = "Feature.Chat.Drawer.Join",
	PendingRequest = "Feature.Friends.Action.PendingRequest",
	Report = "Feature.Catalog.Action.Report",
	ViewDetails = "Feature.Profile.Label.ViewDetails",
	ViewPlatformProfile = "Feature.Friends.Action.ViewPlatformProfile",
	ConnectionAdded = "Feature.Friends.Action.FriendAdded",
	ConnectionRequestSent = "Feature.Friends.Action.FriendRequestSent",
	ConnectionRemoved = "Feature.Friends.Action.FriendRemoved",
	FriendRequestIgnored = "Feature.AddFriends.Action.RequestIgnored",
	SomethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong",
	UserBlocked = "Feature.Profile.Action.UserBlocked"
}

return function(p1) --[[ Line: 197 | Named "PlayerContextualMenuContainer" ]]
	-- upvalues: CryoModule (copy), config (copy), RoactRodux (copy), RobloxAppHooksModule (copy), NavigationModule (copy), AppSessionService (copy), UseLocalizationFunction (copy), config1 (copy), ToastRoduxModule (copy), ReactModule (copy), SetupFireEventFunction (copy), AnalyticsService (copy), UseHttpRequestModule (copy), Url (copy), GetFFlagAppChatPCMFixBlockingFunction (copy), FFlagUserBlockingApiPlayerContextMenuEnabledModule (copy), BlockingModule (copy), NewResult (copy), UseDesignTokensFunction (copy), UserProfilesModule (copy), PlatformFriendsService (copy), RecommendationContextType (copy), GetPresenceIconModule (copy), GetPresenceTextModule (copy), UseRecommendationContextualInfoDisplayFunction (copy), EventNames (copy), SetGamePlaySessionFunction (copy), SessionType (copy), DiscoveryAnalyticsModule (copy), GetCurrentRouteStateFunction (copy), AppPage (copy), Button (copy), ButtonType (copy), launchGameWithAnalytics (copy), FFlagUserProfileConsoleUseNewReportFlowModule (copy), Callback (ref), AbuseVectorModule (ref), CloseCentralOverlayFunction (ref), FFlagSkipBlockModal (copy), FFlagMigrateFriendshipStatusesRemainingActions (copy), GetResult (copy), FriendsModule (copy), Images (copy), PlayerContextualMenuVendorImagePath (copy), NO_OPT_CALLBACK (copy), DashModule (copy), PlayerContextualMenuComponentModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseDispatchResult = RoactRodux.useDispatch()
	local UseLocalUserIdResult = RobloxAppHooksModule.useLocalUserId()
	local UseNavigationResult = NavigationModule.useNavigation()
	local UseRoactServiceResult = RobloxAppHooksModule.useRoactService(AppSessionService)
	local UseLocalizationResult = UseLocalizationFunction(config1)
	local config2 = {
		isLocalized = true,
		toastMessage = UseLocalizationResult.SomethingIsWrong,
		toastType = ToastRoduxModule.Enums.ToastType.NetworkingError
	}
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 213 ]]
		-- upvalues: SetupFireEventFunction (upval), AnalyticsService (upval), UseLocalUserIdResult (copy)
		return SetupFireEventFunction({
			analytics = AnalyticsService,
			infoForAllEvents = { uid = UseLocalUserIdResult }
		})
	end, { UseLocalUserIdResult })
	local UseHttpRequestModuleResult = UseHttpRequestModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState({ status = "NotStarted", isPlayable = false })
	ReactModule.useEffect(function() --[[ Line: 229 ]]
		-- upvalues: UnionResult (copy), UseStateResult2 (copy), UseHttpRequestModuleResult (copy), Url (upval)
		if UnionResult.subjectPresence and UnionResult.subjectPresence.locationUniverseId then
			UseStateResult2({ status = "Fetching", isPlayable = false })
			UseHttpRequestModuleResult(Url.GAME_URL .. "v1/games/multiget-playability-status?universeIds=" .. UnionResult.subjectPresence.locationUniverseId, "GET"):andThen(function(Result) --[[ Line: 241 ]]
				-- upvalues: UseStateResult2 (upval)
				if Result.responseBody and Result.responseBody[1] then
					UseStateResult2({
						status = "Finished",
						isPlayable = Result.responseBody[1].isPlayable
					})
				end
			end):catch(function(_) --[[ Line: 249 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2({ status = "Failed", isPlayable = false })
			end)
		end
	end, { (tostring(UnionResult.subjectPresence)) })
	local UseSelectorResult = nil
	
	if GetFFlagAppChatPCMFixBlockingFunction() then
		UseSelectorResult = RoactRodux.useSelector(function(p2): boolean --[[ Line: 261 ]]
			-- upvalues: FFlagUserBlockingApiPlayerContextMenuEnabledModule (upval), UnionResult (copy)
			return (if FFlagUserBlockingApiPlayerContextMenuEnabledModule then p2.PlayerContextualMenu.UserBlocking.isBlockedByMe else p2.PlayerContextualMenu.IsBlockedByMe)[UnionResult.subjectUserId] == nil
		end)
		ReactModule.useEffect(function() --[[ Line: 269 ]]
			-- upvalues: UseSelectorResult (ref), UseDispatchResult (copy), BlockingModule (upval), UnionResult (copy), NewResult (upval)
			if UseSelectorResult then
				UseDispatchResult(BlockingModule.IsBlockedById.API({ userId = UnionResult.subjectUserId })):andThen(function() --[[ Line: 274 ]] end):catch(function() --[[ Line: 275 ]]
					-- upvalues: NewResult (upval)
					NewResult:warning("Failed to check if subject user is blocked")
				end)
			end
		end, {
			UseSelectorResult,
			UseDispatchResult,
			UnionResult.subjectUserId
		})
	end
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2) --[[ Line: 282 ]]
		return {
			iconEmphasis = p2.Color.Content.Emphasis,
			onlinePresence = p2.Color.System.Success,
			joinEventButtonHeight = p2.Size.Size_1200
		}
	end)
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = { UnionResult.subjectUserId },
		query = UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
	})
	local UsernameFromId = ""
	local ContactName = ""
	local PlatformNameFromId = ""
	local PlatformProfileIdFromId = ""
	
	if UseUserProfilesFetchResult.data then
		UsernameFromId = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, UnionResult.subjectUserId)
		ContactName = UserProfilesModule.Selectors.getDisplayNameFromId(UseUserProfilesFetchResult.data, UnionResult.subjectUserId)
		PlatformNameFromId = UserProfilesModule.Selectors.getPlatformNameFromId(UseUserProfilesFetchResult.data, UnionResult.subjectUserId)
		
		if PlatformFriendsService then
			PlatformProfileIdFromId = UserProfilesModule.Selectors.getPlatformProfileIdFromId(UseUserProfilesFetchResult.data, UnionResult.subjectUserId)
		end
	end
	local IsNotPlatformNameFromIdMatch: boolean = if PlatformNameFromId then PlatformNameFromId ~= "" else false
	
	if UnionResult.recommendationContext == RecommendationContextType.Contacts then
		ContactName = UnionResult.contactName or ""
	end
	local PresenceIconModule, PresenceIconModule2 = GetPresenceIconModule(UnionResult.subjectPresence, UseDesignTokensResult)
	
	if UnionResult.robloxFriendshipStatus ~= Enum.FriendStatus.Friend then
		PresenceIconModule = nil
		PresenceIconModule2 = nil
	end
	local PresenceTextModule = if UnionResult.robloxFriendshipStatus == Enum.FriendStatus.Friend then GetPresenceTextModule(UnionResult.subjectPresence) else nil
	
	if UnionResult.recommendationContext then
		local UseRecommendationContextualInfoDisplayResult = UseRecommendationContextualInfoDisplayFunction({
			contextType = UnionResult.recommendationContext,
			mutualFriendsCount = UnionResult.mutualFriendsCount
		})
		PresenceTextModule = UseRecommendationContextualInfoDisplayResult.text
		PresenceIconModule = UseRecommendationContextualInfoDisplayResult.icon
	end
	local UseResult = ReactModule.useCallback(function() --[[ Line: 333 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), UseDispatchResult (copy), UseRoactServiceResult (copy), SetGamePlaySessionFunction (upval), SessionType (upval), DiscoveryAnalyticsModule (upval), AnalyticsService (upval), GetCurrentRouteStateFunction (upval), UseNavigationResult (copy), AppPage (upval)
		UseMemoResult(EventNames.ViewExperienceDetails, { profileUserId = UnionResult.subjectUserId })
		UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		
		if UnionResult.subjectPresence and UnionResult.subjectPresence.locationUniverseId then
			local Text = tostring(UnionResult.subjectPresence.locationUniverseId)
			
			if UseRoactServiceResult then
				SetGamePlaySessionFunction(UseRoactServiceResult, SessionType.StructuralIdentifier.GameDetailSource, false)
			end
			DiscoveryAnalyticsModule.Events.gameDetailReferral(AnalyticsService.EventStream, DiscoveryAnalyticsModule.Constants.Context.PlayerContextualMenu, {
				pg = GetCurrentRouteStateFunction(UseNavigationResult).routeName,
				universeId = Text,
				pid = UnionResult.subjectPresence.locationPlaceId,
				friendId = UnionResult.subjectUserId
			})
			UseNavigationResult.navigate(AppPage.ExperienceDetail, { detail = Text })
		end
	end, {
		UseMemoResult, UnionResult.subjectUserId, UnionResult.closeCentralOverlayThunk,
		UnionResult.subjectPresence, UseNavigationResult, UseRoactServiceResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 371 ]]
		-- upvalues: UnionResult (copy), UseStateResult (copy), ReactModule (upval), Button (upval), ButtonType (upval), UseResult (copy), UseDesignTokensResult (copy), UseLocalizationResult (copy)
		if UnionResult.enableExperienceCTAs then
			local IsInGame: boolean = if UnionResult.subjectPresence then UnionResult.subjectPresence.status == "InGame" else false
			
			return if IsInGame and not UseStateResult.isPlayable then function() --[[ Line: 379 ]]
				-- upvalues: ReactModule (upval), Button (upval), ButtonType (upval), UseResult (upval), UseDesignTokensResult (upval), UseLocalizationResult (upval)
				return ReactModule.createElement(Button, {
					isLoading = false,
					layoutOrder = 100,
					buttonType = ButtonType.PrimarySystem,
					onActivated = UseResult,
					size = UDim2.new(1, 0, 0, UseDesignTokensResult.joinEventButtonHeight),
					text = UseLocalizationResult.ViewDetails
				})
			end else nil
		else
			return function() --[[ Line: 396 ]]
				-- upvalues: ReactModule (upval)
				return ReactModule.createElement("Folder")
			end
		end
	end, {
		UseStateResult,
		tostring(UnionResult.subjectPresence),
		UnionResult.enableExperienceCTAs
	})
	local Join = if UnionResult.robloxFriendshipStatus == Enum.FriendStatus.Friend and UnionResult.subjectPresence and UnionResult.subjectPresence.status == "InGame" then UseLocalizationResult.Join else nil
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 414 ]]
		-- upvalues: launchGameWithAnalytics (upval), UseMemoResult (copy), GetCurrentRouteStateFunction (upval), UseNavigationResult (copy), UnionResult (copy), UseRoactServiceResult (copy)
		launchGameWithAnalytics(UseMemoResult, GetCurrentRouteStateFunction(UseNavigationResult).routeName, UnionResult.subjectUserId, UnionResult.subjectPresence, UseRoactServiceResult)
	end, {
		UseMemoResult,
		UseNavigationResult,
		UnionResult.subjectUserId,
		UnionResult.subjectPresence,
		UseRoactServiceResult
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 424 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), UseDispatchResult (copy), FFlagUserProfileConsoleUseNewReportFlowModule (upval), Callback (upval), AbuseVectorModule (upval), CloseCentralOverlayFunction (upval), UseNavigationResult (copy), AppPage (upval)
		UseMemoResult(EventNames.ReportPlayer, { profileUserId = UnionResult.subjectUserId })
		
		if UnionResult.onReportActivated then
			UnionResult.onReportActivated()
			
			return
		end
		UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		
		if FFlagUserProfileConsoleUseNewReportFlowModule then
			UseDispatchResult(Callback({
				abuseVector = AbuseVectorModule.UserProfile,
				targetId = UnionResult.subjectUserId,
				onClose = function() --[[ Line: 435 ]]
					-- upvalues: UseDispatchResult (upval), CloseCentralOverlayFunction (upval)
					UseDispatchResult(CloseCentralOverlayFunction())
				end
			}))
			
			return
		else
			UseNavigationResult.navigate(AppPage.ReportScreen, {
				reportData = {
					reportAbuseVector = "user",
					context = "profile",
					platform = "console",
					assetId = UnionResult.subjectUserId
				}
			})
		end
	end, {
		UseDispatchResult,
		UseNavigationResult,
		UnionResult.subjectUserId,
		UnionResult.closeCentralOverlayThunk,
		UnionResult.onReportActivated
	})
	local UseResult3 = if PlatformFriendsService then ReactModule.useCallback(function() --[[ Line: 460 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), PlatformFriendsService (upval), PlatformProfileIdFromId (ref)
		UseMemoResult(EventNames.ViewPlatformProfile, { profileUserId = UnionResult.subjectUserId })
		PlatformFriendsService:ShowProfile(PlatformProfileIdFromId)
	end, {
		PlatformProfileIdFromId,
		UseDispatchResult,
		UseNavigationResult,
		UnionResult.subjectUserId,
		UnionResult.closeCentralOverlayThunk
	}) else nil
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 468 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), FFlagSkipBlockModal (upval), UseDispatchResult (copy), UseNavigationResult (copy), AppPage (upval), ToastRoduxModule (upval), UseLocalizationResult (copy), BlockingModule (upval), UseLocalUserIdResult (copy), config2 (copy)
		UseMemoResult(EventNames.BlockPlayer, { profileUserId = UnionResult.subjectUserId })
		
		if FFlagSkipBlockModal and UnionResult.skipBlockModal then
			UseDispatchResult(BlockingModule.BlockUserById.API({
				userId = UnionResult.subjectUserId,
				currentUserId = UseLocalUserIdResult
			})):andThen(function() --[[ Line: 494 ]]
				-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval), UnionResult (upval)
				UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
					isLocalized = true,
					toastMessage = UseLocalizationResult.UserBlocked,
					toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
				}))
				UseDispatchResult(UnionResult.closeCentralOverlayThunk())
			end):catch(function(_) --[[ Line: 502 ]]
				-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
				UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
			end)
			
			return
		end
		if UnionResult.onBlockActivated then
			UnionResult.onBlockActivated()
			
			return
		else
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
			UseNavigationResult.push(AppPage.BlockingModal, {
				navProps = {
					userId = UnionResult.subjectUserId,
					onBlockSuccess = function() --[[ Line: 479 ]]
						-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval)
						UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
							isLocalized = true,
							toastMessage = UseLocalizationResult.UserBlocked,
							toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
						}))
					end
				}
			})
		end
	end, {
		UseLocalizationResult, UseLocalUserIdResult, UseDispatchResult,
		UnionResult.closeCentralOverlayThunk, UnionResult.subjectUserId,
		UnionResult.onBlockActivated,
		if FFlagSkipBlockModal then UnionResult.skipBlockModal else nil
	})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 516 ]]
		-- upvalues: UseDispatchResult (copy), BlockingModule (upval), UnionResult (copy), UseLocalUserIdResult (copy), ToastRoduxModule (upval), config2 (copy)
		UseDispatchResult(BlockingModule.UnblockUserById.API({
			userId = UnionResult.subjectUserId,
			currentUserId = UseLocalUserIdResult
		})):andThen(function() --[[ Line: 521 ]]
			-- upvalues: UseDispatchResult (upval), UnionResult (upval)
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		end):catch(function(_) --[[ Line: 524 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
		end)
	end, {
		UseLocalUserIdResult,
		UseDispatchResult,
		UnionResult.closeCentralOverlayThunk,
		UnionResult.subjectUserId
	})
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 529 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), UseDispatchResult (copy), FriendsModule (upval), UseLocalUserIdResult (copy), ToastRoduxModule (upval), UseLocalizationResult (copy), config2 (copy)
		UseMemoResult(EventNames.Unfriend, { profileUserId = UnionResult.subjectUserId });
		(if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.Unfriend(UnionResult.subjectUserId) else UseDispatchResult(FriendsModule.UnfriendTargetUserId.API({
			targetUserId = UnionResult.subjectUserId,
			currentUserId = UseLocalUserIdResult
		}))):andThen(function() --[[ Line: 539 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval), UnionResult (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = UseLocalizationResult.ConnectionRemoved,
				toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		end):catch(function() --[[ Line: 547 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
		end)
	end, {
		UseLocalizationResult,
		UseLocalUserIdResult,
		UseDispatchResult,
		UnionResult.subjectUserId,
		UnionResult.closeCentralOverlayThunk
	})
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 553 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), RecommendationContextType (upval), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), UseDispatchResult (copy), FriendsModule (upval), UseLocalUserIdResult (copy), ToastRoduxModule (upval), UseLocalizationResult (copy), config2 (copy)
		UseMemoResult(EventNames.RequestFriendship, { profileUserId = UnionResult.subjectUserId })
		local ContactId = UnionResult.contactId
		local ContactId1 = UnionResult.recommendationContext == RecommendationContextType.Contacts and ContactId;
		(if FFlagMigrateFriendshipStatusesRemainingActions then if ContactId1 then GetResult.RequestFriendship(ContactId, UnionResult.friendshipOriginSourceType, { isContact = true }) else GetResult.RequestFriendship(UnionResult.subjectUserId, UnionResult.friendshipOriginSourceType) else UseDispatchResult(if ContactId1 then FriendsModule.RequestFriendshipFromContactId.API({
			contactId = ContactId,
			currentUserId = UseLocalUserIdResult
		}) else FriendsModule.RequestFriendshipFromUserId.API({
			targetUserId = UnionResult.subjectUserId,
			currentUserId = UseLocalUserIdResult,
			friendshipOriginSourceType = UnionResult.friendshipOriginSourceType
		}))):andThen(function() --[[ Line: 576 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval), UnionResult (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = UseLocalizationResult.ConnectionRequestSent,
				toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		end):catch(function() --[[ Line: 584 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
		end)
	end, {
		UseLocalizationResult, UseLocalUserIdResult, UseDispatchResult,
		UnionResult.closeCentralOverlayThunk, UnionResult.subjectUserId,
		UnionResult.recommendationContext, UnionResult.contactId,
		UnionResult.friendshipOriginSourceType
	})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 600 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), UseDispatchResult (copy), FriendsModule (upval), UseLocalUserIdResult (copy), ToastRoduxModule (upval), UseLocalizationResult (copy), config2 (copy)
		UseMemoResult(EventNames.AcceptFriendRequest, { profileUserId = UnionResult.subjectUserId });
		(if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.AcceptFriendRequest(UnionResult.subjectUserId) else UseDispatchResult(FriendsModule.AcceptFriendRequestFromUserId.API({
			targetUserId = UnionResult.subjectUserId,
			currentUserId = UseLocalUserIdResult
		}))):andThen(function() --[[ Line: 610 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval), UnionResult (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = UseLocalizationResult.ConnectionAdded,
				toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		end):catch(function() --[[ Line: 618 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
		end)
	end, {
		UseLocalizationResult,
		UseLocalUserIdResult,
		UseDispatchResult,
		UnionResult.closeCentralOverlayThunk,
		UnionResult.subjectUserId
	})
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 623 ]]
		-- upvalues: UseMemoResult (copy), EventNames (upval), UnionResult (copy), FFlagMigrateFriendshipStatusesRemainingActions (upval), GetResult (upval), UseDispatchResult (copy), FriendsModule (upval), UseLocalUserIdResult (copy), ToastRoduxModule (upval), UseLocalizationResult (copy), config2 (copy)
		UseMemoResult(EventNames.IgnoreFriendRequest, { profileUserId = UnionResult.subjectUserId });
		(if FFlagMigrateFriendshipStatusesRemainingActions then GetResult.DeclineFriendRequest(UnionResult.subjectUserId) else UseDispatchResult(FriendsModule.DeclineFriendRequestFromUserId.API({
			targetUserId = UnionResult.subjectUserId,
			currentUserId = UseLocalUserIdResult
		}))):andThen(function() --[[ Line: 633 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), UseLocalizationResult (upval), UnionResult (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({
				isLocalized = true,
				toastMessage = UseLocalizationResult.FriendRequestIgnored,
				toastType = ToastRoduxModule.Enums.ToastType.SuccessConfirmation
			}))
			UseDispatchResult(UnionResult.closeCentralOverlayThunk())
		end):catch(function() --[[ Line: 641 ]]
			-- upvalues: UseDispatchResult (upval), ToastRoduxModule (upval), config2 (upval)
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage(config2))
		end)
	end, {
		UseLocalizationResult,
		UseLocalUserIdResult,
		UseDispatchResult,
		UnionResult.closeCentralOverlayThunk,
		UnionResult.subjectUserId
	})
	local UseSelectorResult1 = RoactRodux.useSelector(function(p2) --[[ Line: 646 ]]
		-- upvalues: FFlagUserBlockingApiPlayerContextMenuEnabledModule (upval), UnionResult (copy)
		return (if FFlagUserBlockingApiPlayerContextMenuEnabledModule then p2.PlayerContextualMenu.UserBlocking.isBlockedByMe else p2.PlayerContextualMenu.IsBlockedByMe)[UnionResult.subjectUserId] or false
	end)
	
	return ReactModule.createElement(PlayerContextualMenuComponentModule, {
		headerProps = ReactModule.useMemo(function() --[[ Line: 788 ]]
			-- upvalues: ContactName (ref), UseUserProfilesFetchResult (copy), UnionResult (copy), RecommendationContextType (upval), UsernameFromId (ref), PlatformNameFromId (ref), IsNotPlatformNameFromIdMatch (copy), PlayerContextualMenuVendorImagePath (upval), PresenceTextModule (ref), PresenceIconModule (ref), PresenceIconModule2 (ref), Join (copy), UseResult1 (copy), UseMemoResult1 (copy)
			return {
				displayNameItem = {
					icon = nil,
					labelText = ContactName,
					isLoading = UseUserProfilesFetchResult.loading
				},
				userNameItem = if UnionResult.recommendationContext == RecommendationContextType.Contacts then nil else {
					icon = nil,
					labelText = "@" .. UsernameFromId,
					isLoading = UseUserProfilesFetchResult.loading
				},
				vendorNameItem = if PlatformNameFromId == "" then nil else {
					labelText = PlatformNameFromId or "",
					icon = IsNotPlatformNameFromIdMatch and {
						Image = PlayerContextualMenuVendorImagePath,
						ImageRectOffset = Vector2.zero,
						ImageRectSize = Vector2.zero
					} or nil,
					isLoading = UseUserProfilesFetchResult.loading
				},
				contextText = PresenceTextModule,
				contextIcon = PresenceIconModule,
				contextIconColor = if PresenceIconModule2 then PresenceIconModule2.Color3 else nil,
				contextIconTransparency = if PresenceIconModule2 then PresenceIconModule2.Transparency else nil,
				joinEventText = Join,
				joinEventOnActivated = UseResult1,
				renderJoinEventButton = UseMemoResult1
			}
		end, {
			UseUserProfilesFetchResult, ContactName, UsernameFromId, PlatformNameFromId,
			IsNotPlatformNameFromIdMatch, PresenceIconModule, PresenceTextModule,
			PresenceIconModule2, UseMemoResult1, Join, UseResult1,
			UnionResult.recommendationContext
		}),
		buttonProps = ReactModule.useMemo(function() --[[ Line: 655 ]]
			-- upvalues: Images (upval), UseLocalizationResult (copy), UseResult2 (copy), PlayerContextualMenuVendorImagePath (upval), UseResult3 (copy), UseResult4 (copy), UseSelectorResult (ref), UseResult5 (copy), UseResult6 (copy), UseResult7 (copy), NO_OPT_CALLBACK (upval), UseResult8 (copy), UseResult9 (copy), UseSelectorResult1 (copy), UnionResult (copy), GetFFlagAppChatPCMFixBlockingFunction (upval), CryoModule (upval), PlatformFriendsService (upval), PlatformProfileIdFromId (ref), DashModule (upval)
			local config = {
				icon = Images["icons/actions/feedback"],
				text = UseLocalizationResult.Report,
				onActivated = UseResult2
			}
			local config1 = {
				icon = PlayerContextualMenuVendorImagePath,
				text = UseLocalizationResult.ViewPlatformProfile,
				onActivated = UseResult3
			}
			local config2 = {
				icon = Images["icons/actions/block"],
				text = UseLocalizationResult.Block,
				onActivated = UseResult4,
				disabled = UseSelectorResult
			}
			local config3 = {
				icon = Images["icons/actions/block"],
				text = UseLocalizationResult.Unblock,
				onActivated = UseResult5
			}
			local config4 = {
				icon = Images["icons/actions/friends/friendRemove"],
				text = UseLocalizationResult.RemoveConnection,
				onActivated = UseResult6
			}
			local config5 = {
				icon = Images["icons/actions/friends/friendAdd"],
				text = UseLocalizationResult.AddConnection,
				onActivated = UseResult7
			}
			local config6 = {
				icon = Images["icons/actions/friends/friendpending"],
				text = UseLocalizationResult.PendingRequest,
				onActivated = NO_OPT_CALLBACK
			}
			local config7 = {
				icon = Images["icons/actions/friends/friendpending"],
				text = UseLocalizationResult.AcceptConnection,
				onActivated = UseResult8
			}
			local config8 = {
				icon = Images["icons/actions/reject"],
				text = UseLocalizationResult.IgnoreConnectionRequest,
				onActivated = UseResult9
			}
			
			local function makeCtas() --[[ Line: 711 ]]
				-- upvalues: UseSelectorResult1 (upval), config3 (copy), config2 (copy), UnionResult (upval), config (copy), GetFFlagAppChatPCMFixBlockingFunction (upval), config4 (copy), config5 (copy), config6 (copy), config7 (copy), config8 (copy), CryoModule (upval)
				local Config = if UseSelectorResult1 then config3 else config2
				local List = if UnionResult.robloxFriendshipStatus == Enum.FriendStatus.Friend then {
					config,
					if GetFFlagAppChatPCMFixBlockingFunction() then Config else config2,
					config4
				} elseif UnionResult.robloxFriendshipStatus == Enum.FriendStatus.NotFriend then if UnionResult.contactId then { config5 } else { config5, config, Config } elseif UnionResult.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestSent then { config6, config, Config } elseif UnionResult.robloxFriendshipStatus == Enum.FriendStatus.FriendRequestReceived then { config7, config8, config, Config } else { config, Config }
				
				if UnionResult.additionalButtons then
					List = CryoModule.List.join(List, UnionResult.additionalButtons)
				end
				return List
			end
			
			return if PlatformFriendsService and PlatformFriendsService:IsProfileEnabled() and PlatformProfileIdFromId and PlatformProfileIdFromId ~= "" then DashModule.append({ config1 }, (makeCtas())) else makeCtas()
		end, CryoModule.Dictionary.union(if PlatformFriendsService then {
			UnionResult.robloxFriendshipStatus,
			UseSelectorResult1,
			PlatformProfileIdFromId,
			UnionResult.contactId,
			UnionResult.additionalButtons
		} else {
			UnionResult.robloxFriendshipStatus,
			UseSelectorResult1,
			UnionResult.contactId,
			UnionResult.additionalButtons
		}, if GetFFlagAppChatPCMFixBlockingFunction() then { UseSelectorResult } else {})),
		width = UnionResult.width
	})
end