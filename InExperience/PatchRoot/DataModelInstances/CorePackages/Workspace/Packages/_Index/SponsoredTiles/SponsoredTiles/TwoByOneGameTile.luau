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
local var1 = if fFlagLuaAppHomeThumbnailPrefetch then gameTileModule.resolveGameTileThumbnailUri else nil
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local color3 = Color3.new(1, 1, 1)
local color3_1 = Color3.new(0, 0, 0)
local var2 = luaAppTwoByOneTileLogoHeightPercentLandscape / 100
local var3 = luaAppTwoByOneTileLogoHeightPercentSquare / 100
local var4 = luaAppTwoByOneTileGradientStartOpacityPercent / 100
local var5 = luaAppTwoByOneTileGradientEndOpacityPercent / 100
local var6 = luaAppTwoByOneTileGradientWidthPercent / 100
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

return function(p1)
	-- upvalues: useNavigateToGameDetails (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var2 (ref), var3 (ref), useValidTileBadges (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTile (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetryModule (ref), getAvailableGameTileOverflowMenuItems (ref), luaAppUseSpanTileOverflowMenuTwoByOne2 (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), fFlagMigrateGameInfoToStore (ref), useSelector (ref), gameInfosReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var1 (ref), formatExperienceThumbnail (ref), getGameTileLayoutData (ref), itemLayoutDataParsingUtils (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), hiddenTileContent (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var6 (ref), color3 (ref), var4 (ref), var5 (ref), color3_1 (ref), gameTileThumbnailBadges (ref), image (ref), playButton (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), fFlagLuaAppGameTileNotInterestedDirectAction (ref), gameTileContextualActions (ref), gameTileOverflowMenu (ref)
	local large, large_1, headingMedium, bodyMedium, captionMedium, xSmall, medium, size1000, titleMedium
	local var7 = useNavigateToGameDetails()
	local var8 = useRoactService(roactNetworking)
	local var9 = useRoactService(appSessionService)
	local var10 = if p1.ctaText then p1.ctaText else useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	}).joinButtonText
	local tileVariant = t[p1.tileVariant] or t.Default
	local var11 = useTokens()
	local uDim = UDim.new(0, var11.Radius.Medium)
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
		large = var11.Padding.Medium
		large_1 = var11.Padding.Medium
		headingMedium = var11.Typography.TitleLarge
		bodyMedium = var11.Typography.BodySmall
		captionMedium = var11.Typography.CaptionSmall
		xSmall = var11.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var11.Size.Size_800
		titleMedium = var11.Typography.TitleSmall
	else
		large = var11.Padding.Large
		large_1 = var11.Padding.Large
		headingMedium = var11.Typography.HeadingMedium
		bodyMedium = var11.Typography.BodyMedium
		captionMedium = var11.Typography.CaptionMedium
		xSmall = var11.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var11.Size.Size_1000
		titleMedium = var11.Typography.TitleMedium
	end
	local var12
	local var13 = var11.Padding.Large * 4
	local var14 = reactModule.useMemo(function()
		-- upvalues: getTextSize (copy), var10 (ref), titleMedium (write), var13 (ref)
		return UDim.new(0, getTextSize(var10, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var13)
	end, { var10, titleMedium, var13 })
	local var15 = if tileVariant.ctaStyle == "StandardLight" then var11.Color.Extended.White.White_20.Color3 else var11.LightMode.ActionOverMedia.Background.Color3
	local var16 = if tileVariant.ctaStyle == "StandardLight" then var11.Color.Extended.White.White_20.Transparency else var11.LightMode.ActionOverMedia.Background.Transparency
	local var17 = tonumber(p1.logoAspectRatio)
	local var18 = if var17 and var17 > 0 then var17 else 1
	local var19 = if var18 == 3 then var2 else var3
	local universeId = p1.universeId
	local placeId = p1.placeId
	local var20 = useValidTileBadges(universeId, p1.topicId, p1.badgeOverride)
	local hoverKey = p1.hoverKey
	local var21, var22 = reactModule.useState(false)
	local var23 = reactModule.useRef(nil)
	local var24 = useTriggerFeedback()
	local var25 = useOverflowMenuOpen(hoverKey)
	local var26 = useIsHoveredTile(var23, hoverKey, true)
	local var27 = reactModule.useRef(false)
	local var28 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sponsoredGamesRecordClick (copy), var8 (ref)
		if p1.isSponsored and p1.adId then
			sponsoredGamesRecordClick(var8, p1.adId)
		end
	end, { var8, p1.isSponsored, p1.adId })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var27 (ref)
		var27.current = false
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), gameCollectionItemTypes (copy), var7 (ref), universeId (ref), twoByOneGameTileTelemetryModule (copy)
		var7(universeId, {
			index = p1.index,
			placeIdOverride = p1.placeIdOverride,
			experienceJoinData = {
				launchData = if p1.launchDataOverride then p1.launchDataOverride else nil,
				tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				nativeAdData = p1.adId
			}
		})
		twoByOneGameTileTelemetryModule.logTwoByOneTileViewGameDetailsActivated()
		
		if p1.reportGameDetailOpened then
			p1.reportGameDetailOpened(p1.index, universeId)
		end
	end, {
		var7, universeId, p1.index, p1.placeIdOverride, p1.launchDataOverride,
		p1.reportGameDetailOpened, p1.adId
	})
	local var31 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), p1 (ref)
		var22(true)
		
		if p1.onSelectionGained then
			p1.onSelectionGained()
		end
	end, { p1.onSelectionGained })
	local var32 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), p1 (ref)
		var22(false)
		
		if p1.onSelectionLost then
			p1.onSelectionLost()
		end
	end, { p1.onSelectionLost })
	local isSponsored = p1.isSponsored
	local var33 = reactModule.useMemo(function()
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), isSponsored (ref), p1 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = isSponsored,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableExplicitFeedback = p1.enableExplicitFeedback
		})
	end, {
		isSponsored,
		p1.enableSponsoredFeedback,
		p1.enableReportAd,
		p1.enableExplicitFeedback
	})
	
	if luaAppUseSpanTileOverflowMenuTwoByOne2 then
		var12 = nil
	elseif not var26 and not var21 then
		var12 = var25 and next(var33) ~= nil
	end
	local var34 = if luaAppUseSpanTileOverflowMenuTwoByOne2 then nil else reactModule.useCallback(function(p2, p3)
		-- upvalues: universeId (ref), p1 (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			universeId = universeId,
			sortId = p1.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p3
		}, p1.appPage or "Unknown")
	end, { universeId, p1.appPage, p1.topicId })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var33 (ref), var24 (ref), var25 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), p1 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref), luaAppUseSpanTileOverflowMenuTwoByOne2 (copy), var34 (ref)
		local current = var27.current
		var27.current = true
		
		if current == false and next(var33) ~= nil then
			if var24 and not var25 then
				var24("TwoByOneTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p1.topicId } else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
			
			if not luaAppUseSpanTileOverflowMenuTwoByOne2 then
				local t = {}
				
				for i, v in var33 do
					table.insert(t, i)
				end
				var34(false, table.concat(t, ","))
			end
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, var24, var33, var25, universeId,
		if luaAppUseSpanTileOverflowMenuTwoByOne2 then nil else var34
	})
	local var36 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), setGamePlaySession (copy), sessionType (copy), var26 (ref), hoverTileCoordinator (copy), p1 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var9 then
			setGamePlaySession(var9, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var26 then
			hoverTileCoordinator.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = placeId,
				universeId = universeId,
				adId = p1.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.appPage, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p1.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end
	end, {
		var9, p1.reportExperienceLaunched, placeId, universeId, p1.appPage, p1.index,
		p1.adId, p1.placeIdOverride, p1.launchDataOverride, var26
	})
	local var37 = usePlayButtonState(var8, universeId)
	local var38 = useOnPlayButtonCallback(universeId, p1.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p1.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p1.adId
	}, if p1.placeIdOverride then p1.placeIdOverride else p1.placeId)
	local var39 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var28 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var28()
	end, { var28 })
	local var40 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var28 (ref), var30 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var28()
		var30()
	end, { var28, var30 })
	local var41 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var38 (ref), var37 (ref), var36 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		var38(var37.playButtonState, var36)
	end, { var38, var37.playButtonState, var36 })
	local var42 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var26 (ref), hoverTileCoordinator (copy), twoByOneGameTileTelemetryModule (copy), var28 (ref), tileVariant (ref), var30 (ref), var41 (ref)
		if var27.current then
			var27.current = false
			
			return
		elseif var26 then
			hoverTileCoordinator.default:reset()
		end
		twoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		var28()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var30()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var41()
		end
	end, {
		var26,
		tileVariant.onTileActivation,
		var30,
		var41,
		var28
	})
	local var43 = if fFlagMigrateGameInfoToStore then nil else useSelector(function(p2)
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p2.Personalization[gameInfosReducer.key][universeId]
	end)
	local _ = nil
	local var44 = if fFlagLuaAppHomeThumbnailPrefetch then var1({
		useGridTile = true,
		isEmphasized = true,
		placeId = placeId,
		perEntryWideAssetId = if fFlagMigrateGameInfoToStore then p1.wideAssetId else p1.primaryWideImageAssetId,
		game = if fFlagMigrateGameInfoToStore then nil else var43,
		topicId = p1.topicId
	}) elseif fFlagMigrateGameInfoToStore then formatExperienceThumbnail(p1.wideAssetId, placeId, true) else formatExperienceThumbnail((if p1.primaryWideImageAssetId then p1.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(getGameTileLayoutData(var43, p1.topicId))) or (if var43 then var43.primaryWideAssetId else nil), placeId, true)
	local var45 = if fFlagMigrateGameInfoToStore then p1.ageRatingLabel elseif var43 then var43.ageRecommendationDisplayName else nil
	local var46 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var46 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var46, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var46 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var46, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	useTagAsViewportAutoplayCandidate(var46, p1.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var46, if p1.isSponsored and p1.adId ~= nil and not p1.isHidden then if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
			mediaType = "image",
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else {
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	return if p1.isHidden then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = var46
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p1.size or UDim2.fromScale(1, 1),
			ref = var23,
			SelectionOrder = p1.SelectionOrder
		}, {
			HiddenTileContent = reactModule.createElement(hiddenTileContent, {
				appPage = p1.appPage,
				collectionId = p1.topicId,
				setGameHidden = p1.setGameHidden,
				universeId = universeId,
				parentRef = var23,
				isSponsored = isSponsored
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = var46
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			Size = p1.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = var23,
			SelectionOrder = p1.SelectionOrder,
			[reactModule.Event.TouchLongPress] = var35,
			[reactModule.Event.Activated] = var42,
			[reactModule.Event.SelectionGained] = var31,
			[reactModule.Event.SelectionLost] = var32,
			[reactModule.Change.GuiState] = var29
		}, {
			BackgroundImage = reactModule.createElement("ImageLabel", {
				[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = var44,
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
				Size = UDim2.new(var6, 0, 1, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientLeft = reactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var4),
						NumberSequenceKeypoint.new(1, var5)
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
				Size = UDim2.new(1, 0, var6, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientBottom = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var5),
						NumberSequenceKeypoint.new(1, var4)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_1),
						ColorSequenceKeypoint.new(1, color3_1)
					})
				})
			}),
			TileBadge = var20 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var20 })
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
				Logo = p1.logoImageAssetId and reactModule.createElement(image, {
					Position = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(1, 0),
					Image = "rbxassetid://" .. tostring(p1.logoImageAssetId),
					Size = UDim2.new(1, 0, var19, 0),
					aspectRatio = var18
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
						Text = p1.headline or "",
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
						Text = p1.subtitle or "",
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
						placeId = if p1.placeIdOverride then p1.placeIdOverride else placeId,
						referralSource = p1.appPage,
						playableText = var10,
						buttonSize = medium,
						width = var14,
						onActivated = var39,
						reportExperienceLaunched = var36,
						experienceJoinData = if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
					Size = UDim2.new(var14.Scale, var14.Offset, 0, size1000),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = var15,
					BackgroundTransparency = var16,
					Text = var10,
					TextColor3 = var11.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize,
					[reactModule.Event.Activated] = var40
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var11.Radius.Medium) })
				}),
				BottomRightLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
					Text = var45,
					TextSize = captionMedium.FontSize,
					Font = captionMedium.Font,
					TextColor3 = var11.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenu = if luaAppUseSpanTileOverflowMenuTwoByOne2 then reactModule.createElement(spanTileOverflowMenuModule, {
				zIndex = 4,
				hoverKey = hoverKey,
				parentRef = var23,
				universeId = universeId,
				placeId = if fFlagLuaAppNotInterestedReportPlaceId then placeId else nil,
				adId = p1.adId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				appPage = p1.appPage,
				topicId = p1.topicId,
				isSponsored = p1.isSponsored,
				setGameHidden = p1.setGameHidden or function() end,
				isHovered = var26,
				isSelected = var21,
				availableMenuItems = var33
			}) else nil,
			OverflowMenuContainer = if not luaAppUseSpanTileOverflowMenuTwoByOne2 then var12 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Size = UDim2.fromScale(1, 1)
			}, {
				OverflowMenu = reactModule.createElement(if fFlagLuaAppGameTileNotInterestedDirectAction then gameTileContextualActions else gameTileOverflowMenu, {
					isHovered = var26,
					isSelected = var21,
					universeId = universeId,
					placeId = if fFlagLuaAppNotInterestedReportPlaceId then placeId else nil,
					collectionId = p1.topicId,
					appPage = p1.appPage,
					setGameHidden = p1.setGameHidden or function() end,
					menuKey = hoverKey,
					menuOpen = var25,
					onMenuOpenChanged = var34,
					parentRef = var23,
					isSponsored = p1.isSponsored,
					payerName = p1.payerName,
					sponsoredUserCohort = p1.sponsoredUserCohort,
					adId = p1.adId,
					availableMenuItems = var33
				})
			}) else nil
		})
	})
end