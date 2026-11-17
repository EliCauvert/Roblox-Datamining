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
local Parent = GameTile.Parent
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local ReactModule = require(Parent.React)
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
local UseTagAsViewportAutoplayCandidateFunction = require(Parent.VideoUtils).useTagAsViewportAutoplayCandidate
local GameTileThumbnailBadgesModule = require(GameTile.Overlays.GameTileThumbnailBadges)
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppHomeThumbnailPrefetch = require(Parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local ResolveGameTileThumbnailUriModule = if FFlagLuaAppHomeThumbnailPrefetch then require(GameTile.resolveGameTileThumbnailUri) else nil

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), GameInfosReducer (copy), GameHydrationReactModule (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ReactModule (copy), ApiFetchGameDetails (copy), GetGameTileLayoutDataModule (copy), FFlagLuaAppHomeThumbnailPrefetch (copy), ResolveGameTileThumbnailUriModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), GameTileViewConfigModule (copy), IsVRAppBuildFunction (copy), UseIsHoveredTileModule (copy), HoverTileCoordinatorModule (copy), GameCollectionItemTypes (copy), SponsoredGamesRecordClickFunction (copy), AppExperienceActionRowModule (copy), GridTileTextFooterModule (copy), CreatorNameMetadataModule (copy), GameStatsModule (copy), GameTileConstantsModule (copy), ImpressionsTagUtility (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), GetTileBadgeByPositionConfigFromEntryModule (copy), GameTileThumbnailBadgesModule (copy), GameTileViewModule (copy), UserGameSettings (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local UniverseId = p1.entry.universeId
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GameInfosReducer (upval), UniverseId (copy)
		return p2.Personalization[GameInfosReducer.key][UniverseId]
	end)
	local UseGameInfoResult = GameHydrationReactModule.useGameInfo(UniverseId)
	local UseGameVotesResult = GameHydrationReactModule.useGameVotes(UniverseId)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: UniverseId (copy)
		return p2.GameDetails[UniverseId]
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
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
	local Title = GameTileLayoutDataModule and GameTileLayoutDataModule.title or (UseGameInfoResult and UseGameInfoResult.name or "")
	local UseRefResult = ReactModule.useRef(nil)
	local UseIsHoveredTileModuleResult = UseIsHoveredTileModule(UseRefResult, `{p1.impressionsTag or ""}_{p1.index}_{GameTileLayoutType}`, not IsVRAppBuildFunction() and p1.useHoverTile and p1.impressionsTag ~= nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), p1 (copy), GameCollectionItemTypes (upval), UniverseId (copy), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
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
		p1.entry.adId, p1.reportGameDetailOpened, UseRoactServiceResult,
		p1.navigateToGameDetails, p1.referralSource, p1.index,
		UseIsHoveredTileModuleResult
	})
	local ShowDescription = p1.showDescription or false
	local UpVotes = UseGameVotesResult and UseGameVotesResult.upVotes or 0
	local DownVotes = UseGameVotesResult and UseGameVotesResult.downVotes or 0
	local HasVerifiedBadge = UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.hasVerifiedBadge)
	local Description = UseSelectorResult1 and UseSelectorResult1.description or ""
	local LocalizedFiatPrice = UseSelectorResult1 and UseSelectorResult1.localizedFiatPrice or nil
	local LicenseDescription = UseSelectorResult1 and UseSelectorResult1.licenseDescription or nil or LocalizedFiatPrice
	local HideGameStats = p1.hideGameStats or (ShowDescription or LicenseDescription ~= nil)
	local Name = UseGameInfoResult and (UseGameInfoResult.creator and UseGameInfoResult.creator.name)
	local Name1 = if Name == "" then UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name) else Name or UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name)
	local LinesOfText: number = if LicenseDescription then 2 else 3
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: Name1 (copy), ShowDescription (copy), LinesOfText (copy), HideGameStats (copy), LicenseDescription (copy)
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
	local UseResult1 = ReactModule.useCallback(function(...)
		-- upvalues: UseIsHoveredTileModuleResult (copy), HoverTileCoordinatorModule (upval), p1 (copy)
		if UseIsHoveredTileModuleResult then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched(...)
		end
	end, {
		UseIsHoveredTileModuleResult,
		p1.reportExperienceLaunched
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
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
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), LicenseDescription (copy), GridTileTextFooterModule (upval), CreatorNameMetadataModule (upval), Name1 (copy), HasVerifiedBadge (copy), GameStatsModule (upval), UpVotes (copy), DownVotes (copy), p1 (copy), GameTileConstantsModule (upval), IsWide (copy), HideGameStats (copy), GameTileLayoutType (copy), ShowDescription (copy), Description (copy), LinesOfText (copy)
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
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: GameTileViewConfigModule (upval), UseDesignTokensResult (copy), UseStateResult (copy), GameTileLayoutType (copy), IsContained (copy), p1 (copy), UseMemoResult (copy), UseTokensResult (copy)
		return UseStateResult.Y - GameTileViewConfigModule.getTileHeight(UseDesignTokensResult, UseStateResult.X, GameTileLayoutType, IsContained, false, false, p1.textSizeOffset, nil, 1, UseMemoResult, UseTokensResult, true)
	end, {
		UseDesignTokensResult, UseStateResult, GameTileLayoutType, IsContained,
		p1.textSizeOffset, 1, UseMemoResult, UseTokensResult
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (copy), p1 (copy)
		ImpressionsTagUtility.AddTag(UseRefResult1, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: ImpressionsTagUtility (upval), UseRefResult1 (upval), p1 (upval)
			ImpressionsTagUtility.RemoveTag(UseRefResult1, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	UseTagAsViewportAutoplayCandidateFunction(UseRefResult1, p1.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	local Element = nil
	local TileBadgeByPositionConfigFromEntryModule = GetTileBadgeByPositionConfigFromEntryModule(p1.entry)
	
	if TileBadgeByPositionConfigFromEntryModule then
		Element = ReactModule.createElement(GameTileThumbnailBadgesModule, {
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
			[ReactModule.Change.AbsoluteSize] = function(Frame)
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
				onSelectionGained = p1.onSelectionGained,
				onSelectionLost = p1.onSelectionLost,
				image = ResolveGameTileThumbnailUriModuleResult,
				title = Title,
				numLinesForMetadata = UseMemoResult,
				isHovered = UseIsHoveredTileModuleResult,
				footerMetadata = UseMemoResult2,
				imageAspectRatio = ImageAspectRatio,
				isContained = IsContained,
				extraFooterContent = if ShowDescription then nil else UseMemoResult1,
				extraFooterSpace = if ShowDescription then nil else UseMemoResult3,
				reducedMotion = UserGameSettings.ReducedMotion,
				thumbnailOverlay = Element
			})
		})
	})
end