local gameTile = script:FindFirstAncestor("GameTile")
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local formatExperienceThumbnailModule = require(gameTile.formatExperienceThumbnail)
local useIsHoveredTileModule = require(gameTile.useIsHoveredTile)
local useNavigateToGameDetailsModule = require(gameTile.useNavigateToGameDetails)
local gameTileOverflowMenuModule = require(gameTile.GameTileOverflowMenu)
local gameTileThumbnailBadgesModule = require(gameTile.Overlays.GameTileThumbnailBadges)
local getAvailableGameTileOverflowMenuItemsModule = require(gameTile.getAvailableGameTileOverflowMenuItems)
local twoByOneGameTileTelemetryModule = require(gameTile.TwoByOneGameTileTelemetry)
local hiddenTileContentModule = require(gameTile.HiddenGameTile.HiddenTileContent)
local itemLayoutDataParsingUtilsModule = require(gameTile.ItemLayoutDataParsingUtils)
local hoverTileCoordinatorModule = require(gameTile.HoverTileCoordinator)
local parent = gameTile.Parent
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
local _ = require(gameTile.GameTileTypes)
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
local useValidTileBadgesModule = require(gameTile.Overlays.useValidTileBadges)
local useTagAsViewportAutoplayCandidate = require(parent.VideoUtils).useTagAsViewportAutoplayCandidate
local useTagAsSponsoredAdViewabilityCandidate = require(parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local luaAppTwoByOneTileSmallScreenBreakpoint = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local luaAppTwoByOneTileLogoHeightPercentLandscape = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20)
local luaAppTwoByOneTileLogoHeightPercentSquare = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36)
local luaAppTwoByOneTileGradientStartOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30)
local luaAppTwoByOneTileGradientEndOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100)
local luaAppTwoByOneTileGradientWidthPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50)
local fFlagLuaAppSupportSponsoredExplicitFeedback = sharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFixTwoByOneOverflowMenuTelemetry = sharedFlagsModule.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local fFlagLuaAppHomeTouchAutoplay = sharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppTileVideoCandidateOnly = sharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixCustomTileBugs = sharedFlagsModule.FFlagLuaAppFixCustomTileBugs
local fFlagLuaAppSponsoredAdViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local color3 = Color3.new(1, 1, 1)
local color3_1 = Color3.new(0, 0, 0)
local var29 = luaAppTwoByOneTileLogoHeightPercentLandscape / 100
local var30 = luaAppTwoByOneTileLogoHeightPercentSquare / 100
local var31 = luaAppTwoByOneTileGradientStartOpacityPercent / 100
local var32 = luaAppTwoByOneTileGradientEndOpacityPercent / 100
local var33 = luaAppTwoByOneTileGradientWidthPercent / 100
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

return function(p0) --[[ line: 165 ]]
	-- upvalues: useNavigateToGameDetailsModule (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var29 (ref), var30 (ref), useValidTileBadgesModule (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTileModule (ref), sponsoredGamesRecordClick (ref), fFlagLuaAppFixTwoByOneOverflowMenuTelemetry (ref), getOverflowMenuSignalStore (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetryModule (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinatorModule (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), useSelector (ref), gameInfosReducer (ref), getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), impressionsTagUtility (ref), fFlagLuaAppHomeTouchAutoplay (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), fFlagLuaAppFixCustomTileBugs (ref), hiddenTileContentModule (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var33 (ref), color3 (ref), var31 (ref), var32 (ref), color3_1 (ref), gameTileThumbnailBadgesModule (ref), image (ref), playButton (ref), gameTileOverflowMenuModule (ref)
	local large, large_1, headingMedium, bodyMedium, captionMedium, xSmall, medium, size1000, titleMedium
	local var35 = useNavigateToGameDetailsModule()
	local var36 = useRoactService(roactNetworking)
	local var37 = useRoactService(appSessionService)
	local var38 = if p0.ctaText then p0.ctaText else useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	}).joinButtonText
	local tileVariant = t[p0.tileVariant] or t.Default
	local var40 = useTokens()
	local uDim = UDim.new(0, var40.Radius.Medium)
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
		large = var40.Padding.Medium
		large_1 = var40.Padding.Medium
		headingMedium = var40.Typography.TitleLarge
		bodyMedium = var40.Typography.BodySmall
		captionMedium = var40.Typography.CaptionSmall
		xSmall = var40.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var40.Size.Size_800
		titleMedium = var40.Typography.TitleSmall
	else
		large = var40.Padding.Large
		large_1 = var40.Padding.Large
		headingMedium = var40.Typography.HeadingMedium
		bodyMedium = var40.Typography.BodyMedium
		captionMedium = var40.Typography.CaptionMedium
		xSmall = var40.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var40.Size.Size_1000
		titleMedium = var40.Typography.TitleMedium
	end
	local var65
	local var43 = var40.Padding.Large * 4
	local var44 = reactModule.useMemo(function() --[[ line: 212 ]]
		-- upvalues: getTextSize (copy), var38 (ref), titleMedium (write), var43 (ref)
		return UDim.new(0, getTextSize(var38, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var43)
	end, { var38, titleMedium, var43 })
	local var45 = if tileVariant.ctaStyle == "StandardLight" then var40.Color.Extended.White.White_20.Color3 else var40.LightMode.ActionOverMedia.Background.Color3
	local var46 = if tileVariant.ctaStyle == "StandardLight" then var40.Color.Extended.White.White_20.Transparency else var40.LightMode.ActionOverMedia.Background.Transparency
	local var47 = tonumber(p0.logoAspectRatio)
	local var48 = if var47 and var47 > 0 then var47 else 1
	local var49 = if var48 == 3 then var29 else var30
	local universeId = p0.universeId
	local placeId = p0.placeId
	local var50 = useValidTileBadgesModule(universeId, p0.topicId, p0.badgeOverride)
	local hoverKey = p0.hoverKey
	local var51, var52 = reactModule.useState(false)
	local var53 = reactModule.useRef(nil)
	local var54 = useTriggerFeedback()
	local var55 = useOverflowMenuOpen(hoverKey)
	local var56 = useIsHoveredTileModule(var53, hoverKey, true)
	local var57 = reactModule.useRef(false)
	local var58 = reactModule.useCallback(function() --[[ line: 257 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy), var36 (ref)
		if p0.isSponsored and p0.adId then
			sponsoredGamesRecordClick(var36, p0.adId)
		end
	end, { var36, p0.isSponsored, p0.adId })
	local var59 = reactModule.useCallback(function() --[[ line: 263 ]]
		-- upvalues: var57 (ref)
		var57.current = false
	end, {})
	local var60 = if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else reactModule.useCallback(function() --[[ line: 269 ]]
		-- upvalues: var57 (ref), var54 (ref), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var57.current
		var57.current = true
		
		if current == false then
			var54("TwoByOneTileLongPress", "Press", p0.appPage, nil)
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, { hoverKey, p0.appPage, var54 })
	local var61 = reactModule.useCallback(function() --[[ line: 279 ]]
		-- upvalues: p0 (ref), gameCollectionItemTypes (copy), var35 (ref), universeId (ref), twoByOneGameTileTelemetryModule (copy)
		var35(universeId, {
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
		var35, universeId, p0.index, p0.placeIdOverride, p0.launchDataOverride,
		p0.reportGameDetailOpened, p0.adId
	})
	local var62 = reactModule.useCallback(function() --[[ line: 310 ]]
		-- upvalues: var52 (ref), p0 (ref)
		var52(true)
		
		if p0.onSelectionGained then
			p0.onSelectionGained()
		end
	end, { p0.onSelectionGained })
	local var63 = reactModule.useCallback(function() --[[ line: 322 ]]
		-- upvalues: var52 (ref), p0 (ref)
		var52(false)
		
		if p0.onSelectionLost then
			p0.onSelectionLost()
		end
	end, { p0.onSelectionLost })
	local isSponsored = p0.isSponsored
	local var64 = reactModule.useMemo(function() --[[ line: 334 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), isSponsored (ref), fFlagLuaAppSupportSponsoredExplicitFeedback (copy), p0 (ref)
		return getAvailableGameTileOverflowMenuItemsModule({
			isSponsored = isSponsored,
			enableSponsoredFeedback = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableSponsoredFeedback else isSponsored,
			enableReportAd = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableReportAd else isSponsored,
			enableExplicitFeedback = if fFlagLuaAppSupportSponsoredExplicitFeedback then p0.enableExplicitFeedback else nil
		})
	end, {
		isSponsored,
		p0.enableSponsoredFeedback,
		p0.enableReportAd,
		p0.enableExplicitFeedback
	})
	
	if not var56 and not var51 then
		var65 = var55 and next(var64) ~= nil
	end
	local var66 = if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then reactModule.useCallback(function(p1, p2) --[[ line: 350 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), universeId (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = universeId,
			sortId = p0.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage or "Unknown" else nil)
	end, { universeId, p0.appPage, p0.topicId }) else nil
	
	if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then
		var60 = reactModule.useCallback(function() --[[ line: 370 ]]
			-- upvalues: var57 (ref), var64 (ref), var54 (ref), var55 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref), var66 (ref)
			local current = var57.current
			var57.current = true
			
			if current == false and next(var64) ~= nil then
				if var54 and not var55 then
					var54("TwoByOneTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p0.topicId } else nil else nil)
				end
				getOverflowMenuSignalStore().openMenu(hoverKey)
				local t = {}
				
				for i, v in var64 do
					table.insert(t, i)
				end
				var66(false, table.concat(t, ","))
			end
		end, {
			hoverKey, p0.appPage, p0.topicId, var54, var64, var55, universeId, var66
		})
	end
	local var67 = reactModule.useCallback(function() --[[ line: 412 ]]
		-- upvalues: var37 (ref), setGamePlaySession (copy), sessionType (copy), var56 (ref), hoverTileCoordinatorModule (copy), p0 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy)
		if var37 then
			setGamePlaySession(var37, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var56 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched({
				placeId = placeId,
				universeId = universeId,
				adId = p0.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = p0.placeIdOverride,
				launchDataOverride = p0.launchDataOverride
			}, p0.appPage, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p0.index)
		end
	end, {
		var37, p0.reportExperienceLaunched, placeId, universeId, p0.appPage, p0.index,
		p0.adId, p0.placeIdOverride, p0.launchDataOverride, var56
	})
	local var68 = usePlayButtonState(var36, universeId)
	local var69 = useOnPlayButtonCallback(universeId, p0.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p0.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p0.adId
	}, if p0.placeIdOverride then p0.placeIdOverride else p0.placeId)
	local var70 = reactModule.useCallback(function() --[[ line: 469 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var58 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var58()
	end, { var58 })
	local var71 = reactModule.useCallback(function() --[[ line: 475 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var58 (ref), var61 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var58()
		var61()
	end, { var58, var61 })
	local var72 = reactModule.useCallback(function() --[[ line: 481 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var69 (ref), var68 (ref), var67 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		var69(var68.playButtonState, var67)
	end, { var69, var68.playButtonState, var67 })
	local var73 = reactModule.useCallback(function() --[[ line: 493 ]]
		-- upvalues: var57 (ref), var56 (ref), hoverTileCoordinatorModule (copy), twoByOneGameTileTelemetryModule (copy), var58 (ref), tileVariant (ref), var61 (ref), var72 (ref)
		if var57.current then
			var57.current = false
			
			return
		elseif var56 then
			hoverTileCoordinatorModule.default:reset()
		end
		twoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		var58()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var61()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var72()
		end
	end, {
		var56,
		tileVariant.onTileActivation,
		var61,
		var72,
		var58
	})
	local var74 = useSelector(function(p3) --[[ line: 521 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p3.Personalization[gameInfosReducer.key][universeId]
	end)
	local var75 = formatExperienceThumbnailModule((if p0.primaryWideImageAssetId then p0.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(getGameTileLayoutDataModule(var74, p0.topicId))) or (if var74 then var74.primaryWideAssetId else nil), placeId, true)
	local var76 = if var74 then var74.ageRecommendationDisplayName else nil
	local var77 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 535 ]]
		-- upvalues: impressionsTagUtility (copy), var77 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var77, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 537 ]]
			-- upvalues: impressionsTagUtility (copy), var77 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var77, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	
	if fFlagLuaAppHomeTouchAutoplay then
		useTagAsViewportAutoplayCandidate(var77, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	end
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var77, if p0.isSponsored and p0.adId ~= nil and not p0.isHidden then {
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	return if fFlagLuaAppSupportSponsoredExplicitFeedback and p0.isHidden then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = if fFlagLuaAppHomeTouchAutoplay then var77 else nil
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p0.size or UDim2.fromScale(1, 1),
			ref = var53,
			SelectionOrder = if fFlagLuaAppFixCustomTileBugs then p0.SelectionOrder else nil
		}, {
			HiddenTileContent = reactModule.createElement(hiddenTileContentModule, {
				appPage = p0.appPage,
				collectionId = p0.topicId,
				setGameHidden = p0.setGameHidden,
				universeId = universeId,
				parentRef = var53,
				isSponsored = isSponsored
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = var77
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			Size = p0.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = var53,
			SelectionOrder = if fFlagLuaAppFixCustomTileBugs then p0.SelectionOrder else nil,
			[reactModule.Event.TouchLongPress] = var60,
			[reactModule.Event.Activated] = var73,
			[reactModule.Event.SelectionGained] = var62,
			[reactModule.Event.SelectionLost] = var63,
			[reactModule.Change.GuiState] = var59
		}, {
			BackgroundImage = reactModule.createElement("ImageLabel", {
				[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = var75,
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
				Size = UDim2.new(var33, 0, 1, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientLeft = reactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var31),
						NumberSequenceKeypoint.new(1, var32)
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
				Size = UDim2.new(1, 0, var33, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientBottom = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var32),
						NumberSequenceKeypoint.new(1, var31)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_1),
						ColorSequenceKeypoint.new(1, color3_1)
					})
				})
			}),
			TileBadge = var50 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var50 })
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
					Size = UDim2.new(1, 0, var49, 0),
					aspectRatio = var48
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
						universeId = universeId,
						placeId = if p0.placeIdOverride then p0.placeIdOverride else placeId,
						referralSource = p0.appPage,
						playableText = var38,
						buttonSize = medium,
						width = var44,
						onActivated = var70,
						reportExperienceLaunched = var67,
						experienceJoinData = if p0.launchDataOverride then { launchData = p0.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
					Size = UDim2.new(var44.Scale, var44.Offset, 0, size1000),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = var45,
					BackgroundTransparency = var46,
					Text = var38,
					TextColor3 = var40.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize,
					[reactModule.Event.Activated] = var71
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var40.Radius.Medium) })
				}),
				BottomRightLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
					Text = var76,
					TextSize = captionMedium.FontSize,
					Font = captionMedium.Font,
					TextColor3 = var40.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenuContainer = var65 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Size = UDim2.fromScale(1, 1)
			}, {
				OverflowMenu = reactModule.createElement(gameTileOverflowMenuModule, {
					isHovered = var56,
					isSelected = if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then var51 else nil,
					universeId = universeId,
					collectionId = p0.topicId,
					appPage = p0.appPage,
					setGameHidden = p0.setGameHidden or function() --[[ line: 817 ]] end,
					menuKey = hoverKey,
					menuOpen = var55,
					onMenuOpenChanged = if fFlagLuaAppFixTwoByOneOverflowMenuTelemetry then var66 else nil,
					parentRef = var53,
					isSponsored = p0.isSponsored,
					payerName = p0.payerName,
					sponsoredUserCohort = p0.sponsoredUserCohort,
					adId = p0.adId,
					availableMenuItems = var64
				})
			})
		})
	})
end