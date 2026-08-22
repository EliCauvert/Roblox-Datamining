local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameTileModule = require(parent.GameTile)
local getGameTileLayoutData = gameTileModule.getGameTileLayoutData
local formatExperienceThumbnail = gameTileModule.formatExperienceThumbnail
local useIsHoveredTile = gameTileModule.useIsHoveredTile
local useNavigateToGameDetails = gameTileModule.useNavigateToGameDetails
local gameTileContextualActions = gameTileModule.GameTileContextualActions
local gameTileOverflowMenu = gameTileModule.GameTileOverflowMenu
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local getAvailableGameTileOverflowMenuItems = gameTileModule.getAvailableGameTileOverflowMenuItems
local spanTileOverflowMenuModule = require(sponsoredTiles.SpanTileOverflowMenu.SpanTileOverflowMenu)
local twoByOneGameTileTelemetryModule = require(sponsoredTiles.TwoByOneGameTileTelemetry)
local hiddenTileContent = gameTileModule.HiddenTileContent
local itemLayoutDataParsingUtils = gameTileModule.ItemLayoutDataParsingUtils
local hoverTileCoordinator = gameTileModule.HoverTileCoordinator
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local image = foundationModule.Image
local responsiveModule = require(parent.Responsive)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local appBloxModule = require(parent.AppBlox)
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local useOverflowMenuOpen = appBloxModule.useOverflowMenuOpen
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local getTextSize = require(parent.Style).GetTextSize
local playButton = require(parent.GamePlayButton).PlayButton
local useOnPlayButtonCallback = require(parent.GamePlayButton).useOnPlayButtonCallback
local usePlayButtonState = require(parent.GamePlayButton).usePlayButtonState
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactNetworking = roactServiceTagsModule.RoactNetworking
local appSessionService = roactServiceTagsModule.AppSessionService
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local sharedFlagsModule = require(parent.SharedFlags)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local useValidTileBadges = gameTileModule.useValidTileBadges
local useTagAsViewportAutoplayCandidate = require(parent.VideoUtils).useTagAsViewportAutoplayCandidate
local useTagAsSponsoredAdViewabilityCandidate = require(parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local luaAppTwoByOneTileSmallScreenBreakpoint = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local luaAppTwoByOneTileLogoHeightPercentLandscape = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20)
local luaAppTwoByOneTileLogoHeightPercentSquare = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36)
local luaAppTwoByOneTileGradientStartOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30)
local luaAppTwoByOneTileGradientEndOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100)
local luaAppTwoByOneTileGradientWidthPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50)
local luaAppUseSpanTileOverflowMenuTwoByOne2 = game:DefineFastFlag("LuaAppUseSpanTileOverflowMenuTwoByOne2", false)
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppTileVideoCandidateOnly = sharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppSponsoredAdViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHomeThumbnailPrefetch = sharedFlagsModule.FFlagLuaAppHomeThumbnailPrefetch
local fFlagLuaAppGameTileNotInterestedDirectAction = sharedFlagsModule.FFlagLuaAppGameTileNotInterestedDirectAction
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local var19 = if fFlagLuaAppHomeThumbnailPrefetch then gameTileModule.resolveGameTileThumbnailUri else nil
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local color3 = Color3.new(1, 1, 1)
local color3_1 = Color3.new(0, 0, 0)
local var22 = luaAppTwoByOneTileLogoHeightPercentLandscape / 100
local var23 = luaAppTwoByOneTileLogoHeightPercentSquare / 100
local var24 = luaAppTwoByOneTileGradientStartOpacityPercent / 100
local var25 = luaAppTwoByOneTileGradientEndOpacityPercent / 100
local var26 = luaAppTwoByOneTileGradientWidthPercent / 100
local _ = { JoinGame = "JoinGame", OpenEdp = "OpenEdp" }
local _ = { StandardLight = "StandardLight", OverMedia = "OverMedia" }
local t = {
	Default = {
		ctaStyle = nil,
		onCtaActivation = "JoinGame",
		onTileActivation = "OpenEdp"
	},
	Variant1 = {
		ctaStyle = nil,
		onCtaActivation = nil,
		onTileActivation = "JoinGame"
	},
	Variant2 = {
		ctaStyle = "StandardLight",
		onCtaActivation = "OpenEdp",
		onTileActivation = "JoinGame"
	},
	Variant3 = {
		ctaStyle = "OverMedia",
		onCtaActivation = "OpenEdp",
		onTileActivation = "JoinGame"
	}
}

return function(p0) --[[ line: 175 ]]
	-- upvalues: useNavigateToGameDetails (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var22 (ref), var23 (ref), useValidTileBadges (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTile (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetryModule (ref), getAvailableGameTileOverflowMenuItems (ref), luaAppUseSpanTileOverflowMenuTwoByOne2 (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), fFlagMigrateGameInfoToStore (ref), useSelector (ref), gameInfosReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var19 (ref), formatExperienceThumbnail (ref), getGameTileLayoutData (ref), itemLayoutDataParsingUtils (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), hiddenTileContent (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var26 (ref), color3 (ref), var24 (ref), var25 (ref), color3_1 (ref), gameTileThumbnailBadges (ref), image (ref), playButton (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActions (ref), gameTileOverflowMenu (ref)
	local large, large_1, headingMedium, bodyMedium, captionMedium, xSmall, medium, size1000, titleMedium
	local var28 = useNavigateToGameDetails()
	local var29 = useRoactService(roactNetworking)
	local var30 = useRoactService(appSessionService)
	local var31 = if p0.ctaText then p0.ctaText else useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	}).joinButtonText
	local tileVariant = t[p0.tileVariant] or t.Default
	local var33 = useTokens()
	local uDim = UDim.new(0, var33.Radius.Medium)
	local isSmaller = responsiveModule.useResponsive({
		{
			Key = "Smaller",
			maxWidth = luaAppTwoByOneTileSmallScreenBreakpoint
		}
	}) == "Smaller"
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if isSmaller then
		large = var33.Padding.Medium
		large_1 = var33.Padding.Medium
		headingMedium = var33.Typography.TitleLarge
		bodyMedium = var33.Typography.BodySmall
		captionMedium = var33.Typography.CaptionSmall
		xSmall = var33.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var33.Size.Size_800
		titleMedium = var33.Typography.TitleSmall
	else
		large = var33.Padding.Large
		large_1 = var33.Padding.Large
		headingMedium = var33.Typography.HeadingMedium
		bodyMedium = var33.Typography.BodyMedium
		captionMedium = var33.Typography.CaptionMedium
		xSmall = var33.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var33.Size.Size_1000
		titleMedium = var33.Typography.TitleMedium
	end
	local var57
	local var36 = var33.Padding.Large * 4
	local var37 = reactModule.useMemo(function() --[[ line: 222 ]]
		-- upvalues: getTextSize (copy), var31 (ref), titleMedium (write), var36 (ref)
		return UDim.new(0, getTextSize(var31, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var36)
	end, { var31, titleMedium, var36 })
	local var38 = if tileVariant.ctaStyle == "StandardLight" then var33.Color.Extended.White.White_20.Color3 else var33.LightMode.ActionOverMedia.Background.Color3
	local var39 = if tileVariant.ctaStyle == "StandardLight" then var33.Color.Extended.White.White_20.Transparency else var33.LightMode.ActionOverMedia.Background.Transparency
	local var40 = tonumber(p0.logoAspectRatio)
	local var41 = if var40 and var40 > 0 then var40 else 1
	local var42 = if var41 == 3 then var22 else var23
	local universeId = p0.universeId
	local placeId = p0.placeId
	local var43 = useValidTileBadges(universeId, p0.topicId, p0.badgeOverride)
	local hoverKey = p0.hoverKey
	local var44, var45 = reactModule.useState(false)
	local var46 = reactModule.useRef(nil)
	local var47 = useTriggerFeedback()
	local var48 = useOverflowMenuOpen(hoverKey)
	local var49 = useIsHoveredTile(var46, hoverKey, true)
	local var50 = reactModule.useRef(false)
	local var51 = reactModule.useCallback(function() --[[ line: 267 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy), var29 (ref)
		if p0.isSponsored and p0.adId then
			sponsoredGamesRecordClick(var29, p0.adId)
		end
	end, { var29, p0.isSponsored, p0.adId })
	local var52 = reactModule.useCallback(function() --[[ line: 273 ]]
		-- upvalues: var50 (ref)
		var50.current = false
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 278 ]]
		-- upvalues: p0 (ref), gameCollectionItemTypes (copy), var28 (ref), universeId (ref), twoByOneGameTileTelemetryModule (copy)
		var28(universeId, {
			index = p0.index,
			placeIdOverride = p0.placeIdOverride,
			experienceJoinData = {
				launchData = if p0.launchDataOverride then p0.launchDataOverride else nil,
				tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				nativeAdData = p0.adId
			}
		})
		twoByOneGameTileTelemetryModule.logTwoByOneTileViewGameDetailsActivated()
		
		if p0.reportGameDetailOpened then
			p0.reportGameDetailOpened(p0.index, universeId)
		end
	end, {
		var28, universeId, p0.index, p0.placeIdOverride, p0.launchDataOverride,
		p0.reportGameDetailOpened, p0.adId
	})
	local var54 = reactModule.useCallback(function() --[[ line: 309 ]]
		-- upvalues: var45 (ref), p0 (ref)
		var45(true)
		
		if p0.onSelectionGained then
			p0.onSelectionGained()
		end
	end, { p0.onSelectionGained })
	local var55 = reactModule.useCallback(function() --[[ line: 321 ]]
		-- upvalues: var45 (ref), p0 (ref)
		var45(false)
		
		if p0.onSelectionLost then
			p0.onSelectionLost()
		end
	end, { p0.onSelectionLost })
	local isSponsored = p0.isSponsored
	local var56 = reactModule.useMemo(function() --[[ line: 333 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), isSponsored (ref), p0 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = isSponsored,
			enableSponsoredFeedback = p0.enableSponsoredFeedback,
			enableReportAd = p0.enableReportAd,
			enableExplicitFeedback = p0.enableExplicitFeedback
		})
	end, {
		isSponsored,
		p0.enableSponsoredFeedback,
		p0.enableReportAd,
		p0.enableExplicitFeedback
	})
	
	if luaAppUseSpanTileOverflowMenuTwoByOne2 then
		var57 = nil
	elseif not var49 and not var44 then
		var57 = var48 and next(var56) ~= nil
	end
	local var58 = if luaAppUseSpanTileOverflowMenuTwoByOne2 then nil else reactModule.useCallback(function(p1, p2) --[[ line: 348 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), universeId (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = universeId,
			sortId = p0.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage or "Unknown" else nil)
	end, { universeId, p0.appPage, p0.topicId })
	local var59 = reactModule.useCallback(function() --[[ line: 366 ]]
		-- upvalues: var50 (ref), var56 (ref), var47 (ref), var48 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref), luaAppUseSpanTileOverflowMenuTwoByOne2 (copy), var58 (ref)
		local current = var50.current
		var50.current = true
		
		if current == false and next(var56) ~= nil then
			if var47 and not var48 then
				var47("TwoByOneTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p0.topicId } else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
			
			if not luaAppUseSpanTileOverflowMenuTwoByOne2 then
				local t = {}
				
				for i, v in var56 do
					table.insert(t, i)
				end
				var58(false, table.concat(t, ","))
			end
		end
	end, {
		hoverKey, p0.appPage, p0.topicId, var47, var56, var48, universeId,
		if luaAppUseSpanTileOverflowMenuTwoByOne2 then nil else var58
	})
	local var60 = reactModule.useCallback(function(p3) --[[ line: 409 ]]
		-- upvalues: var30 (ref), setGamePlaySession (copy), sessionType (copy), var49 (ref), hoverTileCoordinator (copy), p0 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var30 then
			setGamePlaySession(var30, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var49 then
			hoverTileCoordinator.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched({
				placeId = placeId,
				universeId = universeId,
				adId = p0.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = p0.placeIdOverride,
				launchDataOverride = p0.launchDataOverride
			}, p0.appPage, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p0.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
		end
	end, {
		var30, p0.reportExperienceLaunched, placeId, universeId, p0.appPage, p0.index,
		p0.adId, p0.placeIdOverride, p0.launchDataOverride, var49
	})
	local var61 = usePlayButtonState(var29, universeId)
	local var62 = useOnPlayButtonCallback(universeId, p0.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p0.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p0.adId
	}, if p0.placeIdOverride then p0.placeIdOverride else p0.placeId)
	local var63 = reactModule.useCallback(function() --[[ line: 467 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var51 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var51()
	end, { var51 })
	local var64 = reactModule.useCallback(function() --[[ line: 473 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var51 (ref), var53 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var51()
		var53()
	end, { var51, var53 })
	local var65 = reactModule.useCallback(function() --[[ line: 479 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var62 (ref), var61 (ref), var60 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		var62(var61.playButtonState, var60)
	end, { var62, var61.playButtonState, var60 })
	local var66 = reactModule.useCallback(function() --[[ line: 491 ]]
		-- upvalues: var50 (ref), var49 (ref), hoverTileCoordinator (copy), twoByOneGameTileTelemetryModule (copy), var51 (ref), tileVariant (ref), var53 (ref), var65 (ref)
		if var50.current then
			var50.current = false
			
			return
		elseif var49 then
			hoverTileCoordinator.default:reset()
		end
		twoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		var51()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var53()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var65()
		end
	end, {
		var49,
		tileVariant.onTileActivation,
		var53,
		var65,
		var51
	})
	local var67 = if fFlagMigrateGameInfoToStore then nil else useSelector(function(p4) --[[ line: 523 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p4.Personalization[gameInfosReducer.key][universeId]
	end)
	local _ = nil
	local var68 = if fFlagLuaAppHomeThumbnailPrefetch then var19({
		useGridTile = true,
		isEmphasized = true,
		placeId = placeId,
		perEntryWideAssetId = if fFlagMigrateGameInfoToStore then p0.wideAssetId else p0.primaryWideImageAssetId,
		game = if fFlagMigrateGameInfoToStore then nil else var67,
		topicId = p0.topicId
	}) elseif fFlagMigrateGameInfoToStore then formatExperienceThumbnail(p0.wideAssetId, placeId, true) else formatExperienceThumbnail((if p0.primaryWideImageAssetId then p0.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(getGameTileLayoutData(var67, p0.topicId))) or (if var67 then var67.primaryWideAssetId else nil), placeId, true)
	local var69 = if fFlagMigrateGameInfoToStore then p0.ageRatingLabel elseif var67 then var67.ageRecommendationDisplayName else nil
	local var70 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 558 ]]
		-- upvalues: impressionsTagUtility (copy), var70 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var70, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 560 ]]
			-- upvalues: impressionsTagUtility (copy), var70 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var70, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	useTagAsViewportAutoplayCandidate(var70, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var70, if p0.isSponsored and p0.adId ~= nil and not p0.isHidden then if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
			mediaType = "image",
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else {
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	return if p0.isHidden then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = var70
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p0.size or UDim2.fromScale(1, 1),
			ref = var46,
			SelectionOrder = p0.SelectionOrder
		}, {
			HiddenTileContent = reactModule.createElement(hiddenTileContent, {
				appPage = p0.appPage,
				collectionId = p0.topicId,
				setGameHidden = p0.setGameHidden,
				universeId = universeId,
				parentRef = var46,
				isSponsored = isSponsored
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = var70
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			Size = p0.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = var46,
			SelectionOrder = p0.SelectionOrder,
			[reactModule.Event.TouchLongPress] = var59,
			[reactModule.Event.Activated] = var66,
			[reactModule.Event.SelectionGained] = var54,
			[reactModule.Event.SelectionLost] = var55,
			[reactModule.Change.GuiState] = var52
		}, {
			BackgroundImage = reactModule.createElement("ImageLabel", {
				[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = var68,
				ScaleType = Enum.ScaleType.Crop,
				ZIndex = 0
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim })
			}),
			GradientOverlayLeft = reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(var26, 0, 1, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientLeft = reactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var24),
						NumberSequenceKeypoint.new(1, var25)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_1),
						ColorSequenceKeypoint.new(1, color3_1)
					})
				})
			}),
			GradientOverlayBottom = reactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, var26, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientBottom = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var25),
						NumberSequenceKeypoint.new(1, var24)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_1),
						ColorSequenceKeypoint.new(1, color3_1)
					})
				})
			}),
			TileBadge = var43 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var43 })
			}),
			ContentOverlay = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, large),
					PaddingRight = UDim.new(0, large),
					PaddingTop = UDim.new(0, large_1),
					PaddingBottom = UDim.new(0, large_1)
				}),
				Logo = p0.logoImageAssetId and reactModule.createElement(image, {
					Position = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(1, 0),
					Image = "rbxassetid://" .. tostring(p0.logoImageAssetId),
					Size = UDim2.new(1, 0, var42, 0),
					aspectRatio = var41
				}),
				HeaderFrame = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0.47, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}, {
					UIListLayout = reactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, xSmall)
					}),
					Headline = reactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p0.headline or "",
						Font = headingMedium.Font,
						TextSize = headingMedium.FontSize,
						TextColor3 = color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}),
					Subtitle = reactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p0.subtitle or "",
						Font = bodyMedium.Font,
						TextSize = bodyMedium.FontSize,
						TextColor3 = color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					})
				}),
				JoinButtonContainer = tileVariant.onCtaActivation == "JoinGame" and reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					JoinButton = reactModule.createElement(playButton, {
						eventContext = "TwoByOneTile",
						launchSource = "TwoByOneTile",
						hidePlayableIcon = true,
						preferSecondaryPlayButton = true,
						universeId = universeId,
						placeId = if p0.placeIdOverride then p0.placeIdOverride else placeId,
						referralSource = p0.appPage,
						playableText = var31,
						buttonSize = medium,
						width = var37,
						onActivated = var63,
						reportExperienceLaunched = var60,
						experienceJoinData = if p0.launchDataOverride then { launchData = p0.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
					Size = UDim2.new(var37.Scale, var37.Offset, 0, size1000),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = var38,
					BackgroundTransparency = var39,
					Text = var31,
					TextColor3 = var33.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize,
					[reactModule.Event.Activated] = var64
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var33.Radius.Medium) })
				}),
				BottomRightLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
					Text = var69,
					TextSize = captionMedium.FontSize,
					Font = captionMedium.Font,
					TextColor3 = var33.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenu = if luaAppUseSpanTileOverflowMenuTwoByOne2 then reactModule.createElement(spanTileOverflowMenuModule, {
				zIndex = 4,
				hoverKey = hoverKey,
				parentRef = var46,
				universeId = universeId,
				placeId = if fFlagLuaAppNotInterestedReportPlaceId then placeId else nil,
				adId = p0.adId,
				payerName = p0.payerName,
				sponsoredUserCohort = p0.sponsoredUserCohort,
				appPage = p0.appPage,
				topicId = p0.topicId,
				isSponsored = p0.isSponsored,
				setGameHidden = p0.setGameHidden or function() --[[ line: 847 ]] end,
				isHovered = var49,
				isSelected = var44,
				availableMenuItems = var56
			}) else nil,
			OverflowMenuContainer = if not luaAppUseSpanTileOverflowMenuTwoByOne2 then var57 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Size = UDim2.fromScale(1, 1)
			}, {
				OverflowMenu = reactModule.createElement(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActions else gameTileOverflowMenu, {
					isHovered = var49,
					isSelected = var44,
					universeId = universeId,
					placeId = if fFlagLuaAppNotInterestedReportPlaceId then placeId else nil,
					collectionId = p0.topicId,
					appPage = p0.appPage,
					setGameHidden = p0.setGameHidden or function() --[[ line: 870 ]] end,
					menuKey = hoverKey,
					menuOpen = var48,
					onMenuOpenChanged = var58,
					parentRef = var46,
					isSponsored = p0.isSponsored,
					payerName = p0.payerName,
					sponsoredUserCohort = p0.sponsoredUserCohort,
					adId = p0.adId,
					availableMenuItems = var56
				})
			}) else nil
		})
	})
end