local sponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local parent = sponsoredTiles.Parent
local gameTileModule = require(parent.GameTile)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local image = foundationModule.Image
local buttonSize = foundationModule.Enums.ButtonSize
local useTokens = foundationModule.Hooks.useTokens
local normalizeFontFace = foundationModule.Utility.normalizeFontFace
local playButton = require(parent.GamePlayButton).PlayButton
local useLocalization = require(parent.Localization).Hooks.useLocalization
local discoveryTypesModule = require(parent.DiscoveryTypes)
local omniRecommendationsContentType = discoveryTypesModule.OmniRecommendationsContentType
local gameCollectionItemTypes = discoveryTypesModule.GameCollectionItemTypes
local gameHydrationReactModule = require(parent.GameHydrationReact)
local useGameInfosSelector = require(parent.GameInfosRodux).useGameInfosSelector
local useNavigation = require(parent.Navigation).useNavigation
local appPage = require(parent.RobloxAppEnums).AppPage
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)
local roactNetworking = roactServiceTagsModule.RoactNetworking
local appSessionService = roactServiceTagsModule.AppSessionService
local robloxAppSessionizationModule = require(parent.RobloxAppSessionization)
local setGamePlaySession = robloxAppSessionizationModule.SetGamePlaySession
local sessionType = robloxAppSessionizationModule.SessionType
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local sponsoredGamesRecordClick = discoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local oneByTwoTileTelemetry = require(parent.SponsoredTilesTelemetry).OneByTwoTileTelemetry
local _ = require(sponsoredTiles.types)
local videoPlayerModule = require(parent.VideoPlayer)
local videoDisplay = videoPlayerModule.VideoDisplay
local videoLoadingState = videoPlayerModule.VideoLoadingState
local videoUtilsModule = require(parent.VideoUtils)
local videoPlaybackDetector = videoUtilsModule.VideoPlaybackDetector
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate
local getPlaybackDetectionMethod = videoUtilsModule.getPlaybackDetectionMethod
local useCanDevicePlayVideoPreview = videoUtilsModule.useCanDevicePlayVideoPreview
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local useTagAsSponsoredAdViewabilityCandidate = require(parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local useIsHoveredTile = gameTileModule.useIsHoveredTile
local useValidTileBadges = gameTileModule.useValidTileBadges
local gameTileThumbnailBadges = gameTileModule.GameTileThumbnailBadges
local hoverTileCoordinator = gameTileModule.HoverTileCoordinator
local tileVideoBlockingConfig = gameTileModule.TileVideoBlockingConfig
local getAvailableGameTileOverflowMenuItems = gameTileModule.getAvailableGameTileOverflowMenuItems
local spanTileOverflowMenuModule = require(sponsoredTiles.SpanTileOverflowMenu.SpanTileOverflowMenu)
local appBloxModule = require(parent.AppBlox)
local getOverflowMenuSignalStore = appBloxModule.getOverflowMenuSignalStore
local useOverflowMenuOpen = appBloxModule.useOverflowMenuOpen
local useTriggerFeedback = require(parent.InteractionFeedback).useTriggerFeedback
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagLuaAppDemoModePlayButtonTelemetry = sharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local fFlagLuaAppHapticTriggeredTelemetry = sharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fIntLuaAppGameTileVideoDwellTimeInSec = sharedFlagsModule.FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = sharedFlagsModule.FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppGameTileSelectionVideoPlayback = sharedFlagsModule.FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppSduiSponsoredOneByTwoTile = sharedFlagsModule.FFlagLuaAppSduiSponsoredOneByTwoTile
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local luaAppDefaultGameAdTileText = game:DefineFastFlag("LuaAppDefaultGameAdTileText", false)
local fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad = sharedFlagsModule.FFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad
local fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate = sharedFlagsModule.FFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = sharedFlagsModule.FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor
local fFlagLuaAppEnableReportExperience = sharedFlagsModule.FFlagLuaAppEnableReportExperience
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local luaAppOneByTwoTileLogoWidthPercentLandscape = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40)
local luaAppOneByTwoTileLogoWidthPercentSquare = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25)
local luaAppOneByTwoTileGradientBottomTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomTransparencyPercent", 25)
local luaAppOneByTwoTileGradientTopTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientTopTransparencyPercent", 100)
local luaAppOneByTwoTileGradientBottomHeightPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomHeightPercent", 50)
local var1 = luaAppOneByTwoTileLogoWidthPercentLandscape / 100
local var2 = luaAppOneByTwoTileLogoWidthPercentSquare / 100
local var3 = luaAppOneByTwoTileGradientBottomTransparencyPercent / 100
local var4 = luaAppOneByTwoTileGradientTopTransparencyPercent / 100
local var5 = luaAppOneByTwoTileGradientBottomHeightPercent / 100

local function _(p1, p2)
	return if not (p1 ~= nil and p1 ~= "") then if p2 == nil or p2 == "" then nil else p2 else p1
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), omniRecommendationsContentType (ref), luaAppDefaultGameAdTileText (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsSponsoredAdViewabilityCandidate (ref), videoPlaybackCoordinator (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppEnableReportExperience (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (ref), videoLoadingState (ref), oneByTwoTileTelemetry (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useNavigation (ref), useLocalization (ref), discoveryAnalyticsModule (ref), sponsoredGamesRecordClick (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), videoEndReason (ref), appPage (ref), impressionsTagUtility (ref), useValidTileBadges (ref), var1 (ref), var2 (ref), buttonSize (ref), videoDisplay (ref), var4 (ref), var5 (ref), var3 (ref), gameTileThumbnailBadges (ref), image (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), playButton (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local var6 = useTokens()
	local var7 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local hoverKey = p1.hoverKey
	local var10 = responsiveModule.useLastInput() ~= responsiveModule.Input.Touch
	local var11 = useIsHoveredTile(var8, hoverKey, var10)
	local var12 = responsiveModule.usePreferredInput()
	local var13 = p1.adId ~= nil and p1.adId ~= ""
	local var14 = p1.contentType == omniRecommendationsContentType.AdLink
	
	if var14 then
		assert(p1.clickoutUrl ~= nil and p1.clickoutUrl ~= "", "OneByTwoTile AdLink requires clickoutUrl")
	else
		assert(p1.universeId ~= nil and p1.universeId ~= "", "OneByTwoTile Game requires universeId")
	end
	local var15, var16
	local headline = p1.headline
	local subtitle = p1.subtitle
	local name = nil
	local ageRecommendationDisplayName = nil
	
	if luaAppDefaultGameAdTileText then
		if fFlagMigrateGameInfoToStore then
			local var17 = gameHydrationReactModule.useGameInfo(p1.universeId or "")
			
			if var17 then
				name = var17.name
				ageRecommendationDisplayName = var17.gameAgeDisplayName
			end
		else
			local var18 = useGameInfosSelector(p1.universeId or "")
			
			if var18 then
				name = var18.name
				ageRecommendationDisplayName = var18.ageRecommendationDisplayName
			end
		end
		if p1.contentType == omniRecommendationsContentType.Game then
			var15 = headline
			headline = if var15 ~= nil and var15 ~= "" then if name == nil or name == "" then nil else name else var15
			var15 = subtitle
			var16 = ageRecommendationDisplayName
			subtitle = if var15 ~= nil and var15 ~= "" then if var16 == nil or var16 == "" then nil else var16 else var15
		end
	end
	var15, var38 = reactModule.useState(false)
	local var19 = useOverflowMenuOpen(hoverKey)
	local var20 = useTriggerFeedback()
	local var21 = reactModule.useRef(false)
	local var22 = nil
	local _ = nil
	
	if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
		local var23 = false
		
		if p1.cellVerticalPadding ~= nil then
			var22 = p1.cellVerticalPadding
		elseif p1.size == nil or p1.size.Height.Scale <= 1 then
			var23 = true
			var22 = var6.Gap.Large
		else
			var22 = p1.size.Height.Offset / (p1.size.Height.Scale - 1)
		end
		reactModule.useEffect(function()
			-- upvalues: var23 (write), discoveryEventErrorLogger (copy)
			if var23 then
				discoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: could not resolve cellVerticalPadding for a 1x2 tile")
			end
		end, { var23 })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), gameCollectionItemTypes (copy), discoveryEventErrorLogger (copy)
			if p1.alignmentType ~= gameCollectionItemTypes.AlignmentType.LeftPin and p1.alignmentType ~= gameCollectionItemTypes.AlignmentType.RightPin then
				discoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: 1x2 tile is neither left- nor right-pinned", { alignmentType = tostring(p1.alignmentType) })
			end
		end, { p1.alignmentType })
	end
	useTagAsViewportAutoplayCandidate(var8, p1.videoPlaybackContext, true, nil, if fFlagLuaAppVideoAutoplayOneByTwoTileCandidatePercentageUpdate or fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then 2 else nil, if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then var22 else nil, if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p1.alignmentType else nil)
	local var24 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useRef(nil) else nil
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var8, if var13 then {
			mediaType = "video",
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
			videoPlaybackStateRef = var24,
			videoSource = `rbxassetid://{p1.primaryVideoAssetId}`
		} else nil)
	end
	local var25
	local var26 = if p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	local var27 = reactModule.useMemo(function()
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), var13 (ref), p1 (ref), fFlagLuaAppEnableReportExperience (copy), var14 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = var13,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableReportExperience = if fFlagLuaAppEnableReportExperience then if var14 then nil else p1.enableReportExperience else nil,
			enableExplicitFeedback = if var14 then nil else p1.enableExplicitFeedback
		})
	end, {
		var13, var14, p1.enableSponsoredFeedback, p1.enableReportAd,
		if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		p1.enableExplicitFeedback
	})
	local var28 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21.current = false
	end, {})
	local onSelectionGained = p1.onSelectionGained
	local var29 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), onSelectionGained (ref)
		var16(true)
		
		if onSelectionGained then
			onSelectionGained()
		end
	end, { onSelectionGained })
	local onSelectionLost = p1.onSelectionLost
	local var30 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), onSelectionLost (ref)
		var16(false)
		
		if onSelectionLost then
			onSelectionLost()
		end
	end, { onSelectionLost })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (copy), p1 (ref), var27 (ref), var20 (ref), var19 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var21.current
		var21.current = true
		
		if fFlagLuaAppSduiSponsoredOneByTwoTile and current == false and p1.onTouchLongPress then
			p1.onTouchLongPress()
			
			return
		elseif current == false and next(var27) ~= nil then
			if var20 and not var19 then
				var20("OneByTwoTileLongPress", "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = tostring(p1.universeId or ""),
					sortId = p1.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, p1.universeId, var20, var19, var27,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.onTouchLongPress else nil
	})
	local var32 = reactModule.useRef(0)
	local var33 = nil
	local var34 = nil
	local var35 = nil
	local var36 = nil
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		local _ = nil
		local var37, var38 = reactModule.useState(nil)
		var33 = var37
		var34 = var38
		local var39, var40 = reactModule.useState(videoLoadingState.Idle)
		var35 = var39
		var25 = var40
		
		var36 = function(p2)
			-- upvalues: videoLoadingState (copy), var25 (write)
			if p2 ~= videoLoadingState.Idle then
				var25(p2)
			end
		end
	end
	var25 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var32 (ref), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (copy), oneByTwoTileTelemetry (copy), p1 (ref), var34 (write), var26 (ref)
		var32.current = 0
		
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
			oneByTwoTileTelemetry.logOneByTwoTileVideoLoaded(p2, p3, p1.adId)
			var34({ duration = p2, loadTime = p3 })
			
			return
		elseif p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoad(p1.index, var26.currentPlaybackSessionId, p2, p3)
		end
	end, {
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else p1.videoAnalytics,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else var26,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else p1.index,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var34 else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then p1.adId else nil
	})
	local var41 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), p1 (ref), var26 (ref)
		var32.current = 0
		
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoop(p1.index, var26.currentPlaybackSessionId)
		end
	end, { p1.videoAnalytics, var26, p1.index })
	local var42 = reactModule.useCallback(function(p2)
		-- upvalues: var32 (ref)
		var32.current = p2
	end, {})
	local var43, var44 = reactModule.useState(false)
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		reactModule.useEffect(function()
			-- upvalues: var33 (write), var43 (ref), var26 (ref), p1 (ref), var34 (write)
			if not var43 or var33 == nil then return end
			local currentPlaybackSessionId = var26.currentPlaybackSessionId
			
			if currentPlaybackSessionId == nil then return end
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoad(p1.index, currentPlaybackSessionId, var33.duration, var33.loadTime)
				var34(nil)
			end
		end, {
			var43, var33, var26, p1.videoAnalytics, p1.index, var34
		})
	end
	local var45 = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
	reactModule.useEffect(function()
		-- upvalues: var45 (ref), var44 (ref)
		if var45 then
			var44(false)
		end
	end, { var45 })
	local var46, var47 = reactModule.useState(false)
	local var48 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p1.universeId or "", p1.pageContext or "")
	local var49 = reactModule.useCallback(function()
		-- upvalues: var47 (ref), var48 (ref)
		var47(var48())
	end, { var48 })
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		reactModule.useEffect(var49, { var49 })
	end
	local large, headingMedium, bodyMedium, size800, size500, xSmall, medium, size1000, titleMedium
	local var50 = useRoactService(roactNetworking)
	local var51 = useRoactService(appSessionService)
	local var52 = useNavigation()
	local var53 = if var14 then p1.ctaText elseif p1.ctaText ~= "" then useLocalization({ joinButtonText = "Common.VisitGame.Label.Play" }).joinButtonText else p1.ctaText
	local var54 = var14 and (p1.clickoutUrl ~= nil and (p1.clickoutUrl ~= "" and var53 ~= ""))
	local launchExperienceEventContext = p1.launchExperienceEventContext or discoveryAnalyticsModule.Constants.Context.ExperienceTile
	local var55 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sponsoredGamesRecordClick (copy), var50 (ref)
		if p1.adId then
			sponsoredGamesRecordClick(var50, p1.adId)
		end
	end, { var50, p1.adId })
	local var56 = reactModule.useCallback(function(p2)
		-- upvalues: var51 (ref), setGamePlaySession (copy), sessionType (copy), var11 (ref), hoverTileCoordinator (copy), p1 (ref), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var51 then
			setGamePlaySession(var51, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var11 then
			hoverTileCoordinator.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = p1.placeId,
				universeId = p1.universeId,
				adId = p1.adId,
				tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.referralSource, "OneByTwoTile", launchExperienceEventContext, p1.index, if fFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end
	end, {
		var51, p1.reportExperienceLaunched, p1.placeId, p1.universeId, p1.adId,
		p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		launchExperienceEventContext, p1.index, var11
	})
	local var57 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), var11 (ref), hoverTileCoordinator (copy), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (copy), var46 (ref), var35 (write), videoLoadingState (copy), oneByTwoTileTelemetry (copy), var32 (ref), var26 (ref), videoEndReason (copy), p1 (ref), var52 (ref), appPage (copy), headline (write), subtitle (write), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (copy)
		if var21.current then
			var21.current = false
			
			return
		elseif var11 then
			hoverTileCoordinator.default:reset()
		end
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad and (not var46 or var35 ~= videoLoadingState.Loaded) then
			return
		end
		oneByTwoTileTelemetry.logOneByTwoTileActivated()
		local current = var32.current
		var26:reset(videoEndReason.TileClicked, nil, p1.universeId, nil)
		var52.navigate(appPage.FeatureTileAdPlayer, {
			extraProps = {
				videoAssetId = p1.primaryVideoAssetId,
				imageAssetId = p1.primaryImageAssetId,
				startPlaybackProgress = current,
				attributionThumbnailAssetId = p1.attributionThumbnailAssetId,
				videoPlaybackContext = p1.videoPlaybackContext,
				title = headline,
				subtitle = subtitle,
				contentType = p1.contentType,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				adId = p1.adId,
				enableReportAd = p1.enableReportAd,
				clickoutUrl = p1.clickoutUrl,
				ctaText = p1.ctaText,
				universeId = p1.universeId,
				index = p1.index,
				placeId = p1.placeId,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride,
				referralSource = p1.referralSource,
				source = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				launchExperienceEventContext = launchExperienceEventContext,
				reportGameDetailOpened = p1.reportGameDetailOpened,
				reportExperienceLaunched = p1.reportExperienceLaunched,
				onOpenGameDetails = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.onOpenGameDetails else nil,
				disableGameLaunchSponsoredClickRecording = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil
			}
		})
	end, {
		var11, var52, var26, p1.universeId, p1.primaryVideoAssetId,
		p1.primaryImageAssetId, p1.attributionThumbnailAssetId,
		p1.videoPlaybackContext, headline, subtitle, p1.contentType, p1.payerName,
		p1.sponsoredUserCohort, p1.adId, p1.enableReportAd, p1.clickoutUrl, p1.ctaText,
		p1.placeId, p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		launchExperienceEventContext, p1.index, p1.reportGameDetailOpened,
		p1.reportExperienceLaunched,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.onOpenGameDetails else nil,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var46 else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var35 else nil
	})
	local var58 = reactModule.useCallback(function()
		-- upvalues: oneByTwoTileTelemetry (copy), fFlagLuaAppSduiSponsoredOneByTwoTile (copy), p1 (ref), var55 (ref)
		oneByTwoTileTelemetry.logOneByTwoTileGameJoinInitiated()
		oneByTwoTileTelemetry.logOneByTwoTileCtaActivated(oneByTwoTileTelemetry.CtaType.GameJoin)
		
		if fFlagLuaAppSduiSponsoredOneByTwoTile then
			if p1.disableGameLaunchSponsoredClickRecording then
				return
			else
				var55()
				
				return
			end
		else
			var55()
		end
	end, {
		var55,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil
	})
	local var59 = reactModule.useCallback(function()
		-- upvalues: var54 (ref), oneByTwoTileTelemetry (copy), var55 (ref), var52 (ref), appPage (copy), p1 (ref)
		if var54 then
			oneByTwoTileTelemetry.logOneByTwoTileCtaActivated(oneByTwoTileTelemetry.CtaType.Clickout)
			var55()
			var52.navigate(appPage.GenericWebPage, {
				detail = p1.clickoutUrl,
				extraProps = { showDomainAsTitle = true }
			})
			
			return
		end
	end, { var54, var52, p1.clickoutUrl, var55 })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var9 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var9, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var9 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var9, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var60 = useValidTileBadges(p1.universeId or "", p1.topicId, p1.badgeOverride)
	local var61 = tonumber(p1.logoAspectRatio)
	local var62 = if var61 and var61 > 0 then var61 else 1
	local var63 = if var62 == 3 then var1 else var2
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var7 then
		large = var6.Padding.Medium
		headingMedium = var6.Typography.TitleLarge
		bodyMedium = var6.Typography.BodySmall
		size800 = var6.Size.Size_600
		size500 = var6.Size.Size_500
		xSmall = var6.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var6.Size.Size_800
		titleMedium = var6.Typography.TitleSmall
	else
		large = var6.Padding.Large
		headingMedium = var6.Typography.HeadingMedium
		bodyMedium = var6.Typography.BodyMedium
		size800 = var6.Size.Size_800
		size500 = var6.Size.Size_500
		xSmall = var6.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var6.Size.Size_1000
		titleMedium = var6.Typography.TitleMedium
	end
	local var64
	local createElement = reactModule.createElement
	local var65 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.rootSize else nil,
		LayoutOrder = p1.index,
		ZIndex = p1.zIndex,
		ref = var9
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var66 = "TextButton"
	local t_2 = {
		ref = var8,
		Size = p1.size or UDim2.fromScale(1, 1),
		BackgroundColor3 = var6.Color.Surface.Surface_100.Color3,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Text = "",
		AutoButtonColor = false,
		SelectionOrder = p1.SelectionOrder,
		[reactModule.Event.Activated] = var57,
		[reactModule.Event.TouchLongPress] = var31,
		[reactModule.Event.SelectionGained] = var29,
		[reactModule.Event.SelectionLost] = var30,
		[reactModule.Change.GuiState] = var28
	}
	local t_3 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) })
	}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		muted = true,
		looped = true,
		ZIndex = 0,
		video = `rbxassetid://{p1.primaryVideoAssetId}`,
		thumbnail = `rbxassetid://{p1.primaryImageAssetId}`,
		shouldStartPlayback = var43
	}
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		var64 = var46
		
		if var64 then
			var64 = var35 ~= videoLoadingState.Failed
			var64 = nil
		end
	else
		var64 = nil
	end
	local createElement_3
	t_4.loadImmediately = var64
	t_4.Size = UDim2.fromScale(1, 1)
	t_4.ScaleType = Enum.ScaleType.Crop
	t_4.cornerRadius = var6.Radius.Medium
	t_4.onVideoLoaded = var25
	t_4.onLoadingStateChanged = if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var36 else nil
	t_4.onVideoLooped = var41
	t_4.onVideoProgressChanged = var42
	t_4.videoPlaybackStateRef = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var13 then var24 else nil
	t_3.Video = createElement_2(videoDisplay, t_4)
	t_3.GradientOverlayBottom = reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = 1,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var6.Color.Extended.Black.Black_100.Color3
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) }),
		UIGradientBottom = reactModule.createElement("UIGradient", {
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, var4),
				NumberSequenceKeypoint.new(1 - var5, var4),
				NumberSequenceKeypoint.new(1, var3)
			})
		})
	})
	t_3.TileBadge = if var60 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1)
	}, {
		Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var60 })
	}) else nil
	t_3.Logo = if p1.logoImageAssetId then reactModule.createElement(image, {
		tag = "anchor-top-right",
		ZIndex = 2,
		Image = `rbxassetid://{p1.logoImageAssetId}`,
		Position = UDim2.new(1, -var6.Padding.Medium, 0, var6.Padding.Medium),
		Size = UDim2.new(var63, 0, 1, 0),
		aspectRatio = var62
	}) else nil
	
	if fFlagLuaAppSduiSponsoredOneByTwoTile and p1.renderOverflowMenu then
		createElement_3 = p1.renderOverflowMenu({
			isHovered = var11,
			isSelected = var15,
			menuKey = hoverKey,
			parentRef = var8
		})
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(spanTileOverflowMenuModule, {
			zIndex = 4,
			hoverKey = hoverKey,
			parentRef = var8,
			universeId = p1.universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId or fFlagLuaAppEnableReportExperience then p1.placeId else nil,
			adId = p1.adId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			appPage = p1.appPage,
			topicId = p1.topicId,
			isSponsored = var13,
			contentType = p1.contentType,
			setGameHidden = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.setGameHidden or function() end else p1.setGameHidden,
			isHovered = var11,
			isSelected = var15,
			availableMenuItems = var27
		})
	end
	t_3.OverflowMenu = createElement_3
	t_3.BottomStack = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = 2,
		Size = UDim2.new(1, -2 * large, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = UDim2.new(0, large, 1, -large),
		AnchorPoint = Vector2.new(0, 1)
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, large)
		}),
		TextStack = reactModule.createElement("Frame", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, xSmall)
			}),
			Headline = if headline then reactModule.createElement("TextLabel", {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(1, 0, 0, 2 * size800),
				Text = headline,
				Font = if foundationFontFaceMigration then nil else headingMedium.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(headingMedium.Font) else nil,
				LineHeight = headingMedium.LineHeight,
				TextSize = headingMedium.FontSize,
				TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom,
				TextTruncate = Enum.TextTruncate.AtEnd
			}) else nil,
			Subtitle = if subtitle then reactModule.createElement("TextLabel", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				TextWrapped = false,
				Size = UDim2.new(1, 0, 0, size500),
				Text = subtitle,
				Font = if foundationFontFaceMigration then nil else bodyMedium.Font,
				FontFace = if foundationFontFaceMigration then normalizeFontFace(bodyMedium.Font) else nil,
				LineHeight = bodyMedium.LineHeight,
				TextSize = bodyMedium.FontSize,
				TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTruncate = Enum.TextTruncate.AtEnd
			}) else nil
		}),
		CtaButton = if var14 then if var54 then reactModule.createElement("TextButton", {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(0, size1000),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = var6.Color.Extended.White.White_20.Color3,
			BackgroundTransparency = var6.Color.Extended.White.White_20.Transparency,
			BorderSizePixel = 0,
			Text = var53,
			TextColor3 = var6.LightMode.ActionOverMedia.Foreground.Color3,
			Font = if foundationFontFaceMigration then nil else titleMedium.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(titleMedium.Font) else nil,
			TextSize = titleMedium.FontSize,
			[reactModule.Event.Activated] = var59
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var6.Radius.Medium) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var6.Padding.Large),
				PaddingRight = UDim.new(0, var6.Padding.Large)
			})
		}) else nil elseif p1.universeId then reactModule.createElement(playButton, {
			LayoutOrder = 2,
			launchSource = "OneByTwoTile",
			hidePlayableIcon = true,
			preferSecondaryPlayButton = true,
			universeId = p1.universeId,
			placeId = if p1.placeIdOverride then p1.placeIdOverride else p1.placeId,
			referralSource = p1.referralSource,
			eventContext = launchExperienceEventContext,
			playableText = var53,
			buttonSize = medium,
			onActivated = var58,
			reportExperienceLaunched = var56,
			experienceJoinData = {
				launchData = p1.launchDataOverride,
				tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				nativeAdData = p1.adId
			}
		}) else nil
	})
	t_1.Container = createElement_1(var66, t_2, t_3)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Tile = createElement(var65, t, t_1),
		VideoPlaybackDetector = if not var45 then reactModule.createElement(videoPlaybackDetector, {
			videoKey = hoverKey,
			itemIndex = p1.index,
			itemFrameRef = var8,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback then if fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(var12, var10) else nil else nil,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var10,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else true,
			isHovered = var11,
			onPlaybackChange = var44,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = var26,
			viewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = var46,
			onPlaybackCandidate = var49
		}) else nil
	})
end)