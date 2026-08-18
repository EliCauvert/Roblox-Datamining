local gameTile = script:FindFirstAncestor("GameTile")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local gameTileViewModule = require(gameTile.GameTileView)
local getGameTileLayoutDataModule = require(gameTile.getGameTileLayoutData)
local _ = require(gameTile.GameTileTypes)
local formatExperienceThumbnailModule = require(gameTile.formatExperienceThumbnail)
local gameStatsModule = require(gameTile.Footer.GameStats)
local gameTileConstantsModule = require(gameTile.GameTileConstants)
local gameTileViewConfigModule = require(gameTile.GameTileViewConfig)
local creatorNameMetadataModule = require(gameTile.Footer.CreatorNameMetadata)
local appExperienceActionRowModule = require(gameTile.AppExperienceActionRow)
local useIsHoveredTileModule = require(gameTile.useIsHoveredTile)
local gridTileTextFooterModule = require(gameTile.Footer.GridTileTextFooter)
local itemLayoutDataParsingUtilsModule = require(gameTile.ItemLayoutDataParsingUtils)
local hoverTileCoordinatorModule = require(gameTile.HoverTileCoordinator)
local getTileBadgeByPositionConfigFromEntryModule = require(gameTile.getTileBadgeByPositionConfigFromEntry)
local parent = gameTile.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local gameInfosReducer = require(parent.GameInfosRodux).GameInfosReducer
local bigGameIconReducer = require(parent.GameIconRodux).BigGameIcons.BigGameIconReducer
local gameHydrationReactModule = require(parent.GameHydrationReact)
local apiFetchGameDetails = require(parent.GameDetailRodux).GameDetails.ApiFetchGameDetails
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local useTokens = require(parent.Foundation).Hooks.useTokens
local useDesignTokens = require(parent.Style).useDesignTokens
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local sponsoredGamesRecordClick = require(parent.DiscoveryAnalytics).Requests.sponsoredGamesRecordClick
local useTagAsViewportAutoplayCandidate = require(parent.VideoUtils).useTagAsViewportAutoplayCandidate
local gameTileThumbnailBadgesModule = require(gameTile.Overlays.GameTileThumbnailBadges)
local wrapEmphasisTileDescriptionText = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false)
local luaAppFixEmphasisHoverLogic = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false)
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppHomeThumbnailPrefetch = require(parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local var21 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p0) --[[ line: 93 ]]
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var21 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), luaAppFixEmphasisHoverLogic (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), hoverTileCoordinatorModule (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var22 = useDesignTokens()
	local var23 = useTokens()
	local universeId = p0.entry.universeId
	local var24 = useSelector(function(p1) --[[ line: 101 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p1.Personalization[gameInfosReducer.key][universeId]
	end)
	local var25 = useSelector(function(p2) --[[ line: 104 ]]
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var26 = useRoactService(roactNetworking)
	local var27 = useDispatch()
	reactModule.useEffect(function() --[[ line: 110 ]]
		-- upvalues: var25 (ref), var27 (ref), apiFetchGameDetails (copy), var26 (ref), universeId (ref)
		if var25 then
			return
		end
		var27(apiFetchGameDetails.Fetch(var26, { universeId }))
	end, { var25, universeId, var26, var27 })
	local var28 = getGameTileLayoutDataModule(var24, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var30 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var31 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p3) --[[ line: 128 ]]
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p3[bigGameIconReducer.key][universeId] then p3[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var32 = if fFlagLuaAppHomeThumbnailPrefetch then var21({
		isEmphasized = true,
		iconUrl = var31,
		universeId = universeId,
		placeId = p0.entry.placeId,
		useGridTile = var30,
		perEntryWideAssetId = p0.entry.primaryWideImageAssetId,
		game = var24,
		topicId = p0.topicId
	}) elseif var30 then formatExperienceThumbnailModule((if p0.entry.primaryWideImageAssetId then p0.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var28)) or (if var24 then var24.primaryWideAssetId else nil), p0.entry.placeId, true) else var31
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var34 = if var28 then var28.title elseif var24 then var24.name else ""
	local _ = nil
	local var35 = nil
	local _ = nil
	local var36 = nil
	
	if luaAppFixEmphasisHoverLogic then
		local var37
		if not isVRAppBuild() and p0.useHoverTile then
			var37 = p0.impressionsTag ~= nil
		end
		var35 = reactModule.useRef(nil)
		var36 = useIsHoveredTileModule(var35, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var37)
	end
	local var38 = reactModule.useCallback(function() --[[ line: 172 ]]
		-- upvalues: luaAppFixEmphasisHoverLogic (copy), var36 (write), hoverTileCoordinatorModule (copy), p0 (ref), gameCollectionItemTypes (copy), universeId (ref), sponsoredGamesRecordClick (copy), var26 (ref)
		if luaAppFixEmphasisHoverLogic and var36 then
			hoverTileCoordinatorModule.default:reset()
		end
		p0.navigateToGameDetails(universeId, {
			source = p0.source,
			index = p0.index,
			referralSource = p0.referralSource,
			onPeekViewClosed = p0.onPeekViewClosed,
			experienceJoinData = {
				tileType = p0.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = p0.entry.adId
			}
		})
		p0.reportGameDetailOpened(p0.index, universeId)
		
		if p0.entry.isSponsored then
			sponsoredGamesRecordClick(var26, p0.entry.adId)
		end
	end, {
		universeId, p0.source, p0.onPeekViewClosed, p0.entry.isSponsored,
		p0.entry.adId, p0.reportGameDetailOpened, var26, p0.navigateToGameDetails,
		p0.referralSource, p0.index, if luaAppFixEmphasisHoverLogic then var36 else nil
	})
	
	if not luaAppFixEmphasisHoverLogic then
		local var39
		if not isVRAppBuild() and p0.useHoverTile then
			var39 = p0.impressionsTag ~= nil
		end
		var35 = reactModule.useRef(nil)
		var36 = useIsHoveredTileModule(var35, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var39)
	end
	local creatorName
	local showDescription = p0.showDescription or false
	local var41 = if var24 then var24.totalUpVotes else 0
	local var42 = if var24 then var24.totalDownVotes else 0
	local hasVerifiedBadge = var25 and (var25.creator and var25.creator.hasVerifiedBadge)
	local var44 = if var25 then var25.description else ""
	local var45 = (if var25 then var25.licenseDescription else nil) or (if var25 then var25.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var45 ~= nil)
	
	if var24 and var24.creatorName ~= "" then
		creatorName = var24.creatorName or var25 and (var25.creator and var25.creator.name)
	end
	local var48 = if var45 then 2 else 3
	local var49 = reactModule.useMemo(function() --[[ line: 244 ]]
		-- upvalues: creatorName (ref), showDescription (ref), var48 (ref), hideGameStats (ref), var45 (ref)
		local var60 = 0
		
		if creatorName and creatorName ~= "" then
			var60 += 1
		end
		if showDescription then
			var60 += var48
		end
		if not hideGameStats then
			var60 += 1
		end
		if var45 then
			var60 += 1
		end
		return var60
	end, {
		creatorName,
		showDescription,
		hideGameStats,
		var45,
		var48
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var22, p0.textSizeOffset, 1, var23, true, var49).playButtonHeight
	local var51 = if luaAppFixEmphasisHoverLogic then reactModule.useCallback(function(...) --[[ line: 278 ]]
		-- upvalues: var36 (write), hoverTileCoordinatorModule (copy), p0 (ref)
		if var36 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
	end, { var36, p0.reportExperienceLaunched }) else nil
	local var52 = reactModule.useMemo(function() --[[ line: 290 ]]
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), luaAppFixEmphasisHoverLogic (copy), var51 (ref), var38 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = if luaAppFixEmphasisHoverLogic then var51 else p0.reportExperienceLaunched,
			openGameDetails = var38,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource,
		if luaAppFixEmphasisHoverLogic then var51 else p0.reportExperienceLaunched,
		var38, p0.entry, p0.launchExperienceEventContext, playButtonHeight, p0.index,
		imageAspectRatio
	})
	local var53 = reactModule.useMemo(function() --[[ line: 323 ]]
		-- upvalues: reactModule (copy), var45 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), creatorName (ref), hasVerifiedBadge (ref), gameStatsModule (copy), var41 (ref), var42 (ref), p0 (ref), gameTileConstantsModule (copy), var30 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var44 (ref), var48 (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var45 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var45
			}) else nil,
			CreatorName = reactModule.createElement(creatorNameMetadataModule, {
				LayoutOrder = 2,
				name = creatorName,
				hasVerifiedBadge = hasVerifiedBadge
			}),
			GameStats = reactModule.createElement(gameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = var41,
					totalDownVotes = var42,
					playerCount = if p0.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p0.entry.playerCount else nil
				},
				isGridTile = var30,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var44,
				linesOfText = var48,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		creatorName, var41, var42, p0.playerCountStyle, p0.entry.playerCount, var30,
		hideGameStats, gameTileLayoutType, showDescription, var44, var45,
		hasVerifiedBadge, var48
	})
	local var54, var55 = reactModule.useState(Vector2.new(0, 0))
	local var56 = reactModule.useMemo(function() --[[ line: 392 ]]
		-- upvalues: gameTileViewConfigModule (copy), var22 (ref), var54 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var49 (ref), var23 (ref)
		return var54.Y - gameTileViewConfigModule.getTileHeight(var22, var54.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var49, var23, true)
	end, {
		var22, var54, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var49,
		var23
	})
	local var57 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 423 ]]
		-- upvalues: impressionsTagUtility (copy), var57 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var57, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 425 ]]
			-- upvalues: impressionsTagUtility (copy), var57 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var57, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	useTagAsViewportAutoplayCandidate(var57, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	local var58 = nil
	local var59 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
	
	if var59 then
		var58 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var59 })
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		ZIndex = -p0.index
	}, {
		EmphasisTileContainer = reactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			Size = p0.size,
			BackgroundTransparency = 1,
			ref = var57,
			[reactModule.Change.AbsoluteSize] = function(p4) --[[ line: 458 ]]
				-- upvalues: var55 (ref)
				var55(p4.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var35,
				SelectionOrder = p0.SelectionOrder,
				isDisabled = p0.isDisabled,
				onActivated = var38,
				onSelectionGained = p0.onSelectionGained,
				onSelectionLost = p0.onSelectionLost,
				image = var32,
				title = var34,
				numLinesForMetadata = var49,
				isHovered = var36,
				footerMetadata = var53,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var52,
				extraFooterSpace = if showDescription then nil else var56,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var58,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			})
		})
	})
end