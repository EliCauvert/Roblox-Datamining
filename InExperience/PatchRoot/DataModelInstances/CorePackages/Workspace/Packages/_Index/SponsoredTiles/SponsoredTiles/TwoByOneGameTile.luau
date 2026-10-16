local SponsoredTiles = script:FindFirstAncestor("SponsoredTiles")
local Parent = SponsoredTiles.Parent
local GameTileModule = require(Parent.GameTile)
local GetGameTileLayoutDataFunction = GameTileModule.getGameTileLayoutData
local FormatExperienceThumbnailFunction = GameTileModule.formatExperienceThumbnail
local UseIsHoveredTileFunction = GameTileModule.useIsHoveredTile
local UseNavigateToGameDetailsFunction = GameTileModule.useNavigateToGameDetails
local GameTileThumbnailBadges = GameTileModule.GameTileThumbnailBadges
local GetAvailableGameTileOverflowMenuItemsFunction = GameTileModule.getAvailableGameTileOverflowMenuItems
local SpanTileOverflowMenuModule = require(SponsoredTiles.SpanTileOverflowMenu.SpanTileOverflowMenu)
local TwoByOneGameTileTelemetry = require(Parent.SponsoredTilesTelemetry).TwoByOneGameTileTelemetry
local _ = require(SponsoredTiles.types)
local HiddenTileContent = GameTileModule.HiddenTileContent
local ItemLayoutDataParsingUtils = GameTileModule.ItemLayoutDataParsingUtils
local HoverTileCoordinator = GameTileModule.HoverTileCoordinator
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Image = FoundationModule.Image
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local ResponsiveModule = require(Parent.Responsive)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local AppBloxModule = require(Parent.AppBlox)
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseOverflowMenuOpenFunction = AppBloxModule.useOverflowMenuOpen
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local PlayButton = require(Parent.GamePlayButton).PlayButton
local UseOnPlayButtonCallbackFunction = require(Parent.GamePlayButton).useOnPlayButtonCallback
local UsePlayButtonStateFunction = require(Parent.GamePlayButton).usePlayButtonState
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local AppSessionService = RoactServiceTagsModule.AppSessionService
local RobloxAppSessionizationModule = require(Parent.RobloxAppSessionization)
local SetGamePlaySessionFunction = RobloxAppSessionizationModule.SetGamePlaySession
local SessionType = RobloxAppSessionizationModule.SessionType
local SharedFlagsModule = require(Parent.SharedFlags)
local SponsoredGamesRecordClickFunction = require(Parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local UseValidTileBadgesFunction = GameTileModule.useValidTileBadges
local UseTagAsViewportAutoplayCandidateFunction = require(Parent.VideoUtils).useTagAsViewportAutoplayCandidate
local UseTagAsSponsoredAdViewabilityCandidateFunction = require(Parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local LuaAppTwoByOneTileSmallScreenBreakpoint = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local FFlagLuaAppHomePageFirstImageLoadObserver = SharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagLuaAppFeatureTileHapticsFix = SharedFlagsModule.FFlagLuaAppFeatureTileHapticsFix
local FFlagLuaAppTileVideoCandidateOnly = SharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppDemoModePlayButtonTelemetry = SharedFlagsModule.FFlagLuaAppDemoModePlayButtonTelemetry
local FFlagLuaAppHomeThumbnailPrefetch = SharedFlagsModule.FFlagLuaAppHomeThumbnailPrefetch
local FFlagMigrateGameInfoToStore = SharedFlagsModule.FFlagMigrateGameInfoToStore
local FFlagLuaAppSduiSponsoredTwoByOneTile = SharedFlagsModule.FFlagLuaAppSduiSponsoredTwoByOneTile
local FFlagLuaAppEnableReportExperience = SharedFlagsModule.FFlagLuaAppEnableReportExperience
local ResolveGameTileThumbnailUri = if FFlagLuaAppHomeThumbnailPrefetch then GameTileModule.resolveGameTileThumbnailUri else nil
local TileLongPress: string = if FFlagLuaAppFeatureTileHapticsFix then "TileLongPress" else "TwoByOneTileLongPress"
local _Color3 = Color3.new(1, 1, 1)
local _Color3_1 = Color3.new(0, 0, 0)
local LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentLandscape", 20) / 100
local LuaAppTwoByOneTileLogoHeightPercentSquareRatio = game:DefineFastInt("LuaAppTwoByOneTileLogoHeightPercentSquare", 36) / 100
local LuaAppTwoByOneTileGradientStartOpacityPercentRatio = game:DefineFastInt("LuaAppTwoByOneTileGradientStartOpacityPercent", 30) / 100
local LuaAppTwoByOneTileGradientEndOpacityPercentRatio = game:DefineFastInt("LuaAppTwoByOneTileGradientEndOpacityPercent", 100) / 100
local LuaAppTwoByOneTileGradientWidthPercentRatio = game:DefineFastInt("LuaAppTwoByOneTileGradientWidthPercent", 50) / 100
local config = {
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

return function(p1) --[[ Line: 186 ]]
	-- upvalues: UseNavigateToGameDetailsFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), ResponsiveModule (copy), LuaAppTwoByOneTileSmallScreenBreakpoint (copy), ButtonSize (copy), ReactModule (copy), GetTextSizeFunction (copy), LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio (copy), LuaAppTwoByOneTileLogoHeightPercentSquareRatio (copy), UseValidTileBadgesFunction (copy), UseTriggerFeedbackFunction (copy), UseOverflowMenuOpenFunction (copy), UseIsHoveredTileFunction (copy), FFlagLuaAppSduiSponsoredTwoByOneTile (copy), SponsoredGamesRecordClickFunction (copy), GameCollectionItemTypes (copy), TwoByOneGameTileTelemetry (copy), GetAvailableGameTileOverflowMenuItemsFunction (copy), FFlagLuaAppEnableReportExperience (copy), TileLongPress (copy), GetOverflowMenuSignalStoreFunction (copy), SetGamePlaySessionFunction (copy), SessionType (copy), HoverTileCoordinator (copy), FFlagLuaAppDemoModePlayButtonTelemetry (copy), UsePlayButtonStateFunction (copy), UseOnPlayButtonCallbackFunction (copy), FFlagMigrateGameInfoToStore (copy), UseSelectorFunction (copy), GameInfosReducer (copy), FFlagLuaAppHomeThumbnailPrefetch (copy), ResolveGameTileThumbnailUri (copy), FormatExperienceThumbnailFunction (copy), GetGameTileLayoutDataFunction (copy), ItemLayoutDataParsingUtils (copy), ImpressionsTagUtility (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), UseTagAsSponsoredAdViewabilityCandidateFunction (copy), HiddenTileContent (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), LuaAppTwoByOneTileGradientWidthPercentRatio (copy), _Color3 (copy), LuaAppTwoByOneTileGradientStartOpacityPercentRatio (copy), LuaAppTwoByOneTileGradientEndOpacityPercentRatio (copy), _Color3_1 (copy), GameTileThumbnailBadges (copy), Image (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), PlayButton (copy), SpanTileOverflowMenuModule (copy)
	local UseNavigateToGameDetailsResult = UseNavigateToGameDetailsFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local UseLocalizationResult = UseLocalizationFunction({
		sponsoredText = "Feature.GamePage.Label.Sponsored",
		joinButtonText = "Common.VisitGame.Label.Play"
	})
	local CtaText = if p1.ctaText then p1.ctaText else UseLocalizationResult.joinButtonText
	local Entry = config[p1.tileVariant] or config.Default
	local UseTokensResult = UseTokensFunction()
	local _UDim = UDim.new(0, UseTokensResult.Radius.Medium)
	local TitleSmall = nil
	local CaptionSmall = nil
	local Medium1 = nil
	local Medium = nil
	local TitleLarge = nil
	local Size800 = nil
	local BodySmall = nil
	local XXSmall = nil
	local Small = nil
	
	if ResponsiveModule.useResponsive({
		{
			Key = "Smaller",
			maxWidth = LuaAppTwoByOneTileSmallScreenBreakpoint
		}
	}) == "Smaller" then
		Medium = UseTokensResult.Padding.Medium
		Medium1 = UseTokensResult.Padding.Medium
		TitleLarge = UseTokensResult.Typography.TitleLarge
		BodySmall = UseTokensResult.Typography.BodySmall
		CaptionSmall = UseTokensResult.Typography.CaptionSmall
		XXSmall = UseTokensResult.Gap.XXSmall
		Small = ButtonSize.Small
		Size800 = UseTokensResult.Size.Size_800
		TitleSmall = UseTokensResult.Typography.TitleSmall
	else
		Medium = UseTokensResult.Padding.Large
		Medium1 = UseTokensResult.Padding.Large
		TitleLarge = UseTokensResult.Typography.HeadingMedium
		BodySmall = UseTokensResult.Typography.BodyMedium
		CaptionSmall = UseTokensResult.Typography.CaptionMedium
		XXSmall = UseTokensResult.Gap.XSmall
		Small = ButtonSize.Medium
		Size800 = UseTokensResult.Size.Size_1000
		TitleSmall = UseTokensResult.Typography.TitleMedium
	end
	local ScaledLarge = UseTokensResult.Padding.Large * 4
	local UseMemoResult = ReactModule.useMemo(function(): UDim --[[ Line: 233 ]]
		-- upvalues: GetTextSizeFunction (upval), CtaText (copy), TitleSmall (ref), ScaledLarge (copy)
		return UDim.new(0, GetTextSizeFunction(CtaText, TitleSmall.FontSize, TitleSmall.Font, Vector2.new(1e999, 1e999)).X + ScaledLarge)
	end, { CtaText, TitleSmall, ScaledLarge })
	local WhiteColor3 = if Entry.ctaStyle == "StandardLight" then UseTokensResult.Color.Extended.White.White_20.Color3 else UseTokensResult.LightMode.ActionOverMedia.Background.Color3
	local Transparency = if Entry.ctaStyle == "StandardLight" then UseTokensResult.Color.Extended.White.White_20.Transparency else UseTokensResult.LightMode.ActionOverMedia.Background.Transparency
	local Number: number? = tonumber(p1.logoAspectRatio)
	local Number1: number = if Number and Number > 0 then Number else 1
	local LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio1 = if Number1 == 3 then LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio else LuaAppTwoByOneTileLogoHeightPercentSquareRatio
	local UniverseId = p1.universeId
	local PlaceId = p1.placeId
	local UseValidTileBadgesResult = UseValidTileBadgesFunction(UniverseId, p1.topicId, p1.badgeOverride)
	local HoverKey = p1.hoverKey
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(HoverKey)
	local UseIsHoveredTileResult = UseIsHoveredTileFunction(UseRefResult, HoverKey, true)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 279 ]]
		-- upvalues: p1 (copy), FFlagLuaAppSduiSponsoredTwoByOneTile (upval), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if p1.isSponsored and p1.adId and (not FFlagLuaAppSduiSponsoredTwoByOneTile or not p1.disableSponsoredClickRecording) then
			SponsoredGamesRecordClickFunction(UseRoactServiceResult, p1.adId)
		end
	end, {
		UseRoactServiceResult,
		p1.isSponsored,
		p1.adId,
		if FFlagLuaAppSduiSponsoredTwoByOneTile then p1.disableSponsoredClickRecording else nil
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 296 ]]
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = false
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 301 ]]
		-- upvalues: FFlagLuaAppSduiSponsoredTwoByOneTile (upval), p1 (copy), GameCollectionItemTypes (upval), UseNavigateToGameDetailsResult (copy), UniverseId (copy), TwoByOneGameTileTelemetry (upval)
		if FFlagLuaAppSduiSponsoredTwoByOneTile and p1.onOpenGameDetails then
			p1.onOpenGameDetails()
		else
			UseNavigateToGameDetailsResult(UniverseId, {
				index = p1.index,
				placeIdOverride = p1.placeIdOverride,
				experienceJoinData = {
					launchData = if p1.launchDataOverride then p1.launchDataOverride else nil,
					tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
					nativeAdData = p1.adId
				}
			})
			
			if not FFlagLuaAppSduiSponsoredTwoByOneTile then
				TwoByOneGameTileTelemetry.logTwoByOneTileViewGameDetailsActivated()
			end
			if p1.reportGameDetailOpened then
				p1.reportGameDetailOpened(p1.index, UniverseId)
			end
		end
		if FFlagLuaAppSduiSponsoredTwoByOneTile then
			TwoByOneGameTileTelemetry.logTwoByOneTileViewGameDetailsActivated()
		end
	end, {
		UseNavigateToGameDetailsResult, UniverseId, p1.index, p1.placeIdOverride,
		p1.launchDataOverride, p1.reportGameDetailOpened, p1.adId,
		if FFlagLuaAppSduiSponsoredTwoByOneTile then p1.onOpenGameDetails else nil
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 343 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.onSelectionGained then
			p1.onSelectionGained()
		end
	end, { p1.onSelectionGained })
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 355 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.onSelectionLost then
			p1.onSelectionLost()
		end
	end, { p1.onSelectionLost })
	local IsSponsored = p1.isSponsored
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 368 ]]
		-- upvalues: GetAvailableGameTileOverflowMenuItemsFunction (upval), IsSponsored (copy), p1 (copy), FFlagLuaAppEnableReportExperience (upval)
		return GetAvailableGameTileOverflowMenuItemsFunction({
			isSponsored = IsSponsored,
			enableSponsoredFeedback = p1.enableSponsoredFeedback,
			enableReportAd = p1.enableReportAd,
			enableReportExperience = if FFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
			enableExplicitFeedback = p1.enableExplicitFeedback
		})
	end, {
		IsSponsored,
		p1.enableSponsoredFeedback,
		p1.enableReportAd,
		if FFlagLuaAppEnableReportExperience then p1.enableReportExperience else nil,
		p1.enableExplicitFeedback
	})
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 389 ]]
		-- upvalues: UseRefResult1 (copy), FFlagLuaAppSduiSponsoredTwoByOneTile (upval), p1 (copy), UseMemoResult1 (copy), UseTriggerFeedbackResult (copy), UseOverflowMenuOpenResult (copy), UniverseId (copy), TileLongPress (upval), GetOverflowMenuSignalStoreFunction (upval), HoverKey (copy)
		local Current = UseRefResult1.current
		UseRefResult1.current = true
		
		if FFlagLuaAppSduiSponsoredTwoByOneTile and Current == false and p1.onTouchLongPress then
			p1.onTouchLongPress()
			
			return
		end
		if Current == false and next(UseMemoResult1) ~= nil then
			if UseTriggerFeedbackResult and not UseOverflowMenuOpenResult then
				UseTriggerFeedbackResult(TileLongPress, "Press", p1.appPage or "Unknown", { universeId = UniverseId, sortId = p1.topicId })
			end
			GetOverflowMenuSignalStoreFunction().openMenu(HoverKey)
		end
	end, {
		HoverKey, p1.appPage, p1.topicId, UseTriggerFeedbackResult, UseMemoResult1,
		UseOverflowMenuOpenResult, UniverseId,
		if FFlagLuaAppSduiSponsoredTwoByOneTile then p1.onTouchLongPress else nil
	})
	local UseResult6 = ReactModule.useCallback(function(p2) --[[ Line: 419 ]]
		-- upvalues: UseRoactServiceResult1 (copy), SetGamePlaySessionFunction (upval), SessionType (upval), UseIsHoveredTileResult (copy), HoverTileCoordinator (upval), p1 (copy), PlaceId (copy), UniverseId (copy), GameCollectionItemTypes (upval), FFlagLuaAppDemoModePlayButtonTelemetry (upval)
		if UseRoactServiceResult1 then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if UseIsHoveredTileResult then
			HoverTileCoordinator.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = PlaceId,
				universeId = UniverseId,
				adId = p1.adId,
				tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.appPage, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p1.index, if FFlagLuaAppDemoModePlayButtonTelemetry then p2 else nil)
		end
	end, {
		UseRoactServiceResult1, p1.reportExperienceLaunched, PlaceId, UniverseId,
		p1.appPage, p1.index, p1.adId, p1.placeIdOverride, p1.launchDataOverride,
		UseIsHoveredTileResult
	})
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, UniverseId)
	local TwoByOneTile = UseOnPlayButtonCallbackFunction(UniverseId, p1.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p1.launchDataOverride,
		tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p1.adId
	}, if p1.placeIdOverride then p1.placeIdOverride else p1.placeId)
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 477 ]]
		-- upvalues: TwoByOneGameTileTelemetry (upval), UseResult (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		TwoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		UseResult()
	end, { UseResult })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 483 ]]
		-- upvalues: TwoByOneGameTileTelemetry (upval), UseResult (copy), UseResult2 (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileCtaActivated()
		UseResult()
		UseResult2()
	end, { UseResult, UseResult2 })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 489 ]]
		-- upvalues: TwoByOneGameTileTelemetry (upval), TwoByOneTile (copy), UsePlayButtonStateResult (copy), UseResult6 (copy)
		TwoByOneGameTileTelemetry.logTwoByOneTileGameJoinInitiated()
		TwoByOneTile(UsePlayButtonStateResult.playButtonState, UseResult6)
	end, {
		TwoByOneTile,
		UsePlayButtonStateResult.playButtonState,
		UseResult6
	})
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 501 ]]
		-- upvalues: UseRefResult1 (copy), UseIsHoveredTileResult (copy), HoverTileCoordinator (upval), TwoByOneGameTileTelemetry (upval), UseResult (copy), Entry (copy), UseResult2 (copy), UseResult9 (copy)
		if UseRefResult1.current then
			UseRefResult1.current = false
			
			return
		end
		if UseIsHoveredTileResult then
			HoverTileCoordinator.default:reset()
		end
		TwoByOneGameTileTelemetry.logTwoByOneTileActivated()
		UseResult()
		
		if Entry.onTileActivation == "OpenEdp" then
			UseResult2()
			
			return
		end
		if Entry.onTileActivation == "JoinGame" then
			UseResult9()
		end
	end, {
		UseIsHoveredTileResult,
		Entry.onTileActivation,
		UseResult2,
		UseResult9,
		UseResult
	})
	local UseSelectorResult = if FFlagMigrateGameInfoToStore then nil else UseSelectorFunction(function(p2) --[[ Line: 533 ]]
		-- upvalues: GameInfosReducer (upval), UniverseId (copy)
		return p2.Personalization[GameInfosReducer.key][UniverseId]
	end)
	local ResolveGameTileThumbnailUriResult = nil
	
	if FFlagLuaAppHomeThumbnailPrefetch then
		ResolveGameTileThumbnailUriResult = ResolveGameTileThumbnailUri({
			useGridTile = true,
			isEmphasized = true,
			placeId = PlaceId,
			perEntryWideAssetId = if FFlagMigrateGameInfoToStore then p1.wideAssetId else p1.primaryWideImageAssetId,
			game = if FFlagMigrateGameInfoToStore then nil else UseSelectorResult,
			topicId = p1.topicId
		})
	elseif FFlagMigrateGameInfoToStore then
		ResolveGameTileThumbnailUriResult = FormatExperienceThumbnailFunction(p1.wideAssetId, PlaceId, true)
	else
		local GameTileLayoutData = GetGameTileLayoutDataFunction(UseSelectorResult, p1.topicId)
		ResolveGameTileThumbnailUriResult = FormatExperienceThumbnailFunction((if p1.primaryWideImageAssetId then p1.primaryWideImageAssetId else ItemLayoutDataParsingUtils.getWideImageAssetId(GameTileLayoutData)) or (UseSelectorResult and UseSelectorResult.primaryWideAssetId or nil), PlaceId, true)
	end
	local AgeRatingLabel = if FFlagMigrateGameInfoToStore then p1.ageRatingLabel else UseSelectorResult and UseSelectorResult.ageRecommendationDisplayName or nil
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 568 ]]
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult2, p1.impressionsTag, p1.index)
		
		return function() --[[ Line: 570 ]]
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult2, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	UseTagAsViewportAutoplayCandidateFunction(UseRefResult2, p1.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	UseTagAsSponsoredAdViewabilityCandidateFunction(UseRefResult2, if p1.isSponsored and p1.adId ~= nil and not p1.isHidden then {
		mediaType = "image",
		encryptedAdTrackingData = p1.adId,
		tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
	} else nil)
	
	return if p1.isHidden then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if FFlagLuaAppSduiSponsoredTwoByOneTile then p1.rootSize else nil,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = UseRefResult2
	}, {
		TwoByOneTileContainer = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p1.size or UDim2.fromScale(1, 1),
			ref = UseRefResult,
			SelectionOrder = p1.SelectionOrder
		}, {
			HiddenTileContent = if FFlagLuaAppSduiSponsoredTwoByOneTile and p1.renderHiddenState then p1.renderHiddenState(UseRefResult) else ReactModule.createElement(HiddenTileContent, {
				appPage = p1.appPage,
				collectionId = p1.topicId,
				setGameHidden = p1.setGameHidden,
				universeId = UniverseId,
				parentRef = UseRefResult,
				isSponsored = IsSponsored
			})
		})
	}) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if FFlagLuaAppSduiSponsoredTwoByOneTile then p1.rootSize else nil,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = UseRefResult2
	}, {
		TwoByOneTileContainer = ReactModule.createElement("TextButton", {
			Size = p1.size or UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ref = UseRefResult,
			SelectionOrder = p1.SelectionOrder,
			[ReactModule.Event.TouchLongPress] = UseResult5,
			[ReactModule.Event.Activated] = UseResult10,
			[ReactModule.Event.SelectionGained] = UseResult3,
			[ReactModule.Event.SelectionLost] = UseResult4,
			[ReactModule.Change.GuiState] = UseResult1
		}, {
			BackgroundImage = ReactModule.createElement("ImageLabel", {
				[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = ResolveGameTileThumbnailUriResult,
				ScaleType = Enum.ScaleType.Crop,
				ZIndex = 0
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim })
			}),
			GradientOverlayLeft = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(LuaAppTwoByOneTileGradientWidthPercentRatio, 0, 1, 0),
				BackgroundColor3 = _Color3
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
				UIGradientLeft = ReactModule.createElement("UIGradient", {
					Rotation = 0,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, LuaAppTwoByOneTileGradientStartOpacityPercentRatio),
						NumberSequenceKeypoint.new(1, LuaAppTwoByOneTileGradientEndOpacityPercentRatio)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, _Color3_1),
						ColorSequenceKeypoint.new(1, _Color3_1)
					})
				})
			}),
			GradientOverlayBottom = ReactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				ZIndex = 1,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UDim2.new(1, 0, LuaAppTwoByOneTileGradientWidthPercentRatio, 0),
				BackgroundColor3 = _Color3
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
				UIGradientBottom = ReactModule.createElement("UIGradient", {
					Rotation = 90,
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, LuaAppTwoByOneTileGradientEndOpacityPercentRatio),
						NumberSequenceKeypoint.new(1, LuaAppTwoByOneTileGradientStartOpacityPercentRatio)
					}),
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, _Color3_1),
						ColorSequenceKeypoint.new(1, _Color3_1)
					})
				})
			}),
			TileBadge = UseValidTileBadgesResult and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = ReactModule.createElement(GameTileThumbnailBadges, { tileBadgesByPosition = UseValidTileBadgesResult })
			}),
			ContentOverlay = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 3,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, Medium),
					PaddingRight = UDim.new(0, Medium),
					PaddingTop = UDim.new(0, Medium1),
					PaddingBottom = UDim.new(0, Medium1)
				}),
				Logo = p1.logoImageAssetId and ReactModule.createElement(Image, {
					Position = UDim2.new(1, 0, 0, 0),
					AnchorPoint = Vector2.new(1, 0),
					Image = "rbxassetid://" .. tostring(p1.logoImageAssetId),
					Size = UDim2.new(1, 0, LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio1, 0),
					aspectRatio = Number1
				}),
				HeaderFrame = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Position = UDim2.new(0, 0, 0.47, 0),
					AnchorPoint = Vector2.new(0, 0.5)
				}, {
					UIListLayout = ReactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, XXSmall)
					}),
					Headline = ReactModule.createElement("TextLabel", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p1.headline or "",
						Font = if FoundationFontFaceMigration then nil else TitleLarge.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleLarge.Font) else nil,
						TextSize = TitleLarge.FontSize,
						TextColor3 = _Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					}),
					Subtitle = ReactModule.createElement("TextLabel", {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = Enum.AutomaticSize.Y,
						Text = p1.subtitle or "",
						Font = if FoundationFontFaceMigration then nil else BodySmall.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodySmall.Font) else nil,
						TextSize = BodySmall.FontSize,
						TextColor3 = _Color3,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Top
					})
				}),
				JoinButtonContainer = Entry.onCtaActivation == "JoinGame" and ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.XY,
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1)
				}, {
					JoinButton = ReactModule.createElement(PlayButton, {
						eventContext = "TwoByOneTile",
						launchSource = "TwoByOneTile",
						hidePlayableIcon = true,
						preferSecondaryPlayButton = true,
						universeId = UniverseId,
						placeId = if p1.placeIdOverride then p1.placeIdOverride else PlaceId,
						referralSource = p1.appPage,
						playableText = CtaText,
						buttonSize = Small,
						width = UseMemoResult,
						onActivated = UseResult7,
						reportExperienceLaunched = UseResult6,
						experienceJoinData = if p1.launchDataOverride then { launchData = p1.launchDataOverride } else nil
					})
				}),
				ViewGameDetailsButton = Entry.onCtaActivation == "OpenEdp" and ReactModule.createElement("TextButton", {
					Size = UDim2.new(UseMemoResult.Scale, UseMemoResult.Offset, 0, Size800),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundColor3 = WhiteColor3,
					BackgroundTransparency = Transparency,
					Text = CtaText,
					TextColor3 = UseTokensResult.LightMode.ActionOverMedia.Foreground.Color3,
					Font = if FoundationFontFaceMigration then nil else TitleSmall.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(TitleSmall.Font) else nil,
					TextSize = TitleSmall.FontSize,
					[ReactModule.Event.Activated] = UseResult8
				}, {
					UICorner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					})
				}),
				BottomRightLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, CaptionSmall.FontSize * CaptionSmall.LineHeight),
					Text = AgeRatingLabel,
					TextSize = CaptionSmall.FontSize,
					Font = if FoundationFontFaceMigration then nil else CaptionSmall.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(CaptionSmall.Font) else nil,
					TextColor3 = UseTokensResult.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenu = if FFlagLuaAppSduiSponsoredTwoByOneTile and p1.renderOverflowMenu then p1.renderOverflowMenu({
				isHovered = UseIsHoveredTileResult,
				isSelected = UseStateResult,
				menuKey = HoverKey,
				parentRef = UseRefResult
			}) else ReactModule.createElement(SpanTileOverflowMenuModule, {
				zIndex = 4,
				hoverKey = HoverKey,
				parentRef = UseRefResult,
				universeId = UniverseId,
				placeId = PlaceId,
				adId = p1.adId,
				payerName = p1.payerName,
				sponsoredUserCohort = p1.sponsoredUserCohort,
				appPage = p1.appPage,
				topicId = p1.topicId,
				isSponsored = p1.isSponsored,
				setGameHidden = p1.setGameHidden or function() --[[ Line: 872 ]] end,
				isHovered = UseIsHoveredTileResult,
				isSelected = UseStateResult,
				availableMenuItems = UseMemoResult1
			})
		})
	})
end