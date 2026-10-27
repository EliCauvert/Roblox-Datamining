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
local UserProfilesModule = require(Parent.UserProfiles)
local Enums = require(Parent.FriendsNetworking).Enums
local FFlagSocialCarouselUseProfileStore = require(Parent.SharedFlags).FFlagSocialCarouselUseProfileStore
local FFlagUserProfilePlatformProfile = require(Parent.SharedFlags).FFlagUserProfilePlatformProfile
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
local FFlagMobileGameJoinCardTTITracking = require(Parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local FFlagMobileGameJoinCardGamepadSupport = require(Parent.SharedFlags).FFlagMobileGameJoinCardGamepadSupport
local FFlagDesktopGameJoinCardGamepadSupport = require(Parent.SharedFlags).FFlagDesktopGameJoinCardGamepadSupport
local EnableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local SocialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local function _(p1)
	-- upvalues: Tile (copy)
	return if p1.tileType == Tile.Recommendation then if p1.isFriendWithUser then Enum.FriendStatus.Friend elseif p1.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p1.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagMobileGameJoinCardGamepadSupport (copy), FFlagDesktopGameJoinCardGamepadSupport (copy), UseDeviceTypeFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), FFlagSocialCarouselUseConsolePolicyForCtaModule (copy), UseAppPolicyFunction (copy), RobloxAppEnumsModule (copy), FFlagEnableMobileGameJoinCard (copy), FFlagConsoleOpenMobileGameJoinCard (copy), UseSocialCarouselContextModule (copy), UseSocialCarouselAnalyticsModule (copy), UseLocalizationFunction (copy), FFlagSocialCarouselUseProfileStore (copy), GetResult (copy), FFlagUserProfilePlatformProfile (copy), SignalsModule (copy), SignalsReactModule (copy), UserProfilesModule (copy), FFlagSocialCarouselShowPlusBadgeModule (copy), PresenceTypes (copy), FFlagConsoleOpenGameJoinCard (copy), PlayerContextualMenuModule (copy), Tile (copy), Enums (copy), EnableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), SocialViewFriendSortInGameFriendsLayer (copy), FFlagMobileGameJoinCardTTITracking (copy), GameJoinCardTTI (copy), AppPage (copy), FFlagEnableSplitPane (copy), Enums1 (copy), FocusNavigationEventNameEnum (copy), ConstantsModule (copy), FFlagSocialCarouselEnableUserSeenEventsModule (copy), FFlagSocialCarouselFixGameJoinCardDismissModule (copy), UseGameJoinCardNavigationFunction (copy), UserTileModule (copy), CryoModule (copy), SocialCarouselVendorImagePath (copy), View (copy), FoundationModule (copy), DesktopGameJoinCardContainer (copy), UserTileEventHandlers (copy)
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
	local UseLocalizationResult = UseLocalizationFunction({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local Config = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local UseSignalStateResult2 = nil
	local UseSignalStateResult = nil
	local UseSignalStateResult1 = nil
	
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: GetResult (upval), p1 (copy), FFlagUserProfilePlatformProfile (upval)
			return GetResult.fetchNamesByUserIds({ p1.item.id }, nil, FFlagUserProfilePlatformProfile)
		end, { p1.item.id })
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult (upval)
				local UseMemoResultResult = UseMemoResult(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p2) else nil
			end)
		end, { UseMemoResult })))
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult (upval)
				local UseMemoResultResult = UseMemoResult(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getPlatformName(p2) else nil
			end)
		end, { UseMemoResult })))
		UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult (upval)
				local UseMemoResultResult = UseMemoResult(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry then Entry.getPlatformProfileId(p2) else nil
			end)
		end, { UseMemoResult })))
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
	local UseResult = ReactModule.useCallback(function(_)
		-- upvalues: p1 (copy), PresenceTypes (upval), UseAppPolicyResult (ref), FFlagConsoleOpenMobileGameJoinCard (upval), IsUseDeviceTypeResultMatch1 (copy), FFlagConsoleOpenGameJoinCard (upval), UseDispatchResult (copy), PlayerContextualMenuModule (upval), Config (copy), Tile (upval), Enums (upval), EnableFriendCarouselInGameFriendExposureLoggingV2 (upval), IXPService (upval), SocialViewFriendSortInGameFriendsLayer (upval), FFlagMobileGameJoinCardTTITracking (upval), GameJoinCardTTI (upval), UseNavigationResult (copy), AppPage (upval), UseStateResult2 (ref), UseStateResult (ref), FFlagEnableSplitPane (upval), Enums1 (upval), UseSocialCarouselAnalyticsModuleResult (copy)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local IsUserPresenceTypeMatch: boolean = p1.item.presence ~= nil and p1.item.presence.userPresenceType == PresenceTypes.InGame
			
			if UseAppPolicyResult and IsUserPresenceTypeMatch and (not FFlagConsoleOpenMobileGameJoinCard or not IsUseDeviceTypeResultMatch1 or not IsUserPresenceTypeMatch) and not FFlagConsoleOpenGameJoinCard then
				local Item = p1.item
				UseDispatchResult(PlayerContextualMenuModule.openPlayerContextualMenu({
					subjectUserId = p1.item.id,
					subjectPresence = Config,
					robloxFriendshipStatus = if Item.tileType == Tile.Recommendation then if Item.isFriendWithUser then Enum.FriendStatus.Friend elseif Item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif Item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend,
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
					UseNavigationResult.navigate(AppPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				else
					UseStateResult2(not UseStateResult)
				end
			else
				(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		UseSocialCarouselAnalyticsModuleResult.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		UseStateResult,
		if FFlagMobileGameJoinCardGamepadSupport then IsUseDeviceTypeResultMatch1 else nil,
		if FFlagMobileGameJoinCardGamepadSupport or FFlagDesktopGameJoinCardGamepadSupport then UseAppPolicyResult else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Tile (upval), UseLocalizationResult (copy), PresenceTypes (upval)
		return if p1.item.tileType == Tile.Recommendation then UseLocalizationResult.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == PresenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local UseStateResult2_1 = nil
	local UseStateResult1
	UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FFlagEnableSplitPane (upval), UseNavigationResult (copy), AppPage (upval), p1 (copy), Enums1 (upval), UseSocialCarouselAnalyticsModuleResult (copy)
		(if FFlagEnableSplitPane then UseNavigationResult.push else UseNavigationResult.navigate)(AppPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
		})
		UseSocialCarouselAnalyticsModuleResult.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		UseNavigationResult.navigate,
		UseNavigationResult.push,
		UseSocialCarouselAnalyticsModuleResult.userPressed
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), FocusNavigationEventNameEnum (upval)
		return {
			{
				onActivated = UseResult1,
				focusEventName = FocusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { UseResult1 })
	local UseResult2 = ReactModule.useCallback(function(Current)
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
		-- upvalues: UseSocialCarouselContextModuleResult (copy), ConstantsModule (upval), FFlagSocialCarouselEnableUserSeenEventsModule (upval), UseSocialCarouselAnalyticsModuleResult (copy), p1 (copy)
		UseSocialCarouselContextModuleResult.onSuccessfulRender(ConstantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if FFlagSocialCarouselEnableUserSeenEventsModule then
			UseSocialCarouselAnalyticsModuleResult.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	local UseResult3 = nil
	
	if FFlagSocialCarouselFixGameJoinCardDismissModule then
		local Id = p1.item.id
		UseResult3 = ReactModule.useCallback(function()
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
		UseResult3 = ReactModule.useCallback(function()
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
	local HasConfig: boolean = if UseStateResult then IsUserPresenceTypeMatch and Config ~= nil else UseGameJoinCardNavigationResult and (IsUserPresenceTypeMatch and Config ~= nil)
	local HasConfig1: boolean = IsUserPresenceTypeMatch and (UseAppPolicyResult1 and HasConfig)
	ReactModule.useEffect(function()
		-- upvalues: EnableFriendCarouselInGameFriendExposureLoggingV2 (upval), HasConfig (copy), IXPService (upval), SocialViewFriendSortInGameFriendsLayer (upval)
		if EnableFriendCarouselInGameFriendExposureLoggingV2 and HasConfig then
			IXPService:LogFlagLinkedUserLayerExposure(SocialViewFriendSortInGameFriendsLayer)
		end
	end, { HasConfig })
	
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
			itemSize = UDim2.fromScale(1, 1),
			onActivated = UseResult,
			name = if p1.item.tileType == Tile.Recommendation then UseSignalStateResult1 else UseSignalStateResult,
			contextualText = UseMemoResult1,
			tileRef = UseRefResult,
			titleIcon = if p1.item.tileType == Tile.Recommendation then SocialCarouselVendorImagePath else nil,
			isRobloxSubscriber = if FFlagSocialCarouselShowPlusBadgeModule then UseIsRobloxSubscriberResult else nil
		})),
		GameJoinCardPopover = if Config and Presence then ReactModule.createElement(DesktopGameJoinCardContainer, {
			layoutOrder = 1,
			playerName = UseSignalStateResult or "",
			platformName = UseSignalStateResult1 or "",
			platformProfileId = UseSignalStateResult2,
			universeId = tostring(Presence.universeId),
			experienceName = Presence.lastLocation,
			userId = p1.item.id,
			presence = Presence,
			anchorRef = UseRefResult,
			isOpen = HasConfig == true,
			onClose = UseResult3,
			homepageCarouselAbsolutePosition = p1.index,
			showGamepadJoinFocus = HasConfig1 == true,
			onCardGuiObjectChanged = UseResult2,
			isFocused = UseGameJoinCardNavigationResult,
			isConsole = UseAppPolicyResult1
		}) else nil,
		TileEventHandlers = ReactModule.createElement(UserTileEventHandlers, {
			tileRef = UseRefResult,
			buttons = if IsUsePreferredInputResultMatch1 then UseMemoResult2 else nil,
			onTileActivated = function() end
		}),
		CardEventHandlers = if IsUsePreferredInputResultMatch1 and UseStateResult1 then ReactModule.createElement(UserTileEventHandlers, {
			tileRef = UseRefResult1,
			buttons = UseMemoResult2,
			onTileActivated = function() end
		}) else nil
	})
end