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
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local GetResult = UserProfilesModule.Stores.UserProfileStore.get()
local PresenceTypes = require(Parent.SocialCommon).Enums.PresenceTypes
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local Enums1 = require(Parent.SocialLuaAnalytics).Analytics.Enums
local EnumsModule = require(SocialCarousel.Common.Enums)
local UseSocialCarouselAnalyticsModule = require(SocialCarousel.Analytics.useSocialCarouselAnalytics)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local View = FoundationModule.View
local CentralOverlayType = RobloxAppEnumsModule.CentralOverlayType
local AppPage = RobloxAppEnumsModule.AppPage
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Tile = EnumsModule.Tile
local UserTileModule = require(script.Parent.UserTile)
local UserTileEventHandlers = require(Parent.UserTile).UserTileEventHandlers
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local ConstantsModule = require(SocialCarousel.Common.Constants)
local UseSocialCarouselContextModule = require(SocialCarousel.Contexts.useSocialCarouselContext)
local DesktopGameJoinCardContainer = GameJoinCardModule.DesktopGameJoinCardContainer
local UseGameJoinCardNavigationFunction = GameJoinCardModule.useGameJoinCardNavigation
local GameJoinCardTTI = GameJoinCardModule.Telemetry.GameJoinCardTTI
local SocialCarouselVendorImagePath = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(Parent.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local FFlagPPVEnabledOnConsole = require(Parent.SharedFlags).FFlagPPVEnabledOnConsole
local FFlagSocialCarouselPressXToViewProfile = require(Parent.SharedFlags).FFlagSocialCarouselPressXToViewProfile
local FFlagSocialCarouselEnableUserSeenEventsModule = require(SocialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local FFlagEnableDesktopGameJoinCard = require(Parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local FFlagEnableMobileGameJoinCard = require(Parent.SharedFlags).FFlagEnableMobileGameJoinCard
local FFlagEnableConsoleGameJoinCard = require(Parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local FFlagMobileGameJoinCardTTITracking = require(Parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local EnableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local SocialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local function _(p1)
	-- upvalues: Tile (copy)
	return if p1.tileType == Tile.Recommendation then if p1.isFriendWithUser then Enum.FriendStatus.Friend elseif p1.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p1.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1)
	-- upvalues: ReactModule (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), FFlagEnableMobileGameJoinCard (copy), FFlagEnableDesktopGameJoinCard (copy), FFlagSocialCarouselPressXToViewProfile (copy), UsePreferredInputFunction (copy), FFlagPPVEnabledOnConsole (copy), FFlagEnableConsoleGameJoinCard (copy), ResponsiveModule (copy), UseSocialCarouselContextModule (copy), UseSocialCarouselAnalyticsModule (copy), UseLocalizationFunction (copy), FFlagSocialCarouselUseProfileStore (copy), GetResult (copy), SignalsModule (copy), SignalsReactModule (copy), UserProfilesModule (copy), PlayerContextualMenuModule (copy), Tile (copy), Enums (copy), PresenceTypes (copy), EnableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), SocialViewFriendSortInGameFriendsLayer (copy), FFlagMobileGameJoinCardTTITracking (copy), GameJoinCardTTI (copy), AppPage (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), EnumsModule (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), Enums1 (copy), FocusNavigationEventNameEnum (copy), ConstantsModule (copy), FFlagSocialCarouselEnableUserSeenEventsModule (copy), UseGameJoinCardNavigationFunction (copy), UserTileModule (copy), CryoModule (copy), SocialCarouselVendorImagePath (copy), View (copy), FoundationModule (copy), DesktopGameJoinCardContainer (copy), UserTileEventHandlers (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UsePreferredInputResult = if FFlagEnableMobileGameJoinCard or FFlagEnableDesktopGameJoinCard or FFlagSocialCarouselPressXToViewProfile then UsePreferredInputFunction() else nil
	local IsDirectionalMatch: boolean = (not FFlagPPVEnabledOnConsole or FFlagEnableConsoleGameJoinCard) and (if FFlagEnableMobileGameJoinCard or FFlagEnableDesktopGameJoinCard or FFlagSocialCarouselPressXToViewProfile then UsePreferredInputResult else UsePreferredInputFunction()) == ResponsiveModule.Input.Directional
	local IsUsePreferredInputResultMatch: boolean = if FFlagSocialCarouselPressXToViewProfile then UsePreferredInputResult == ResponsiveModule.Input.Directional else false
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
	local UseSignalStateResult = nil
	local UseMemoResult = nil
	local UseSignalStateResult1 = nil
	
	if FFlagSocialCarouselUseProfileStore then
		local UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: GetResult (upval), p1 (copy)
			return GetResult.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult1 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult1 (upval)
				local UseMemoResultResult = UseMemoResult1(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getCombinedName(p2) else nil
			end)
		end, { UseMemoResult1 })))
		UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
			-- upvalues: SignalsModule (upval), UseMemoResult1 (copy)
			return SignalsModule.createComputed(function(p2)
				-- upvalues: UseMemoResult1 (upval)
				local UseMemoResultResult = UseMemoResult1(p2)
				local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
				
				return if Entry and Entry.names then Entry.names.getPlatformName(p2) else nil
			end)
		end, { UseMemoResult1 })))
		
		if FFlagEnableConsoleGameJoinCard then
			UseMemoResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
				-- upvalues: SignalsModule (upval), UseMemoResult1 (copy)
				return SignalsModule.createComputed(function(p2)
					-- upvalues: UseMemoResult1 (upval)
					local UseMemoResultResult = UseMemoResult1(p2)
					local Entry = UseMemoResultResult and (UseMemoResultResult.data and UseMemoResultResult.data[1])
					
					return if Entry then Entry.getPlatformProfileId(p2) else nil
				end)
			end, { UseMemoResult1 })))
		end
	else
		local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if FFlagEnableConsoleGameJoinCard then UserProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else UserProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		UseSignalStateResult = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
		end, { UseUserProfilesFetchResult.data })
		UseSignalStateResult1 = ReactModule.useMemo(function()
			-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
			return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getPlatformNameFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
		end, { UseUserProfilesFetchResult.data })
		
		if FFlagEnableConsoleGameJoinCard then
			UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: UseUserProfilesFetchResult (copy), UserProfilesModule (upval), p1 (copy)
				return if UseUserProfilesFetchResult.data then UserProfilesModule.Selectors.getPlatformProfileIdFromId(UseUserProfilesFetchResult.data, p1.item.id) else nil
			end, { UseUserProfilesFetchResult.data, p1.item.id })
		end
	end
	local IsOpenGameJoinCardUserIdMatch: boolean? = nil
	local Callback: ((any) -> ())? = nil
	
	if FFlagEnableDesktopGameJoinCard or FFlagEnableConsoleGameJoinCard then
		IsOpenGameJoinCardUserIdMatch, Callback = ReactModule.useState(false)
		local SetOpenGameJoinCardUserIdFunction = UseSocialCarouselContextModuleResult.setOpenGameJoinCardUserId
		
		if SetOpenGameJoinCardUserIdFunction then
			IsOpenGameJoinCardUserIdMatch = UseSocialCarouselContextModuleResult.openGameJoinCardUserId == p1.item.id
			
			Callback = function(p2)
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
	end
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: p1 (copy), FFlagPPVEnabledOnConsole (upval), IsDirectionalMatch (ref), UseDispatchResult (copy), PlayerContextualMenuModule (upval), Config (copy), Tile (upval), Enums (upval), PresenceTypes (upval), EnableFriendCarouselInGameFriendExposureLoggingV2 (upval), IXPService (upval), SocialViewFriendSortInGameFriendsLayer (upval), FFlagEnableMobileGameJoinCard (upval), UsePreferredInputResult (copy), ResponsiveModule (upval), FFlagMobileGameJoinCardTTITracking (upval), GameJoinCardTTI (upval), UseNavigationResult (copy), AppPage (upval), FFlagEnableDesktopGameJoinCard (upval), Callback (ref), IsOpenGameJoinCardUserIdMatch (ref), SetCentralOverlayFunction (upval), CentralOverlayType (upval), UseSignalStateResult (ref), EnumsModule (upval), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (upval), Enums1 (upval), UseSocialCarouselAnalyticsModuleResult (copy)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		elseif FFlagPPVEnabledOnConsole or not IsDirectionalMatch then
			if p1.item.presence and p1.item.presence.userPresenceType == PresenceTypes.InGame then
				if EnableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(SocialViewFriendSortInGameFriendsLayer)
				end
				if FFlagEnableMobileGameJoinCard and UsePreferredInputResult == ResponsiveModule.Input.Touch then
					if FFlagMobileGameJoinCardTTITracking then
						GameJoinCardTTI.trackMobileCardClickStart()
					end
					UseNavigationResult.navigate(AppPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				elseif FFlagEnableDesktopGameJoinCard then
					Callback(not IsOpenGameJoinCardUserIdMatch)
				else
					if FFlagMobileGameJoinCardTTITracking then
						GameJoinCardTTI.trackPeopleListClickStart()
					end
					UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.PeopleList, {
						user = {
							id = p1.item.id,
							combinedName = UseSignalStateResult,
							presence = EnumsModule.OldPresence.IN_GAME,
							universeId = p1.item.presence.universeId,
							rootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.rootPlaceId else nil,
							placeId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.placeId else nil,
							gameInstanceId = p1.item.presence.gameId,
							lastLocation = p1.item.presence.lastLocation
						},
						positionIndex = p1.index,
						absolutePosition = p1.index,
						anchorSpaceSize = Frame.AbsoluteSize,
						anchorSpacePosition = Frame.AbsolutePosition,
						source = Enums1.Sources.HomePageFriendsCarousel
					}))
				end
			else
				UseNavigationResult.navigate(AppPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
				})
			end
		else
			local Item = p1.item
			UseDispatchResult(PlayerContextualMenuModule.openPlayerContextualMenu({
				subjectUserId = p1.item.id,
				subjectPresence = Config,
				robloxFriendshipStatus = if Item.tileType == Tile.Recommendation then if Item.isFriendWithUser then Enum.FriendStatus.Friend elseif Item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif Item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend,
				friendshipOriginSourceType = Enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
			}))
		end
		UseSocialCarouselAnalyticsModuleResult.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, IsOpenGameJoinCardUserIdMatch })
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), Tile (upval), UseLocalizationResult (copy), PresenceTypes (upval)
		return if p1.item.tileType == Tile.Recommendation then UseLocalizationResult.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == PresenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local v1 = nil
	local Callback1 = nil
	
	if FFlagEnableDesktopGameJoinCard or EnableFriendCarouselInGameFriendExposureLoggingV2 then
		v1, Callback1 = ReactModule.useState(nil)
	end
	local UseRefResult1 = if FFlagSocialCarouselPressXToViewProfile then ReactModule.useRef(nil) else nil
	local UseResult1 = if FFlagSocialCarouselPressXToViewProfile then ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), AppPage (upval), p1 (copy), Enums1 (upval), UseSocialCarouselAnalyticsModuleResult (copy)
		UseNavigationResult.navigate(AppPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = Enums1.Sources.HomePageFriendsCarousel }
		})
		UseSocialCarouselAnalyticsModuleResult.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		UseNavigationResult.navigate,
		UseSocialCarouselAnalyticsModuleResult.userPressed
	}) else nil
	local UseMemoResult3 = if FFlagSocialCarouselPressXToViewProfile then ReactModule.useMemo(function()
		-- upvalues: UseResult1 (copy), FocusNavigationEventNameEnum (upval)
		return {
			{
				onActivated = UseResult1,
				focusEventName = FocusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() end }
		}
	end, { UseResult1 }) else nil
	local UseResult2 = if FFlagSocialCarouselPressXToViewProfile then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), Callback1 (ref)
		UseRefResult1.current = Current
		
		if Callback1 then
			Callback1(Current)
		end
	end, { Callback1 }) else nil
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
	
	if FFlagEnableDesktopGameJoinCard or EnableFriendCarouselInGameFriendExposureLoggingV2 then
		local UseResult3 = ReactModule.useCallback(function()
			-- upvalues: Callback (ref)
			if Callback then
				Callback(false)
			end
		end, {})
		local UseGameJoinCardNavigationResult = if FFlagEnableConsoleGameJoinCard then UseGameJoinCardNavigationFunction(v1, IsDirectionalMatch, UseRefResult) else false
		local Presence = p1.item.presence
		local IsUserPresenceTypeMatch: boolean = Presence and Presence.userPresenceType == PresenceTypes.InGame
		local HasConfig: boolean = if IsOpenGameJoinCardUserIdMatch then IsUserPresenceTypeMatch and Config ~= nil else UseGameJoinCardNavigationResult and (IsUserPresenceTypeMatch and Config ~= nil)
		local HasConfig1: boolean = FFlagEnableConsoleGameJoinCard and (IsUserPresenceTypeMatch and (IsDirectionalMatch and HasConfig))
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
				contextualText = UseMemoResult2,
				tileRef = UseRefResult,
				titleIcon = if p1.item.tileType == Tile.Recommendation then SocialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if FFlagEnableDesktopGameJoinCard and Config and Presence then ReactModule.createElement(DesktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = UseSignalStateResult or "",
				platformName = UseSignalStateResult1 or "",
				platformProfileId = if FFlagEnableConsoleGameJoinCard then UseMemoResult else nil,
				universeId = tostring(Presence.universeId),
				experienceName = Presence.lastLocation,
				userId = p1.item.id,
				presence = Presence,
				anchorRef = UseRefResult,
				isOpen = HasConfig == true,
				onClose = UseResult3,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = HasConfig1 == true,
				onCardGuiObjectChanged = if FFlagSocialCarouselPressXToViewProfile then UseResult2 else Callback1,
				isFocused = UseGameJoinCardNavigationResult
			}) else nil,
			TileEventHandlers = if FFlagSocialCarouselPressXToViewProfile then ReactModule.createElement(UserTileEventHandlers, {
				tileRef = UseRefResult,
				buttons = if IsUsePreferredInputResultMatch then UseMemoResult3 else nil,
				onTileActivated = function() end
			}) else nil,
			CardEventHandlers = if FFlagSocialCarouselPressXToViewProfile and (IsUsePreferredInputResultMatch and v1) then ReactModule.createElement(UserTileEventHandlers, {
				tileRef = UseRefResult1,
				buttons = UseMemoResult3,
				onTileActivated = function() end
			}) else nil
		})
	else
		local Element = ReactModule.createElement(UserTileModule, CryoModule.Dictionary.join(p1, {
			onActivated = UseResult,
			name = if p1.item.tileType == Tile.Recommendation then UseSignalStateResult1 else UseSignalStateResult,
			contextualText = UseMemoResult2,
			tileRef = UseRefResult,
			titleIcon = if p1.item.tileType == Tile.Recommendation then SocialCarouselVendorImagePath else nil
		}))
		
		return if FFlagSocialCarouselPressXToViewProfile then ReactModule.createElement(ReactModule.Fragment, nil, {
			UserTile = Element,
			TileEventHandlers = ReactModule.createElement(UserTileEventHandlers, {
				tileRef = UseRefResult,
				buttons = if IsUsePreferredInputResultMatch then UseMemoResult3 else nil,
				onTileActivated = function() end
			})
		}) else Element
	end
end