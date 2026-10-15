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
local twoByOneGameTileTelemetry = require(parent.SponsoredTilesTelemetry).TwoByOneGameTileTelemetry
local _ = require(sponsoredTiles.types)
local hiddenTileContent = gameTileModule.HiddenTileContent
local itemLayoutDataParsingUtils = gameTileModule.ItemLayoutDataParsingUtils
local hoverTileCoordinator = gameTileModule.HoverTileCoordinator
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local image = foundationModule.Image
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
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
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local luaAppTwoByOneTileSmallScreenBreakpoint = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local luaAppTwoByOneTileLogoHeightPercentLandscape = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20)
local luaAppTwoByOneTileLogoHeightPercentSquare = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36)
local luaAppTwoByOneTileGradientStartOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30)
local luaAppTwoByOneTileGradientEndOpacityPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100)
local luaAppTwoByOneTileGradientWidthPercent = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50)
local fFlagLuaAppHomePageFirstImageLoadObserver = sharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppFeatureTileHapticsFix = sharedFlagsModule.FFlagLuaAppFeatureTileHapticsFix
local fFlagLuaAppTileVideoCandidateOnly = sharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppSponsoredAdViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHomeThumbnailPrefetch = sharedFlagsModule.FFlagLuaAppHomeThumbnailPrefetch
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppSduiSponsoredTwoByOneTile = sharedFlagsModule.FFlagLuaAppSduiSponsoredTwoByOneTile
local fFlagLuaAppEnableReportExperience = sharedFlagsModule.FFlagLuaAppEnableReportExperience
local var1 = if fFlagLuaAppHomeThumbnailPrefetch then gameTileModule.resolveGameTileThumbnailUri else nil
local var2 = if fFlagLuaAppFeatureTileHapticsFix then "TileLongPress" else "TwoByOneTileLongPress"
local color3 = Color3.new(1, 1, 1)
local color3_1 = Color3.new(0, 0, 0)
local var3 = luaAppTwoByOneTileLogoHeightPercentLandscape / 100
local var4 = luaAppTwoByOneTileLogoHeightPercentSquare / 100
local var5 = luaAppTwoByOneTileGradientStartOpacityPercent / 100
local var6 = luaAppTwoByOneTileGradientEndOpacityPercent / 100
local var7 = luaAppTwoByOneTileGradientWidthPercent / 100
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
	-- upvalues: useNavigateToGameDetails (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useLocalization (ref), t (ref), useTokens (ref), responsiveModule (ref), luaAppTwoByOneTileSmallScreenBreakpoint (ref), buttonSize (ref), reactModule (ref), getTextSize (ref), var3 (ref), var4 (ref), useValidTileBadges (ref), useTriggerFeedback (ref), useOverflowMenuOpen (ref), useIsHoveredTile (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (ref), sponsoredGamesRecordClick (ref), gameCollectionItemTypes (ref), twoByOneGameTileTelemetry (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppEnableReportExperience (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), var2 (ref), getOverflowMenuSignalStore (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), usePlayButtonState (ref), useOnPlayButtonCallback (ref), fFlagMigrateGameInfoToStore (ref), useSelector (ref), gameInfosReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var1 (ref), formatExperienceThumbnail (ref), getGameTileLayoutData (ref), itemLayoutDataParsingUtils (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppSponsoredAdViewabilityEnabled (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), hiddenTileContent (ref), fFlagLuaAppHomePageFirstImageLoadObserver (ref), var7 (ref), color3 (ref), var5 (ref), var6 (ref), color3_1 (ref), gameTileThumbnailBadges (ref), image (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), playButton (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref)
	local large, large_1, headingMedium, bodyMedium, captionMedium, xSmall, medium, size1000, titleMedium
	local var8 = useNavigateToGameDetails()
	local var9 = useRoactService(roactNetworking)
	local var10 = useRoactService(appSessionService)
	local var11 = if p1.ctaText then p1.ctaText else useLocalization({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	}).joinButtonText
	local tileVariant = t[p1.tileVariant] or t.Default
	local var12 = useTokens()
	local uDim = UDim.new(0, var12.Radius.Medium)
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
		large = var12.Padding.Medium
		large_1 = var12.Padding.Medium
		headingMedium = var12.Typography.TitleLarge
		bodyMedium = var12.Typography.BodySmall
		captionMedium = var12.Typography.CaptionSmall
		xSmall = var12.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var12.Size.Size_800
		titleMedium = var12.Typography.TitleSmall
	else
		large = var12.Padding.Large
		large_1 = var12.Padding.Large
		headingMedium = var12.Typography.HeadingMedium
		bodyMedium = var12.Typography.BodyMedium
		captionMedium = var12.Typography.CaptionMedium
		xSmall = var12.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var12.Size.Size_1000
		titleMedium = var12.Typography.TitleMedium
	end
	local var13 = var12.Padding.Large * 4
	local var14 = reactModule.useMemo(function()
		-- upvalues: getTextSize (copy), var11 (ref), titleMedium (write), var13 (ref)
		return UDim.new(0, getTextSize(var11, titleMedium.FontSize, titleMedium.Font, Vector2.new(1e999, 1e999)).X + var13)
	end, { var11, titleMedium, var13 })
	local var15 = if tileVariant.ctaStyle == "StandardLight" then var12.Color.Extended.White.White_20.Color3 else var12.LightMode.ActionOverMedia.Background.Color3
	local var16 = if tileVariant.ctaStyle == "StandardLight" then var12.Color.Extended.White.White_20.Transparency else var12.LightMode.ActionOverMedia.Background.Transparency
	local var17 = tonumber(p1.logoAspectRatio)
	local var18 = if var17 and var17 > 0 then var17 else 1
	local var19 = if var18 == 3 then var3 else var4
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
		-- upvalues: p1 (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (copy), sponsoredGamesRecordClick (copy), var9 (ref)
		if p1.isSponsored and p1.adId and (if fFlagLuaAppSduiSponsoredTwoByOneTile then not p1.disableSponsoredClickRecording else true) then
			sponsoredGamesRecordClick(var9, p1.adId)
		end
	end, {
		var9,
		p1.isSponsored,
		p1.adId,
		if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.disableSponsoredClickRecording else nil
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: var27 (ref)
		var27.current = false
	end, {})
	local var30 = reactModule.useCallback(function()
		-- upvalues: fFlagLuaAppSduiSponsoredTwoByOneTile (copy), p1 (ref), gameCollectionItemTypes (copy), var8 (ref), universeId (ref), twoByOneGameTileTelemetry (copy)
		if fFlagLuaAppSduiSponsoredTwoByOneTile and p1.onOpenGameDetails then
			p1.onOpenGameDetails()
		else
			var8(universeId, {
				index = p1.index,
				placeIdOverride = p1.placeIdOverride,
				experienceJoinData = {
					launchData = if p1.launchDataOverride then p1.launchDataOverride else nil,
					tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
					nativeAdData = p1.adId
				}
			})
			
			if not fFlagLuaAppSduiSponsoredTwoByOneTile then
				twoByOneGameTileTelemetry.logTwoByOneTileViewGameDetailsActivated()
			end
			if p1.reportGameDetailOpened then
				p1.reportGameDetailOpened(p1.index, universeId)
			end
		end
		if fFlagLuaAppSduiSponsoredTwoByOneTile then
			twoByOneGameTileTelemetry.logTwoByOneTileViewGameDetailsActivated()
		end
	end, {
		var8, universeId, p1.index, p1.placeIdOverride, p1.launchDataOverride,
		p1.reportGameDetailOpened, p1.adId,
		if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.onOpenGameDetails else nil
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
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), isSponsored (ref), p1 (ref), fFlagLuaAppEnableReportExperience (copy)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = isSponsored,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableReportExperience = if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
			enableExplicitFeedback = p1.enableExplicitFeedback
		})
	end, {
		isSponsored,
		p1.enableSponsoredFeedback,
		p1.enableReportAd,
		if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		p1.enableExplicitFeedback
	})
	local var34 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), fFlagLuaAppSduiSponsoredTwoByOneTile (copy), p1 (ref), var33 (ref), var24 (ref), var25 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), universeId (ref), var2 (copy), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var27.current
		var27.current = true
		
		if fFlagLuaAppSduiSponsoredTwoByOneTile and current == false and p1.onTouchLongPress then
			p1.onTouchLongPress()
			
			return
		elseif current == false and next(var33) ~= nil then
			if var24 and not var25 then
				var24(var2, "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then { universeId = universeId, sortId = p1.topicId } else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, var24, var33, var25, universeId,
		if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.onTouchLongPress else nil
	})
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: var10 (ref), setGamePlaySession (copy), sessionType (copy), var26 (ref), hoverTileCoordinator (copy), p1 (ref), placeId (ref), universeId (ref), gameCollectionItemTypes (copy), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var10 then
			setGamePlaySession(var10, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
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
		var10, p1.reportExperienceLaunched, placeId, universeId, p1.appPage, p1.index,
		p1.adId, p1.placeIdOverride, p1.launchDataOverride, var26
	})
	local var36 = usePlayButtonState(var9, universeId)
	local var37 = useOnPlayButtonCallback(universeId, p1.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p1.launchDataOverride,
		tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p1.adId
	}, if p1.placeIdOverride then p1.placeIdOverride else p1.placeId)
	local var38 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetry (copy), var28 (ref)
		twoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		twoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		var28()
	end, { var28 })
	local var39 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetry (copy), var28 (ref), var30 (ref)
		twoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		var28()
		var30()
	end, { var28, var30 })
	local var40 = reactModule.useCallback(function()
		-- upvalues: twoByOneGameTileTelemetry (copy), var37 (ref), var36 (ref), var35 (ref)
		twoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		var37(var36.playButtonState, var35)
	end, { var37, var36.playButtonState, var35 })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var26 (ref), hoverTileCoordinator (copy), twoByOneGameTileTelemetry (copy), var28 (ref), tileVariant (ref), var30 (ref), var40 (ref)
		if var27.current then
			var27.current = false
			
			return
		elseif var26 then
			hoverTileCoordinator.default:reset()
		end
		twoByOneGameTileTelemetry.logTwoByOneTileActivated()
		var28()
		
		if tileVariant.onTileActivation == "OpenEdp" then
			var30()
			
			return
		elseif tileVariant.onTileActivation == "JoinGame" then
			var40()
		end
	end, {
		var26,
		tileVariant.onTileActivation,
		var30,
		var40,
		var28
	})
	local var42 = if fFlagMigrateGameInfoToStore then nil else useSelector(function(p2)
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p2.Personalization[gameInfosReducer.key][universeId]
	end)
	local _ = nil
	local var43 = if fFlagLuaAppHomeThumbnailPrefetch then var1({
		useGridTile = true,
		isEmphasized = true,
		placeId = placeId,
		perEntryWideAssetId = if fFlagMigrateGameInfoToStore then p1.wideAssetId else p1.primaryWideImageAssetId,
		game = if fFlagMigrateGameInfoToStore then nil else var42,
		topicId = p1.topicId
	}) elseif fFlagMigrateGameInfoToStore then formatExperienceThumbnail(p1.wideAssetId, placeId, true) else formatExperienceThumbnail((if p1.primaryWideImageAssetId then p1.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(getGameTileLayoutData(var42, p1.topicId))) or (if var42 then var42.primaryWideAssetId else nil), placeId, true)
	local var44 = if fFlagMigrateGameInfoToStore then p1.ageRatingLabel elseif var42 then var42.ageRecommendationDisplayName else nil
	local var45 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var45 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var45, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var45 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var45, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	useTagAsViewportAutoplayCandidate(var45, p1.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	
	if fFlagLuaAppSponsoredAdViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var45, if p1.isSponsored and p1.adId ~= nil and not p1.isHidden then if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then {
			mediaType = "image",
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else {
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	if p1.isHidden then
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.rootSize else nil,
			LayoutOrder = p1.layoutOrder,
			ZIndex = p1.zIndex,
			ref = var45
		}, {
			TwoByOneTileContainer = reactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				Selectable = false,
				Size = p1.size or UDim2.fromScale(1, 1),
				ref = var23,
				SelectionOrder = p1.SelectionOrder
			}, {
				HiddenTileContent = if fFlagLuaAppSduiSponsoredTwoByOneTile and p1.renderHiddenState then p1.renderHiddenState(var23) else reactModule.createElement(hiddenTileContent, {
					appPage = p1.appPage,
					collectionId = p1.topicId,
					setGameHidden = p1.setGameHidden,
					universeId = universeId,
					parentRef = var23,
					isSponsored = isSponsored
				})
			})
		})
	end
	local createElement_2
	local createElement = reactModule.createElement
	local var46 = "Frame"
	local t_1 = {
		BackgroundTransparency = 1,
		Size = if fFlagLuaAppSduiSponsoredTwoByOneTile then p1.rootSize else nil,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = var45
	}
	local t_2 = {}
	local createElement_1 = reactModule.createElement
	local var47 = "TextButton"
	local t_3 = {
		Size = p1.size or UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		AutoButtonColor = false,
		ref = var23,
		SelectionOrder = p1.SelectionOrder,
		[reactModule.Event.TouchLongPress] = var34,
		[reactModule.Event.Activated] = var41,
		[reactModule.Event.SelectionGained] = var31,
		[reactModule.Event.SelectionLost] = var32,
		[reactModule.Change.GuiState] = var29
	}
	local t_4 = {
		BackgroundImage = reactModule.createElement("ImageLabel", {
			[reactModule.Tag] = if fFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Image = var43,
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
			Size = UDim2.new(var7, 0, 1, 0),
			BackgroundColor3 = color3
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
			UIGradientLeft = reactModule.createElement("UIGradient", {
				Rotation = 0,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, var5),
					NumberSequenceKeypoint.new(1, var6)
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
			Size = UDim2.new(1, 0, var7, 0),
			BackgroundColor3 = color3
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim }),
			UIGradientBottom = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, var6),
					NumberSequenceKeypoint.new(1, var5)
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
					Font = if foundationFontFaceMigration then nil else headingMedium.Font,
					FontFace = if foundationFontFaceMigration then normalizeFontFace(headingMedium.Font) else nil,
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
					Font = if foundationFontFaceMigration then nil else bodyMedium.Font,
					FontFace = if foundationFontFaceMigration then normalizeFontFace(bodyMedium.Font) else nil,
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
					playableText = var11,
					buttonSize = medium,
					width = var14,
					onActivated = var38,
					reportExperienceLaunched = var35,
					experienceJoinData = if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil
				})
			}),
			ViewGameDetailsButton = tileVariant.onCtaActivation == "OpenEdp" and reactModule.createElement("TextButton", {
				Size = UDim2.new(var14.Scale, var14.Offset, 0, size1000),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundColor3 = var15,
				BackgroundTransparency = var16,
				Text = var11,
				TextColor3 = var12.LightMode.ActionOverMedia.Foreground.Color3,
				Font = if foundationFontFaceMigration then nil else titleMedium.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(titleMedium.Font) else nil,
				TextSize = titleMedium.FontSize,
				[reactModule.Event.Activated] = var39
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var12.Radius.Medium) })
			}),
			BottomRightLabel = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.X,
				Size = UDim2.new(0, 0, 0, captionMedium.FontSize * captionMedium.LineHeight),
				Text = var44,
				TextSize = captionMedium.FontSize,
				Font = if foundationFontFaceMigration then nil else captionMedium.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(captionMedium.Font) else nil,
				TextColor3 = var12.Color.Extended.Gray.Gray_400.Color3,
				TextXAlignment = Enum.TextXAlignment.Right,
				TextTruncate = Enum.TextTruncate.SplitWord,
				AnchorPoint = Vector2.new(1, 1),
				Position = UDim2.new(1, 0, 1, 0)
			})
		})
	}
	
	if fFlagLuaAppSduiSponsoredTwoByOneTile and p1.renderOverflowMenu then
		createElement_2 = p1.renderOverflowMenu({
			isHovered = var26,
			isSelected = var21,
			menuKey = hoverKey,
			parentRef = var23
		})
	else
		createElement_2 = reactModule.createElement
		createElement_2 = createElement_2(spanTileOverflowMenuModule, {
			zIndex = 4,
			hoverKey = hoverKey,
			parentRef = var23,
			universeId = universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId or fFlagLuaAppEnableReportExperience then placeId else nil,
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
		})
	end
	t_4.OverflowMenu = createElement_2
	t_2.TwoByOneTileContainer = createElement_1(var47, t_3, t_4)
	
	return createElement(var46, t_1, t_2)
end