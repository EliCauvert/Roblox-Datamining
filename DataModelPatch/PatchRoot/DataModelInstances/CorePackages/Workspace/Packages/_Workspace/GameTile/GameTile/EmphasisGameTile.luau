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
local BigGameIconReducer = require(Parent.GameIconRodux).BigGameIcons.BigGameIconReducer
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
local WrapEmphasisTileDescriptionText = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false)
local LuaAppFixEmphasisHoverLogic = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false)
local FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(Parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local FFlagLuaAppHomeTouchAutoplay = require(Parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local FFlagLuaAppTileVideoCandidateOnly = require(Parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local FFlagLuaAppFixCustomTileBugs = require(Parent.SharedFlags).FFlagLuaAppFixCustomTileBugs

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), UseSelectorFunction (copy), GameInfosReducer (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseDispatchFunction (copy), ReactModule (copy), ApiFetchGameDetails (copy), GetGameTileLayoutDataModule (copy), ItemLayoutDataParsingUtilsModule (copy), FormatExperienceThumbnailModule (copy), BigGameIconReducer (copy), GameTileViewConfigModule (copy), LuaAppFixEmphasisHoverLogic (copy), IsVRAppBuildFunction (copy), UseIsHoveredTileModule (copy), HoverTileCoordinatorModule (copy), GameCollectionItemTypes (copy), SponsoredGamesRecordClickFunction (copy), AppExperienceActionRowModule (copy), GridTileTextFooterModule (copy), CreatorNameMetadataModule (copy), GameStatsModule (copy), GameTileConstantsModule (copy), WrapEmphasisTileDescriptionText (copy), ImpressionsTagUtility (copy), FFlagLuaAppHomeTouchAutoplay (copy), UseTagAsViewportAutoplayCandidateFunction (copy), FFlagLuaAppTileVideoCandidateOnly (copy), GetTileBadgeByPositionConfigFromEntryModule (copy), GameTileThumbnailBadgesModule (copy), GameTileViewModule (copy), FFlagLuaAppFixCustomTileBugs (copy), UserGameSettings (copy), FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local UniverseId = p1.entry.universeId
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GameInfosReducer (upval), UniverseId (copy)
		return p2.Personalization[GameInfosReducer.key][UniverseId]
	end)
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
	local FormatExperienceThumbnailModuleResult = FormatExperienceThumbnailModule((if p1.entry.primaryWideImageAssetId then p1.entry.primaryWideImageAssetId else ItemLayoutDataParsingUtilsModule.getWideImageAssetId(GameTileLayoutDataModule)) or (UseSelectorResult and UseSelectorResult.primaryWideAssetId or nil), p1.entry.placeId, true)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: BigGameIconReducer (upval), UniverseId (copy)
		return p2[BigGameIconReducer.key][UniverseId] and p2[BigGameIconReducer.key][UniverseId].url or ""
	end)
	local FormatExperienceThumbnailModuleResult1 = if IsWide then FormatExperienceThumbnailModuleResult else UseSelectorResult2
	local ImageAspectRatio = GameTileViewConfigModule.getImageAspectRatio(GameTileLayoutType)
	local Title = GameTileLayoutDataModule and GameTileLayoutDataModule.title or (UseSelectorResult and UseSelectorResult.name or "")
	local UseRefResult = nil
	local IsHovered = nil
	
	if LuaAppFixEmphasisHoverLogic then
		UseRefResult = ReactModule.useRef(nil)
		IsHovered = UseIsHoveredTileModule(UseRefResult, `{p1.impressionsTag or ""}_{p1.index}_{GameTileLayoutType}`, not IsVRAppBuildFunction() and p1.useHoverTile and p1.impressionsTag ~= nil)
	end
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: LuaAppFixEmphasisHoverLogic (upval), IsHovered (ref), HoverTileCoordinatorModule (upval), p1 (copy), GameCollectionItemTypes (upval), UniverseId (copy), SponsoredGamesRecordClickFunction (upval), UseRoactServiceResult (copy)
		if LuaAppFixEmphasisHoverLogic and IsHovered then
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
		if LuaAppFixEmphasisHoverLogic then IsHovered else nil
	})
	
	if not LuaAppFixEmphasisHoverLogic then
		UseRefResult = ReactModule.useRef(nil)
		IsHovered = UseIsHoveredTileModule(UseRefResult, `{p1.impressionsTag or ""}_{p1.index}_{GameTileLayoutType}`, not IsVRAppBuildFunction() and p1.useHoverTile and p1.impressionsTag ~= nil)
	end
	local ShowDescription = p1.showDescription or false
	local TotalUpVotes = UseSelectorResult and UseSelectorResult.totalUpVotes or 0
	local TotalDownVotes = UseSelectorResult and UseSelectorResult.totalDownVotes or 0
	local HasVerifiedBadge = UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.hasVerifiedBadge)
	local Description = UseSelectorResult1 and UseSelectorResult1.description or ""
	local LocalizedFiatPrice = UseSelectorResult1 and UseSelectorResult1.localizedFiatPrice or nil
	local LicenseDescription = UseSelectorResult1 and UseSelectorResult1.licenseDescription or nil or LocalizedFiatPrice
	local HideGameStats = p1.hideGameStats or (ShowDescription or LicenseDescription ~= nil)
	local CreatorName = UseSelectorResult and UseSelectorResult.creatorName ~= "" and UseSelectorResult.creatorName or UseSelectorResult1 and (UseSelectorResult1.creator and UseSelectorResult1.creator.name)
	local LinesOfText: number = if LicenseDescription then 2 else 3
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: CreatorName (copy), ShowDescription (copy), LinesOfText (copy), HideGameStats (copy), LicenseDescription (copy)
		local Count = 0
		
		if CreatorName and CreatorName ~= "" then
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
		CreatorName,
		ShowDescription,
		HideGameStats,
		LicenseDescription,
		LinesOfText
	})
	local IsContained = p1.isContained or false
	local PlayButtonHeight = GameTileViewConfigModule.getElementSizes(UseDesignTokensResult, p1.textSizeOffset, 1, UseTokensResult, true, UseMemoResult).playButtonHeight
	local UseResult1 = if LuaAppFixEmphasisHoverLogic then ReactModule.useCallback(function(...)
		-- upvalues: IsHovered (ref), HoverTileCoordinatorModule (upval), p1 (copy)
		if IsHovered then
			HoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched(...)
		end
	end, { IsHovered, p1.reportExperienceLaunched }) else nil
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), AppExperienceActionRowModule (upval), UniverseId (copy), p1 (copy), LuaAppFixEmphasisHoverLogic (upval), UseResult1 (copy), UseResult (copy), ImageAspectRatio (copy), PlayButtonHeight (copy)
		return ReactModule.createElement(AppExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = UniverseId,
			referralSource = p1.referralSource,
			reportExperienceLaunched = if LuaAppFixEmphasisHoverLogic then UseResult1 else p1.reportExperienceLaunched,
			openGameDetails = UseResult,
			entry = p1.entry,
			launchExperienceEventContext = p1.launchExperienceEventContext,
			showButtonText = ImageAspectRatio > 1,
			height = PlayButtonHeight,
			index = p1.index
		})
	end, {
		UniverseId, p1.referralSource,
		if LuaAppFixEmphasisHoverLogic then UseResult1 else p1.reportExperienceLaunched,
		UseResult, p1.entry, p1.launchExperienceEventContext, PlayButtonHeight,
		p1.index, ImageAspectRatio
	})
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), LicenseDescription (copy), GridTileTextFooterModule (upval), CreatorNameMetadataModule (upval), CreatorName (copy), HasVerifiedBadge (copy), GameStatsModule (upval), TotalUpVotes (copy), TotalDownVotes (copy), p1 (copy), GameTileConstantsModule (upval), IsWide (copy), HideGameStats (copy), GameTileLayoutType (copy), ShowDescription (copy), Description (copy), LinesOfText (copy), WrapEmphasisTileDescriptionText (upval)
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
				name = CreatorName,
				hasVerifiedBadge = HasVerifiedBadge
			}),
			GameStats = ReactModule.createElement(GameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = TotalUpVotes,
					totalDownVotes = TotalDownVotes,
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
				text = Description,
				linesOfText = LinesOfText,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if WrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		CreatorName, TotalUpVotes, TotalDownVotes, p1.playerCountStyle,
		p1.entry.playerCount, IsWide, HideGameStats, GameTileLayoutType,
		ShowDescription, Description, LicenseDescription, HasVerifiedBadge, LinesOfText
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
	
	if FFlagLuaAppHomeTouchAutoplay then
		UseTagAsViewportAutoplayCandidateFunction(UseRefResult1, p1.videoPlaybackContext, not FFlagLuaAppTileVideoCandidateOnly and nil)
	end
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
				selectionOrder = if FFlagLuaAppFixCustomTileBugs then nil else p1.selectionOrder,
				SelectionOrder = if FFlagLuaAppFixCustomTileBugs then p1.SelectionOrder else nil,
				isDisabled = p1.isDisabled,
				onActivated = UseResult,
				onSelectionGained = p1.onSelectionGained,
				onSelectionLost = p1.onSelectionLost,
				image = FormatExperienceThumbnailModuleResult1,
				title = Title,
				numLinesForMetadata = UseMemoResult,
				isHovered = IsHovered,
				footerMetadata = UseMemoResult2,
				imageAspectRatio = ImageAspectRatio,
				isContained = IsContained,
				extraFooterContent = if ShowDescription then nil else UseMemoResult1,
				extraFooterSpace = if ShowDescription then nil else UseMemoResult3,
				reducedMotion = UserGameSettings.ReducedMotion,
				thumbnailOverlay = Element,
				onTileImageLoaded = if FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
			})
		})
	})
end