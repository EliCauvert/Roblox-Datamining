local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameTileModule = require(parent.GameTile)
local getGameTileLayoutData = gameTileModule.getGameTileLayoutData
local formatExperienceThumbnail = gameTileModule.formatExperienceThumbnail
local useIsHoveredTile = gameTileModule.useIsHoveredTile
local useNavigateToGameDetails = gameTileModule.useNavigateToGameDetails
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
local sponsoredGamesRecordClick = require(parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
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
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppTileVideoCandidateOnly = sharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppSponsoredAdViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHomeThumbnailPrefetch = sharedFlagsModule.FFlagLuaAppHomeThumbnailPrefetch
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppSduiSponsoredTwoByOneTile = sharedFlagsModule.FFlagLuaAppSduiSponsoredTwoByOneTile
local var1 = if fFlagLuaAppHomeThumbnailPrefetch then gameTileModule.resolveGameTileThumbnailUri else nil
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
	-- upvalues: useNavigateToGameDetails (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var2 (ref), var3 (ref), useValidTileBadges (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTile (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetryModule (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), fFlagMigrateGameInfoToStore (ref), useSelector (ref), gameInfosReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var1 (ref), formatExperienceThumbnail (ref), getGameTileLayoutData (ref), itemLayoutDataParsingUtils (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), hiddenTileContent (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var6 (ref), color3 (ref), var4 (ref), var5 (ref), color3_1 (ref), gameTileThumbnailBadges (ref), image (ref), playButton (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref)
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
	local var12 = var11.Padding.Large * 4
	local var13 = reactModule.useMemo(function()
		-- upvalues: getTextSize (copy), var10 (ref), titleMedium (write), var12 (ref)
		return UDim.new(0, getTextSize(var10, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var12)
	end, { var10, titleMedium, var12 })
	local var14 = if tileVariant.ctaStyle == "StandardLight" then var11.Color.Extended.White.White_20.Color3 else var11.LightMode.ActionOverMedia.Background.Color3
	local var15 = if tileVariant.ctaStyle == "StandardLight" then var11.Color.Extended.White.White_20.Transparency else var11.LightMode.ActionOverMedia.Background.Transparency
	local var16 = tonumber(p1.logoAspectRatio)
	local var17 = if var16 and var16 > 0 then var16 else 1
	local var18 = if var17 == 3 then var2 else var3
	local universeId = p1.universeId
	local placeId = p1.placeId
	local var19 = useValidTileBadges(universeId, p1.topicId, p1.badgeOverride)
	local hoverKey = p1.hoverKey
	local var20, var21 = reactModule.useState(false)
	local var22 = reactModule.useRef(nil)
	local var23 = useTriggerFeedback()
	local var24 = useOverflowMenuOpen(hoverKey)
	local var25 = useIsHoveredTile(var22, hoverKey, true)
	local var26 = reactModule.useRef(false)
	local var27 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (copy), sponsoredGamesRecordClick (copy), var8 (ref)
		if p1.isSponsored and p1.adId and (if fFlagLuaAppSduiSponsoredTwoByOneTile then not p1.disableSponsoredClickRecording else true) then
			sponsoredGamesRecordClick(var8, p1.adId)
		end
	end, {
		var8,
		p1.isSponsored,
		p1.adId,
		if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.disableSponsoredClickRecording else nil
	})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var26 (ref)
		var26.current = false
	end, {})
	local var29 = reactModule.useCallback(function()
		-- upvalues: fFlagLuaAppSduiSponsoredTwoByOneTile (copy), p1 (ref), gameCollectionItemTypes (copy), var7 (ref), universeId (ref), twoByOneGameTileTelemetryModule (copy)
		if fFlagLuaAppSduiSponsoredTwoByOneTile and p1.onOpenGameDetails then
			p1.onOpenGameDetails()
		else
			var7(universeId, {
				index = p1.index,
				placeIdOverride = p1.placeIdOverride,
				experienceJoinData = {
					launchData = if p1.launchDataOverride then p1.launchDataOverride else nil,
					tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
					nativeAdData = p1.adId
				}
			})
			
			if not fFlagLuaAppSduiSponsoredTwoByOneTile then
				twoByOneGameTileTelemetryModule.logTwoByOneTileViewGameDetailsActivated()
			end
			if p1.reportGameDetailOpened then
				p1.reportGameDetailOpened(p1.index, universeId)
			end
		end
		if fFlagLuaAppSduiSponsoredTwoByOneTile then
			twoByOneGameTileTelemetryModule.logTwoByOneTileViewGameDetailsActivated()
		end
	end, {
		var7, universeId, p1.index, p1.placeIdOverride, p1.launchDataOverride,
		p1.reportGameDetailOpened, p1.adId,
		if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.onOpenGameDetails else nil
	})
	local var30 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), p1 (ref)
		var21(true)
		
		if p1.onSelectionGained then
			p1.onSelectionGained()
		end
	end, { p1.onSelectionGained })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), p1 (ref)
		var21(false)
		
		if p1.onSelectionLost then
			p1.onSelectionLost()
		end
	end, { p1.onSelectionLost })
	local isSponsored = p1.isSponsored
	local var32 = reactModule.useMemo(function()
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
	local var33 = reactModule.useCallback(function()
		-- upvalues: var26 (ref), var32 (ref), var23 (ref), var24 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), p1 (ref), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var26.current
		var26.current = true
		
		if current == false and next(var32) ~= nil then
			if var23 and not var24 then
				var23("TwoByOneTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p1.topicId } else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, var23, var32, var24, universeId
	})
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), setGamePlaySession (copy), sessionType (copy), var25 (ref), hoverTileCoordinator (copy), p1 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var9 then
			setGamePlaySession(var9, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var25 then
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
		p1.adId, p1.placeIdOverride, p1.launchDataOverride, var25
	})
	local var35 = usePlayButtonState(var8, universeId)
	local var36 = useOnPlayButtonCallback(universeId, p1.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p1.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p1.adId
	}, if p1.placeIdOverride then p1.placeIdOverride else p1.placeId)
	local var37 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var27 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var27()
	end, { var27 })
	local var38 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var27 (ref), var29 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		var27()
		var29()
	end, { var27, var29 })
	local var39 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetryModule (copy), var36 (ref), var35 (ref), var34 (ref)
		twoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		var36(var35.playButtonState, var34)
	end, { var36, var35.playButtonState, var34 })
	local var40 = reactModule.useCallback(function()
		-- upvalues: var26 (ref), var25 (ref), hoverTileCoordinator (copy), twoByOneGameTileTelemetryModule (copy), var27 (ref), tileVariant (ref), var29 (ref), var39 (ref)
		if var26.current then
			var26.current = false
			
			return
		elseif var25 then
			hoverTileCoordinator.default:reset()
		end
		twoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		var27()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var29()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var39()
		end
	end, {
		var25,
		tileVariant.onTileActivation,
		var29,
		var39,
		var27
	})
	local var41 = if fFlagMigrateGameInfoToStore then nil else useSelector(function(p2)
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p2.Personalization[gameInfosReducer.key][universeId]
	end)
	local _ = nil
	local var42 = if fFlagLuaAppHomeThumbnailPrefetch then var1({
		useGridTile = true,
		isEmphasized = true,
		placeId = placeId,
		perEntryWideAssetId = if fFlagMigrateGameInfoToStore then p1.wideAssetId else p1.primaryWideImageAssetId,
		game = if fFlagMigrateGameInfoToStore then nil else var41,
		topicId = p1.topicId
	}) elseif fFlagMigrateGameInfoToStore then formatExperienceThumbnail(p1.wideAssetId, placeId, true) else formatExperienceThumbnail((if p1.primaryWideImageAssetId then p1.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(getGameTileLayoutData(var41, p1.topicId))) or (if var41 then var41.primaryWideAssetId else nil), placeId, true)
	local var43 = if fFlagMigrateGameInfoToStore then p1.ageRatingLabel elseif var41 then var41.ageRecommendationDisplayName else nil
	local var44 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var44 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var44, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var44 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var44, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	useTagAsViewportAutoplayCandidate(var44, p1.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var44, if p1.isSponsored and p1.adId ~= nil and not p1.isHidden then if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
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
		ref = var44
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p1.size or UDim2.fromScale(1, 1),
			ref = var22,
			SelectionOrder = p1.SelectionOrder
		}, {
			HiddenTileContent = reactModule.createElement(hiddenTileContent, {
				appPage = p1.appPage,
				collectionId = p1.topicId,
				setGameHidden = p1.setGameHidden,
				universeId = universeId,
				parentRef = var22,
				isSponsored = isSponsored
			})
		})
	}) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.rootSize else nil,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = var44
	}, {
		TwoByOneTileContainer = reactModule.createElement("TextButton", {
			Size = p1.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = var22,
			SelectionOrder = p1.SelectionOrder,
			[reactModule.Event.TouchLongPress] = var33,
			[reactModule.Event.Activated] = var40,
			[reactModule.Event.SelectionGained] = var30,
			[reactModule.Event.SelectionLost] = var31,
			[reactModule.Change.GuiState] = var28
		}, {
			BackgroundImage = reactModule.createElement("ImageLabel", {
				[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = var42,
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
			TileBadge = var19 and reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var19 })
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
					Size = UDim2.new(1, 0, var18, 0),
					aspectRatio = var17
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
						width = var13,
						onActivated = var37,
						reportExperienceLaunched = var34,
						experienceJoinData = if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
					Size = UDim2.new(var13.Scale, var13.Offset, 0, size1000),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = var14,
					BackgroundTransparency = var15,
					Text = var10,
					TextColor3 = var11.LightMode.ActionOverMedia.Foreground.Color3,
					Font = titleMedium.Font,
					TextSize = titleMedium.FontSize,
					[reactModule.Event.Activated] = var38
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var11.Radius.Medium) })
				}),
				BottomRightLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
					Text = var43,
					TextSize = captionMedium.FontSize,
					Font = captionMedium.Font,
					TextColor3 = var11.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenu = reactModule.createElement(spanTileOverflowMenuModule, {
				zIndex = 4,
				hoverKey = hoverKey,
				parentRef = var22,
				universeId = universeId,
				placeId = if fFlagLuaAppNotInterestedReportPlaceId then placeId else nil,
				adId = p1.adId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				appPage = p1.appPage,
				topicId = p1.topicId,
				isSponsored = p1.isSponsored,
				setGameHidden = p1.setGameHidden or function() end,
				isHovered = var25,
				isSelected = var20,
				availableMenuItems = var32
			})
		})
	})
end