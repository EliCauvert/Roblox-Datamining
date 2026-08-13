local IXPService = game:GetService("IXPService")
local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local cryoModule = require(parent.Cryo)
local foundationModule = require(parent.Foundation)
local gameJoinCardModule = require(parent.GameJoinCard)
local playerContextualMenuModule = require(parent.PlayerContextualMenu)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local userProfilesModule = require(parent.UserProfiles)
local socialCommonModule = require(parent.SocialCommon)
local enums = require(parent.FriendsNetworking).Enums
local fFlagSocialCarouselUseProfileStore = require(parent.SharedFlags).FFlagSocialCarouselUseProfileStore
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local var13 = userProfilesModule.Stores.UserProfileStore.get()
local presenceTypes = socialCommonModule.Enums.PresenceTypes
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay
local enums_1 = require(parent.SocialLuaAnalytics).Analytics.Enums
local enumsModule = require(socialCarousel.Common.Enums)
local localizationModule = require(parent.Localization)
local useSocialCarouselAnalyticsModule = require(socialCarousel.Analytics.useSocialCarouselAnalytics)
local usePreferredInput = responsiveModule.usePreferredInput
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local useNavigation = require(parent.Navigation).useNavigation
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local view = foundationModule.View
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local appPage = robloxAppEnumsModule.AppPage
local useLocalization = localizationModule.Hooks.useLocalization
local tile = enumsModule.Tile
local userTileModule = require(script.Parent.UserTile)
local userTileEventHandlers = require(parent.UserTile).UserTileEventHandlers
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local constantsModule = require(socialCarousel.Common.Constants)
local useSocialCarouselContextModule = require(socialCarousel.Contexts.useSocialCarouselContext)
local desktopGameJoinCardContainer = gameJoinCardModule.DesktopGameJoinCardContainer
local useGameJoinCardNavigation = gameJoinCardModule.useGameJoinCardNavigation
local gameJoinCardTTI = gameJoinCardModule.Telemetry.GameJoinCardTTI
local socialCarouselVendorImagePath = game:DefineFastString("SocialCarouselVendorImagePath", "rbxasset://textures/ui/Shell/Icons/PlatformLogo.png")
local fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(parent.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local fFlagPPVEnabledOnConsole = require(parent.SharedFlags).FFlagPPVEnabledOnConsole
local fFlagSocialCarouselPressXToViewProfile = require(parent.SharedFlags).FFlagSocialCarouselPressXToViewProfile
local fFlagEnableSplitPane = require(parent.SharedFlags).FFlagEnableSplitPane
local fFlagSocialCarouselEnableUserSeenEventsModule = require(socialCarousel.Flags.FFlagSocialCarouselEnableUserSeenEvents)
local fFlagSocialCarouselFixConsoleCtaForInGameModule = require(socialCarousel.Flags.FFlagSocialCarouselFixConsoleCtaForInGame)
local fFlagSocialCarouselUseConsolePolicyForCtaModule = require(socialCarousel.Flags.FFlagSocialCarouselUseConsolePolicyForCta)
local fFlagEnableDesktopGameJoinCard = require(parent.SharedFlags).FFlagEnableDesktopGameJoinCard
local fFlagEnableMobileGameJoinCard = require(parent.SharedFlags).FFlagEnableMobileGameJoinCard
local fFlagEnableConsoleGameJoinCard = require(parent.SharedFlags).FFlagEnableConsoleGameJoinCard
local fFlagMobileGameJoinCardTTITracking = require(parent.SharedFlags).FFlagMobileGameJoinCardTTITracking
local fFlagDeprecatePeopleListContextualMenu = require(parent.SharedFlags).FFlagDeprecatePeopleListContextualMenu
local enableFriendCarouselInGameFriendExposureLoggingV2 = game:DefineFastFlag("EnableFriendCarouselInGameFriendExposureLogging_v2", false)
local socialViewFriendSortInGameFriendsLayer = game:DefineFastString("SocialViewFriendSortInGameFriendsLayer", "Social.ViewFriendSortInGameFriends")

local _ = function(p0) --[[ line: 99 ]]
	-- upvalues: tile (ref)
	return if p0.tileType == tile.Recommendation then if p0.isFriendWithUser then Enum.FriendStatus.Friend elseif p0.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif p0.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
end

return function(p1) --[[ line: 115 ]]
	-- upvalues: reactModule (ref), useDispatch (ref), useNavigation (ref), fFlagEnableMobileGameJoinCard (ref), fFlagEnableDesktopGameJoinCard (ref), fFlagSocialCarouselPressXToViewProfile (ref), usePreferredInput (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (ref), fFlagPPVEnabledOnConsole (ref), fFlagEnableConsoleGameJoinCard (ref), responsiveModule (ref), fFlagSocialCarouselUseConsolePolicyForCtaModule (ref), useAppPolicy (ref), useSocialCarouselContextModule (ref), useSocialCarouselAnalyticsModule (ref), useLocalization (ref), fFlagSocialCarouselUseProfileStore (ref), var13 (ref), signalsModule (ref), signalsReactModule (ref), userProfilesModule (ref), presenceTypes (ref), playerContextualMenuModule (ref), tile (ref), enums (ref), enableFriendCarouselInGameFriendExposureLoggingV2 (ref), IXPService (ref), socialViewFriendSortInGameFriendsLayer (ref), fFlagMobileGameJoinCardTTITracking (ref), gameJoinCardTTI (ref), appPage (ref), fFlagDeprecatePeopleListContextualMenu (ref), setCentralOverlay (ref), centralOverlayType (ref), enumsModule (ref), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (ref), enums_1 (ref), fFlagEnableSplitPane (ref), focusNavigationEventNameEnum (ref), constantsModule (ref), fFlagSocialCarouselEnableUserSeenEventsModule (ref), useGameJoinCardNavigation (ref), userTileModule (ref), cryoModule (ref), socialCarouselVendorImagePath (ref), view (ref), foundationModule (ref), desktopGameJoinCardContainer (ref), userTileEventHandlers (ref)
	local var26 = reactModule.useRef(nil)
	local var27 = useDispatch()
	local var28 = useNavigation()
	local var29 = if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then usePreferredInput() else nil
	local var30 = false
	
	if fFlagSocialCarouselFixConsoleCtaForInGameModule or not fFlagPPVEnabledOnConsole or fFlagEnableConsoleGameJoinCard then
		var30 = (if fFlagEnableMobileGameJoinCard or fFlagEnableDesktopGameJoinCard or fFlagSocialCarouselPressXToViewProfile then var29 else usePreferredInput()) == responsiveModule.Input.Directional
	end
	local var32
	local var31 = if fFlagSocialCarouselUseConsolePolicyForCtaModule then useAppPolicy(function(p2) --[[ line: 145 ]]
		return p2.getUseConsoleGameJoinCard()
	end) else var30
	
	if fFlagSocialCarouselPressXToViewProfile then
		var32 = var29 == responsiveModule.Input.Directional
		var32 = nil
	else
		var32 = false
	end
	local var39, var40
	local var33 = useSocialCarouselContextModule()
	local var34 = useSocialCarouselAnalyticsModule()
	local var35 = useLocalization({ suggestedLabel = "Feature.Friends.Label.Suggested" })
	local var36 = if p1.item.presence then {
		locationString = p1.item.presence.lastLocation,
		locationPlaceId = p1.item.presence.placeId,
		locationRootPlaceId = p1.item.presence.rootPlaceId,
		locationUniverseId = p1.item.presence.universeId,
		status = p1.item.presence.userPresenceType
	} else nil
	local _ = nil
	local _ = nil
	local var37 = nil
	
	if fFlagSocialCarouselUseProfileStore then
		local var41 = reactModule.useMemo(function() --[[ line: 173 ]]
			-- upvalues: var13 (copy), p1 (ref)
			return var13.fetchNamesByUserIds({ p1.item.id })
		end, { p1.item.id })
		var39 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 177 ]]
			-- upvalues: signalsModule (copy), var41 (ref)
			return signalsModule.createComputed(function(p3) --[[ line: 178 ]]
				-- upvalues: var41 (copy)
				local var62 = var41(p3)
				local var63 = var62 and (var62.data and var62.data[1])
				
				return if var63 and var63.names then var63.names.getCombinedName(p3) else nil
			end)
		end, { var41 }))
		var40 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 185 ]]
			-- upvalues: signalsModule (copy), var41 (ref)
			return signalsModule.createComputed(function(p4) --[[ line: 186 ]]
				-- upvalues: var41 (copy)
				local var64 = var41(p4)
				local var65 = var64 and (var64.data and var64.data[1])
				
				return if var65 and var65.names then var65.names.getPlatformName(p4) else nil
			end)
		end, { var41 }))
		
		if fFlagEnableConsoleGameJoinCard then
			var37 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 197 ]]
				-- upvalues: signalsModule (copy), var41 (ref)
				return signalsModule.createComputed(function(p5) --[[ line: 198 ]]
					-- upvalues: var41 (copy)
					local var66 = var41(p5)
					local var67 = var66 and (var66.data and var66.data[1])
					
					return if var67 then var67.getPlatformProfileId(p5) else nil
				end)
			end, { var41 }))
		end
	else
		local var38 = userProfilesModule.Hooks.useUserProfilesFetch({
			userIds = { p1.item.id },
			query = if fFlagEnableConsoleGameJoinCard then userProfilesModule.Queries.userProfilesDisplayUserPlatformNamesByUserIds else userProfilesModule.Queries.userProfilesCombinedAndPlatformByUserIds
		})
		var39 = reactModule.useMemo(function() --[[ line: 221 ]]
			-- upvalues: var38 (ref), userProfilesModule (copy), p1 (ref)
			return if var38.data then userProfilesModule.Selectors.getCombinedNameFromId(var38.data, p1.item.id) else nil
		end, { var38.data })
		var40 = reactModule.useMemo(function() --[[ line: 229 ]]
			-- upvalues: var38 (ref), userProfilesModule (copy), p1 (ref)
			return if var38.data then userProfilesModule.Selectors.getPlatformNameFromId(var38.data, p1.item.id) else nil
		end, { var38.data })
		
		if fFlagEnableConsoleGameJoinCard then
			var37 = reactModule.useMemo(function() --[[ line: 238 ]]
				-- upvalues: var38 (ref), userProfilesModule (copy), p1 (ref)
				return if var38.data then userProfilesModule.Selectors.getPlatformProfileIdFromId(var38.data, p1.item.id) else nil
			end, { var38.data, p1.item.id })
		end
	end
	local var42 = nil
	local var43 = nil
	
	if fFlagEnableDesktopGameJoinCard or fFlagEnableConsoleGameJoinCard then
		local var44, var45 = reactModule.useState(false)
		var42 = var44
		var43 = var45
		local setOpenGameJoinCardUserId = var33.setOpenGameJoinCardUserId
		
		if setOpenGameJoinCardUserId then
			var42 = var33.openGameJoinCardUserId == p1.item.id
			
			var43 = function(p6) --[[ line: 255 ]]
				-- upvalues: setOpenGameJoinCardUserId (ref), p1 (ref)
				if p6 then
					setOpenGameJoinCardUserId(p1.item.id)
					
					return
				end
				setOpenGameJoinCardUserId(function(p7) --[[ line: 259 ]]
					-- upvalues: p1 (copy)
					return if p7 == p1.item.id then nil else p7
				end)
			end
		end
	end
	local var46 = reactModule.useCallback(function(p8) --[[ line: 270 ]]
		-- upvalues: p1 (ref), fFlagSocialCarouselFixConsoleCtaForInGameModule (copy), presenceTypes (copy), var31 (write), fFlagPPVEnabledOnConsole (copy), var27 (ref), playerContextualMenuModule (copy), var36 (ref), tile (copy), enums (copy), enableFriendCarouselInGameFriendExposureLoggingV2 (copy), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy), fFlagEnableMobileGameJoinCard (copy), var29 (ref), responsiveModule (copy), fFlagMobileGameJoinCardTTITracking (copy), gameJoinCardTTI (copy), var28 (ref), appPage (copy), fFlagEnableDesktopGameJoinCard (copy), var43 (write), var42 (write), fFlagDeprecatePeopleListContextualMenu (copy), setCentralOverlay (copy), centralOverlayType (copy), var39 (write), enumsModule (copy), fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), enums_1 (copy), fFlagEnableSplitPane (copy), var34 (ref)
		if p1.item.onActivated then
			p1.item.onActivated(p1.item)
		else
			local _ = nil
			
			if if fFlagSocialCarouselFixConsoleCtaForInGameModule then var31 and (not fFlagPPVEnabledOnConsole or (p1.item.presence ~= nil and p1.item.presence.userPresenceType == presenceTypes.InGame)) else not fFlagPPVEnabledOnConsole and var31 then
				local var68 = var27
				local openPlayerContextualMenu = playerContextualMenuModule.openPlayerContextualMenu
				local t = { subjectUserId = p1.item.id, subjectPresence = var36 }
				local item = p1.item
				t.robloxFriendshipStatus = if item.tileType ~= tile.Recommendation then if item.isFriendWithUser then Enum.FriendStatus.Friend elseif item.hasIncomingFriendRequest then Enum.FriendStatus.FriendRequestReceived elseif item.hasPendingFriendRequest then Enum.FriendStatus.FriendRequestSent else Enum.FriendStatus.NotFriend else Enum.FriendStatus.Friend
				t.friendshipOriginSourceType = enums.FriendshipOriginSourceType.FriendRecommendations.rawValue()
				var68(openPlayerContextualMenu(t))
			elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then
				if enableFriendCarouselInGameFriendExposureLoggingV2 then
					IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
				end
				if fFlagEnableMobileGameJoinCard and var29 == responsiveModule.Input.Touch then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackMobileCardClickStart()
					end
					var28.navigate(appPage.GameJoinCard, {
						userId = p1.item.id,
						homepageCarouselAbsolutePosition = p1.index
					})
				elseif fFlagEnableDesktopGameJoinCard then
					var43(not var42)
				elseif not fFlagDeprecatePeopleListContextualMenu then
					if fFlagMobileGameJoinCardTTITracking then
						gameJoinCardTTI.trackPeopleListClickStart()
					end
					var27(setCentralOverlay(centralOverlayType.PeopleList, {
						user = {
							id = p1.item.id,
							combinedName = var39,
							presence = enumsModule.OldPresence.IN_GAME,
							universeId = p1.item.presence.universeId,
							rootPlaceId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.rootPlaceId else nil,
							placeId = if fFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.item.presence.placeId else nil,
							gameInstanceId = p1.item.presence.gameId,
							lastLocation = p1.item.presence.lastLocation
						},
						positionIndex = p1.index,
						absolutePosition = p1.index,
						anchorSpaceSize = p8.AbsoluteSize,
						anchorSpacePosition = p8.AbsolutePosition,
						source = enums_1.Sources.HomePageFriendsCarousel
					}))
				end
			else
				(if fFlagEnableSplitPane then var28.push else var28.navigate)(appPage.ProfilePlatform, {
					detail = p1.item.id,
					extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
				})
			end
		end
		var34.userPressed(p1.item, { absolutePosition = p1.index })
	end, { p1.item, var42 })
	local var47 = reactModule.useMemo(function() --[[ line: 347 ]]
		-- upvalues: p1 (ref), tile (copy), var35 (ref), presenceTypes (copy)
		return if p1.item.tileType == tile.Recommendation then var35.suggestedLabel elseif p1.item.presence and p1.item.presence.userPresenceType == presenceTypes.InGame then p1.item.presence.lastLocation else nil
	end, { p1.item })
	local var48 = nil
	local var49 = nil
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var50, var51 = reactModule.useState(nil)
		var48 = var50
		var49 = var51
	end
	local var52 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useRef(nil) else nil
	local var53 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function() --[[ line: 365 ]]
		-- upvalues: fFlagEnableSplitPane (copy), var28 (ref), appPage (copy), p1 (ref), enums_1 (copy), var34 (ref)
		;(if fFlagEnableSplitPane then var28.push else var28.navigate)(appPage.ProfilePlatform, {
			detail = p1.item.id,
			extraProps = { source = enums_1.Sources.HomePageFriendsCarousel }
		})
		var34.userPressed(p1.item, { absolutePosition = p1.index })
	end, {
		p1.item,
		p1.index,
		var28.navigate,
		var28.push,
		var34.userPressed
	}) else nil
	local var54 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useMemo(function() --[[ line: 382 ]]
		-- upvalues: var53 (ref), focusNavigationEventNameEnum (copy)
		return {
			{
				onActivated = var53,
				focusEventName = focusNavigationEventNameEnum.ViewProfile
			},
			{ onActivated = function() --[[ line: 388 ]] end }
		}
	end, { var53 }) else nil
	local var55 = if fFlagSocialCarouselPressXToViewProfile then reactModule.useCallback(function(p9) --[[ line: 394 ]]
		-- upvalues: var52 (ref), var49 (write)
		var52.current = p9
		
		if var49 then
			var49(p9)
		end
	end, { var49 }) else nil
	reactModule.useEffect(function() --[[ line: 402 ]]
		-- upvalues: var33 (ref), var26 (ref), p1 (ref)
		if var33.unifiedLogging then
			var33.unifiedLogging.tagTileForImpressions(var26, p1.index)
		end
	end, { p1.index })
	reactModule.useEffect(function() --[[ line: 408 ]]
		-- upvalues: var33 (ref), constantsModule (copy), fFlagSocialCarouselEnableUserSeenEventsModule (copy), var34 (ref), p1 (ref)
		var33.onSuccessfulRender(constantsModule.ANALYTICS.UI_LOADING_EVENTS.CAROUSEL_FRIEND)
		
		if fFlagSocialCarouselEnableUserSeenEventsModule then
			var34.userSeen(p1.item, { absolutePosition = p1.index })
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 417 ]]
		-- upvalues: p1 (ref)
		if p1.onTileContentChanged then
			p1.onTileContentChanged(p1.item.id, p1.index)
		end
	end, { p1.item.id, p1.index })
	
	if fFlagEnableDesktopGameJoinCard or enableFriendCarouselInGameFriendExposureLoggingV2 then
		local var59
		local var56 = reactModule.useCallback(function() --[[ line: 424 ]]
			-- upvalues: var43 (write)
			if var43 then
				var43(false)
			end
		end, {})
		local var57 = if fFlagEnableConsoleGameJoinCard then useGameJoinCardNavigation(var48, var30, var26) else false
		local presence = p1.item.presence
		local var58 = presence and presence.userPresenceType == presenceTypes.InGame
		
		if not var42 then
			var59 = var57 and (var58 and var36 ~= nil)
		end
		local var59_1 = fFlagEnableConsoleGameJoinCard and (var58 and (var30 and var59))
		reactModule.useEffect(function() --[[ line: 440 ]]
			-- upvalues: enableFriendCarouselInGameFriendExposureLoggingV2 (copy), var59 (ref), IXPService (copy), socialViewFriendSortInGameFriendsLayer (copy)
			if enableFriendCarouselInGameFriendExposureLoggingV2 and var59 then
				IXPService:LogFlagLinkedUserLayerExposure(socialViewFriendSortInGameFriendsLayer)
			end
		end, { var59 })
		
		return reactModule.createElement(view, {
			BackgroundTransparency = 1,
			Size = p1.itemSize,
			LayoutOrder = p1.index,
			ref = var26,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			}
		}, {
			UserTile = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
				itemSize = UDim2.fromScale(1, 1),
				onActivated = var46,
				name = if p1.item.tileType == tile.Recommendation then var40 else var39,
				contextualText = var47,
				tileRef = var26,
				titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
			})),
			GameJoinCardPopover = if fFlagEnableDesktopGameJoinCard and var36 and presence then reactModule.createElement(desktopGameJoinCardContainer, {
				layoutOrder = 1,
				playerName = var39 or "",
				platformName = var40 or "",
				platformProfileId = if fFlagEnableConsoleGameJoinCard then var37 else nil,
				universeId = tostring(presence.universeId),
				experienceName = presence.lastLocation,
				userId = p1.item.id,
				presence = presence,
				anchorRef = var26,
				isOpen = var59 == true,
				onClose = var56,
				homepageCarouselAbsolutePosition = p1.index,
				showGamepadJoinFocus = var59_1 == true,
				onCardGuiObjectChanged = if fFlagSocialCarouselPressXToViewProfile then var55 else var49,
				isFocused = var57
			}) else nil,
			TileEventHandlers = if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(userTileEventHandlers, {
				tileRef = var26,
				buttons = if var32 then var54 else nil,
				onTileActivated = function() --[[ line: 494 ]] end
			}) else nil,
			CardEventHandlers = if fFlagSocialCarouselPressXToViewProfile and var32 and var48 then reactModule.createElement(userTileEventHandlers, {
				tileRef = var52,
				buttons = var54,
				onTileActivated = function() --[[ line: 503 ]] end
			}) else nil
		})
	else
		local var61 = reactModule.createElement(userTileModule, cryoModule.Dictionary.join(p1, {
			onActivated = var46,
			name = if p1.item.tileType == tile.Recommendation then var40 else var39,
			contextualText = var47,
			tileRef = var26,
			titleIcon = if p1.item.tileType == tile.Recommendation then socialCarouselVendorImagePath else nil
		}))
		
		return if fFlagSocialCarouselPressXToViewProfile then reactModule.createElement(reactModule.Fragment, nil, {
			UserTile = var61,
			TileEventHandlers = reactModule.createElement(userTileEventHandlers, {
				tileRef = var26,
				buttons = if var32 then var54 else nil,
				onTileActivated = function() --[[ line: 526 ]] end
			})
		}) else var61
	end
end