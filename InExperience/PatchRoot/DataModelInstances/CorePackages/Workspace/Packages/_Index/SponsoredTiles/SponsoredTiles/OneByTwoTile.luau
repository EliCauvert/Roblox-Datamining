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
local videoPlaybackDetectionMethod = videoUtilsModule.VideoPlaybackDetectionMethod
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate
local adsViewportAutoplayCandidateTagModule = require(script.Parent.AdsViewportAutoplayCandidateTag)
local useTagAsAdsViewportAutoplayCandidateModule = require(script.Parent.useTagAsAdsViewportAutoplayCandidate)
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
local fFlagLuaAppFeatureTileHapticsFix = sharedFlagsModule.FFlagLuaAppFeatureTileHapticsFix
local fFlagLuaAppSponsoredAdVideoViewabilityEnabled = sharedFlagsModule.FFlagLuaAppSponsoredAdVideoViewabilityEnabled
local fIntLuaAppGameTileVideoDwellTimeInSec = sharedFlagsModule.FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = sharedFlagsModule.FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppGameTileSelectionVideoPlayback = sharedFlagsModule.FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagLuaAppNotInterestedReportPlaceId = sharedFlagsModule.FFlagLuaAppNotInterestedReportPlaceId
local fFlagLuaAppSduiSponsoredOneByTwoTile = sharedFlagsModule.FFlagLuaAppSduiSponsoredOneByTwoTile
local fFlagMigrateGameInfoToStore = sharedFlagsModule.FFlagMigrateGameInfoToStore
local luaAppDefaultGameAdTileText = game:DefineFastFlag("LuaAppDefaultGameAdTileText", false)
local fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad = sharedFlagsModule.FFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad
local fFlagLuaAppOneByTwoHoverIdleAutoplay = sharedFlagsModule.FFlagLuaAppOneByTwoHoverIdleAutoplay
local fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor = sharedFlagsModule.FFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor
local fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = sharedFlagsModule.FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local fFlagLuaAppEnableReportExperience = sharedFlagsModule.FFlagLuaAppEnableReportExperience
local fFlagLuaAppEnableOneByTwoTileFunnelTelemetry = sharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local luaAppOneByTwoTileLogoWidthPercentLandscape = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40)
local luaAppOneByTwoTileLogoWidthPercentSquare = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25)
local luaAppOneByTwoTileGradientBottomTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomTransparencyPercent", 25)
local luaAppOneByTwoTileGradientTopTransparencyPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientTopTransparencyPercent", 100)
local luaAppOneByTwoTileGradientBottomHeightPercent = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomHeightPercent", 50)
local var1 = luaAppOneByTwoTileLogoWidthPercentLandscape / 100
local var2 = luaAppOneByTwoTileLogoWidthPercentSquare / 100
local var3 = if fFlagLuaAppFeatureTileHapticsFix then "TileLongPress" else "OneByTwoTileLongPress"
local var4 = luaAppOneByTwoTileGradientBottomTransparencyPercent / 100
local var5 = luaAppOneByTwoTileGradientTopTransparencyPercent / 100
local var6 = luaAppOneByTwoTileGradientBottomHeightPercent / 100

local function _(p1, p2)
	return if not (p1 ~= nil and p1 ~= "") then if p2 == nil or p2 == "" then nil else p2 else p1
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), useIsHoveredTile (ref), omniRecommendationsContentType (ref), luaAppDefaultGameAdTileText (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useGameInfosSelector (ref), useOverflowMenuOpen (ref), useTriggerFeedback (ref), fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor (ref), discoveryEventErrorLogger (ref), gameCollectionItemTypes (ref), fFlagLuaAppEnableOneByTwoTileFunnelTelemetry (ref), oneByTwoTileTelemetry (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (ref), fFlagLuaAppOneByTwoHoverIdleAutoplay (ref), videoPlaybackCoordinator (ref), adsViewportAutoplayCandidateTagModule (ref), useTagAsAdsViewportAutoplayCandidateModule (ref), fFlagLuaAppSponsoredAdVideoViewabilityEnabled (ref), useTagAsViewportAutoplayCandidate (ref), useTagAsSponsoredAdViewabilityCandidate (ref), getAvailableGameTileOverflowMenuItems (ref), fFlagLuaAppEnableReportExperience (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (ref), fFlagLuaAppHapticTriggeredTelemetry (ref), var3 (ref), getOverflowMenuSignalStore (ref), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (ref), videoLoadingState (ref), useCanDevicePlayVideoPreview (ref), tileVideoBlockingConfig (ref), useRoactService (ref), roactNetworking (ref), appSessionService (ref), useNavigation (ref), useLocalization (ref), discoveryAnalyticsModule (ref), sponsoredGamesRecordClick (ref), setGamePlaySession (ref), sessionType (ref), hoverTileCoordinator (ref), fFlagLuaAppDemoModePlayButtonTelemetry (ref), videoEndReason (ref), appPage (ref), impressionsTagUtility (ref), useValidTileBadges (ref), var1 (ref), var2 (ref), buttonSize (ref), videoDisplay (ref), var5 (ref), var6 (ref), var4 (ref), gameTileThumbnailBadges (ref), image (ref), spanTileOverflowMenuModule (ref), fFlagLuaAppNotInterestedReportPlaceId (ref), foundationFontFaceMigration (ref), normalizeFontFace (ref), playButton (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), getPlaybackDetectionMethod (ref), videoPlaybackDetector (ref), videoPlaybackDetectionMethod (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref)
	local var7 = useTokens()
	local var8 = responsiveModule.useResponsive({ responsiveModule.BreakpointConfig.sizes.Small }) == responsiveModule.Keys.Small
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	local hoverKey = p1.hoverKey
	local var11 = responsiveModule.useLastInput() ~= responsiveModule.Input.Touch
	local var12 = useIsHoveredTile(var9, hoverKey, var11)
	local var13 = responsiveModule.usePreferredInput()
	local var14 = p1.adId ~= nil and p1.adId ~= ""
	local var15 = p1.contentType == omniRecommendationsContentType.AdLink
	
	if var15 then
		assert(p1.clickoutUrl ~= nil and p1.clickoutUrl ~= "", "OneByTwoTile AdLink requires clickoutUrl")
	else
		assert(p1.universeId ~= nil and p1.universeId ~= "", "OneByTwoTile Game requires universeId")
	end
	local var16, var17
	local headline = p1.headline
	local subtitle = p1.subtitle
	local name = nil
	local ageRecommendationDisplayName = nil
	
	if luaAppDefaultGameAdTileText then
		if fFlagMigrateGameInfoToStore then
			local var18 = gameHydrationReactModule.useGameInfo(p1.universeId or "")
			
			if var18 then
				name = var18.name
				ageRecommendationDisplayName = var18.gameAgeDisplayName
			end
		else
			local var19 = useGameInfosSelector(p1.universeId or "")
			
			if var19 then
				name = var19.name
				ageRecommendationDisplayName = var19.ageRecommendationDisplayName
			end
		end
		if p1.contentType == omniRecommendationsContentType.Game then
			var16 = headline
			headline = if var16 ~= nil and var16 ~= "" then if name == nil or name == "" then nil else name else var16
			var16 = subtitle
			var17 = ageRecommendationDisplayName
			subtitle = if var16 ~= nil and var16 ~= "" then if var17 == nil or var17 == "" then nil else var17 else var16
		end
	end
	var16, var41 = reactModule.useState(false)
	local var20 = useOverflowMenuOpen(hoverKey)
	local var21 = useTriggerFeedback()
	local var22 = reactModule.useRef(false)
	local var23 = nil
	local _ = nil
	
	if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then
		local var24 = false
		
		if p1.cellVerticalPadding ~= nil then
			var23 = p1.cellVerticalPadding
		elseif p1.size == nil or p1.size.Height.Scale <= 1 then
			var24 = true
			var23 = var7.Gap.Large
		else
			var23 = p1.size.Height.Offset / (p1.size.Height.Scale - 1)
		end
		reactModule.useEffect(function()
			-- upvalues: var24 (write), discoveryEventErrorLogger (copy)
			if var24 then
				discoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: could not resolve cellVerticalPadding for a 1x2 tile")
			end
		end, { var24 })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), gameCollectionItemTypes (copy), discoveryEventErrorLogger (copy)
			if p1.alignmentType ~= gameCollectionItemTypes.AlignmentType.LeftPin and p1.alignmentType ~= gameCollectionItemTypes.AlignmentType.RightPin then
				discoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: 1x2 tile is neither left- nor right-pinned", { alignmentType = tostring(p1.alignmentType) })
			end
		end, { p1.alignmentType })
	end
	if fFlagLuaAppEnableOneByTwoTileFunnelTelemetry then
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), oneByTwoTileTelemetry (copy), gameCollectionItemTypes (copy)
			if p1.oneByTwoTileFlowId then
				oneByTwoTileTelemetry.logOneByTwoTileRendered({
					oneByTwoTileFlowId = p1.oneByTwoTileFlowId,
					recommendationsRequestId = p1.recommendationsRequestId,
					topicId = p1.topicId,
					contentType = p1.contentType,
					adId = p1.adId,
					componentType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
					alignmentType = p1.alignmentType,
					isSdui = p1.isSdui == true
				})
			end
		end, {
			p1.oneByTwoTileFlowId, p1.recommendationsRequestId, p1.topicId, p1.contentType,
			p1.adId, p1.alignmentType, p1.isSdui
		})
	end
	local var25 = nil
	local var26 = nil
	local var27 = nil
	
	if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		var25 = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
		local var28 = fFlagLuaAppOneByTwoHoverIdleAutoplay and (var25 ~= nil and var25:isUserIntentWithSelectiveAutoplay())
		local var29 = if var14 then `{hoverKey}|{p1.adId}` else hoverKey
		local var30, var31 = reactModule.useState(nil)
		local var32 = if var30 ~= var29 then var25 ~= nil and var25:hasCompletedAdsPlayback(var29) else true
		var26 = reactModule.useMemo(function()
			-- upvalues: var25 (write), var28 (ref), var32 (ref), videoPlaybackCoordinator (copy), adsViewportAutoplayCandidateTagModule (copy)
			if not var25 or var28 or var32 then
				return nil
			end
			local adsPlaybackCoordinator = var25:getAdsPlaybackCoordinator()
			
			if adsPlaybackCoordinator then
				return adsPlaybackCoordinator
			end
			local var33 = videoPlaybackCoordinator.new()
			var25:attachAdsPlaybackCoordinator(var33, adsViewportAutoplayCandidateTagModule)
			
			return var33
		end, { var25, var28, var32 })
		useTagAsAdsViewportAutoplayCandidateModule(var9, if var26 then var25 else nil)
		local var33 = var26 ~= nil
		var27 = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var33 (ref), var25 (write), var29 (ref), var31 (ref)
			local current = var9.current
			
			if var33 and var25 and current then
				var25:completeAdsPlayback(current, var29)
				var31(var29)
				
				return
			end
		end, { var33, var25, var29 })
	end
	local var34 = if fFlagLuaAppOneByTwoHoverIdleAutoplay and fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var14 then `{hoverKey}|{p1.adId}` else hoverKey
	useTagAsViewportAutoplayCandidate(var9, if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and var26 then nil else p1.videoPlaybackContext, true, nil, 2, if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then var23 else nil, if fFlagLuaAppVideoAutoplayOneByTwoTileDoubleAnchor then p1.alignmentType else nil, if fFlagLuaAppOneByTwoHoverIdleAutoplay then {
		isUserIntentModeAutoplayCandidate = true,
		videoKey = var34
	} else nil)
	local var35 = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then reactModule.useRef(nil) else nil
	
	if fFlagLuaAppSponsoredAdVideoViewabilityEnabled then
		useTagAsSponsoredAdViewabilityCandidate(var9, if var14 then {
			mediaType = "video",
			encryptedAdTrackingData = p1.adId,
			tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
			videoPlaybackStateRef = var35,
			videoSource = `rbxassetid://{p1.primaryVideoAssetId}`
		} else nil)
	end
	local var36 = if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and var26 then var26 elseif p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	
	if not fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		var25 = if fFlagLuaAppOneByTwoHoverIdleAutoplay and p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	end
	local var37
	local var38 = fFlagLuaAppOneByTwoHoverIdleAutoplay and (var11 and (var25 ~= nil and var25:isUserIntentWithSelectiveAutoplay()))
	local var39 = reactModule.useMemo(function()
		-- upvalues: getAvailableGameTileOverflowMenuItems (copy), var14 (ref), p1 (ref), fFlagLuaAppEnableReportExperience (copy), var15 (ref)
		return getAvailableGameTileOverflowMenuItems({
			isSponsored = var14,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableReportExperience = if fFlagLuaAppEnableReportExperience then if var15 then nil else p1.enableReportExperience else nil,
			enableExplicitFeedback = if var15 then nil else p1.enableExplicitFeedback
		})
	end, {
		var14, var15, p1.enableSponsoredFeedback, p1.enableReportAd,
		if fFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		p1.enableExplicitFeedback
	})
	local var40 = reactModule.useCallback(function()
		-- upvalues: var22 (ref)
		var22.current = false
	end, {})
	local onSelectionGained = p1.onSelectionGained
	local var41 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), onSelectionGained (ref)
		var17(true)
		
		if onSelectionGained then
			onSelectionGained()
		end
	end, { onSelectionGained })
	local onSelectionLost = p1.onSelectionLost
	local var42 = reactModule.useCallback(function()
		-- upvalues: var17 (ref), onSelectionLost (ref)
		var17(false)
		
		if onSelectionLost then
			onSelectionLost()
		end
	end, { onSelectionLost })
	local var43 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (copy), p1 (ref), var39 (ref), var21 (ref), var20 (ref), fFlagLuaAppHapticTriggeredTelemetry (copy), var3 (copy), getOverflowMenuSignalStore (copy), hoverKey (ref)
		local current = var22.current
		var22.current = true
		
		if fFlagLuaAppSduiSponsoredOneByTwoTile and current == false and p1.onTouchLongPress then
			p1.onTouchLongPress()
			
			return
		elseif current == false and next(var39) ~= nil then
			if var21 and not var20 then
				var21(var3, "Press", if fFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if fFlagLuaAppHapticTriggeredTelemetry then if fFlagLuaAppHapticTriggeredTelemetry then {
					universeId = tostring(p1.universeId or ""),
					sortId = p1.topicId
				} else nil else nil)
			end
			getOverflowMenuSignalStore().openMenu(hoverKey)
		end
	end, {
		hoverKey, p1.appPage, p1.topicId, p1.universeId, var21, var20, var39,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.onTouchLongPress else nil
	})
	local var44 = reactModule.useRef(0)
	local var45 = nil
	local var46 = nil
	local var47 = nil
	local var48 = nil
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		local _ = nil
		local var49, var50 = reactModule.useState(nil)
		var45 = var49
		var46 = var50
		local var51, var52 = reactModule.useState(videoLoadingState.Idle)
		var47 = var51
		var37 = var52
		
		var48 = function(p2)
			-- upvalues: videoLoadingState (copy), var37 (write)
			if p2 ~= videoLoadingState.Idle then
				var37(p2)
			end
		end
	end
	var37 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var44 (ref), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (copy), oneByTwoTileTelemetry (copy), p1 (ref), var46 (write), var36 (ref)
		var44.current = 0
		
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
			oneByTwoTileTelemetry.logOneByTwoTileVideoLoaded(p2, p3, p1.adId)
			var46({ duration = p2, loadTime = p3 })
			
			return
		elseif p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoad(p1.index, var36.currentPlaybackSessionId, p2, p3)
		end
	end, {
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else p1.videoAnalytics,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else var36,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then nil else p1.index,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var46 else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then p1.adId else nil
	})
	local var53 = reactModule.useCallback(function()
		-- upvalues: var44 (ref), p1 (ref), var36 (ref), fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), var27 (write)
		var44.current = 0
		
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoop(p1.index, var36.currentPlaybackSessionId)
		end
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and var27 then
			var27()
		end
	end, {
		p1.videoAnalytics,
		var36,
		p1.index,
		if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then var27 else nil
	})
	local var54 = if fFlagLuaAppOneByTwoHoverIdleAutoplay then reactModule.useCallback(function()
		-- upvalues: var9 (ref), discoveryEventErrorLogger (copy), var25 (write)
		local current = var9.current
		
		if current == nil then
			discoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: tile ref missing when reporting video completion")
			
			return
		elseif var25 then
			var25:onVideoCompleted(current)
		end
	end, { var25, var9 }) else nil
	local var55 = reactModule.useCallback(function(p2)
		-- upvalues: var44 (ref)
		var44.current = p2
	end, {})
	local var56, var57 = reactModule.useState(false)
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		reactModule.useEffect(function()
			-- upvalues: var45 (write), var56 (ref), var36 (ref), p1 (ref), var46 (write)
			if not var56 or var45 == nil then return end
			local currentPlaybackSessionId = var36.currentPlaybackSessionId
			
			if currentPlaybackSessionId == nil then return end
			if p1.videoAnalytics then
				p1.videoAnalytics.reportVideoLoad(p1.index, currentPlaybackSessionId, var45.duration, var45.loadTime)
				var46(nil)
			end
		end, {
			var56, var45, var36, p1.videoAnalytics, p1.index, var46
		})
	end
	local var58 = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
	reactModule.useEffect(function()
		-- upvalues: var58 (ref), var57 (ref)
		if var58 then
			var57(false)
		end
	end, { var58 })
	local var59, var60 = reactModule.useState(false)
	local var61 = useCanDevicePlayVideoPreview(tileVideoBlockingConfig, p1.universeId or "", p1.pageContext or "")
	local var62 = reactModule.useCallback(function()
		-- upvalues: var60 (ref), var61 (ref)
		var60(var61())
	end, { var61 })
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		reactModule.useEffect(var62, { var62 })
	end
	local large, headingMedium, bodyMedium, size800, size500, xSmall, medium, size1000, titleMedium
	local var63 = useRoactService(roactNetworking)
	local var64 = useRoactService(appSessionService)
	local var65 = useNavigation()
	local var66 = if var15 then p1.ctaText elseif p1.ctaText ~= "" then useLocalization({ joinButtonText = "Common.VisitGame.Label.Play" }).joinButtonText else p1.ctaText
	local var67 = var15 and (p1.clickoutUrl ~= nil and (p1.clickoutUrl ~= "" and var66 ~= ""))
	local launchExperienceEventContext = p1.launchExperienceEventContext or discoveryAnalyticsModule.Constants.Context.ExperienceTile
	local var68 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), sponsoredGamesRecordClick (copy), var63 (ref)
		if p1.adId then
			sponsoredGamesRecordClick(var63, p1.adId)
		end
	end, { var63, p1.adId })
	local var69 = reactModule.useCallback(function(p2)
		-- upvalues: var64 (ref), setGamePlaySession (copy), sessionType (copy), var12 (ref), hoverTileCoordinator (copy), p1 (ref), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppDemoModePlayButtonTelemetry (copy)
		if var64 then
			setGamePlaySession(var64, sessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if var12 then
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
		var64, p1.reportExperienceLaunched, p1.placeId, p1.universeId, p1.adId,
		p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		launchExperienceEventContext, p1.index, var12
	})
	local var70 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var12 (ref), hoverTileCoordinator (copy), fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad (copy), var59 (ref), var47 (write), videoLoadingState (copy), oneByTwoTileTelemetry (copy), var44 (ref), var36 (ref), videoEndReason (copy), p1 (ref), var65 (ref), appPage (copy), headline (write), subtitle (write), gameCollectionItemTypes (copy), launchExperienceEventContext (ref), fFlagLuaAppSduiSponsoredOneByTwoTile (copy)
		if var22.current then
			var22.current = false
			
			return
		elseif var12 then
			hoverTileCoordinator.default:reset()
		end
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad and (not var59 or var47 ~= videoLoadingState.Loaded) then
			return
		end
		oneByTwoTileTelemetry.logOneByTwoTileActivated()
		local current = var44.current
		var36:reset(videoEndReason.TileClicked, nil, p1.universeId, nil)
		var65.navigate(appPage.FeatureTileAdPlayer, {
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
		var12, var65, var36, p1.universeId, p1.primaryVideoAssetId,
		p1.primaryImageAssetId, p1.attributionThumbnailAssetId,
		p1.videoPlaybackContext, headline, subtitle, p1.contentType, p1.payerName,
		p1.sponsoredUserCohort, p1.adId, p1.enableReportAd, p1.clickoutUrl, p1.ctaText,
		p1.placeId, p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		launchExperienceEventContext, p1.index, p1.reportGameDetailOpened,
		p1.reportExperienceLaunched,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.onOpenGameDetails else nil,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var59 else nil,
		if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var47 else nil
	})
	local var71 = reactModule.useCallback(function()
		-- upvalues: oneByTwoTileTelemetry (copy), fFlagLuaAppSduiSponsoredOneByTwoTile (copy), p1 (ref), var68 (ref)
		oneByTwoTileTelemetry.logOneByTwoTileGameJoinInitiated()
		oneByTwoTileTelemetry.logOneByTwoTileCtaActivated(oneByTwoTileTelemetry.CtaType.GameJoin)
		
		if fFlagLuaAppSduiSponsoredOneByTwoTile then
			if p1.disableGameLaunchSponsoredClickRecording then
				return
			else
				var68()
				
				return
			end
		else
			var68()
		end
	end, {
		var68,
		if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil
	})
	local var72 = reactModule.useCallback(function()
		-- upvalues: var67 (ref), oneByTwoTileTelemetry (copy), var68 (ref), var65 (ref), appPage (copy), p1 (ref)
		if var67 then
			oneByTwoTileTelemetry.logOneByTwoTileCtaActivated(oneByTwoTileTelemetry.CtaType.Clickout)
			var68()
			var65.navigate(appPage.GenericWebPage, {
				detail = p1.clickoutUrl,
				extraProps = { showDomainAsTitle = true }
			})
			
			return
		end
	end, { var67, var65, p1.clickoutUrl, var68 })
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var10 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var10, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var10 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var10, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var73 = useValidTileBadges(p1.universeId or "", p1.topicId, p1.badgeOverride)
	local var74 = tonumber(p1.logoAspectRatio)
	local var75 = if var74 and var74 > 0 then var74 else 1
	local var76 = if var75 == 3 then var1 else var2
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if var8 then
		large = var7.Padding.Medium
		headingMedium = var7.Typography.TitleLarge
		bodyMedium = var7.Typography.BodySmall
		size800 = var7.Size.Size_600
		size500 = var7.Size.Size_500
		xSmall = var7.Gap.XXSmall
		medium = buttonSize.Small
		size1000 = var7.Size.Size_800
		titleMedium = var7.Typography.TitleSmall
	else
		large = var7.Padding.Large
		headingMedium = var7.Typography.HeadingMedium
		bodyMedium = var7.Typography.BodyMedium
		size800 = var7.Size.Size_800
		size500 = var7.Size.Size_500
		xSmall = var7.Gap.XSmall
		medium = buttonSize.Medium
		size1000 = var7.Size.Size_1000
		titleMedium = var7.Typography.TitleMedium
	end
	local var77
	local createElement = reactModule.createElement
	local var78 = "Frame"
	local t = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.rootSize else nil,
		LayoutOrder = p1.index,
		ZIndex = p1.zIndex,
		ref = var10
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local var79 = "TextButton"
	local t_2 = {
		ref = var9,
		Size = p1.size or UDim2.fromScale(1, 1),
		BackgroundColor3 = var7.Color.Surface.Surface_100.Color3,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Text = "",
		AutoButtonColor = false,
		SelectionOrder = p1.SelectionOrder,
		[reactModule.Event.Activated] = var70,
		[reactModule.Event.TouchLongPress] = var43,
		[reactModule.Event.SelectionGained] = var41,
		[reactModule.Event.SelectionLost] = var42,
		[reactModule.Change.GuiState] = var40
	}
	local t_3 = {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) })
	}
	local createElement_2 = reactModule.createElement
	local t_4 = {
		muted = true,
		ZIndex = 0,
		video = `rbxassetid://{p1.primaryVideoAssetId}`,
		thumbnail = `rbxassetid://{p1.primaryImageAssetId}`,
		shouldStartPlayback = var56
	}
	
	if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then
		var77 = var59
		
		if var77 then
			var77 = var47 ~= videoLoadingState.Failed
			var77 = nil
		end
	else
		var77 = nil
	end
	local createElement_3
	t_4.loadImmediately = var77
	t_4.looped = if fFlagLuaAppOneByTwoHoverIdleAutoplay then not var38 or var12 else true
	t_4.Size = UDim2.fromScale(1, 1)
	t_4.ScaleType = Enum.ScaleType.Crop
	t_4.cornerRadius = var7.Radius.Medium
	t_4.onVideoLoaded = var37
	t_4.onLoadingStateChanged = if fFlagLuaAppOneByTwoTileGatePlayerOnVideoLoad then var48 else nil
	t_4.onVideoEnded = if fFlagLuaAppOneByTwoHoverIdleAutoplay and var38 then var54 else nil
	t_4.onVideoLooped = var53
	t_4.onVideoProgressChanged = var55
	t_4.videoPlaybackStateRef = if fFlagLuaAppSponsoredAdVideoViewabilityEnabled and var14 then var35 else nil
	t_3.Video = createElement_2(videoDisplay, t_4)
	t_3.GradientOverlayBottom = reactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ZIndex = 1,
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = var7.Color.Extended.Black.Black_100.Color3
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
		UIGradientBottom = reactModule.createElement("UIGradient", {
			Rotation = 90,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, var5),
				NumberSequenceKeypoint.new(1 - var6, var5),
				NumberSequenceKeypoint.new(1, var4)
			})
		})
	})
	t_3.TileBadge = if var73 then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.fromScale(1, 1)
	}, {
		Badge = reactModule.createElement(gameTileThumbnailBadges, { tileBadgesByPosition = var73 })
	}) else nil
	t_3.Logo = if p1.logoImageAssetId then reactModule.createElement(image, {
		tag = "anchor-top-right",
		ZIndex = 2,
		Image = `rbxassetid://{p1.logoImageAssetId}`,
		Position = UDim2.new(1, -var7.Padding.Medium, 0, var7.Padding.Medium),
		Size = UDim2.new(var76, 0, 1, 0),
		aspectRatio = var75
	}) else nil
	
	if fFlagLuaAppSduiSponsoredOneByTwoTile and p1.renderOverflowMenu then
		createElement_3 = p1.renderOverflowMenu({
			isHovered = var12,
			isSelected = var16,
			menuKey = hoverKey,
			parentRef = var9
		})
	else
		createElement_3 = reactModule.createElement
		createElement_3 = createElement_3(spanTileOverflowMenuModule, {
			zIndex = 4,
			hoverKey = hoverKey,
			parentRef = var9,
			universeId = p1.universeId,
			placeId = if fFlagLuaAppNotInterestedReportPlaceId or fFlagLuaAppEnableReportExperience then p1.placeId else nil,
			adId = p1.adId,
			payerName = p1.payerName,
			sponsoredUserCohort = p1.sponsoredUserCohort,
			appPage = p1.appPage,
			topicId = p1.topicId,
			isSponsored = var14,
			contentType = p1.contentType,
			setGameHidden = if fFlagLuaAppSduiSponsoredOneByTwoTile then p1.setGameHidden or function() end else p1.setGameHidden,
			isHovered = var12,
			isSelected = var16,
			availableMenuItems = var39
		})
	end
	local createElement_5
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
				TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
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
				TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextTruncate = Enum.TextTruncate.AtEnd
			}) else nil
		}),
		CtaButton = if var15 then if var67 then reactModule.createElement("TextButton", {
			LayoutOrder = 2,
			Size = UDim2.fromOffset(0, size1000),
			AutomaticSize = Enum.AutomaticSize.X,
			BackgroundColor3 = var7.Color.Extended.White.White_20.Color3,
			BackgroundTransparency = var7.Color.Extended.White.White_20.Transparency,
			BorderSizePixel = 0,
			Text = var66,
			TextColor3 = var7.LightMode.ActionOverMedia.Foreground.Color3,
			Font = if foundationFontFaceMigration then nil else titleMedium.Font,
			FontFace = if foundationFontFaceMigration then normalizeFontFace(titleMedium.Font) else nil,
			TextSize = titleMedium.FontSize,
			[reactModule.Event.Activated] = var72
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Medium) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, var7.Padding.Large),
				PaddingRight = UDim.new(0, var7.Padding.Large)
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
			playableText = var66,
			buttonSize = medium,
			onActivated = var71,
			reportExperienceLaunched = var69,
			experienceJoinData = {
				launchData = p1.launchDataOverride,
				tileType = gameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				nativeAdData = p1.adId
			}
		}) else nil
	})
	t_1.Container = createElement_1(var79, t_2, t_3)
	createElement = createElement(var78, t, t_1)
	local var80 = if fFlagLuaAppOneByTwoHoverIdleAutoplay or fFlagLuaAppGameTileSelectionVideoPlayback then getPlaybackDetectionMethod(var13, var11) else nil
	local createElement_4 = reactModule.createElement
	local fragment = reactModule.Fragment
	local var81 = nil
	local t_5 = { Tile = createElement }
	
	if var58 then
		createElement_5 = nil
	else
		createElement_5 = reactModule.createElement
		createElement_5 = createElement_5(videoPlaybackDetector, {
			videoKey = if fFlagLuaAppOneByTwoHoverIdleAutoplay then var34 else hoverKey,
			itemIndex = p1.index,
			itemFrameRef = var9,
			playbackDetectionMethod = if fFlagLuaAppGameTileSelectionVideoPlayback or fFlagLuaAppOneByTwoHoverIdleAutoplay then var80 else nil,
			isHoverSupported = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else var11,
			autoplay = if fFlagLuaAppGameTileSelectionVideoPlayback then nil else true,
			isHovered = var12,
			hasVideoPlaybackUserIntent = if fFlagLuaAppOneByTwoHoverIdleAutoplay and var80 == videoPlaybackDetectionMethod.Hover then var12 else nil,
			onPlaybackChange = var57,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = var36,
			viewportVideoAutoplayController = if fFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then var25 elseif p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = var59,
			onPlaybackCandidate = var62
		})
	end
	t_5.VideoPlaybackDetector = createElement_5
	
	return createElement_4(fragment, var81, t_5)
end)