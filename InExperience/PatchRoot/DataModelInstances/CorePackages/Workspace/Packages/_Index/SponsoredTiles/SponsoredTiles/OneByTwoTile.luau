local SponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local Parent = SponsoredTiles.Parent
local GameTileModule = require(Parent.GameTile)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local Image = FoundationModule.Image
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local PlayButton = require(Parent.GamePlayButton).PlayButton
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local DiscoveryTypesModule = require(Parent.DiscoveryTypes)
local OmniRecommendationsContentType = DiscoveryTypesModule.OmniRecommendationsContentType
local GameCollectionItemTypes = DiscoveryTypesModule.GameCollectionItemTypes
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local UseGameInfosSelectorFunction = require(Parent.GameInfosRodux).useGameInfosSelector
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local AppPage = require(Parent.RobloxAppEnums).AppPage
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppSessionService = RoactServiceTagsModule.AppSessionService
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SponsoredGamesRecordClickFunction = DiscoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local OneByTwoTileTelemetry = require(Parent.SponsoredTilesTelemetry).OneByTwoTileTelemetry
local _ = require(SponsoredTiles.types)
local VideoPlayerModule = require(Parent.VideoPlayer)
local VideoDisplay = VideoPlayerModule.VideoDisplay
local VideoLoadingState = VideoPlayerModule.VideoLoadingState
local VideoUtilsModule = require(Parent.VideoUtils)
local VideoPlaybackDetector = VideoUtilsModule.VideoPlaybackDetector
local VideoPlaybackDetectionMethod = VideoUtilsModule.VideoPlaybackDetectionMethod
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local UseTagAsViewportAutoplayCandidateFunction = VideoUtilsModule.useTagAsViewportAutoplayCandidate
local AdsViewportAutoplayCandidateTagModule = require(script.Parent.AdsViewportAutoplayCandidateTag)
local UseTagAsAdsViewportAutoplayCandidateModule = require(script.Parent.useTagAsAdsViewportAutoplayCandidate)
local GetPlaybackDetectionMethodFunction = VideoUtilsModule.getPlaybackDetectionMethod
local UseCanDevicePlayVideoPreviewFunction = VideoUtilsModule.useCanDevicePlayVideoPreview
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local UseTagAsSponsoredAdViewabilityCandidateFunction = require(Parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseIsHoveredTileFunction = GameTileModule.useIsHoveredTile
local UseValidTileBadgesFunction = GameTileModule.useValidTileBadges
local GameTileThumbnailBadges = GameTileModule.GameTileThumbnailBadges
local HoverTileCoordinator = GameTileModule.HoverTileCoordinator
local TileVideoBlockingConfig = GameTileModule.TileVideoBlockingConfig
local GetAvailableGameTileOverflowMenuItemsFunction = GameTileModule.getAvailableGameTileOverflowMenuItems
local SpanTileOverflowMenuModule = require(SponsoredTiles.SpanTileOverflowMenu.SpanTileOverflowMenu)
local AppBloxModule = require(Parent.AppBlox)
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseOverflowMenuOpenFunction = AppBloxModule.useOverflowMenuOpen
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagLuaAppDemoModePlayButtonTelemetry = SharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local FIntLuaAppGameTileVideoDwellTimeInSec = SharedFlagsModule.FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = SharedFlagsModule.FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppGameTileSelectionVideoPlayback = SharedFlagsModule.FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagLuaAppSduiSponsoredOneByTwoTile = SharedFlagsModule.FFlagLuaAppSduiSponsoredOneByTwoTile
local FFlagMigrateGameInfoToStore = SharedFlagsModule.FFlagMigrateGameInfoToStore
local LuaAppDefaultGameAdTileText = game:DefineFastFlag("LuaAppDefaultGameAdTileText", false)
local FFlagLuaAppOneByTwoHoverIdleAutoplay = SharedFlagsModule.FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback = SharedFlagsModule.FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local FFlagLuaAppEnableOneByTwoTileFunnelTelemetry = SharedFlagsModule.FFlagLuaAppEnableOneByTwoTileFunnelTelemetry
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local FFlagLuaAppSponsoredTileBadgeContentPaddingModule = require(SponsoredTiles.Flags.FFlagLuaAppSponsoredTileBadgeContentPadding)
local LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentLandscape", 40) / 100
local LuaAppOneByTwoTileLogoWidthPercentSquareRatio = game:DefineFastInt("LuaAppOneByTwoTileLogoWidthPercentSquare", 25) / 100
local TileLongPress: string = if SharedFlagsModule.FFlagLuaAppFeatureTileHapticsFix then "TileLongPress" else "OneByTwoTileLongPress"
local LuaAppOneByTwoTileGradientBottomTransparencyPercentRatio = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomTransparencyPercent", 25) / 100
local LuaAppOneByTwoTileGradientTopTransparencyPercentRatio = game:DefineFastInt("LuaAppOneByTwoTileGradientTopTransparencyPercent", 100) / 100
local LuaAppOneByTwoTileGradientBottomHeightPercentRatio = game:DefineFastInt("LuaAppOneByTwoTileGradientBottomHeightPercent", 50) / 100

local function _(p1, p2) --[[ Line: 173 | Named "getTextOrDefault" ]]
	return if p1 == nil or p1 == "" then if p2 == nil or p2 == "" then nil else p2 else p1
end

return ReactModule.memo(function(p1) --[[ Line: 181 | Named "OneByTwoTile" ]]
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), UseIsHoveredTileFunction (copy), OmniRecommendationsContentType (copy), LuaAppDefaultGameAdTileText (copy), FFlagMigrateGameInfoToStore (copy), GameHydrationReactModule (copy), UseGameInfosSelectorFunction (copy), UseOverflowMenuOpenFunction (copy), UseTriggerFeedbackFunction (copy), DiscoveryEventErrorLogger (copy), GameCollectionItemTypes (copy), FFlagLuaAppEnableOneByTwoTileFunnelTelemetry (copy), OneByTwoTileTelemetry (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), VideoPlaybackCoordinator (copy), AdsViewportAutoplayCandidateTagModule (copy), UseTagAsAdsViewportAutoplayCandidateModule (copy), UseTagAsViewportAutoplayCandidateFunction (copy), UseTagAsSponsoredAdViewabilityCandidateFunction (copy), GetAvailableGameTileOverflowMenuItemsFunction (copy), FFlagLuaAppEnableReportExperience (copy), FFlagLuaAppSduiSponsoredOneByTwoTile (copy), TileLongPress (copy), GetOverflowMenuSignalStoreFunction (copy), VideoLoadingState (copy), UseCanDevicePlayVideoPreviewFunction (copy), TileVideoBlockingConfig (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), UseNavigationFunction (copy), UseLocalizationFunction (copy), DiscoveryAnalyticsModule (copy), SponsoredGamesRecordClickFunction (copy), SetGamePlaySessionFunction (copy), SessionType (copy), HoverTileCoordinator (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), VideoEndReason (copy), AppPage (copy), ImpressionsTagUtility (copy), UseValidTileBadgesFunction (copy), LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio (copy), LuaAppOneByTwoTileLogoWidthPercentSquareRatio (copy), ButtonSize (copy), VideoDisplay (copy), LuaAppOneByTwoTileGradientTopTransparencyPercentRatio (copy), LuaAppOneByTwoTileGradientBottomHeightPercentRatio (copy), LuaAppOneByTwoTileGradientBottomTransparencyPercentRatio (copy), GameTileThumbnailBadges (copy), FFlagLuaAppSponsoredTileBadgeContentPaddingModule (copy), Image (copy), SpanTileOverflowMenuModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), PlayButton (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), GetPlaybackDetectionMethodFunction (copy), VideoPlaybackDetector (copy), VideoPlaybackDetectionMethod (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseResponsiveResultMatch = ResponsiveModule.useResponsive({ ResponsiveModule.BreakpointConfig.sizes.Small }) == ResponsiveModule.Keys.Small
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local HoverKey = p1.hoverKey
	local IsNotUseLastInputResultMatch = ResponsiveModule.useLastInput() ~= ResponsiveModule.Input.Touch
	local UseIsHoveredTileResult = UseIsHoveredTileFunction(UseRefResult, HoverKey, IsNotUseLastInputResultMatch)
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local IsNotAdIdMatch: boolean = p1.adId ~= nil and p1.adId ~= ""
	local IsContentTypeMatch = p1.contentType == OmniRecommendationsContentType.AdLink
	
	if IsContentTypeMatch then
		assert(p1.clickoutUrl ~= nil and p1.clickoutUrl ~= "", "OneByTwoTile AdLink requires clickoutUrl")
	else
		assert(p1.universeId ~= nil and p1.universeId ~= "", "OneByTwoTile Game requires universeId")
	end
	local Headline = p1.headline
	local Subtitle = p1.subtitle
	local Name = nil
	local AgeRecommendationDisplayName = nil
	
	if LuaAppDefaultGameAdTileText then
		if FFlagMigrateGameInfoToStore then
			local UseGameInfoResult = GameHydrationReactModule.useGameInfo(p1.universeId or "")
			
			if UseGameInfoResult then
				Name = UseGameInfoResult.name
				AgeRecommendationDisplayName = UseGameInfoResult.gameAgeDisplayName
			end
		else
			local UseGameInfosSelectorResult = UseGameInfosSelectorFunction(p1.universeId or "")
			
			if UseGameInfosSelectorResult then
				Name = UseGameInfosSelectorResult.name
				AgeRecommendationDisplayName = UseGameInfosSelectorResult.ageRecommendationDisplayName
			end
		end
		if p1.contentType == OmniRecommendationsContentType.Game then
			local Headline1 = Headline
			Headline = if Headline1 == nil or Headline1 == "" then if Name == nil or Name == "" then nil else Name else Headline1
			local Subtitle1 = Subtitle
			Subtitle = if Subtitle1 == nil or Subtitle1 == "" then if AgeRecommendationDisplayName == nil or AgeRecommendationDisplayName == "" then nil else AgeRecommendationDisplayName else Subtitle1
		end
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(HoverKey)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseRefResult2 = ReactModule.useRef(false)
	local OffsetRatio = if p1.cellVerticalPadding == nil then if p1.size == nil or p1.size.Height.Scale <= 1 then nil else p1.size.Height.Offset / (p1.size.Height.Scale - 1) else p1.cellVerticalPadding
	local NoOffsetRatio = OffsetRatio == nil
	local OffsetRatio1 = OffsetRatio or UseTokensResult.Gap.Large
	ReactModule.useEffect(function() --[[ Line: 241 ]]
		-- upvalues: NoOffsetRatio (copy), DiscoveryEventErrorLogger (upval)
		if NoOffsetRatio then
			DiscoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: could not resolve cellVerticalPadding for a 1x2 tile")
		end
	end, { NoOffsetRatio })
	ReactModule.useEffect(function() --[[ Line: 250 ]]
		-- upvalues: p1 (copy), GameCollectionItemTypes (upval), DiscoveryEventErrorLogger (upval)
		if p1.alignmentType ~= GameCollectionItemTypes.AlignmentType.LeftPin and p1.alignmentType ~= GameCollectionItemTypes.AlignmentType.RightPin then
			DiscoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: 1x2 tile is neither left- nor right-pinned", { alignmentType = tostring(p1.alignmentType) })
		end
	end, { p1.alignmentType })
	
	if FFlagLuaAppEnableOneByTwoTileFunnelTelemetry then
		ReactModule.useEffect(function() --[[ Line: 265 ]]
			-- upvalues: p1 (copy), OneByTwoTileTelemetry (upval), GameCollectionItemTypes (upval)
			if p1.oneByTwoTileFlowId then
				OneByTwoTileTelemetry.logOneByTwoTileRendered({
					oneByTwoTileFlowId = p1.oneByTwoTileFlowId,
					recommendationsRequestId = p1.recommendationsRequestId,
					topicId = p1.topicId,
					contentType = p1.contentType,
					adId = p1.adId,
					componentType = GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
					alignmentType = p1.alignmentType,
					isSdui = p1.isSdui == true
				})
			end
		end, {
			p1.oneByTwoTileFlowId, p1.recommendationsRequestId, p1.topicId, p1.contentType,
			p1.adId, p1.alignmentType, p1.isSdui
		})
	end
	local ViewportVideoAutoplayController = nil
	local UseMemoResult = nil
	local Callback = nil
	
	if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		ViewportVideoAutoplayController = if p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
		local IsUserIntentWithSelectiveAutoplay = FFlagLuaAppOneByTwoHoverIdleAutoplay and (ViewportVideoAutoplayController ~= nil and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay())
		local Text = if IsNotAdIdMatch then `{HoverKey}|{p1.adId}` else HoverKey
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
		local IsUseStateResultMatch = UseStateResult1 == Text or ViewportVideoAutoplayController ~= nil and ViewportVideoAutoplayController:hasCompletedAdsPlayback(Text)
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 309 ]]
			-- upvalues: ViewportVideoAutoplayController (ref), IsUserIntentWithSelectiveAutoplay (copy), IsUseStateResultMatch (copy), VideoPlaybackCoordinator (upval), AdsViewportAutoplayCandidateTagModule (upval)
			if not ViewportVideoAutoplayController or IsUserIntentWithSelectiveAutoplay or IsUseStateResultMatch then
				return nil
			end
			local AdsPlaybackCoordinator = ViewportVideoAutoplayController:getAdsPlaybackCoordinator()
			
			if AdsPlaybackCoordinator then
				return AdsPlaybackCoordinator
			else
				local NewVideoPlaybackCoordinator = VideoPlaybackCoordinator.new()
				ViewportVideoAutoplayController:attachAdsPlaybackCoordinator(NewVideoPlaybackCoordinator, AdsViewportAutoplayCandidateTagModule)
				
				return NewVideoPlaybackCoordinator
			end
		end, {
			ViewportVideoAutoplayController,
			IsUserIntentWithSelectiveAutoplay,
			IsUseStateResultMatch
		})
		UseTagAsAdsViewportAutoplayCandidateModule(UseRefResult, if UseMemoResult then ViewportVideoAutoplayController else nil)
		local HasUseMemoResult = UseMemoResult ~= nil
		Callback = ReactModule.useCallback(function() --[[ Line: 339 ]]
			-- upvalues: UseRefResult (copy), HasUseMemoResult (copy), ViewportVideoAutoplayController (ref), Text (copy), UseStateResult2_1 (copy)
			local Current = UseRefResult.current
			
			if HasUseMemoResult and ViewportVideoAutoplayController and Current then
				ViewportVideoAutoplayController:completeAdsPlayback(Current, Text)
				UseStateResult2_1(Text)
				
				return
			end
		end, { HasUseMemoResult, ViewportVideoAutoplayController, Text })
	end
	local Text1 = if FFlagLuaAppOneByTwoHoverIdleAutoplay and IsNotAdIdMatch then `{HoverKey}|{p1.adId}` else HoverKey
	UseTagAsViewportAutoplayCandidateFunction(UseRefResult, if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and UseMemoResult then nil else p1.videoPlaybackContext, true, nil, 2, OffsetRatio1, p1.alignmentType, if FFlagLuaAppOneByTwoHoverIdleAutoplay then {
		isUserIntentModeAutoplayCandidate = true,
		videoKey = Text1
	} else nil)
	local UseRefResult3 = ReactModule.useRef(nil)
	UseTagAsSponsoredAdViewabilityCandidateFunction(UseRefResult, if IsNotAdIdMatch then {
		mediaType = "video",
		encryptedAdTrackingData = p1.adId,
		tileType = GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
		videoPlaybackStateRef = UseRefResult3,
		videoSource = `rbxassetid://{p1.primaryVideoAssetId}`
	} else nil)
	local UseMemoResult1 = if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and UseMemoResult then UseMemoResult elseif p1.videoPlaybackContext then p1.videoPlaybackContext.videoPlaybackCoordinator else VideoPlaybackCoordinator.default
	
	if not FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then
		ViewportVideoAutoplayController = if FFlagLuaAppOneByTwoHoverIdleAutoplay and p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil
	end
	local IsUserIntentWithSelectiveAutoplay1 = FFlagLuaAppOneByTwoHoverIdleAutoplay and (IsNotUseLastInputResultMatch and (ViewportVideoAutoplayController ~= nil and ViewportVideoAutoplayController:isUserIntentWithSelectiveAutoplay()))
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 406 ]]
		-- upvalues: GetAvailableGameTileOverflowMenuItemsFunction (upval), IsNotAdIdMatch (copy), p1 (copy), FFlagLuaAppEnableReportExperience (upval), IsContentTypeMatch (copy)
		return GetAvailableGameTileOverflowMenuItemsFunction({
			isSponsored = IsNotAdIdMatch,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableReportExperience = if FFlagLuaAppEnableReportExperience then if IsContentTypeMatch then nil else p1.enableReportExperience else nil,
			enableExplicitFeedback = if IsContentTypeMatch then nil else p1.enableExplicitFeedback
		})
	end, {
		IsNotAdIdMatch, IsContentTypeMatch, p1.enableSponsoredFeedback,
		p1.enableReportAd,
		if FFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		p1.enableExplicitFeedback
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 427 ]]
		-- upvalues: UseRefResult2 (copy)
		UseRefResult2.current = false
	end, {})
	local OnSelectionGainedFunction = p1.onSelectionGained
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 432 ]]
		-- upvalues: UseStateResult2 (copy), OnSelectionGainedFunction (copy)
		UseStateResult2(true)
		
		if OnSelectionGainedFunction then
			OnSelectionGainedFunction()
		end
	end, { OnSelectionGainedFunction })
	local OnSelectionLostFunction = p1.onSelectionLost
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 440 ]]
		-- upvalues: UseStateResult2 (copy), OnSelectionLostFunction (copy)
		UseStateResult2(false)
		
		if OnSelectionLostFunction then
			OnSelectionLostFunction()
		end
	end, { OnSelectionLostFunction })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 448 ]]
		-- upvalues: UseRefResult2 (copy), FFlagLuaAppSduiSponsoredOneByTwoTile (upval), p1 (copy), UseMemoResult2 (copy), UseTriggerFeedbackResult (copy), UseOverflowMenuOpenResult (copy), TileLongPress (upval), GetOverflowMenuSignalStoreFunction (upval), HoverKey (copy)
		local Current = UseRefResult2.current
		UseRefResult2.current = true
		
		if FFlagLuaAppSduiSponsoredOneByTwoTile and Current == false and p1.onTouchLongPress then
			p1.onTouchLongPress()
			
			return
		end
		if Current == false and next(UseMemoResult2) ~= nil then
			if UseTriggerFeedbackResult and not UseOverflowMenuOpenResult then
				UseTriggerFeedbackResult(TileLongPress, "Press", p1.appPage or "Unknown", {
					universeId = tostring(p1.universeId or ""),
					sortId = p1.topicId
				})
			end
			GetOverflowMenuSignalStoreFunction().openMenu(HoverKey)
		end
	end, {
		HoverKey, p1.appPage, p1.topicId, p1.universeId, UseTriggerFeedbackResult,
		UseOverflowMenuOpenResult, UseMemoResult2,
		if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.onTouchLongPress else nil
	})
	local UseRefResult4 = ReactModule.useRef(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(VideoLoadingState.Idle)
	
	local function OnLoadingStateChanged(Idle) --[[ Line: 481 ]]
		-- upvalues: VideoLoadingState (upval), UseStateResult2_3 (copy)
		if Idle ~= VideoLoadingState.Idle then
			UseStateResult2_3(Idle)
		end
	end
	
	local UseResult4 = ReactModule.useCallback(function(Duration, LoadTime) --[[ Line: 487 ]]
		-- upvalues: UseRefResult4 (copy), OneByTwoTileTelemetry (upval), p1 (copy), UseStateResult2_2 (copy)
		UseRefResult4.current = 0
		OneByTwoTileTelemetry.logOneByTwoTileVideoLoaded(Duration, LoadTime, p1.adId)
		UseStateResult2_2({ duration = Duration, loadTime = LoadTime })
	end, { UseStateResult2_2, p1.adId })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 502 ]]
		-- upvalues: UseRefResult4 (copy), p1 (copy), UseMemoResult1 (copy), FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback (upval), Callback (ref)
		UseRefResult4.current = 0
		
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoop(p1.index, UseMemoResult1.currentPlaybackSessionId)
		end
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback and Callback then
			Callback()
		end
	end, {
		p1.videoAnalytics,
		UseMemoResult1,
		p1.index,
		if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then Callback else nil
	})
	local UseResult6 = if FFlagLuaAppOneByTwoHoverIdleAutoplay then ReactModule.useCallback(function() --[[ Line: 521 ]]
		-- upvalues: UseRefResult (copy), DiscoveryEventErrorLogger (upval), ViewportVideoAutoplayController (ref)
		local Current = UseRefResult.current
		
		if Current == nil then
			DiscoveryEventErrorLogger.reportError("SponsoredTiles", "OneByTwoTile: tile ref missing when reporting video completion")
			
			return
		end
		if ViewportVideoAutoplayController then
			ViewportVideoAutoplayController:onVideoCompleted(Current)
		end
	end, { ViewportVideoAutoplayController, UseRefResult }) else nil
	local UseResult7 = ReactModule.useCallback(function(Current) --[[ Line: 537 ]]
		-- upvalues: UseRefResult4 (copy)
		UseRefResult4.current = Current
	end, {})
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 543 ]]
		-- upvalues: UseStateResult3 (copy), UseStateResult5 (copy), UseMemoResult1 (copy), p1 (copy), UseStateResult2_2 (copy)
		if not UseStateResult5 or UseStateResult3 == nil then return end
		local CurrentPlaybackSessionId = UseMemoResult1.currentPlaybackSessionId
		
		if CurrentPlaybackSessionId == nil then return end
		if p1.videoAnalytics then
			p1.videoAnalytics.reportVideoLoad(p1.index, CurrentPlaybackSessionId, UseStateResult3.duration, UseStateResult3.loadTime)
			UseStateResult2_2(nil)
		end
	end, {
		UseStateResult5, UseStateResult3, UseMemoResult1, p1.videoAnalytics, p1.index,
		UseStateResult2_2
	})
	local IsDisablePlayback: boolean = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
	ReactModule.useEffect(function() --[[ Line: 568 ]]
		-- upvalues: IsDisablePlayback (copy), UseStateResult2_4 (copy)
		if IsDisablePlayback then
			UseStateResult2_4(false)
		end
	end, { IsDisablePlayback })
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(false)
	local UseCanDevicePlayVideoPreviewResult = UseCanDevicePlayVideoPreviewFunction(TileVideoBlockingConfig, p1.universeId or "", p1.pageContext or "")
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 579 ]]
		-- upvalues: UseStateResult2_5 (copy), UseCanDevicePlayVideoPreviewResult (copy)
		UseStateResult2_5(UseCanDevicePlayVideoPreviewResult())
	end, { UseCanDevicePlayVideoPreviewResult })
	ReactModule.useEffect(UseResult8, { UseResult8 })
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseNavigationResult = UseNavigationFunction()
	local UseLocalizationResult = UseLocalizationFunction({ joinButtonText = "Common.VisitGame.Label.Play" })
	local CtaText = if IsContentTypeMatch then p1.ctaText elseif p1.ctaText == "" then UseLocalizationResult.joinButtonText else p1.ctaText
	local IsNotCtaTextMatch: boolean = IsContentTypeMatch and (p1.clickoutUrl ~= nil and (p1.clickoutUrl ~= "" and CtaText ~= ""))
	local LaunchExperienceEventContext = p1.launchExperienceEventContext or DiscoveryAnalyticsModule.Constants.Context.ExperienceTile
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 598 ]]
		-- upvalues: p1 (copy), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if p1.adId then
			SponsoredGamesRecordClickFunction(UseRoactServiceResult, p1.adId)
		end
	end, { UseRoactServiceResult, p1.adId })
	local UseResult10 = ReactModule.useCallback(function(p2) --[[ Line: 605 ]]
		-- upvalues: UseRoactServiceResult1 (copy), SetGamePlaySessionFunction (upval), SessionType (upval), UseIsHoveredTileResult (copy), HoverTileCoordinator (upval), p1 (copy), GameCollectionItemTypes (upval), LaunchExperienceEventContext (copy), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		if UseRoactServiceResult1 then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if UseIsHoveredTileResult then
			HoverTileCoordinator.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = p1.placeId,
				universeId = p1.universeId,
				adId = p1.adId,
				tileType = GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.referralSource, "OneByTwoTile", LaunchExperienceEventContext, p1.index, if FFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end
	end, {
		UseRoactServiceResult1, p1.reportExperienceLaunched, p1.placeId, p1.universeId,
		p1.adId, p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		LaunchExperienceEventContext, p1.index, UseIsHoveredTileResult
	})
	local UseResult11 = ReactModule.useCallback(function() --[[ Line: 648 ]]
		-- upvalues: UseRefResult2 (copy), UseIsHoveredTileResult (copy), HoverTileCoordinator (upval), UseStateResult6 (copy), UseStateResult4 (copy), VideoLoadingState (upval), OneByTwoTileTelemetry (upval), UseRefResult4 (copy), UseMemoResult1 (copy), VideoEndReason (upval), p1 (copy), UseNavigationResult (copy), AppPage (upval), Headline (ref), Subtitle (ref), GameCollectionItemTypes (upval), LaunchExperienceEventContext (copy), FFlagLuaAppSduiSponsoredOneByTwoTile (upval)
		if UseRefResult2.current then
			UseRefResult2.current = false
			
			return
		end
		if UseIsHoveredTileResult then
			HoverTileCoordinator.default:reset()
		end
		if UseStateResult6 and UseStateResult4 == VideoLoadingState.Loaded then
			OneByTwoTileTelemetry.logOneByTwoTileActivated()
			local Current = UseRefResult4.current
			UseMemoResult1:reset(VideoEndReason.TileClicked, nil, p1.universeId, nil)
			UseNavigationResult.navigate(AppPage.FeatureTileAdPlayer, {
				extraProps = {
					videoAssetId = p1.primaryVideoAssetId,
					imageAssetId = p1.primaryImageAssetId,
					startPlaybackProgress = Current,
					attributionThumbnailAssetId = p1.attributionThumbnailAssetId,
					videoPlaybackContext = p1.videoPlaybackContext,
					title = Headline,
					subtitle = Subtitle,
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
					source = GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
					launchExperienceEventContext = LaunchExperienceEventContext,
					reportGameDetailOpened = p1.reportGameDetailOpened,
					reportExperienceLaunched = p1.reportExperienceLaunched,
					onOpenGameDetails = if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.onOpenGameDetails else nil,
					disableGameLaunchSponsoredClickRecording = if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil
				}
			})
			
			return
		end
	end, {
		UseIsHoveredTileResult, UseNavigationResult, UseMemoResult1, p1.universeId,
		p1.primaryVideoAssetId, p1.primaryImageAssetId, p1.attributionThumbnailAssetId,
		p1.videoPlaybackContext, Headline, Subtitle, p1.contentType, p1.payerName,
		p1.sponsoredUserCohort, p1.adId, p1.enableReportAd, p1.clickoutUrl, p1.ctaText,
		p1.placeId, p1.placeIdOverride, p1.launchDataOverride, p1.referralSource,
		LaunchExperienceEventContext, p1.index, p1.reportGameDetailOpened,
		p1.reportExperienceLaunched,
		if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.onOpenGameDetails else nil,
		if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil,
		UseStateResult6, UseStateResult4
	})
	local UseResult12 = ReactModule.useCallback(function() --[[ Line: 732 ]]
		-- upvalues: OneByTwoTileTelemetry (upval), FFlagLuaAppSduiSponsoredOneByTwoTile (upval), p1 (copy), UseResult9 (copy)
		OneByTwoTileTelemetry.logOneByTwoTileGameJoinInitiated()
		OneByTwoTileTelemetry.logOneByTwoTileCtaActivated(OneByTwoTileTelemetry.CtaType.GameJoin)
		
		if not FFlagLuaAppSduiSponsoredOneByTwoTile then
			UseResult9()
		elseif not p1.disableGameLaunchSponsoredClickRecording then
			UseResult9()
			
			return
		end
	end, {
		UseResult9,
		if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.disableGameLaunchSponsoredClickRecording else nil
	})
	local UseResult13 = ReactModule.useCallback(function() --[[ Line: 749 ]]
		-- upvalues: IsNotCtaTextMatch (copy), OneByTwoTileTelemetry (upval), UseResult9 (copy), UseNavigationResult (copy), AppPage (upval), p1 (copy)
		if IsNotCtaTextMatch then
			OneByTwoTileTelemetry.logOneByTwoTileCtaActivated(OneByTwoTileTelemetry.CtaType.Clickout)
			UseResult9()
			UseNavigationResult.navigate(AppPage.GenericWebPage, {
				detail = p1.clickoutUrl,
				extraProps = { showDomainAsTitle = true }
			})
			
			return
		end
	end, {
		IsNotCtaTextMatch,
		UseNavigationResult,
		p1.clickoutUrl,
		UseResult9
	})
	ReactModule.useEffect(function() --[[ Line: 764 ]]
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult1, p1.impressionsTag, p1.index)
		
		return function() --[[ Line: 766 ]]
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult1, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local UseValidTileBadgesResult = UseValidTileBadgesFunction(p1.universeId or "", p1.topicId, p1.badgeOverride)
	local Number: number? = tonumber(p1.logoAspectRatio)
	local Number1: number = if Number and Number > 0 then Number else 1
	local LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio1 = if Number1 == 3 then LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio else LuaAppOneByTwoTileLogoWidthPercentSquareRatio
	local Large = nil
	local Size500 = nil
	local Size800 = nil
	local BodyMedium = nil
	local HeadingMedium = nil
	local XSmall = nil
	local Size1000 = nil
	local Medium = nil
	local TitleMedium = nil
	
	if IsUseResponsiveResultMatch then
		Large = UseTokensResult.Padding.Medium
		HeadingMedium = UseTokensResult.Typography.TitleLarge
		BodyMedium = UseTokensResult.Typography.BodySmall
		Size800 = UseTokensResult.Size.Size_600
		Size500 = UseTokensResult.Size.Size_500
		XSmall = UseTokensResult.Gap.XXSmall
		Medium = ButtonSize.Small
		Size1000 = UseTokensResult.Size.Size_800
		TitleMedium = UseTokensResult.Typography.TitleSmall
	else
		Large = UseTokensResult.Padding.Large
		HeadingMedium = UseTokensResult.Typography.HeadingMedium
		BodyMedium = UseTokensResult.Typography.BodyMedium
		Size800 = UseTokensResult.Size.Size_800
		Size500 = UseTokensResult.Size.Size_500
		XSmall = UseTokensResult.Gap.XSmall
		Medium = ButtonSize.Medium
		Size1000 = UseTokensResult.Size.Size_1000
		TitleMedium = UseTokensResult.Typography.TitleMedium
	end
	local PlaybackDetectionMethod = if FFlagLuaAppOneByTwoHoverIdleAutoplay or FFlagLuaAppGameTileSelectionVideoPlayback then GetPlaybackDetectionMethodFunction(UsePreferredInputResult, IsNotUseLastInputResultMatch) else nil
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Tile = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.rootSize else nil,
			LayoutOrder = p1.index,
			ZIndex = p1.zIndex,
			ref = UseRefResult1
		}, {
			Container = ReactModule.createElement("TextButton", {
				ref = UseRefResult,
				Size = p1.size or UDim2.fromScale(1, 1),
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				Text = "",
				AutoButtonColor = false,
				SelectionOrder = p1.SelectionOrder,
				[ReactModule.Event.Activated] = UseResult11,
				[ReactModule.Event.TouchLongPress] = UseResult3,
				[ReactModule.Event.SelectionGained] = UseResult1,
				[ReactModule.Event.SelectionLost] = UseResult2,
				[ReactModule.Change.GuiState] = UseResult
			}, {
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
				}),
				Video = ReactModule.createElement(VideoDisplay, {
					muted = true,
					ZIndex = 0,
					video = `rbxassetid://{p1.primaryVideoAssetId}`,
					thumbnail = `rbxassetid://{p1.primaryImageAssetId}`,
					shouldStartPlayback = UseStateResult5,
					loadImmediately = UseStateResult6 and UseStateResult4 ~= VideoLoadingState.Failed,
					looped = not FFlagLuaAppOneByTwoHoverIdleAutoplay or (not IsUserIntentWithSelectiveAutoplay1 or UseIsHoveredTileResult),
					Size = UDim2.fromScale(1, 1),
					ScaleType = Enum.ScaleType.Crop,
					cornerRadius = UseTokensResult.Radius.Medium,
					onVideoLoaded = UseResult4,
					onLoadingStateChanged = OnLoadingStateChanged,
					onVideoEnded = if FFlagLuaAppOneByTwoHoverIdleAutoplay and IsUserIntentWithSelectiveAutoplay1 then UseResult6 else nil,
					onVideoLooped = UseResult5,
					onVideoProgressChanged = UseResult7,
					videoPlaybackStateRef = if IsNotAdIdMatch then UseRefResult3 else nil
				}),
				GradientOverlayBottom = ReactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 1,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = UseTokensResult.Color.Extended.Black.Black_100.Color3
				}, {
					UICorner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					}),
					UIGradientBottom = ReactModule.createElement("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, LuaAppOneByTwoTileGradientTopTransparencyPercentRatio),
							NumberSequenceKeypoint.new(1 - LuaAppOneByTwoTileGradientBottomHeightPercentRatio, LuaAppOneByTwoTileGradientTopTransparencyPercentRatio),
							NumberSequenceKeypoint.new(1, LuaAppOneByTwoTileGradientBottomTransparencyPercentRatio)
						})
					})
				}),
				TileBadge = if UseValidTileBadgesResult then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 2,
					Size = UDim2.fromScale(1, 1)
				}, {
					Badge = ReactModule.createElement(GameTileThumbnailBadges, {
						tileBadgesByPosition = UseValidTileBadgesResult,
						padding = if FFlagLuaAppSponsoredTileBadgeContentPaddingModule then Large else nil
					})
				}) else nil,
				Logo = if p1.logoImageAssetId then ReactModule.createElement(Image, {
					tag = "anchor-top-right",
					ZIndex = 2,
					Image = `rbxassetid://{p1.logoImageAssetId}`,
					Position = UDim2.new(1, -UseTokensResult.Padding.Medium, 0, UseTokensResult.Padding.Medium),
					Size = UDim2.new(LuaAppOneByTwoTileLogoWidthPercentLandscapeRatio1, 0, 1, 0),
					aspectRatio = Number1
				}) else nil,
				OverflowMenu = if FFlagLuaAppSduiSponsoredOneByTwoTile and p1.renderOverflowMenu then p1.renderOverflowMenu({
					isHovered = UseIsHoveredTileResult,
					isSelected = UseStateResult,
					menuKey = HoverKey,
					parentRef = UseRefResult
				}) else ReactModule.createElement(SpanTileOverflowMenuModule, {
					zIndex = 4,
					hoverKey = HoverKey,
					parentRef = UseRefResult,
					universeId = p1.universeId,
					placeId = p1.placeId,
					adId = p1.adId,
					payerName = p1.payerName,
					sponsoredUserCohort = p1.sponsoredUserCohort,
					appPage = p1.appPage,
					topicId = p1.topicId,
					isSponsored = IsNotAdIdMatch,
					contentType = p1.contentType,
					setGameHidden = if FFlagLuaAppSduiSponsoredOneByTwoTile then p1.setGameHidden or function() --[[ Line: 912 ]] end else p1.setGameHidden,
					isHovered = UseIsHoveredTileResult,
					isSelected = UseStateResult,
					availableMenuItems = UseMemoResult2
				}),
				BottomStack = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, -2 * Large, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, Large, 1, -Large),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Padding = UDim.new(0, Large)
					}),
					TextStack = ReactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y
					}, {
						UIListLayout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							SortOrder = Enum.SortOrder.LayoutOrder,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							Padding = UDim.new(0, XSmall)
						}),
						Headline = if Headline then ReactModule.createElement("TextLabel", {
							LayoutOrder = 1,
							BackgroundTransparency = 1,
							TextWrapped = true,
							Size = UDim2.new(1, 0, 0, 2 * Size800),
							Text = Headline,
							Font = if FoundationFontFaceMigration then nil else HeadingMedium.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(HeadingMedium.Font) else nil,
							LineHeight = HeadingMedium.LineHeight,
							TextSize = HeadingMedium.FontSize,
							TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Bottom,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil,
						Subtitle = if Subtitle then ReactModule.createElement("TextLabel", {
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							TextWrapped = false,
							Size = UDim2.new(1, 0, 0, Size500),
							Text = Subtitle,
							Font = if FoundationFontFaceMigration then nil else BodyMedium.Font,
							FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyMedium.Font) else nil,
							LineHeight = BodyMedium.LineHeight,
							TextSize = BodyMedium.FontSize,
							TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							TextTruncate = Enum.TextTruncate.AtEnd
						}) else nil
					}),
					CtaButton = if IsContentTypeMatch then if IsNotCtaTextMatch then ReactModule.createElement("TextButton", {
						LayoutOrder = 2,
						Size = UDim2.fromOffset(0, Size1000),
						AutomaticSize = Enum.AutomaticSize.X,
						BackgroundColor3 = UseTokensResult.Color.Extended.White.White_20.Color3,
						BackgroundTransparency = UseTokensResult.Color.Extended.White.White_20.Transparency,
						BorderSizePixel = 0,
						Text = CtaText,
						TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
						Font = if FoundationFontFaceMigration then nil else TitleMedium.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleMedium.Font) else nil,
						TextSize = TitleMedium.FontSize,
						[ReactModule.Event.Activated] = UseResult13
					}, {
						UICorner = ReactModule.createElement("UICorner", {
							CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
						}),
						UIPadding = ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large),
							PaddingRight = UDim.new(0, UseTokensResult.Padding.Large)
						})
					}) else nil elseif p1.universeId then ReactModule.createElement(PlayButton, {
						LayoutOrder = 2,
						launchSource = "OneByTwoTile",
						hidePlayableIcon = true,
						preferSecondaryPlayButton = true,
						universeId = p1.universeId,
						placeId = if p1.placeIdOverride then p1.placeIdOverride else p1.placeId,
						referralSource = p1.referralSource,
						eventContext = LaunchExperienceEventContext,
						playableText = CtaText,
						buttonSize = Medium,
						onActivated = UseResult12,
						reportExperienceLaunched = UseResult10,
						experienceJoinData = {
							launchData = p1.launchDataOverride,
							tileType = GameCollectionItemTypes.GameCollectionItemType.OneByTwoTile,
							nativeAdData = p1.adId
						}
					}) else nil
				})
			})
		}),
		VideoPlaybackDetector = if IsDisablePlayback then nil else ReactModule.createElement(VideoPlaybackDetector, {
			videoKey = if FFlagLuaAppOneByTwoHoverIdleAutoplay then Text1 else HoverKey,
			itemIndex = p1.index,
			itemFrameRef = UseRefResult,
			playbackDetectionMethod = if FFlagLuaAppGameTileSelectionVideoPlayback or FFlagLuaAppOneByTwoHoverIdleAutoplay then PlaybackDetectionMethod else nil,
			isHoverSupported = if FFlagLuaAppGameTileSelectionVideoPlayback then nil else IsNotUseLastInputResultMatch,
			autoplay = not FFlagLuaAppGameTileSelectionVideoPlayback or nil,
			isHovered = UseIsHoveredTileResult,
			hasVideoPlaybackUserIntent = if FFlagLuaAppOneByTwoHoverIdleAutoplay and PlaybackDetectionMethod == VideoPlaybackDetectionMethod.Hover then UseIsHoveredTileResult else nil,
			onPlaybackChange = UseStateResult2_4,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = FIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = FIntLuaAppGameTileVideoVisiblePercent,
			videoPlaybackCoordinator = UseMemoResult1,
			viewportVideoAutoplayController = if FFlagLuaAppVideoAutoplayOneByTwoConcurrentPlayback then ViewportVideoAutoplayController elseif p1.videoPlaybackContext then p1.videoPlaybackContext.viewportVideoAutoplayController else nil,
			isVideoEligible = UseStateResult6,
			onPlaybackCandidate = UseResult8
		})
	})
end)