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
local fFlagLuaAppFixExplicitFeedbackTelemetry = sharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppTileVideoCandidateOnly = sharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppSponsoredAdViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local fFlagLuaAppDemoModePlayButton = sharedFlagsModule.FFlagLuaAppDemoModePlayButton
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHomeThumbnailPrefetch = sharedFlagsModule.FFlagLuaAppHomeThumbnailPrefetch
local var27 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil
local gameTileOverflowMenuAction = discoveryAnalyticsModule.Events.gameTileOverflowMenuAction
local color3 = Color3.new(1, 1, 1)
local color3_1 = Color3.new(0, 0, 0)
local var30 = luaAppTwoByOneTileLogoHeightPercentLandscape / 100
local var31 = luaAppTwoByOneTileLogoHeightPercentSquare / 100
local var32 = luaAppTwoByOneTileGradientStartOpacityPercent / 100
local var33 = luaAppTwoByOneTileGradientEndOpacityPercent / 100
local var34 = luaAppTwoByOneTileGradientWidthPercent / 100
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

return function(p0) --[[ line: 167 ]]
	-- upvalues: useNavigateToGameDetailsModule (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var30 (ref), var31 (ref), useValidTileBadgesModule (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTileModule (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetryModule (ref), getAvailableGameTileOverflowMenuItemsModule (ref), fFlagLuaAppFixExplicitFeedbackTelemetry (ref), gameTileOverflowMenuAction (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinatorModule (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), useSelector (ref), gameInfosReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var27 (ref), getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), hiddenTileContentModule (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var34 (ref), color3 (ref), var32 (ref), var33 (ref), color3_1 (ref), gameTileThumbnailBadgesModule (ref), image (ref), playButton (ref), fFlagLuaAppDemoModePlayButton (ref), gameTileOverflowMenuModule (ref)
	local large, large_1, headingMedium, bodyMedium, captionMedium, xSmall, medium, size1000, titleMedium
	local var36 = useNavigateToGameDetailsModule()
	local var37 = useRoactService(roactNetworking)
	local var38 = useRoactService(appSessionService)
	local var39 = if p0.ctaText then p0.ctaText else useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	}).joinButtonText
	local tileVariant = t[p0.tileVariant] or t.Default
	local var41 = useTokens()
	local uDim = UDim.new(0, var41.Radius.Medium)
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
		large = var41.Padding.Medium
		large_1 = var41.Padding.Medium
		headingMedium = var41.Typography.TitleLarge
		bodyMedium = var41.Typography.BodySmall
		captionMedium = var41.Typography.CaptionSmall
		xSmall = var41.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var41.Size.Size_800
		titleMedium = var41.Typography.TitleSmall
	else
		large = var41.Padding.Large
		large_1 = var41.Padding.Large
		headingMedium = var41.Typography.HeadingMedium
		bodyMedium = var41.Typography.BodyMedium
		captionMedium = var41.Typography.CaptionMedium
		xSmall = var41.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var41.Size.Size_1000
		titleMedium = var41.Typography.TitleMedium
	end
	local var65
	local var44 = var41.Padding.Large * 4
	local var45 = reactModule.useMemo(function() --[[ line: 214 ]]
		-- upvalues: getTextSize (copy), var39 (ref), titleMedium (write), var44 (ref)
		return UDim.new(0, getTextSize(var39, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var44)
	end, { var39, titleMedium, var44 })
	local var46 = if tileVariant.ctaStyle == "StandardLight" then var41.Color.Extended.White.White_20.Color3 else var41.LightMode.ActionOverMedia.Background.Color3
	local var47 = if tileVariant.ctaStyle == "StandardLight" then var41.Color.Extended.White.White_20.Transparency else var41.LightMode.ActionOverMedia.Background.Transparency
	local var48 = tonumber(p0.logoAspectRatio)
	local var49 = if var48 and var48 > 0 then var48 else 1
	local var50 = if var49 == 3 then var30 else var31
	local universeId = p0.universeId
	local placeId = p0.placeId
	local var51 = useValidTileBadgesModule(universeId, p0.topicId, p0.badgeOverride)
	local hoverKey = p0.hoverKey
	local var52, var53 = reactModule.useState(false)
	local var54 = reactModule.useRef(nil)
	local var55 = useTriggerFeedback()
	local var56 = useOverflowMenuOpen(hoverKey)
	local var57 = useIsHoveredTileModule(var54, hoverKey, true)
	local var58 = reactModule.useRef(false)
	local var59 = reactModule.useCallback(function() --[[ line: 259 ]]
		-- upvalues: p0 (ref), sponsoredGamesRecordClick (copy), var37 (ref)
		if p0.isSponsored and p0.adId then
			sponsoredGamesRecordClick(var37, p0.adId)
		end
	end, { var37, p0.isSponsored, p0.adId })
	local var60 = reactModule.useCallback(function() --[[ line: 265 ]]
		-- upvalues: var58 (ref)
		var58.current = false
	end, {})
	local var61 = reactModule.useCallback(function() --[[ line: 270 ]]
		-- upvalues: p0 (ref), gameCollectionItemTypes (copy), var36 (ref), universeId (ref), twoByOneGameTileTelemetryModule (copy)
		var36(universeId, {
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
		var36, universeId, p0.index, p0.placeIdOverride, p0.launchDataOverride,
		p0.reportGameDetailOpened, p0.adId
	})
	local var62 = reactModule.useCallback(function() --[[ line: 301 ]]
		-- upvalues: var53 (ref), p0 (ref)
		var53(true)
		
		if p0.onSelectionGained then
			p0.onSelectionGained()
		end
	end, { p0.onSelectionGained })
	local var63 = reactModule.useCallback(function() --[[ line: 313 ]]
		-- upvalues: var53 (ref), p0 (ref)
		var53(false)
		
		if p0.onSelectionLost then
			p0.onSelectionLost()
		end
	end, { p0.onSelectionLost })
	local isSponsored = p0.isSponsored
	local var64 = reactModule.useMemo(function() --[[ line: 325 ]]
		-- upvalues: getAvailableGameTileOverflowMenuItemsModule (copy), isSponsored (ref), p0 (ref)
		return getAvailableGameTileOverflowMenuItemsModule({
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
	
	if not var57 and not var52 then
		var65 = var56 and next(var64) ~= nil
	end
	local var66 = reactModule.useCallback(function(p1, p2) --[[ line: 337 ]]
		-- upvalues: fFlagLuaAppFixExplicitFeedbackTelemetry (copy), p0 (ref), universeId (ref), gameTileOverflowMenuAction (copy)
		gameTileOverflowMenuAction({
			ctx = if fFlagLuaAppFixExplicitFeedbackTelemetry then nil else p0.appPage,
			universeId = universeId,
			sortId = p0.topicId,
			actionType = if p1 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = p2
		}, if fFlagLuaAppFixExplicitFeedbackTelemetry then p0.appPage or "Unknown" else nil)
	end, { universeId, p0.appPage, p0.topicId })
	local var67 = reactModule.useCallback(function() --[[ line: 357 ]]
		-- upvalues: var58 (ref), var64 (ref), var55 (ref), var56 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), p0 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref), var66 (ref)
		local current = var58.current
		var58.current = true
		
		if current == false and next(var64) ~= nil then
			if var55 and not var56 then
				var55("TwoByOneTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p0.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p0.topicId } else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
			local t = {}
			
			for i, v in var64 do
				table.insert(t, i)
			end
			var66(false, table.concat(t, ","))
		end
	end, {
		hoverKey, p0.appPage, p0.topicId, var55, var64, var56, universeId, var66
	})
	local var68 = reactModule.useCallback(function(p3) --[[ line: 398 ]]
		-- upvalues: var38 (ref), setGamePlaySession (copy), sessionType (copy), var57 (ref), hoverTileCoordinatorModule (copy), p0 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var38 then
			setGamePlaySession(var38, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var57 then
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
			}, p0.appPage, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p0.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p3 else nil)
		end
	end, {
		var38, p0.reportExperienceLaunched, placeId, universeId, p0.appPage, p0.index,
		p0.adId, p0.placeIdOverride, p0.launchDataOverride, var57
	})
	local var69 = usePlayButtonState(var37, universeId)
	local var70 = useOnPlayButtonCallback(universeId, p0.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p0.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p0.adId
	}, if p0.placeIdOverride then p0.placeIdOverride else p0.placeId)
	local var71 = reactModule.useCallback(function() --[[ line: 456 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var59 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var59()
	end, { var59 })
	local var72 = reactModule.useCallback(function() --[[ line: 462 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var59 (ref), var61 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var59()
		var61()
	end, { var59, var61 })
	local var73 = reactModule.useCallback(function() --[[ line: 468 ]]
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var70 (ref), var69 (ref), var68 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		var70(var69.playButtonState, var68)
	end, { var70, var69.playButtonState, var68 })
	local var74 = reactModule.useCallback(function() --[[ line: 480 ]]
		-- upvalues: var58 (ref), var57 (ref), hoverTileCoordinatorModule (copy), twoByOneGameTileTelemetryModule (copy), var59 (ref), tileVariant (ref), var61 (ref), var73 (ref)
		if var58.current then
			var58.current = false
			
			return
		elseif var57 then
			hoverTileCoordinatorModule.default:reset()
		end
		twoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		var59()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var61()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var73()
		end
	end, {
		var57,
		tileVariant.onTileActivation,
		var61,
		var73,
		var59
	})
	local var75 = useSelector(function(p4) --[[ line: 508 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p4.Personalization[gameInfosReducer.key][universeId]
	end)
	local _ = nil
	local var76 = if fFlagLuaAppHomeThumbnailPrefetch then var27({
		useGridTile = true,
		isEmphasized = true,
		placeId = placeId,
		perEntryWideAssetId = p0.primaryWideImageAssetId,
		game = var75,
		topicId = p0.topicId
	}) else formatExperienceThumbnailModule((if p0.primaryWideImageAssetId then p0.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(getGameTileLayoutDataModule(var75, p0.topicId))) or (if var75 then var75.primaryWideAssetId else nil), placeId, true)
	local var77 = if var75 then var75.ageRecommendationDisplayName else nil
	local var78 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 534 ]]
		-- upvalues: impressionsTagUtility (copy), var78 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var78, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 536 ]]
			-- upvalues: impressionsTagUtility (copy), var78 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var78, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	useTagAsViewportAutoplayCandidate(var78, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var78, if p0.isSponsored and p0.adId ~= nil and not p0.isHidden then {
			encryptedAdTrackingData = p0.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	return if p0.isHidden then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = var78
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p0.size or UDim2.fromScale(1, 1),
			ref = var54,
			SelectionOrder = p0.SelectionOrder
		}, {
			HiddenTileContent = reactModule.createElement(hiddenTileContentModule, {
				appPage = p0.appPage,
				collectionId = p0.topicId,
				setGameHidden = p0.setGameHidden,
				universeId = universeId,
				parentRef = var54,
				isSponsored = isSponsored
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex,
		ref = var78
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			Size = p0.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = var54,
			SelectionOrder = p0.SelectionOrder,
			[reactModule.Event.TouchLongPress] = var67,
			[reactModule.Event.Activated] = var74,
			[reactModule.Event.SelectionGained] = var62,
			[reactModule.Event.SelectionLost] = var63,
			[reactModule.Change.GuiState] = var60
		}, {
			BackgroundImage = reactModule.createElement("ImageLabel", {
				[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = var76,
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
				Size = UDim2.new(var34, 0, 1, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientLeft = reactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var32),
						NumberSequenceKeypoint.new(1, var33)
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
				Size = UDim2.new(1, 0, var34, 0),
				BackgroundColor3 = color3
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
				UIGradientBottom = reactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, var33),
						NumberSequenceKeypoint.new(1, var32)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, color3_1),
						ColorSequenceKeypoint.new(1, color3_1)
					})
				})
			}),
			TileBadge = var51 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var51 })
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
					Size = UDim2.new(1, 0, var50, 0),
					aspectRatio = var49
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
						playableText = var39,
						buttonSize = medium,
						width = var45,
						preferSecondaryPlayButton = if fFlagLuaAppDemoModePlayButton then true else nil,
						onActivated = var71,
						reportExperienceLaunched = var68,
						experienceJoinData = if p0.launchDataOverride then { launchData = p0.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
					Size = UDim2.new(var45.Scale, var45.Offset, 0, size1000),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = var46,
					BackgroundTransparency = var47,
					Text = var39,
					TextColor3 = var41.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize,
					[reactModule.Event.Activated] = var72
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var41.Radius.Medium) })
				}),
				BottomRightLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
					Text = var77,
					TextSize = captionMedium.FontSize,
					Font = captionMedium.Font,
					TextColor3 = var41.Color.Extended.Gray.Gray_400.Color3,
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
					isHovered = var57,
					isSelected = var52,
					universeId = universeId,
					collectionId = p0.topicId,
					appPage = p0.appPage,
					setGameHidden = p0.setGameHidden or function() --[[ line: 815 ]] end,
					menuKey = hoverKey,
					menuOpen = var56,
					onMenuOpenChanged = var66,
					parentRef = var54,
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