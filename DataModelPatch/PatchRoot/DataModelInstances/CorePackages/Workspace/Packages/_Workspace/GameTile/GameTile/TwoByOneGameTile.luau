local GameTile = script:FindFirstAncestor("GameTile")
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local FormatExperienceThumbnailModule = require(GameTile.formatExperienceThumbnail)
local UseIsHoveredTileModule = require(GameTile.useIsHoveredTile)
local UseNavigateToGameDetailsModule = require(GameTile.useNavigateToGameDetails)
local GameTileOverflowMenuModule = require(GameTile.GameTileOverflowMenu)
local GameTileThumbnailBadgesModule = require(GameTile.Overlays.GameTileThumbnailBadges)
local GetAvailableGameTileOverflowMenuItemsModule = require(GameTile.getAvailableGameTileOverflowMenuItems)
local TwoByOneGameTileTelemetryModule = require(GameTile.TwoByOneGameTileTelemetry)
local HiddenTileContentModule = require(GameTile.HiddenGameTile.HiddenTileContent)
local ItemLayoutDataParsingUtilsModule = require(GameTile.ItemLayoutDataParsingUtils)
local HoverTileCoordinatorModule = require(GameTile.HoverTileCoordinator)
local Parent = GameTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Image = FoundationModule.Image
local ResponsiveModule = require(Parent.Responsive)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local AppBloxModule = require(Parent.AppBlox)
local GetOverflowMenuSignalStoreFunction = AppBloxModule.getOverflowMenuSignalStore
local UseOverflowMenuOpenFunction = AppBloxModule.useOverflowMenuOpen
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local _ = require(GameTile.GameTileTypes)
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
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local SponsoredGamesRecordClickFunction = DiscoveryAnalyticsModule.Requests.sponsoredGamesRecordClick
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local UseValidTileBadgesModule = require(GameTile.Overlays.useValidTileBadges)
local UseTagAsViewportAutoplayCandidateFunction = require(Parent.VideoUtils).useTagAsViewportAutoplayCandidate
local UseTagAsSponsoredAdViewabilityCandidateFunction = require(Parent.SponsoredAdViewability).useTagAsSponsoredAdViewabilityCandidate
local LuaAppTwoByOneTileSmallScreenBreakpoint = game:DefineFastInt("LuaAppTwoByOneTileSmallScreenBreakpoint", 600)
local FFlagLuaAppSupportSponsoredExplicitFeedback = SharedFlagsModule.FFlagLuaAppSupportSponsoredExplicitFeedback
local FFlagLuaAppFixExplicitFeedbackTelemetry = SharedFlagsModule.FFlagLuaAppFixExplicitFeedbackTelemetry
local FFlagLuaAppHomePageFirstImageLoadObserver = SharedFlagsModule.FFlagLuaAppHomePageFirstImageLoadObserver
local FFlagLuaAppHapticTriggeredTelemetry = SharedFlagsModule.FFlagLuaAppHapticTriggeredTelemetry
local FFlagLuaAppFixTwoByOneOverflowMenuTelemetry = SharedFlagsModule.FFlagLuaAppFixTwoByOneOverflowMenuTelemetry
local FFlagLuaAppHomeTouchAutoplay = SharedFlagsModule.FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = SharedFlagsModule.FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppFixCustomTileBugs = SharedFlagsModule.FFlagLuaAppFixCustomTileBugs
local FFlagLuaAppSponsoredAdViewabilityEnabled = SharedFlagsModule.FFlagLuaAppSponsoredAdViewabilityEnabled
local GameTileOverflowMenuActionFunction = DiscoveryAnalyticsModule.Events.gameTileOverflowMenuAction
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

return function(p1)
	-- upvalues: UseNavigateToGameDetailsModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), ResponsiveModule (copy), LuaAppTwoByOneTileSmallScreenBreakpoint (copy), ButtonSize (copy), ReactModule (copy), GetTextSizeFunction (copy), LuaAppTwoByOneTileLogoHeightPercentLandscapeRatio (copy), LuaAppTwoByOneTileLogoHeightPercentSquareRatio (copy), UseValidTileBadgesModule (copy), UseTriggerFeedbackFunction (copy), UseOverflowMenuOpenFunction (copy), UseIsHoveredTileModule (copy), SponsoredGamesRecordClickFunction (copy), FFlagLuaAppFixTwoByOneOverflowMenuTelemetry (copy), GetOverflowMenuSignalStoreFunction (copy), GameCollectionItemTypes (copy), TwoByOneGameTileTelemetryModule (copy), GetAvailableGameTileOverflowMenuItemsModule (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (copy), FFlagLuaAppFixExplicitFeedbackTelemetry (copy), GameTileOverflowMenuActionFunction (copy), FFlagLuaAppHapticTriggeredTelemetry (copy), SetGamePlaySessionFunction (copy), SessionType (copy), HoverTileCoordinatorModule (copy), UsePlayButtonStateFunction (copy), UseOnPlayButtonCallbackFunction (copy), UseSelectorFunction (copy), GameInfosReducer (copy), GetGameTileLayoutDataModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), ImpressionsTagUtility (copy), FFlagLuaAppHomeTouchAutoplay (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppSponsoredAdViewabilityEnabled (copy), UseTagAsSponsoredAdViewabilityCandidateFunction (copy), FFlagLuaAppFixCustomTileBugs (copy), HiddenTileContentModule (copy), FFlagLuaAppHomePageFirstImageLoadObserver (copy), LuaAppTwoByOneTileGradientWidthPercentRatio (copy), _Color3 (copy), LuaAppTwoByOneTileGradientStartOpacityPercentRatio (copy), LuaAppTwoByOneTileGradientEndOpacityPercentRatio (copy), _Color3_1 (copy), GameTileThumbnailBadgesModule (copy), Image (copy), PlayButton (copy), GameTileOverflowMenuModule (copy)
	local UseNavigateToGameDetailsModuleResult = UseNavigateToGameDetailsModule()
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
	local XXSmall = nil
	local Medium1 = nil
	local BodySmall = nil
	local Small = nil
	local Medium = nil
	local TitleLarge = nil
	local Size800 = nil
	
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
	local UseMemoResult = ReactModule.useMemo(function(): UDim
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
	local UseValidTileBadgesModuleResult = UseValidTileBadgesModule(UniverseId, p1.topicId, p1.badgeOverride)
	local HoverKey = p1.hoverKey
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseOverflowMenuOpenResult = UseOverflowMenuOpenFunction(HoverKey)
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, HoverKey, true)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if p1.isSponsored and p1.adId then
			SponsoredGamesRecordClickFunction(UseRoactServiceResult, p1.adId)
		end
	end, { UseRoactServiceResult, p1.isSponsored, p1.adId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = false
	end, {})
	local UseResult2 = if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then nil else ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseTriggerFeedbackResult (copy), p1 (copy), GetOverflowMenuSignalStoreFunction (upval), HoverKey (copy)
		UseRefResult1.current = true
		
		if UseRefResult1.current == false then
			UseTriggerFeedbackResult("TwoByOneTileLongPress", "Press", p1.appPage, nil)
			GetOverflowMenuSignalStoreFunction().openMenu(HoverKey)
		end
	end, { HoverKey, p1.appPage, UseTriggerFeedbackResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), GameCollectionItemTypes (upval), UseNavigateToGameDetailsModuleResult (copy), UniverseId (copy), TwoByOneGameTileTelemetryModule (upval)
		UseNavigateToGameDetailsModuleResult(UniverseId, {
			index = p1.index,
			placeIdOverride = p1.placeIdOverride,
			experienceJoinData = {
				launchData = if p1.launchDataOverride then p1.launchDataOverride else nil,
				tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				nativeAdData = p1.adId
			}
		})
		TwoByOneGameTileTelemetryModule.logTwoByOneTileViewGameDetailsActivated()
		
		if p1.reportGameDetailOpened then
			p1.reportGameDetailOpened(p1.index, UniverseId)
		end
	end, {
		UseNavigateToGameDetailsModuleResult, UniverseId, p1.index, p1.placeIdOverride,
		p1.launchDataOverride, p1.reportGameDetailOpened, p1.adId
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(true)
		
		if p1.onSelectionGained then
			p1.onSelectionGained()
		end
	end, { p1.onSelectionGained })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		
		if p1.onSelectionLost then
			p1.onSelectionLost()
		end
	end, { p1.onSelectionLost })
	local IsSponsored = p1.isSponsored
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetAvailableGameTileOverflowMenuItemsModule (upval), IsSponsored (copy), FFlagLuaAppSupportSponsoredExplicitFeedback (upval), p1 (copy)
		return GetAvailableGameTileOverflowMenuItemsModule({
			isSponsored = IsSponsored,
			enableSponsoredFeedback = if FFlagLuaAppSupportSponsoredExplicitFeedback then p1.enableSponsoredFeedback else IsSponsored,
			enableReportAd = if FFlagLuaAppSupportSponsoredExplicitFeedback then p1.enableReportAd else IsSponsored,
			enableExplicitFeedback = if FFlagLuaAppSupportSponsoredExplicitFeedback then p1.enableExplicitFeedback else nil
		})
	end, {
		IsSponsored,
		p1.enableSponsoredFeedback,
		p1.enableReportAd,
		p1.enableExplicitFeedback
	})
	local HasNextEntry: boolean = if UseIsHoveredTileModuleResult or UseStateResult then next(UseMemoResult1) ~= nil else UseOverflowMenuOpenResult and next(UseMemoResult1) ~= nil
	local UseResult6 = if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then ReactModule.useCallback(function(p2, AvailableMenuItems)
		-- upvalues: FFlagLuaAppFixExplicitFeedbackTelemetry (upval), p1 (copy), UniverseId (copy), GameTileOverflowMenuActionFunction (upval)
		GameTileOverflowMenuActionFunction({
			ctx = if FFlagLuaAppFixExplicitFeedbackTelemetry then nil else p1.appPage,
			universeId = UniverseId,
			sortId = p1.topicId,
			actionType = if p2 then "GameTileOverflowMenuClosed" else "GameTileOverflowMenuOpened",
			availableMenuItems = AvailableMenuItems
		}, if FFlagLuaAppFixExplicitFeedbackTelemetry then p1.appPage or "Unknown" else nil)
	end, { UniverseId, p1.appPage, p1.topicId }) else nil
	
	if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: UseRefResult1 (copy), UseMemoResult1 (copy), UseTriggerFeedbackResult (copy), UseOverflowMenuOpenResult (copy), FFlagLuaAppHapticTriggeredTelemetry (upval), UniverseId (copy), p1 (copy), GetOverflowMenuSignalStoreFunction (upval), HoverKey (copy), UseResult6 (copy)
			UseRefResult1.current = true
			
			if UseRefResult1.current == false and next(UseMemoResult1) ~= nil then
				if UseTriggerFeedbackResult and not UseOverflowMenuOpenResult then
					local Config = if FFlagLuaAppHapticTriggeredTelemetry then { universeId = UniverseId, sortId = p1.topicId } else nil
					UseTriggerFeedbackResult("TwoByOneTileLongPress", "Press", if FFlagLuaAppHapticTriggeredTelemetry then p1.appPage or "Unknown" else nil, if FFlagLuaAppHapticTriggeredTelemetry then Config else nil)
				end
				GetOverflowMenuSignalStoreFunction().openMenu(HoverKey)
				local List = {}
				
				for i, _ in UseMemoResult1 do
					table.insert(List, i)
				end
				UseResult6(false, table.concat(List, ","))
			end
		end, {
			HoverKey, p1.appPage, p1.topicId, UseTriggerFeedbackResult, UseMemoResult1,
			UseOverflowMenuOpenResult, UniverseId, UseResult6
		})
	end
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult1 (copy), SetGamePlaySessionFunction (upval), SessionType (upval), UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), p1 (copy), PlaceId (copy), UniverseId (copy), GameCollectionItemTypes (upval)
		if UseRoactServiceResult1 then
			SetGamePlaySessionFunction(UseRoactServiceResult1, SessionType.StructuralIdentifier.GamePlayFromHoverTile, true)
		end
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched({
				placeId = PlaceId,
				universeId = UniverseId,
				adId = p1.adId,
				tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
				placeIdOverride = p1.placeIdOverride,
				launchDataOverride = p1.launchDataOverride
			}, p1.appPage, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile, p1.index)
		end
	end, {
		UseRoactServiceResult1, p1.reportExperienceLaunched, PlaceId, UniverseId,
		p1.appPage, p1.index, p1.adId, p1.placeIdOverride, p1.launchDataOverride,
		UseIsHoveredTileModuleResult
	})
	local UsePlayButtonStateResult = UsePlayButtonStateFunction(UseRoactServiceResult, UniverseId)
	local TwoByOneTile = UseOnPlayButtonCallbackFunction(UniverseId, p1.appPage, "TwoByOneTile", nil, "TwoByOneTile", {
		launchData = p1.launchDataOverride,
		tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile,
		nativeAdData = p1.adId
	}, if p1.placeIdOverride then p1.placeIdOverride else p1.placeId)
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: TwoByOneGameTileTelemetryModule (upval), UseResult (copy)
		TwoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		TwoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		UseResult()
	end, { UseResult })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: TwoByOneGameTileTelemetryModule (upval), UseResult (copy), UseResult3 (copy)
		TwoByOneGameTileTelemetryModule.logTwoByOneTileCtaActivated()
		UseResult()
		UseResult3()
	end, { UseResult, UseResult3 })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: TwoByOneGameTileTelemetryModule (upval), TwoByOneTile (copy), UsePlayButtonStateResult (copy), UseResult7 (copy)
		TwoByOneGameTileTelemetryModule.logTwoByOneTileGameJoinInitiated()
		TwoByOneTile(UsePlayButtonStateResult.playButtonState, UseResult7)
	end, {
		TwoByOneTile,
		UsePlayButtonStateResult.playButtonState,
		UseResult7
	})
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), TwoByOneGameTileTelemetryModule (upval), UseResult (copy), Entry (copy), UseResult3 (copy), UseResult10 (copy)
		if UseRefResult1.current then
			UseRefResult1.current = false
			
			return
		end
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
		end
		TwoByOneGameTileTelemetryModule.logTwoByOneTileActivated()
		UseResult()
		
		if Entry.onTileActivation == "OpenEdp" then
			UseResult3()
			
			return
		end
		if Entry.onTileActivation == "JoinGame" then
			UseResult10()
		end
	end, {
		UseIsHoveredTileModuleResult,
		Entry.onTileActivation,
		UseResult3,
		UseResult10,
		UseResult
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GameInfosReducer (upval), UniverseId (copy)
		return p2.Personalization[GameInfosReducer.key][UniverseId]
	end)
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(UseSelectorResult, p1.topicId)
	local FormatExperienceThumbnailModuleResult = FormatExperienceThumbnailModule((if p1.primaryWideImageAssetId then p1.primaryWideImageAssetId else ItemLayoutDataParsingUtilsModule.getWideImageAssetId(GameTileLayoutDataModule)) or (UseSelectorResult and UseSelectorResult.primaryWideAssetId or nil), PlaceId, true)
	local AgeRecommendationDisplayName = UseSelectorResult and UseSelectorResult.ageRecommendationDisplayName or nil
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult2, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult2 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult2, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	
	if FFlagLuaAppHomeTouchAutoplay then
		UseTagAsViewportAutoplayCandidateFunction(UseRefResult2, p1.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	end
	if FFlagLuaAppSponsoredAdViewabilityEnabled then
		UseTagAsSponsoredAdViewabilityCandidateFunction(UseRefResult2, if p1.isSponsored and p1.adId ~= nil and not p1.isHidden then {
			encryptedAdTrackingData = p1.adId,
			tileType = GameCollectionItemTypes.GameCollectionItemType.TwoByOneTile
		} else nil)
	end
	return if FFlagLuaAppSupportSponsoredExplicitFeedback and p1.isHidden then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex,
		ref = if FFlagLuaAppHomeTouchAutoplay then UseRefResult2 else nil
	}, {
		TwoByOneTileContainer = ReactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = p1.size or UDim2.fromScale(1, 1),
			ref = UseRefResult,
			SelectionOrder = if FFlagLuaAppFixCustomTileBugs then p1.SelectionOrder else nil
		}, {
			HiddenTileContent = ReactModule.createElement(HiddenTileContentModule, {
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
			SelectionOrder = if FFlagLuaAppFixCustomTileBugs then p1.SelectionOrder else nil,
			[ReactModule.Event.TouchLongPress] = UseResult2,
			[ReactModule.Event.Activated] = UseResult11,
			[ReactModule.Event.SelectionGained] = UseResult4,
			[ReactModule.Event.SelectionLost] = UseResult5,
			[ReactModule.Change.GuiState] = UseResult1
		}, {
			BackgroundImage = ReactModule.createElement("ImageLabel", {
				[ReactModule.Tag] = if FFlagLuaAppHomePageFirstImageLoadObserver then "observed-image" else nil,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Image = FormatExperienceThumbnailModuleResult,
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
			TileBadge = UseValidTileBadgesModuleResult and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Size = UDim2.fromScale(1, 1)
			}, {
				Badge = ReactModule.createElement(GameTileThumbnailBadgesModule, { tileBadgesByPosition = UseValidTileBadgesModuleResult })
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
						Font = TitleLarge.Font,
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
						Font = BodySmall.Font,
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
						universeId = UniverseId,
						placeId = if p1.placeIdOverride then p1.placeIdOverride else PlaceId,
						referralSource = p1.appPage,
						playableText = CtaText,
						buttonSize = Small,
						width = UseMemoResult,
						onActivated = UseResult8,
						reportExperienceLaunched = UseResult7,
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
					Font = TitleSmall.Font,
					TextSize = TitleSmall.FontSize,
					[ReactModule.Event.Activated] = UseResult9
				}, {
					UICorner = ReactModule.createElement("UICorner", {
						CornerRadius = UDim.new(0, UseTokensResult.Radius.Medium)
					})
				}),
				BottomRightLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.X,
					Size = UDim2.new(0, 0, 0, CaptionSmall.FontSize * CaptionSmall.LineHeight),
					Text = AgeRecommendationDisplayName,
					TextSize = CaptionSmall.FontSize,
					Font = CaptionSmall.Font,
					TextColor3 = UseTokensResult.Color.Extended.Gray.Gray_400.Color3,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.SplitWord,
					AnchorPoint = Vector2.new(1, 1),
					Position = UDim2.new(1, 0, 1, 0)
				})
			}),
			OverflowMenuContainer = HasNextEntry and ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ZIndex = 4,
				Size = UDim2.fromScale(1, 1)
			}, {
				OverflowMenu = ReactModule.createElement(GameTileOverflowMenuModule, {
					isHovered = UseIsHoveredTileModuleResult,
					isSelected = if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then UseStateResult else nil,
					universeId = UniverseId,
					collectionId = p1.topicId,
					appPage = p1.appPage,
					setGameHidden = p1.setGameHidden or function() end,
					menuKey = HoverKey,
					menuOpen = UseOverflowMenuOpenResult,
					onMenuOpenChanged = if FFlagLuaAppFixTwoByOneOverflowMenuTelemetry then UseResult6 else nil,
					parentRef = UseRefResult,
					isSponsored = p1.isSponsored,
					payerName = p1.payerName,
					sponsoredUserCohort = p1.sponsoredUserCohort,
					adId = p1.adId,
					availableMenuItems = UseMemoResult1
				})
			})
		})
	})
end