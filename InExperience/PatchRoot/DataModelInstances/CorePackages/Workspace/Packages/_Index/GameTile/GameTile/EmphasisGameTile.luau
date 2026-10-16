local GameTile = script:FindFirstAncestor("GameTile")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GameTileViewModule = require(GameTile.GameTileView)
local GetGameTileLayoutDataModule = require(GameTile.getGameTileLayoutData)
local _ = require(GameTile.GameTileTypes)
local FormatExperienceThumbnailModule = require(GameTile.formatExperienceThumbnail)
local GameStatsModule = require(GameTile.Footer.GameStats)
local GameTileConstantsModule = require(GameTile.GameTileConstants)
local GameTileViewConfigModule = require(GameTile.GameTileViewConfig)
local CreatorNameMetadataModule = require(GameTile.Footer.CreatorNameMetadata)
local AppExperienceActionRowModule = require(GameTile.AppExperienceActionRow)
local UseIsHoveredTileModule = require(GameTile.useIsHoveredTile)
local GridTileTextFooterModule = require(GameTile.Footer.GridTileTextFooter)
local ItemLayoutDataParsingUtilsModule = require(GameTile.ItemLayoutDataParsingUtils)
local HoverTileCoordinatorModule = require(GameTile.HoverTileCoordinator)
local GetTileBadgeByPositionConfigFromEntryModule = require(GameTile.getTileBadgeByPositionConfigFromEntry)
local GameTileVideoThumbnailModule = require(GameTile.GameTileVideoThumbnail)
local GameVideoPlaybackDetectorModule = require(GameTile.Video.GameVideoPlaybackDetector)
local Parent = GameTile.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local RoactUtilsModule = require(Parent.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local GameInfosReducer = require(Parent.GameInfosRodux).GameInfosReducer
local GameHydrationReactModule = require(Parent.GameHydrationReact)
local ApiFetchGameDetails = require(Parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local ImpressionsTagUtility = require(Parent.Impressions).ImpressionsTagUtility
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local SponsoredGamesRecordClickFunction = require(Parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local VideoUtilsModule = require(Parent.VideoUtils)
local UseTagAsViewportAutoplayCandidateFunction = VideoUtilsModule.useTagAsViewportAutoplayCandidate
local VideoPlaybackCoordinator = VideoUtilsModule.VideoPlaybackCoordinator
local VideoEndReason = VideoUtilsModule.AnalyticsEnums.VideoEndReason
local GameTileThumbnailBadgesModule = require(GameTile.Overlays.GameTileThumbnailBadges)
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppOneByTwoHoverIdleAutoplay = require(Parent.SharedFlags).FFlagLuaAppOneByTwoHoverIdleAutoplay
local FFlagLuaAppHomeThumbnailPrefetch = require(Parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local FFlagLuaAppEdpMediaGalleryVideoPreview = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local FFlagLuaAppEmphasisGameTileVideo = require(Parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local FIntLuaAppGameTileVideoDwellTimeInSec = require(Parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local FIntLuaAppGameTileVideoVisiblePercent = require(Parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local FFlagLuaAppGameTileSelectionVideoPlayback = require(Parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local FFlagMigrateGameInfoToStore = require(Parent.SharedFlags).FFlagMigrateGameInfoToStore
local ResolveGameTileThumbnailUriModule = if FFlagLuaAppHomeThumbnailPrefetch then require(GameTile.resolveGameTileThumbnailUri) else nil

return function(p1) --[[ Line: 101 ]]
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), GameInfosReducer (copy), FFlagMigrateGameInfoToStore (copy), GameHydrationReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ReactModule (copy), ApiFetchGameDetails (copy), GetGameTileLayoutDataModule (copy), FFlagLuaAppHomeThumbnailPrefetch (copy), ResolveGameTileThumbnailUriModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), GameTileViewConfigModule (copy), IsVRAppBuildFunction (copy), UseIsHoveredTileModule (copy), FFlagLuaAppEmphasisGameTileVideo (copy), VideoPlaybackCoordinator (copy), HoverTileCoordinatorModule (copy), VideoEndReason (copy), GameCollectionItemTypes (copy), SponsoredGamesRecordClickFunction (copy), AppExperienceActionRowModule (copy), GridTileTextFooterModule (copy), CreatorNameMetadataModule (copy), GameStatsModule (copy), GameTileConstantsModule (copy), ImpressionsTagUtility (copy), FFlagLuaAppGameTileSelectionVideoPlayback (copy), FFlagLuaAppEdpMediaGalleryVideoPreview (copy), UsePreferredInputFunction (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), FFlagLuaAppOneByTwoHoverIdleAutoplay (copy), GameTileVideoThumbnailModule (copy), GameVideoPlaybackDetectorModule (copy), ResponsiveModule (copy), FIntLuaAppGameTileVideoDwellTimeInSec (copy), FIntLuaAppGameTileVideoVisiblePercent (copy), GetTileBadgeByPositionConfigFromEntryModule (copy), GameTileThumbnailBadgesModule (copy), GameTileViewModule (copy), UserGameSettings (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local UniverseId = p1.entry.universeId
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 111 ]]
		-- upvalues: GameInfosReducer (upval), UniverseId (copy)
		return p2.Personalization[GameInfosReducer.key][UniverseId]
	end)
	local UseGameInfoResult = nil
	local UseGameVotesResult = nil
	
	if FFlagMigrateGameInfoToStore then
		UseGameInfoResult = GameHydrationReactModule.useGameInfo(UniverseId)
		UseGameVotesResult = GameHydrationReactModule.useGameVotes(UniverseId)
	end
	local UseSelectorResult1 = UseSelectorFunction(function(p2) --[[ Line: 119 ]]
		-- upvalues: UniverseId (copy)
		return p2.GameDetails[UniverseId]
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function() --[[ Line: 125 ]]
		-- upvalues: UseSelectorResult1 (copy), UseDispatchResult (copy), ApiFetchGameDetails (upval), UseRoactServiceResult (copy), UniverseId (copy)
		if not UseSelectorResult1 then
			UseDispatchResult(ApiFetchGameDetails.Fetch(UseRoactServiceResult, { UniverseId }))
			
			return
		end
	end, {
		UseSelectorResult1,
		UniverseId,
		UseRoactServiceResult,
		UseDispatchResult
	})
	local GameTileLayoutDataModule = GetGameTileLayoutDataModule(UseSelectorResult, p1.topicId)
	local GameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local IsWide: boolean = GameTileLayoutType == "Wide" or GameTileLayoutType == "Event"
	local UseLargeGameIconResult = GameHydrationReactModule.useLargeGameIcon(UniverseId) or ""
	local ResolveGameTileThumbnailUriModuleResult = nil
	
	if FFlagLuaAppHomeThumbnailPrefetch then
		ResolveGameTileThumbnailUriModuleResult = ResolveGameTileThumbnailUriModule({
			isEmphasized = true,
			iconUrl = UseLargeGameIconResult,
			universeId = UniverseId,
			placeId = p1.entry.placeId,
			useGridTile = IsWide,
			perEntryWideAssetId = p1.entry.primaryWideImageAssetId,
			game = UseSelectorResult,
			topicId = p1.topicId
		})
	else
		local FormatExperienceThumbnailModuleResult = FormatExperienceThumbnailModule((if p1.entry.primaryWideImageAssetId then p1.entry.primaryWideImageAssetId else ItemLayoutDataParsingUtilsModule.getWideImageAssetId(GameTileLayoutDataModule)) or (UseSelectorResult and UseSelectorResult.primaryWideAssetId or nil), p1.entry.placeId, true)
		ResolveGameTileThumbnailUriModuleResult = if IsWide then FormatExperienceThumbnailModuleResult else UseLargeGameIconResult
	end
	local ImageAspectRatio = GameTileViewConfigModule.getImageAspectRatio(GameTileLayoutType)
	local Title = (if FFlagMigrateGameInfoToStore then GameTileLayoutDataModule and GameTileLayoutDataModule.title or UseGameInfoResult and UseGameInfoResult.name else GameTileLayoutDataModule and GameTileLayoutDataModule.title or UseSelectorResult and UseSelectorResult.name) or ""
	local HasImpressionsTag: boolean = not IsVRAppBuildFunction() and p1.useHoverTile and p1.impressionsTag ~= nil
	local UseRefResult = ReactModule.useRef(nil)
	local Text: string = `{p1.impressionsTag or ""}_{p1.index}_{GameTileLayoutType}`
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, Text, HasImpressionsTag)
	local VideoPlaybackCoordinator1 = if FFlagLuaAppEmphasisGameTileVideo then if p1.videoPlaybackContext and p1.videoPlaybackContext.videoPlaybackCoordinator then p1.videoPlaybackContext.videoPlaybackCoordinator else VideoPlaybackCoordinator.default else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 187 ]]
		-- upvalues: UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), FFlagLuaAppEmphasisGameTileVideo (upval), VideoPlaybackCoordinator1 (ref), VideoEndReason (upval), UniverseId (copy), p1 (copy), GameCollectionItemTypes (upval), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
		end
		if FFlagLuaAppEmphasisGameTileVideo then
			VideoPlaybackCoordinator1:reset(VideoEndReason.TileClicked, nil, UniverseId, nil)
		end
		p1.navigateToGameDetails(UniverseId, {
			source = p1.source,
			index = p1.index,
			referralSource = p1.referralSource,
			onPeekViewClosed = p1.onPeekViewClosed,
			experienceJoinData = {
				tileType = p1.entry.tileType or GameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = p1.entry.adId
			}
		})
		p1.reportGameDetailOpened(p1.index, UniverseId)
		
		if p1.entry.isSponsored then
			SponsoredGamesRecordClickFunction(UseRoactServiceResult, p1.entry.adId)
		end
	end, {
		UniverseId, p1.source, p1.onPeekViewClosed, p1.entry.isSponsored,
		p1.entry.adId,
		if FFlagLuaAppEmphasisGameTileVideo then p1.entry.tileType else nil,
		p1.reportGameDetailOpened, UseRoactServiceResult, p1.navigateToGameDetails,
		p1.referralSource, p1.index, UseIsHoveredTileModuleResult,
		if FFlagLuaAppEmphasisGameTileVideo then VideoPlaybackCoordinator1 else nil
	})
	local ShowDescription = p1.showDescription or false
	local UpVotes = nil
	local DownVotes = nil
	
	if FFlagMigrateGameInfoToStore then
		UpVotes = UseGameVotesResult and UseGameVotesResult.upVotes or 0
		DownVotes = UseGameVotesResult and UseGameVotesResult.downVotes or 0
	else
		UpVotes = UseSelectorResult and UseSelectorResult.totalUpVotes or 0
		DownVotes = UseSelectorResult and UseSelectorResult.totalDownVotes or 0
	end
	local HasVerifiedBadge = UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.hasVerifiedBadge)
	local Description = UseSelectorResult1 and UseSelectorResult1.description or ""
	local LocalizedFiatPrice = UseSelectorResult1 and UseSelectorResult1.localizedFiatPrice or nil
	local LicenseDescription = UseSelectorResult1 and UseSelectorResult1.licenseDescription or nil or LocalizedFiatPrice
	local HideGameStats = p1.hideGameStats or (ShowDescription or LicenseDescription ~= nil)
	local Name1 = nil
	
	if FFlagMigrateGameInfoToStore then
		local Name = UseGameInfoResult and (UseGameInfoResult.creator and UseGameInfoResult.creator.name)
		Name1 = if Name == "" then UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name) else Name or UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name)
	else
		Name1 = UseSelectorResult and UseSelectorResult.creatorName ~= "" and UseSelectorResult.creatorName or UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name)
	end
	local LinesOfText: number = if LicenseDescription then 2 else 3
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 274 ]]
		-- upvalues: Name1 (ref), ShowDescription (copy), LinesOfText (copy), HideGameStats (copy), LicenseDescription (copy)
		local Count = 0
		
		if Name1 and Name1 ~= "" then
			Count += 1
		end
		if ShowDescription then
			Count += LinesOfText
		end
		if not HideGameStats then
			Count += 1
		end
		if LicenseDescription then
			Count += 1
		end
		return Count
	end, {
		Name1,
		ShowDescription,
		HideGameStats,
		LicenseDescription,
		LinesOfText
	})
	local IsContained = p1.isContained or false
	local PlayButtonHeight = GameTileViewConfigModule.getElementSizes(UseDesignTokensResult, p1.textSizeOffset, 1, UseTokensResult, true, UseMemoResult).playButtonHeight
	local UseResult1 = ReactModule.useCallback(function(...) --[[ Line: 308 ]]
		-- upvalues: UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), p1 (copy), FFlagLuaAppEmphasisGameTileVideo (upval), VideoPlaybackCoordinator1 (ref), VideoEndReason (upval), UniverseId (copy)
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched(...)
		end
		if FFlagLuaAppEmphasisGameTileVideo then
			VideoPlaybackCoordinator1:reset(VideoEndReason.ExperienceLaunched, nil, UniverseId, nil)
		end
	end, {
		UseIsHoveredTileModuleResult,
		p1.reportExperienceLaunched,
		if FFlagLuaAppEmphasisGameTileVideo then UniverseId else nil,
		if FFlagLuaAppEmphasisGameTileVideo then VideoPlaybackCoordinator1 else nil
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 335 ]]
		-- upvalues: ReactModule (upval), AppExperienceActionRowModule (upval), UniverseId (copy), p1 (copy), UseResult1 (copy), UseResult (copy), ImageAspectRatio (copy), PlayButtonHeight (copy)
		return ReactModule.createElement(AppExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = UniverseId,
			referralSource = p1.referralSource,
			reportExperienceLaunched = UseResult1,
			openGameDetails = UseResult,
			entry = p1.entry,
			launchExperienceEventContext = p1.launchExperienceEventContext,
			showButtonText = ImageAspectRatio > 1,
			height = PlayButtonHeight,
			index = p1.index
		})
	end, {
		UniverseId, p1.referralSource, UseResult1, UseResult, p1.entry,
		p1.launchExperienceEventContext, PlayButtonHeight, p1.index, ImageAspectRatio
	})
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 366 ]]
		-- upvalues: ReactModule (upval), LicenseDescription (copy), GridTileTextFooterModule (upval), CreatorNameMetadataModule (upval), Name1 (ref), HasVerifiedBadge (copy), GameStatsModule (upval), UpVotes (ref), DownVotes (ref), p1 (copy), GameTileConstantsModule (upval), IsWide (copy), HideGameStats (copy), GameTileLayoutType (copy), ShowDescription (copy), Description (copy), LinesOfText (copy)
		return ReactModule.createElement(ReactModule.Fragment, {}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if LicenseDescription then ReactModule.createElement(GridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = LicenseDescription
			}) else nil,
			CreatorName = ReactModule.createElement(CreatorNameMetadataModule, {
				LayoutOrder = 2,
				name = Name1,
				hasVerifiedBadge = HasVerifiedBadge
			}),
			GameStats = ReactModule.createElement(GameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = UpVotes,
					totalDownVotes = DownVotes,
					playerCount = if p1.playerCountStyle == GameTileConstantsModule.PlayerCountStyleValues.Footer then p1.entry.playerCount else nil
				},
				isGridTile = IsWide,
				hideGameStats = HideGameStats,
				gameTileLayoutType = GameTileLayoutType
			}),
			Description = if ShowDescription then ReactModule.createElement(GridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				TextWrapped = true,
				text = Description,
				linesOfText = LinesOfText,
				TextYAlignment = Enum.TextYAlignment.Top
			}) else nil
		})
	end, {
		Name1, UpVotes, DownVotes, p1.playerCountStyle, p1.entry.playerCount, IsWide,
		HideGameStats, GameTileLayoutType, ShowDescription, Description,
		LicenseDescription, HasVerifiedBadge, LinesOfText
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 435 ]]
		-- upvalues: GameTileViewConfigModule (upval), UseDesignTokensResult (copy), UseStateResult (copy), GameTileLayoutType (copy), IsContained (copy), p1 (copy), UseMemoResult (copy), UseTokensResult (copy)
		return UseStateResult.Y - GameTileViewConfigModule.getTileHeight(UseDesignTokensResult, UseStateResult.X, GameTileLayoutType, IsContained, false, false, p1.textSizeOffset, nil, 1, UseMemoResult, UseTokensResult, true)
	end, {
		UseDesignTokensResult, UseStateResult, GameTileLayoutType, IsContained,
		p1.textSizeOffset, 1, UseMemoResult, UseTokensResult
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 466 ]]
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult1, p1.impressionsTag, p1.index)
		
		return function() --[[ Line: 468 ]]
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult1, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local Playing = nil
	local UseStateResult2_1 = nil
	local UseResult2 = nil
	local PrimaryWideVideoAssetId = nil
	local v1 = nil
	local UseStateResult2_2 = nil
	local UseResult3 = nil
	local UseResult4 = nil
	local IsDisablePlayback: boolean? = nil
	local Touch = nil
	
	if FFlagLuaAppEmphasisGameTileVideo then
		IsDisablePlayback = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
		Playing, UseStateResult2_1 = ReactModule.useState(false)
		UseResult2 = ReactModule.useCallback(function(p2) --[[ Line: 485 ]]
			-- upvalues: UseStateResult2_1 (ref)
			UseStateResult2_1(p2)
		end, {})
		PrimaryWideVideoAssetId = if p1.entry.primaryWideVideoAssetId then p1.entry.primaryWideVideoAssetId else GameTileLayoutDataModule and (GameTileLayoutDataModule.primaryMediaAsset and GameTileLayoutDataModule.primaryMediaAsset.wideVideoAssetId)
		
		if FFlagLuaAppGameTileSelectionVideoPlayback then
			v1, UseStateResult2_2 = ReactModule.useState(false)
			UseResult3 = ReactModule.useCallback(function(...) --[[ Line: 495 ]]
				-- upvalues: UseStateResult2_2 (ref), p1 (copy)
				UseStateResult2_2(true)
				
				if p1.onSelectionGained then
					p1.onSelectionGained(...)
				end
			end, { p1.onSelectionGained })
			UseResult4 = ReactModule.useCallback(function(...) --[[ Line: 503 ]]
				-- upvalues: UseStateResult2_2 (ref), p1 (copy)
				UseStateResult2_2(false)
				
				if p1.onSelectionLost then
					p1.onSelectionLost(...)
				end
			end, { p1.onSelectionLost })
		end
		if not FFlagLuaAppGameTileSelectionVideoPlayback then
			Touch = if FFlagLuaAppEdpMediaGalleryVideoPreview then UsePreferredInputFunction() else nil
		end
		ReactModule.useEffect(function() --[[ Line: 516 ]]
			-- upvalues: IsDisablePlayback (ref), UseStateResult2_1 (ref)
			if IsDisablePlayback then
				UseStateResult2_1(false)
			end
		end, { IsDisablePlayback })
	end
	local HasPrimaryWideVideoAssetId: boolean = FFlagLuaAppEmphasisGameTileVideo and PrimaryWideVideoAssetId ~= nil
	UseTagAsViewportAutoplayCandidateFunction(if FFlagLuaAppEmphasisGameTileVideo then UseRefResult else UseRefResult1, p1.videoPlaybackContext, if FFlagLuaAppTileVideoCandidateOnly then if FFlagLuaAppEmphasisGameTileVideo then HasPrimaryWideVideoAssetId else false else nil, nil, nil, nil, nil, if FFlagLuaAppOneByTwoHoverIdleAutoplay and HasPrimaryWideVideoAssetId then {
		isUserIntentModeAutoplayCandidate = false,
		videoKey = Text
	} else nil)
	local Element = nil
	local Element1 = nil
	
	if FFlagLuaAppEmphasisGameTileVideo then
		Element = if HasPrimaryWideVideoAssetId then ReactModule.createElement(GameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{PrimaryWideVideoAssetId}`,
			image = ResolveGameTileThumbnailUriModuleResult,
			playing = Playing,
			Size = UDim2.fromScale(1, 1),
			isTileContained = IsContained,
			cornerRadius = UseTokensResult.Radius.Medium,
			itemIndex = p1.index,
			videoAnalytics = p1.videoAnalytics,
			universeId = UniverseId,
			videoPlaybackCoordinator = VideoPlaybackCoordinator1
		}) else nil
		Element1 = if HasPrimaryWideVideoAssetId and not IsDisablePlayback then ReactModule.createElement(GameVideoPlaybackDetectorModule, {
			videoKey = Text,
			itemIndex = p1.index,
			universeId = tostring(UniverseId),
			tileRef = UseRefResult,
			isHoverSupported = HasImpressionsTag,
			isHovered = UseIsHoveredTileModuleResult,
			isSelected = if FFlagLuaAppGameTileSelectionVideoPlayback then v1 else nil,
			autoplay = if FFlagLuaAppGameTileSelectionVideoPlayback then nil elseif FFlagLuaAppEdpMediaGalleryVideoPreview then Touch == ResponsiveModule.Input.Touch else nil,
			onPlaybackChange = UseResult2,
			videoAnalytics = p1.videoAnalytics,
			videoDwellTimeInSec = FIntLuaAppGameTileVideoDwellTimeInSec,
			videoVisiblePercent = FIntLuaAppGameTileVideoVisiblePercent,
			pageContext = p1.appPage,
			videoPlaybackContext = p1.videoPlaybackContext
		}) else nil
	end
	local Element2 = nil
	local TileBadgeByPositionConfigFromEntryModule = GetTileBadgeByPositionConfigFromEntryModule(p1.entry)
	
	if TileBadgeByPositionConfigFromEntryModule then
		Element2 = ReactModule.createElement(GameTileThumbnailBadgesModule, {
			tileBadgesByPosition = TileBadgeByPositionConfigFromEntryModule
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = -p1.index
	}, {
		EmphasisTileContainer = ReactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			Size = p1.size,
			BackgroundTransparency = 1,
			ref = UseRefResult1,
			[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 606 ]]
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize)
			end
		}, {
			GameTileView = ReactModule.createElement(GameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = UseRefResult,
				SelectionOrder = p1.SelectionOrder,
				isDisabled = p1.isDisabled,
				onActivated = UseResult,
				onSelectionGained = if FFlagLuaAppEmphasisGameTileVideo and FFlagLuaAppGameTileSelectionVideoPlayback then UseResult3 else p1.onSelectionGained,
				onSelectionLost = if FFlagLuaAppEmphasisGameTileVideo and FFlagLuaAppGameTileSelectionVideoPlayback then UseResult4 else p1.onSelectionLost,
				image = ResolveGameTileThumbnailUriModuleResult,
				thumbnailComponent = if FFlagLuaAppEmphasisGameTileVideo then Element else nil,
				title = Title,
				numLinesForMetadata = UseMemoResult,
				isHovered = UseIsHoveredTileModuleResult,
				footerMetadata = UseMemoResult2,
				imageAspectRatio = ImageAspectRatio,
				isContained = IsContained,
				extraFooterContent = if ShowDescription then nil else UseMemoResult1,
				extraFooterSpace = if ShowDescription then nil else UseMemoResult3,
				reducedMotion = UserGameSettings.ReducedMotion,
				thumbnailOverlay = Element2
			}),
			VideoPlaybackDetector = if FFlagLuaAppEmphasisGameTileVideo then Element1 else nil
		})
	})
end