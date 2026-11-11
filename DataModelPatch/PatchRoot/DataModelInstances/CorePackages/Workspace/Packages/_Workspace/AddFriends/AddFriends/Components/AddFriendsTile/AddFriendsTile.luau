local AddFriends = script:FindFirstAncestor("AddFriends")
local Parent = AddFriends.Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local _ = require(Parent.PlayerContextualMenu)
local ToastRoduxModule = require(Parent.ToastRodux)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local RoactUtilsModule = require(Parent.RoactUtils)
local SocialCommonModule = require(Parent.SocialCommon)
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local SocialStopwatchModule = require(Parent.SocialStopwatch)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserProfilesModule = require(Parent.UserProfiles)
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local View = require(Parent.Foundation).View
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local FriendshipOriginSourceType = require(Parent.FriendsNetworking).Enums.FriendshipOriginSourceType
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local PlayerTile = UIBloxModule.App.Tile.PlayerTile
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseFocusGuiObjectFunction = require(Parent.ReactFocusNavigation).useFocusGuiObject
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local ConvertUserPresenceTypeToStringFunction = SocialCommonModule.Utils.convertUserPresenceTypeToString
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Images = UIBloxModule.App.ImageSet.Images
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AddFriendsStateModule = require(Parent.AddFriendsState)
local AddFriendsSelectorFunction = AddFriendsStateModule.AddFriendsSelector
local RecommendationContextType = AddFriendsStateModule.RoduxFriends.Enums.RecommendationContextType
local ConstantsModule = require(AddFriends.Common.Constants)
local PresenceType = AddFriendsStateModule.RoduxPresence.Enums.PresenceType
local FriendsNetworking = AddFriendsStateModule.Networking.FriendsNetworking
local UseFireAnalyticsEventModule = require(AddFriends.Analytics.useFireAnalyticsEvent)
local AnalyticsModule = require(AddFriends.Analytics)
local EventNames = AnalyticsModule.EventNames
local Namespaces = AnalyticsModule.Namespaces
local EntityTypes = SocialLuaAnalyticsModule.Analytics.Enums.EntityTypes
local GetSessionIdByKeyFunction = AddFriendsStateModule.RoduxAnalytics.Selectors.getSessionIdByKey
local GetFooterRelevanceInfoModule = require(script.Parent.getFooterRelevanceInfo)
local GetOverlayButtonsModule = require(script.Parent.getOverlayButtons)
local _ = require(script.Parent.getFriendRequestHandlersExtraProps)
local UserTileEventHandlers = require(Parent.UserTile).UserTileEventHandlers
local GetFFlagLuaAppEnableOpenTypeSupportFunction = require(Parent.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport
local UseLastInputModeFunction = require(Parent.FocusNavigationUtils).useLastInputMode
local UserListModule = require(Parent.UserList)
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local PresenceType1 = require(Parent.DataHydration).Presence.PresenceEnums.PresenceType
local FFlagPPVEnabledOnConsole = require(Parent.SharedFlags).FFlagPPVEnabledOnConsole
local FFlagAddFriendsPYMKPresence = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresence
local FFlagAddFriendsPYMKPresenceAnalytics = require(Parent.SharedFlags).FFlagAddFriendsPYMKPresenceAnalytics
local FFlagAddFriendsRenderTileRefactor = require(Parent.SharedFlags).FFlagAddFriendsRenderTileRefactor
local FFlagAddFriendsTileLoadFromHomeCarouselAnalytics = require(Parent.SharedFlags).FFlagAddFriendsTileLoadFromHomeCarouselAnalytics
local FFlagAddFriendsUserListEnabled = require(Parent.SharedFlags).FFlagAddFriendsUserListEnabled
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename
local FFlagFriendsPageViewBtnWidth = require(Parent.SharedFlags).FFlagFriendsPageViewBtnWidth
local FFlagAddFriendsPresenceStoreMigration = require(Parent.SharedFlags).FFlagAddFriendsPresenceStoreMigration

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseFocusGuiObjectFunction (copy), UseLastInputModeFunction (copy), UseStyleFunction (copy), FFlagPPVEnabledOnConsole (copy), UsePreferredInputFunction (copy), ReactModule (copy), ResponsiveModule (copy), UseImpressionsTaggerFunction (copy), FFlagAddFriendsRenderTileRefactor (copy), UserListModule (copy), RecommendationContextType (copy), UseLocalUserIdFunction (copy), UseSelectorFunction (copy), AddFriendsSelectorFunction (copy), FFlagAddFriendsPresenceStoreMigration (copy), UseGetPresenceByUserIdFunction (copy), FFlagAddFriendsPYMKPresence (copy), GetSessionIdByKeyFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), GetFooterRelevanceInfoModule (copy), UseFireAnalyticsEventModule (copy), EntityTypes (copy), Namespaces (copy), FFlagAddFriendsPYMKPresenceAnalytics (copy), FFlagAddFriendsTileLoadFromHomeCarouselAnalytics (copy), SocialStopwatchModule (copy), EventNames (copy), ToastRoduxModule (copy), FriendsNetworking (copy), Images (copy), FriendshipOriginSourceType (copy), UseNavigationFunction (copy), AppPage (copy), Contexts (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), ConvertUserPresenceTypeToStringFunction (copy), FFlagAddFriendsUserListEnabled (copy), UserProfilesModule (copy), PresenceType1 (copy), SocialCommonModule (copy), PresenceType (copy), GetOverlayButtonsModule (copy), View (copy), FFlagFriendsPageViewBtnWidth (copy), UserTileEventHandlers (copy), PlayerTile (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), OpenTypeSupport (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseFocusGuiObjectResult = UseFocusGuiObjectFunction()
	local UseLastInputModeResult = UseLastInputModeFunction()
	local UseStyleResult = UseStyleFunction()
	local UsePreferredInputResult = if FFlagPPVEnabledOnConsole then nil else UsePreferredInputFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseLastInputModeResult (copy), UseRefResult (copy), UseFocusGuiObjectResult (copy)
		if p1.selected and UseLastInputModeResult == "Focus" then
			local Current = UseRefResult.current
			
			if Current then
				UseFocusGuiObjectResult(Current)
			end
		end
	end, {
		p1.selected,
		UseLastInputModeResult,
		UseRefResult,
		UseFocusGuiObjectResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseResult (copy)
		UseResult()
	end, {})
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, p1.position)
	local IsTypeMatch: boolean = if FFlagAddFriendsRenderTileRefactor then p1.user.type == UserListModule.Enums.EntityType.Contact else p1.user.contextType and p1.user.contextType == RecommendationContextType.Contacts
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Friends.friendshipStatus.%s", p1.user.id) or nil
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return (AddFriendsSelectorFunction(p2, "RequestsFromOriginSourceType") or {})[p1.user.id]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		local FriendsRequestsSourceUniverseId = (AddFriendsSelectorFunction(p2, "Friends.requests.sourceUniverseIds") or {})[p1.user.id]
		
		return if FriendsRequestsSourceUniverseId == nil or FriendsRequestsSourceUniverseId == 0 then nil else (AddFriendsSelectorFunction(p2, "Games.byGameId.%s", (tostring(FriendsRequestsSourceUniverseId))) or {}).name
	end)
	local UseSelectorResult3 = if FFlagAddFriendsRenderTileRefactor then UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Friends.requests.mutualFriends.%s", p1.user.id) or {}
	end) else nil
	local UseSelectorResult4 = if FFlagAddFriendsRenderTileRefactor then UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Friends.contactNamesByUserId.%s", p1.user.id)
	end) else nil
	local UseSelectorResult5 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		local IsUserFollowing = AddFriendsSelectorFunction(p2, "IsUserFollowing") or {}
		
		return IsUserFollowing[p1.user.id] and IsUserFollowing[p1.user.id].isFollowing or false
	end)
	local UseSelectorResult6 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		local IsUserFollowing = AddFriendsSelectorFunction(p2, "IsUserFollowing") or {}
		
		return IsUserFollowing[p1.user.id] and IsUserFollowing[p1.user.id].isFollowed or false
	end)
	local UseSelectorResult7 = UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Friends.recommendations.hasIncomingFriendRequest.%s", p1.user.id) or false
	end)
	local UseSelectorResult8 = if FFlagAddFriendsRenderTileRefactor then UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), UseLocalUserIdResult (copy), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Friends.recommendations.byUserId.%s.%s", UseLocalUserIdResult, p1.user.id) or {}
	end) else nil
	local ContextType = if FFlagAddFriendsRenderTileRefactor then UseSelectorResult8.contextType else nil
	local MutualFriendsCount = if FFlagAddFriendsRenderTileRefactor then UseSelectorResult8.mutualFriendsCount else nil
	local Rank = if FFlagAddFriendsRenderTileRefactor then UseSelectorResult8.rank else nil
	local UseGetPresenceByUserIdResult = if FFlagAddFriendsPresenceStoreMigration then UseGetPresenceByUserIdFunction(if IsTypeMatch then nil else p1.user.id) elseif FFlagAddFriendsPYMKPresence then UseSelectorFunction(function(p2)
		-- upvalues: AddFriendsSelectorFunction (upval), p1 (copy)
		return AddFriendsSelectorFunction(p2, "Presence.byUserId.%s", p1.user.id) or nil
	end) else nil
	local UseSelectorResult9 = UseSelectorFunction(function(p2)
		-- upvalues: GetSessionIdByKeyFunction (upval), ConstantsModule (upval)
		return GetSessionIdByKeyFunction(p2)(ConstantsModule.RECOMMENDATION_SESSION_ID_KEY)
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		youAreFollowingText = "Feature.Friends.Label.YouAreFollowing",
		followsYouText = "Feature.Friends.Label.FollowsYou",
		fromContactsText = "Feature.Friends.Description.FoundFromContactImporter",
		foundThroughQRCode = "Feature.Profile.Label.QRCodeFriendRequest",
		connectionRequests = "Feature.Friends.Label.ConnectionRequest",
		frequents = "Feature.Friends.Label.Frequent",
		fromContacts = "Feature.Friends.Description.FromContacts",
		mutualFriendsText = if FFlagAddFriendsRenderTileRefactor then nil elseif p1.user.mutualFriends and #p1.user.mutualFriends == 1 then "Feature.Friends.Label.SingularMutualFriend" else "Feature.Friends.Label.MutualFriends",
		sentFromWithContextText = {
			"Feature.Friends.Label.SentFromWithContext",
			gameName = UseSelectorResult2 or ""
		},
		contactNameText = if if FFlagAddFriendsRenderTileRefactor then UseSelectorResult4 else p1.user.contactName then {
			"Feature.Friends.Description.FromContactsV2",
			contactName = if FFlagAddFriendsRenderTileRefactor then UseSelectorResult4 else p1.user.contactName
		} else nil,
		singularMutualConnection = if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendTitle" else "Feature.Friends.Label.MutualConnection",
		mutualConnections = {
			if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
			numConnections = if FFlagAddFriendsRenderTileRefactor then MutualFriendsCount or UseSelectorResult3 and #UseSelectorResult3 else p1.user.mutualFriendsCount or p1.user.mutualFriends and #p1.user.mutualFriends
		}
	})
	local UseMemoResult, UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: GetFooterRelevanceInfoModule (upval), FFlagAddFriendsRenderTileRefactor (upval), UseSelectorResult3 (copy), p1 (copy), UseSelectorResult6 (copy), UseSelectorResult5 (copy), UseSelectorResult2 (copy), UseSelectorResult1 (copy), ContextType (copy), MutualFriendsCount (copy), UseSelectorResult7 (copy), UseStyleResult (copy), UseLocalizationResult (copy)
		return GetFooterRelevanceInfoModule({
			mutualFriends = if FFlagAddFriendsRenderTileRefactor then UseSelectorResult3 else p1.user.mutualFriends,
			isUserFollowingMe = UseSelectorResult6,
			amIFollowingUser = UseSelectorResult5,
			sentFromExperienceName = UseSelectorResult2,
			isFriendRequest = p1.isFriendRequest or false,
			isRecommendation = p1.isRecommendation,
			userPresenceType = if FFlagAddFriendsRenderTileRefactor then nil else p1.user.userPresenceType,
			lastLocation = if FFlagAddFriendsRenderTileRefactor then nil else p1.user.lastLocation,
			originSourceType = UseSelectorResult1,
			contextType = if FFlagAddFriendsRenderTileRefactor then ContextType else p1.user.contextType,
			mutualFriendsCount = if FFlagAddFriendsRenderTileRefactor then MutualFriendsCount else p1.user.mutualFriendsCount,
			hasIncomingFriendRequest = UseSelectorResult7
		}, UseStyleResult, UseLocalizationResult)
	end, {
		p1.user, UseSelectorResult6, UseSelectorResult5, UseSelectorResult2,
		p1.isFriendRequest, p1.isRecommendation, UseSelectorResult1,
		UseSelectorResult7,
		if FFlagAddFriendsRenderTileRefactor then MutualFriendsCount else nil,
		if FFlagAddFriendsRenderTileRefactor then UseSelectorResult3 else nil,
		if FFlagAddFriendsRenderTileRefactor then ContextType else nil, UseStyleResult,
		UseLocalizationResult
	})
	local UseFireAnalyticsEventModuleResult = UseFireAnalyticsEventModule({
		targetUserId = p1.user.id,
		absolutePosition = p1.position,
		rank = if FFlagAddFriendsRenderTileRefactor then Rank else p1.user.rank,
		contextType = UseMemoResult2,
		entityType = if IsTypeMatch then EntityTypes.Contact else nil,
		namespace = if p1.isFriendRequest then Namespaces.FriendRequests else Namespaces.PYMK,
		friendStatus = UseSelectorResult,
		presence = if FFlagAddFriendsPYMKPresenceAnalytics then (UseGetPresenceByUserIdResult or {}).userPresenceType else nil
	})
	
	if FFlagAddFriendsTileLoadFromHomeCarouselAnalytics then
		ReactModule.useEffect(function()
			-- upvalues: SocialStopwatchModule (upval), UseFireAnalyticsEventModuleResult (copy), EventNames (upval)
			local StopResult = SocialStopwatchModule.Stopwatch.stop(SocialStopwatchModule.Events.AFPUserTileLoadFromHomeCarousel)
			
			if StopResult then
				UseFireAnalyticsEventModuleResult(EventNames.AFPUserTileLoadFromHomeCarousel, {
					loadingTime = StopResult.timeElapsed,
					statValue = StopResult.timeElapsed
				})
			end
		end, {})
	end
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), ToastRoduxModule (upval)
		if p2 then
			UseDispatchResult(ToastRoduxModule.Actions.SetCurrentToastMessage({ toastMessage = p2.toastTitle, toastIcon = p2.iconImage }))
			
			return
		end
	end, { UseDispatchResult })
	local UseResult2 = ReactModule.useCallback(function(Promise, p2)
		-- upvalues: UseResult1 (copy)
		return Promise:andThen(function()
			-- upvalues: UseResult1 (upval), p2 (copy)
			UseResult1(p2)
		end):catch(function()
			-- upvalues: UseResult1 (upval)
			UseResult1({
				toastTitle = "Feature.Toast.NetworkingError.SomethingIsWrong"
			})
		end)
	end, { UseResult1 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNames (upval), UseResult2 (copy), UseDispatchResult (copy), FriendsNetworking (upval), UseLocalUserIdResult (copy), p1 (copy), FFlagConnectionsToFriendsRename (upval), Images (upval)
		UseFireAnalyticsEventModuleResult(EventNames.AcceptFriendshipBtnClick)
		
		return UseResult2(UseDispatchResult(FriendsNetworking.AcceptFriendRequestFromUserId.API({
			currentUserId = UseLocalUserIdResult,
			targetUserId = p1.user.id
		})), {
			toastTitle = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded",
			iconImage = Images["icons/actions/friends/friendAdd"]
		})
	end, {
		p1.user.id,
		UseLocalUserIdResult,
		UseDispatchResult,
		UseResult2,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNames (upval), UseResult2 (copy), UseDispatchResult (copy), FriendsNetworking (upval), UseLocalUserIdResult (copy), p1 (copy), Images (upval)
		UseFireAnalyticsEventModuleResult(EventNames.DeclineFriendshipBtnClick)
		
		return UseResult2(UseDispatchResult(FriendsNetworking.DeclineFriendRequestFromUserId.API({
			currentUserId = UseLocalUserIdResult,
			targetUserId = p1.user.id
		})), {
			toastTitle = "Feature.AddFriends.Action.RequestIgnored",
			iconImage = Images["icons/actions/reject"]
		})
	end, {
		p1.user.id,
		UseLocalUserIdResult,
		UseDispatchResult,
		UseResult2,
		UseFireAnalyticsEventModuleResult
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNames (upval), IsTypeMatch (copy), FriendsNetworking (upval), UseLocalUserIdResult (copy), p1 (copy), FriendshipOriginSourceType (upval), UseResult2 (copy), UseDispatchResult (copy), FFlagConnectionsToFriendsRename (upval), Images (upval)
		UseFireAnalyticsEventModuleResult(EventNames.RequestFriendshipBtnClick)
		
		return UseResult2(UseDispatchResult(if IsTypeMatch then FriendsNetworking.RequestFriendshipFromContactId.API({
			currentUserId = UseLocalUserIdResult,
			contactId = p1.user.id
		}) else FriendsNetworking.RequestFriendshipFromUserId.API({
			currentUserId = UseLocalUserIdResult,
			targetUserId = p1.user.id,
			friendshipOriginSourceType = if p1.isRecommendation then FriendshipOriginSourceType.FriendRecommendations.rawValue() else nil
		})), {
			toastTitle = if FFlagConnectionsToFriendsRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent",
			iconImage = Images["icons/actions/friends/friendAdd"]
		})
	end, {
		IsTypeMatch, p1.isRecommendation, p1.user.id, UseLocalUserIdResult,
		UseDispatchResult, UseResult2, UseFireAnalyticsEventModuleResult
	})
	local UseNavigationResult = UseNavigationFunction()
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseFireAnalyticsEventModuleResult (copy), EventNames (upval), UseNavigationResult (copy), AppPage (upval), p1 (copy), IsTypeMatch (copy), UseSelectorResult9 (copy), FFlagAddFriendsRenderTileRefactor (upval), Rank (copy), UseSelectorResult (copy), ConstantsModule (upval), Contexts (upval), UseMemoResult2 (copy), UseMemoResult (copy)
		UseFireAnalyticsEventModuleResult(EventNames.PlayerTileClick)
		UseNavigationResult.navigate(AppPage.ProfilePlatform, {
			detail = p1.user.id,
			extraProps = {
				profileType = if IsTypeMatch then "Contact" else nil,
				recommendationSessionId = UseSelectorResult9,
				absolutePosition = p1.position,
				rank = if FFlagAddFriendsRenderTileRefactor then Rank else p1.user.rank,
				isRecommendation = p1.isRecommendation,
				isContact = IsTypeMatch,
				contactProps = if IsTypeMatch then {
					contactId = p1.user.entityId,
					contactname = p1.user.entityDisplayName,
					avatarImageUrl = if FFlagAddFriendsRenderTileRefactor then p1.user.thumbnailEntities and p1.user.thumbnailEntities.avatarImageUrl else p1.user.thumbnailEntities.avatarImageUrl
				} else nil,
				friendStatus = UseSelectorResult,
				source = if p1.isRecommendation then ConstantsModule.AddFriendsPYMKSourceName else Contexts.AddFriends,
				contextualInfoType = UseMemoResult2,
				contextualInfoDisplay = if p1.isRecommendation then UseMemoResult else nil
			}
		})
	end, {
		p1.user, p1.position, p1.isRecommendation, UseSelectorResult,
		UseSelectorResult9, IsTypeMatch, UseNavigationResult, UseMemoResult2,
		UseMemoResult, if FFlagAddFriendsRenderTileRefactor then Rank else nil
	})
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseSelectorResult (copy), UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), ConvertUserPresenceTypeToStringFunction (upval), FriendshipOriginSourceType (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.PlayerContextualMenu, {
			subjectUserId = p1.user.id,
			contactId = p1.user.entityId,
			contactName = p1.user.entityDisplayName,
			recommendationContext = p1.user.contextType,
			mutualFriendsCount = p1.user.mutualFriendsCount,
			robloxFriendshipStatus = if p1.isRecommendation then UseSelectorResult or Enum.FriendStatus.NotFriend else Enum.FriendStatus.FriendRequestReceived,
			subjectPresence = {
				locationString = p1.user.lastLocation,
				locationPlaceId = p1.user.placeId,
				locationRootPlaceId = p1.user.rootPlaceId,
				locationUniverseId = p1.user.universeId,
				status = ConvertUserPresenceTypeToStringFunction(p1.user.userPresenceType)
			},
			friendshipOriginSourceType = if p1.isRecommendation then FriendshipOriginSourceType.FriendRecommendations.rawValue() else nil
		}))
	end, {
		p1.isRecommendation,
		UseSelectorResult,
		p1.user,
		UseDispatchResult
	})
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: FFlagPPVEnabledOnConsole (upval), UsePreferredInputResult (ref), ResponsiveModule (upval), UseResult7 (copy), UseResult6 (copy)
		if FFlagPPVEnabledOnConsole or UsePreferredInputResult ~= ResponsiveModule.Input.Directional then
			UseResult6()
			
			return
		else
			return UseResult7()
		end
	end, {
		if FFlagPPVEnabledOnConsole then nil else UsePreferredInputResult,
		if FFlagPPVEnabledOnConsole then nil else UseResult7,
		UseResult6
	})
	local EntityDisplayName = nil
	local Text: string? = nil
	local Formatted = nil
	
	if not FFlagAddFriendsUserListEnabled then
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.user.id },
			query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds,
			skip = IsTypeMatch
		})
		
		if IsTypeMatch then
			EntityDisplayName = p1.user.entityDisplayName
			Text = nil
			Formatted = if FFlagAddFriendsRenderTileRefactor then p1.user.thumbnailEntities and p1.user.thumbnailEntities.avatarImageUrl else p1.user.thumbnailEntities.avatarImageUrl
		else
			local CombinedNameFromId = ""
			local UsernameFromId = ""
			
			if UseUserProfilesFetchResult and UseUserProfilesFetchResult.data then
				CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.user.id) or ""
				UsernameFromId = UserProfilesModule.Selectors.getUsernameFromId(UseUserProfilesFetchResult.data, p1.user.id) or ""
			end
			EntityDisplayName = CombinedNameFromId
			Text = if FFlagAddFriendsRenderTileRefactor then "@" .. UsernameFromId else "@" .. (p1.user.externalAppDisplayName or UsernameFromId)
			Formatted = string.format("rbxthumb://type=Avatar&id=%s&w=720&h=720", (tostring(p1.user.id)))
		end
	end
	local UseMemoResult1 = nil
	local UseMemoResult3 = nil
	
	if FFlagAddFriendsPYMKPresence then
		if FFlagAddFriendsUserListEnabled then
			UseMemoResult3 = ReactModule.useMemo(function()
				-- upvalues: FFlagAddFriendsPresenceStoreMigration (upval), UseGetPresenceByUserIdResult (copy), PresenceType1 (upval), SocialCommonModule (upval)
				return if FFlagAddFriendsPresenceStoreMigration then UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType or PresenceType1.Offline elseif UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType then string.gsub(tostring(UseGetPresenceByUserIdResult.userPresenceType), "PresenceType%.", "") else SocialCommonModule.Enums.PresenceTypes.Offline
			end, { UseGetPresenceByUserIdResult })
		else
			local UseMemoResult5 = ReactModule.useMemo(function(): boolean
				-- upvalues: UseGetPresenceByUserIdResult (copy), FFlagAddFriendsPresenceStoreMigration (upval), PresenceType1 (upval), PresenceType (upval)
				local UserPresenceType = UseGetPresenceByUserIdResult and UseGetPresenceByUserIdResult.userPresenceType or nil
				
				return if FFlagAddFriendsPresenceStoreMigration then UserPresenceType == PresenceType1.Online or (UserPresenceType == PresenceType1.InStudio or UserPresenceType == PresenceType1.InGame) else UserPresenceType == PresenceType.Online or (UserPresenceType == PresenceType.InStudio or UserPresenceType == PresenceType.InGame)
			end, { UseGetPresenceByUserIdResult })
			local Color = UseStyleResult.Theme.OnlineStatus.Color
			UseMemoResult1 = ReactModule.useMemo(function()
				-- upvalues: Color (copy), UseMemoResult5 (copy), EntityDisplayName (ref)
				local Message: string = `<font color="rgb({math.round(Color.R * 255)},{math.round(Color.G * 255)},{math.round(Color.B * 255)})">● </font>`
				
				return if UseMemoResult5 then Message .. EntityDisplayName else EntityDisplayName
			end, { EntityDisplayName, UseMemoResult5, Color })
		end
	end
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: GetOverlayButtonsModule (upval), p1 (copy), UseSelectorResult7 (copy), UseSelectorResult (copy), UseResult5 (copy), UseResult3 (copy), UseResult4 (copy), IsUsePreferredInputResultMatch (copy)
		return GetOverlayButtonsModule({
			isFriendRequest = p1.isFriendRequest or false,
			hasIncomingFriendRequest = UseSelectorResult7,
			friendStatus = UseSelectorResult,
			handleRequestFriendship = UseResult5,
			handleAcceptFriendRequest = UseResult3,
			handleDeclineFriendRequest = UseResult4,
			shouldAddFocusEventName = IsUsePreferredInputResultMatch
		})
	end, {
		p1.isFriendRequest, UseSelectorResult, UseResult5, UseResult3, UseResult4,
		UseSelectorResult7, IsUsePreferredInputResultMatch
	})
	
	if FFlagAddFriendsUserListEnabled then
		local UseMemoResultEntry = UseMemoResult4 and UseMemoResult4[#UseMemoResult4] or nil
		local UseMemoResultEntry1 = UseMemoResult4 and UseMemoResult4[#UseMemoResult4 - 1] or nil
		
		return ReactModule.createElement(View, { tag = "size-full-0 auto-y", ref = UseRefResult }, {
			UserRow = p1.createRow({
				onRowActivated = UseResult6,
				primaryCta = UseMemoResultEntry and {
					type = UseMemoResultEntry.type,
					icon = UseMemoResultEntry.icon,
					isDisabled = UseMemoResultEntry.isDisabled,
					onActivated = UseMemoResultEntry.onActivated,
					minWidth = if FFlagFriendsPageViewBtnWidth then ConstantsModule.PRIMARY_CTA_BUTTON_MIN_WIDTH else nil,
					maxWidth = if FFlagFriendsPageViewBtnWidth then ConstantsModule.PRIMARY_CTA_BUTTON_MAX_WIDTH else nil
				},
				secondaryCta = UseMemoResultEntry1 and {
					type = UseMemoResultEntry1.type,
					icon = UseMemoResultEntry1.icon,
					isDisabled = UseMemoResultEntry1.isDisabled,
					onActivated = UseMemoResultEntry1.onActivated
				},
				contextualInfo = UseMemoResult and { text = UseMemoResult.text, icon = UseMemoResult.icon },
				presence = UseMemoResult3
			}),
			UserTileEventHandlers = if IsUsePreferredInputResultMatch then ReactModule.createElement(UserTileEventHandlers, {
				buttons = UseMemoResult4,
				onTileActivated = UseResult8,
				tileRef = UseRefResult
			}) else nil
		})
	else
		return (ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.fromScale(1, 0.5),
			Size = UDim2.new(0, p1.size.X, 0, p1.size.Y),
			LayoutOrder = p1.layoutOrder
		}, {
			PlayerTile = ReactModule.createElement(PlayerTile, {
				Selectable = true,
				buttonRef = UseRefResult,
				thumbnail = Formatted,
				title = if FFlagAddFriendsPYMKPresence then UseMemoResult1 else EntityDisplayName,
				tileSize = UDim2.new(0, p1.size.X, 0, p1.size.Y),
				subtitle = Text,
				buttons = if IsUsePreferredInputResultMatch then nil else UseMemoResult4,
				relevancyInfo = UseMemoResult,
				onActivated = UseResult8,
				openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil
			}),
			UserTileEventHandlers = if IsUsePreferredInputResultMatch then ReactModule.createElement(UserTileEventHandlers, {
				buttons = UseMemoResult4,
				onTileActivated = UseResult8,
				tileRef = UseRefResult
			}) else nil
		}))
	end
end