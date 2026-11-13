local IXPService = game:GetService("IXPService")
local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local GameJoinCardModule = require(Parent.GameJoinCard)
local PlayerContextualMenuModule = require(Parent.PlayerContextualMenu)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local DataStatus = require(Parent.DataHydration).DataStatus
local UserProfilesModule = require(Parent.UserProfiles)
local Enums = require(Parent.FriendsNetworking).Enums
local UseGetPresenceByUserIdFunction = require(Parent.FriendsCommon).Hooks.useGetPresenceByUserId
local FFlagSocialCarouselUseProfileStore = require(Parent.SharedFlags).FFlagSocialCarouselUseProfileStore
local FFlagSocialCarouselInGameTitleMarquee = require(Parent.SharedFlags).FFlagSocialCarouselInGameTitleMarquee
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
local FFlagMobileGameJoinCardVideo = require(Parent.SharedFlags).FFlagMobileGameJoinCardVideo
local FFlagSocialCarouselBuildPresence = require(Parent.SharedFlags).FFlagSocialCarouselBuildPresence
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = UserProfilesModule.Stores.UserProfileStore.get()
local PresenceTypes = require(Parent.SocialCommon).Enums.PresenceTypes
local Enums1 = require(Parent.SocialLuaAnalytics).Analytics.Enums
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseDeviceTypeFunction = require(Parent.RobloxAppHooks).useDeviceType
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local View = FoundationModule.View
local AppPage = RobloxAppEnumsModule.AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Tile = require(SocialCarousel.Common.Enums).Tile
local UserTileModule = require(script.Parent.UserTile)
local UserTileEventHandlers = require(Parent.UserTile).UserTileEventHandlers
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local UseBuildCardModule = require(script.Parent.useBuildCard)
local DesktopGameJoinCardContainer = GameJoinCardModule.DesktopGameJoinCardContainer
local UseGameJoinCardNavigationFunction = GameJoinCardModule.useGameJoinCardNavigation
local GameJoinCardTTI = GameJoinCardModule.Telemetry.GameJoinCardTTI
local SocialCarouselVendorImagePath = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local FFlagEnableSplitPane = require(Parent.SharedFlags).FFlagEnableSplitPane
local FFlagSocialCarouselEnableUserSeenEventsModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local FFlagSocialCarouselUseConsolePolicyForCtaModule = require(SocialCarousel.Flags.FFlagSocialCarouselUseConsolePolicyForCta)
local FFlagSocialCarouselFixGameJoinCardDismissModule = require(SocialCarousel.Flags.FFlagSocialCarouselFixGameJoinCardDismiss)
local FFlagSocialCarouselShowPlusBadgeModule = require(SocialCarousel.Flags.FFlagSocialCarouselShowPlusBadge)
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagConsoleOpenMobileGameJoinCard = require(Parent.SharedFlags).FFlagConsoleOpenMobileGameJoinCard
local FFlagConsoleOpenGameJoinCard = require(Parent.SharedFlags).FFlagConsoleOpenGameJoinCard
local FFlagShowRequestsInCarouselForAllUsers = require(Parent.SharedFlags).FFlagShowRequestsInCarouselForAllUsers
local FFlagMobileGameJoinCardTTITracking = require(Parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local FFlagMobileGameJoinCardGamepadSupport = require(Parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local FFlagDesktopGameJoinCardGamepadSupport = require(Parent.SharedFlags).FFlagDesktopGameJoinCardGamepadSupport
local EnableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local SocialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local function v50(Item)
	-- upvalues: FFlagShowRequestsInCarouselForAllUsers (copy), Tile (copy)
	return if FFlagShowRequestsInCarouselForAllUsers and Item.tileType == Tile.FriendRequest then Enum.FriendStatus.FriendRequestReceived elseif Item.tileType == Tile.Recommendation then if Item.isFriendWithUser then Enum.FriendStatus.Friend elseif Item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif Item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

local function _(p1, Failed): boolean
	-- upvalues: DataStatus (copy)
	return p1 ~= nil or (Failed == DataStatus.Ready or Failed == DataStatus.Failed)
end

local _ = function(Tbl, p1, Presence)
	if p1 and Presence then
		local Copy = table.clone(Tbl)
		Copy.presence = Presence
		
		return Copy
	else
		return Tbl
	end
end

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagMobileGameJoinCardGamepadSupport (copy), FFlagDesktopGameJoinCardGamepadSupport (copy), UseDeviceTypeFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagSocialCarouselUseConsolePolicyForCtaModule (copy), UseAppPolicyFunction (copy), RobloxAppEnumsModule (copy), FFlagEnableMobileGameJoinCard (copy), FFlagConsoleOpenMobileGameJoinCard (copy), UseSocialCarouselContextModule (copy), UseSocialCarouselAnalyticsModule (copy), UseLocalizationFunction (copy), FFlagShowRequestsInCarouselForAllUsers (copy), Tile (copy), UseGetPresenceByUserIdFunction (copy), DataStatus (copy), PresenceTypes (copy), FFlagSocialCarouselUseProfileStore (copy), GetResult (copy), FFlagUserProfilePlatformProfile (copy), SignalsModule (copy), SignalsReactModule (copy), UserProfilesModule (copy), FFlagSocialCarouselShowPlusBadgeModule (copy), FFlagSocialCarouselBuildPresence (copy), UseBuildCardModule (copy), FFlagSocialCarouselInGameTitleMarquee (copy), FFlagEnableSplitPane (copy), AppPage (copy), Enums1 (copy), FFlagConsoleOpenGameJoinCard (copy), PlayerContextualMenuModule (copy), v50 (copy), Enums (copy), EnableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), SocialViewFriendSortInGameFriendsLayer (copy), FFlagMobileGameJoinCardTTITracking (copy), GameJoinCardTTI (copy), FFlagMobileGameJoinCardVideo (copy), FocusNavigationEventNameEnum (copy), ConstantsModule (copy), FFlagSocialCarouselEnableUserSeenEventsModule (copy), FFlagSocialCarouselFixGameJoinCardDismissModule (copy), UseGameJoinCardNavigationFunction (copy), UserTileModule (copy), CryoModule (copy), FoundationModule (copy), SocialCarouselVendorImagePath (copy), View (copy), DesktopGameJoinCardContainer (copy), UserTileEventHandlers (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDeviceTypeResult = if FFlagMobileGameJoinCardGamepadSupport or FFlagDesktopGameJoinCardGamepadSupport then UseDeviceTypeFunction() else nil
	local UsePreferredInputResult = UsePreferredInputFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputResult == ResponsiveModule.Input.Directional
	local UseAppPolicyResult = if FFlagSocialCarouselUseConsolePolicyForCtaModule or FFlagMobileGameJoinCardGamepadSupport then (not FFlagDesktopGameJoinCardGamepadSupport or UseDeviceTypeResult ~= RobloxAppEnumsModule.DeviceType.Desktop) and UseAppPolicyFunction(function(p2)
		return p2.getUseConsoleGameJoinCard()
	end) else (not FFlagDesktopGameJoinCardGamepadSupport or UseDeviceTypeResult ~= RobloxAppEnumsModule.DeviceType.Desktop) and IsUsePreferredInputResultMatch
	local IsUsePreferredInputResultMatch1 = UsePreferredInputResult == ResponsiveModule.Input.Directional
	local IsUseDeviceTypeResultMatch: boolean = UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Phone or UseDeviceTypeResult == RobloxAppEnumsModule.DeviceType.Tablet
	local IsUseDeviceTypeResultMatch1 = FFlagEnableMobileGameJoinCard and (FFlagMobileGameJoinCardGamepadSupport and IsUseDeviceTypeResultMatch or UsePreferredInputResult == ResponsiveModule.Input.Touch) or FFlagConsoleOpenMobileGameJoinCard and UseAppPolicyResult
	local UseSocialCarouselContextModuleResult = UseSocialCarouselContextModule()
	local UseSocialCarouselAnalyticsModuleResult = UseSocialCarouselAnalyticsModule()
	local UserPressedFunction = UseSocialCarouselAnalyticsModuleResult.userPressed
	local UserSeenFunction = UseSocialCarouselAnalyticsModuleResult.userSeen
	local UseLocalizationResult = UseLocalizationFunction({
		suggestedLabel = "Feature.Friends.Label.Suggested",
		friendRequestLabel = if FFlagShowRequestsInCarouselForAllUsers then "Feature.Friends.Label.FriendRequest" else nil
	})
	local IsTileTypeMatch: boolean? = nil
	local v1 = nil
	local Failed = nil
	
	if FFlagShowRequestsInCarouselForAllUsers then
		IsTileTypeMatch = p1.item.tileType == Tile.FriendRequest
		v1, Failed = UseGetPresenceByUserIdFunction(if IsTileTypeMatch then p1.item.id else nil)
	end
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), p1 (copy), IsTileTypeMatch (ref), v1 (ref)
		if not FFlagShowRequestsInCarouselForAllUsers then
			return p1.item
		end
		local Item = p1.item
		local Presence = v1
		
		if IsTileTypeMatch and Presence then
			local Copy = table.clone(Item)
			Copy.presence = Presence
			
			return Copy
		else
			return Item
		end
	end, { p1.item, IsTileTypeMatch, v1 })
	local v2: boolean = v1 ~= nil or (Failed == DataStatus.Ready or Failed == DataStatus.Failed)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), IsTileTypeMatch (ref), v2 (copy), p1 (copy), v1 (ref), PresenceTypes (upval)
		if FFlagShowRequestsInCarouselForAllUsers and IsTileTypeMatch and v2 then
			local Copy = table.clone(p1.item)
			Copy.presence = v1 or { userPresenceType = PresenceTypes.Offline }
			
			return Copy
		else
			return p1.item
		end
	end, { p1.item, IsTileTypeMatch, v1, v2 })
	local SubjectPresence = nil
	
	if FFlagShowRequestsInCarouselForAllUsers and IsTileTypeMatch or not p1.item.presence then
		SubjectPresence = nil
	else
		SubjectPresence = {
			locationString = p1.item.presence.lastLocation,
			locationPlaceId = p1.item.presence.placeId,
			locationRootPlaceId = p1.item.presence.rootPlaceId,
			locationUniverseId = p1.item.presence.universeId,
			status = p1.item.presence.userPresenceType
		}
	end
	local UseSignalStateResult1 = nil
	local UseSignalStateResult2 = nil
	local UseSignalStateResult = nil
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: GetResult (upval), p1 (copy), FFlagUserProfilePlatformProfile (upval)
			return GetResult.fetchNamesByUserIds({ p1.item.id }, nil, FFlagUserProfilePlatformProfile)
		end, { p1.item.id })
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult2 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult2 (upval)
				local UseMemoResultResult = UseMemoResult2(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p2) else nil
			end)
		end, { UseMemoResult2 })))
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult2 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult2 (upval)
				local UseMemoResultResult = UseMemoResult2(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getPlatformName(p2) else nil
			end)
		end, { UseMemoResult2 })))
		UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult2 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult2 (upval)
				local UseMemoResultResult = UseMemoResult2(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry then Entry.getPlatformProfileId(p2) else nil
			end)
		end, { UseMemoResult2 })))
	else
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds
		})
		UseSignalStateResult = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
		end, { UseUserProfilesFetchResult.data })
		UseSignalStateResult1 = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getPlatformNameFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
		end, { UseUserProfilesFetchResult.data })
		UseSignalStateResult2 = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getPlatformProfileIdFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
		end, { UseUserProfilesFetchResult.data, p1.item.id })
	end
	local UseIsRobloxSubscriberResult = if FFlagSocialCarouselShowPlusBadgeModule then UserProfilesModule.Hooks.useIsRobloxSubscriber(p1.item.id) else nil
	local UseStateResult = nil
	local UseStateResult2 = nil
	UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local SetOpenGameJoinCardUserIdFunction = UseSocialCarouselContextModuleResult.setOpenGameJoinCardUserId
	
	if SetOpenGameJoinCardUserIdFunction then
		UseStateResult = UseSocialCarouselContextModuleResult.openGameJoinCardUserId == p1.item.id
		
		UseStateResult2 = function(p2)
			-- upvalues: SetOpenGameJoinCardUserIdFunction (copy), p1 (copy)
			if p2 then
				SetOpenGameJoinCardUserIdFunction(p1.item.id)
				
				return
			else
				SetOpenGameJoinCardUserIdFunction(function(Id)
					-- upvalues: p1 (upval)
					return if Id == p1.item.id then nil else Id
				end)
			end
		end
	end
	local UseBuildCardModuleResult = if FFlagSocialCarouselBuildPresence then UseBuildCardModule({
		userId = p1.item.id,
		playerName = UseSignalStateResult or "",
		presence = p1.item.presence,
		preferredInput = UsePreferredInputResult,
		isPhoneOrTablet = IsUseDeviceTypeResultMatch,
		anchorRef = UseRefResult
	}) else nil
	local JoinSheetUserIdRef = if FFlagSocialCarouselInGameTitleMarquee then UseSocialCarouselContextModuleResult.joinSheetUserIdRef else nil
	local UseResult = if FFlagShowRequestsInCarouselForAllUsers then ReactModule.useCallback(function()
		-- upvalues: FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval), p1 (copy), Enums1 (upval)
		(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
		})
	end, { UseNavigationResult, p1.item.id }) else nil
	local UseResult1 = ReactModule.useCallback(function(_)
		-- upvalues: p1 (copy), PresenceTypes (upval), UseAppPolicyResult (ref), FFlagShowRequestsInCarouselForAllUsers (upval), IsTileTypeMatch (ref), UseResult (ref), FFlagConsoleOpenMobileGameJoinCard (upval), IsUseDeviceTypeResultMatch1 (copy), FFlagConsoleOpenGameJoinCard (upval), UseDispatchResult (copy), PlayerContextualMenuModule (upval), SubjectPresence (copy), v50 (upval), Enums (upval), EnableFriendCarouselInGameFriendExposureLoggingV2 (upval), IXPService (upval), SocialViewFriendSortInGameFriendsLayer (upval), FFlagMobileGameJoinCardTTITracking (upval), GameJoinCardTTI (upval), JoinSheetUserIdRef (copy), UseNavigationResult (copy), AppPage (upval), FFlagMobileGameJoinCardVideo (upval), UseSocialCarouselContextModuleResult (copy), UseStateResult2 (ref), UseStateResult (ref), FFlagSocialCarouselBuildPresence (upval), UseBuildCardModuleResult (copy), FFlagEnableSplitPane (upval), Enums1 (upval), UserPressedFunction (copy), UseMemoResult1 (copy)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local IsUserPresenceTypeMatch: boolean = p1.item.presence ~= nil and p1.item.presence.userPresenceType == PresenceTypes.InGame
			local IsUserPresenceTypeMatch1: boolean = UseAppPolicyResult and IsUserPresenceTypeMatch
			
			if FFlagShowRequestsInCarouselForAllUsers and IsTileTypeMatch and UseResult then
				UseResult()
			elseif IsUserPresenceTypeMatch1 and (not FFlagConsoleOpenMobileGameJoinCard or not IsUseDeviceTypeResultMatch1 or not IsUserPresenceTypeMatch) and not FFlagConsoleOpenGameJoinCard then
				UseDispatchResult(PlayerContextualMenuModule.openPlayerContextualMenu({
					subjectUserId = p1.item.id,
					subjectPresence = SubjectPresence,
					robloxFriendshipStatus = v50(p1.item),
					friendshipOriginSourceType = Enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				}))
			elseif p1.item.presence and p1.item.presence.userPresenceType == PresenceTypes.InGame then
				if EnableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(SocialViewFriendSortInGameFriendsLayer)
				end
				if IsUseDeviceTypeResultMatch1 then
					if FFlagMobileGameJoinCardTTITracking then
						GameJoinCardTTI.trackMobileCardClickStart()
					end
					if JoinSheetUserIdRef ~= nil then
						JoinSheetUserIdRef.current = p1.item.id
					end
					UseNavigationResult.navigate(AppPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index,
						isBannerVideoEnabled = if FFlagMobileGameJoinCardVideo then UseSocialCarouselContextModuleResult.isJoinCardVideoEnabled else nil,
						videoPlaybackContext = if FFlagMobileGameJoinCardVideo then UseSocialCarouselContextModuleResult.videoPlaybackContext else nil
					})
				else
					UseStateResult2(not UseStateResult)
				end
			elseif FFlagSocialCarouselBuildPresence and UseBuildCardModuleResult.isInBuild and UseBuildCardModuleResult.canOpen then
				UseBuildCardModuleResult.onActivated()
			elseif FFlagShowRequestsInCarouselForAllUsers and UseResult then
				UseResult()
			else
				(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		UserPressedFunction(UseMemoResult1, { absolutePosition = p1.index })
	end, {
		p1.item, UseStateResult,
		if FFlagMobileGameJoinCardGamepadSupport then IsUseDeviceTypeResultMatch1 else nil,
		if FFlagMobileGameJoinCardGamepadSupport or FFlagDesktopGameJoinCardGamepadSupport then UseAppPolicyResult else nil,
		if FFlagSocialCarouselInGameTitleMarquee then JoinSheetUserIdRef else nil,
		FFlagSocialCarouselBuildPresence and UseBuildCardModuleResult,
		if FFlagShowRequestsInCarouselForAllUsers then IsTileTypeMatch else nil,
		if FFlagShowRequestsInCarouselForAllUsers then UseResult else nil,
		if FFlagShowRequestsInCarouselForAllUsers then UseNavigationResult else nil,
		UseMemoResult1, UseDispatchResult, UserPressedFunction, UseAppPolicyResult,
		p1.index, IsUseDeviceTypeResultMatch1, SubjectPresence,
		if FFlagMobileGameJoinCardVideo then UseSocialCarouselContextModuleResult.isJoinCardVideoEnabled else nil,
		if FFlagMobileGameJoinCardVideo then UseSocialCarouselContextModuleResult.videoPlaybackContext else nil
	})
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), IsTileTypeMatch (ref), UseLocalizationResult (copy), p1 (copy), Tile (upval), PresenceTypes (upval)
		return if FFlagShowRequestsInCarouselForAllUsers and IsTileTypeMatch then UseLocalizationResult.friendRequestLabel elseif p1.item.tileType == Tile.Recommendation then UseLocalizationResult.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == PresenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, {
		p1.item,
		IsTileTypeMatch,
		UseLocalizationResult.friendRequestLabel,
		UseLocalizationResult.suggestedLabel
	})
	local ContextualInfo = if FFlagSocialCarouselBuildPresence and UseBuildCardModuleResult.isInBuild then UseBuildCardModuleResult.contextualInfo else nil
	local UseStateResult2_1 = nil
	local UseStateResult1
	UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), UseResult (ref), FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval), p1 (copy), Enums1 (upval), UserPressedFunction (copy), UseMemoResult1 (copy)
		if FFlagShowRequestsInCarouselForAllUsers and UseResult then
			UseResult()
		else
			(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
				detail = p1.item.id,
				extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
			})
		end
		UserPressedFunction(UseMemoResult1, { absolutePosition = p1.index })
	end, {
		p1.item, p1.index,
		if FFlagShowRequestsInCarouselForAllUsers then UseResult else nil,
		if FFlagShowRequestsInCarouselForAllUsers then nil else UseNavigationResult.navigate,
		if FFlagShowRequestsInCarouselForAllUsers then nil else UseNavigationResult.push,
		UserPressedFunction, UseMemoResult1
	})
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: UseResult2 (copy), FocusNavigationEventNameEnum (upval)
		return {
			{
				onActivated = UseResult2,
				focusEventName = FocusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { UseResult2 })
	local UseResult3 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseStateResult2_1 (ref)
		UseRefResult1.current = Current
		
		if UseStateResult2_1 then
			UseStateResult2_1(Current)
		end
	end, { UseStateResult2_1 })
	ReactModule.useEffect(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), UseRefResult (copy), p1 (copy)
		if UseSocialCarouselContextModuleResult.unifiedLogging then
			UseSocialCarouselContextModuleResult.unifiedLogging.tagTileForImpressions(UseRefResult, p1.index)
		end
	end, { p1.index })
	ReactModule.useEffect(function()
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval), FFlagSocialCarouselEnableUserSeenEventsModule (upval), FFlagShowRequestsInCarouselForAllUsers (upval), UserSeenFunction (copy), p1 (copy)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if FFlagSocialCarouselEnableUserSeenEventsModule and not FFlagShowRequestsInCarouselForAllUsers then
			UserSeenFunction(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: FFlagShowRequestsInCarouselForAllUsers (upval), FFlagSocialCarouselEnableUserSeenEventsModule (upval), IsTileTypeMatch (ref), v2 (copy), UseRefResult2 (copy), p1 (copy), UserSeenFunction (copy), UseMemoResult1 (copy)
		if FFlagShowRequestsInCarouselForAllUsers and FFlagSocialCarouselEnableUserSeenEventsModule and (not IsTileTypeMatch or v2) and UseRefResult2.current ~= p1.item.id then
			UseRefResult2.current = p1.item.id
			UserSeenFunction(UseMemoResult1, { absolutePosition = p1.index })
		end
	end, {
		UseMemoResult1, IsTileTypeMatch, v2, UserSeenFunction, p1.item.id, p1.index
	})
	
	if FFlagShowRequestsInCarouselForAllUsers then
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseMemoResult1 (copy)
			if p1.onTileContentChanged then
				p1.onTileContentChanged(p1.item.id, p1.index, UseMemoResult1)
			end
		end, {
			p1.item.id,
			p1.index,
			UseMemoResult1,
			p1.onTileContentChanged
		})
	else
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy)
			if p1.onTileContentChanged then
				p1.onTileContentChanged(p1.item.id, p1.index)
			end
		end, { p1.item.id, p1.index })
	end
	local UseResult4 = nil
	if FFlagSocialCarouselFixGameJoinCardDismissModule then
		local Id = p1.item.id
		UseResult4 = ReactModule.useCallback(function()
			-- upvalues: SetOpenGameJoinCardUserIdFunction (copy), Id (copy), UseStateResult2 (ref)
			if SetOpenGameJoinCardUserIdFunction then
				SetOpenGameJoinCardUserIdFunction(function(Id1)
					-- upvalues: Id (upval)
					return if Id1 == Id then nil else Id1
				end)
				
				return
			end
			if UseStateResult2 then
				UseStateResult2(false)
			end
		end, { Id, SetOpenGameJoinCardUserIdFunction })
	else
		UseResult4 = ReactModule.useCallback(function()
			-- upvalues: UseStateResult2 (ref)
			if UseStateResult2 then
				UseStateResult2(false)
			end
		end, {})
	end
	local UseAppPolicyResult1 = if FFlagDesktopGameJoinCardGamepadSupport then if FFlagConsoleOpenGameJoinCard then UseAppPolicyResult else IsUsePreferredInputResultMatch and UseDeviceTypeResult ~= RobloxAppEnumsModule.DeviceType.Desktop elseif FFlagConsoleOpenGameJoinCard then UseAppPolicyResult else IsUsePreferredInputResultMatch
	local UseGameJoinCardNavigationResult = UseGameJoinCardNavigationFunction(if FFlagConsoleOpenGameJoinCard and UseAppPolicyResult1 then nil elseif FFlagDesktopGameJoinCardGamepadSupport and not UseAppPolicyResult1 then nil else UseStateResult1, UseAppPolicyResult1 and not FFlagConsoleOpenGameJoinCard, UseRefResult)
	local Presence = p1.item.presence
	local IsUserPresenceTypeMatch: boolean = Presence and Presence.userPresenceType == PresenceTypes.InGame
	local HasSubjectPresence: boolean = if UseStateResult then IsUserPresenceTypeMatch and SubjectPresence ~= nil else UseGameJoinCardNavigationResult and (IsUserPresenceTypeMatch and SubjectPresence ~= nil)
	local HasSubjectPresence1: boolean = IsUserPresenceTypeMatch and (UseAppPolicyResult1 and HasSubjectPresence)
	ReactModule.useEffect(function()
		-- upvalues: EnableFriendCarouselInGameFriendExposureLoggingV2 (upval), HasSubjectPresence (copy), IXPService (upval), SocialViewFriendSortInGameFriendsLayer (upval)
		if EnableFriendCarouselInGameFriendExposureLoggingV2 and HasSubjectPresence then
			IXPService:LogFlagLinkedUserLayerExposure(SocialViewFriendSortInGameFriendsLayer)
		end
	end, { HasSubjectPresence })
	
	return ReactModule.createElement(View, {
		BackgroundTransparency = 1,
		Size = p1.itemSize,
		LayoutOrder = p1.index,
		ref = UseRefResult,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		UserTile = ReactModule.createElement(UserTileModule, CryoModule.Dictionary.join(p1, {
			item = if FFlagShowRequestsInCarouselForAllUsers then UseMemoResult else nil,
			itemSize = UDim2.fromScale(1, 1),
			onActivated = UseResult1,
			name = if p1.item.tileType == Tile.Recommendation then UseSignalStateResult1 else UseSignalStateResult,
			contextualText = UseMemoResult3,
			overlayIcon = if FFlagShowRequestsInCarouselForAllUsers and IsTileTypeMatch then FoundationModule.Enums.IconName.PersonPlus else nil,
			contextualInfo = if FFlagSocialCarouselBuildPresence and ContextualInfo then ContextualInfo.text else nil,
			contextualInfoIcon = if FFlagSocialCarouselBuildPresence and ContextualInfo then ContextualInfo.icon else nil,
			tileRef = UseRefResult,
			titleIcon = if p1.item.tileType == Tile.Recommendation then SocialCarouselVendorImagePath else nil,
			isRobloxSubscriber = if FFlagSocialCarouselShowPlusBadgeModule then UseIsRobloxSubscriberResult else nil
		})),
		GameJoinCardPopover = if FFlagSocialCarouselBuildPresence and UseBuildCardModuleResult.isInBuild then nil elseif SubjectPresence and Presence then ReactModule.createElement(DesktopGameJoinCardContainer, {
			layoutOrder = 1,
			playerName = UseSignalStateResult or "",
			platformName = UseSignalStateResult1 or "",
			platformProfileId = UseSignalStateResult2,
			universeId = tostring(Presence.universeId),
			experienceName = Presence.lastLocation,
			userId = p1.item.id,
			presence = Presence,
			anchorRef = UseRefResult,
			isOpen = HasSubjectPresence == true,
			onClose = UseResult4,
			homepageCarouselAbsolutePosition = p1.index,
			showGamepadJoinFocus = HasSubjectPresence1 == true,
			onCardGuiObjectChanged = UseResult3,
			isFocused = UseGameJoinCardNavigationResult,
			isConsole = UseAppPolicyResult1
		}) else nil,
		BuildJoinCardPopover = if FFlagSocialCarouselBuildPresence then UseBuildCardModuleResult.popover else nil,
		TileEventHandlers = ReactModule.createElement(UserTileEventHandlers, {
			tileRef = UseRefResult,
			buttons = if IsUsePreferredInputResultMatch1 then UseMemoResult4 else nil,
			onTileActivated = function() end
		}),
		CardEventHandlers = if IsUsePreferredInputResultMatch1 and UseStateResult1 then ReactModule.createElement(UserTileEventHandlers, {
			tileRef = UseRefResult1,
			buttons = UseMemoResult4,
			onTileActivated = function() end
		}) else nil
	})
end