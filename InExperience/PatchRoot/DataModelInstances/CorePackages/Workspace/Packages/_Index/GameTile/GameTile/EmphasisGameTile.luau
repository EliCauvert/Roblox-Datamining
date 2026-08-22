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
local gameTileVideoThumbnailModule = require(gameTile.GameTileVideoThumbnail)
local gameVideoPlaybackDetectorModule = require(gameTile.Video.GameVideoPlaybackDetector)
local parent = gameTile.Parent
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local usePreferredInput = responsiveModule.usePreferredInput
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
local videoUtilsModule = require(parent.VideoUtils)
local useTagAsViewportAutoplayCandidate = videoUtilsModule.useTagAsViewportAutoplayCandidate
local videoPlaybackCoordinator = videoUtilsModule.VideoPlaybackCoordinator
local videoEndReason = videoUtilsModule.AnalyticsEnums.VideoEndReason
local gameTileThumbnailBadgesModule = require(gameTile.Overlays.GameTileThumbnailBadges)
local wrapEmphasisTileDescriptionText = game:DefineFastFlag("WrapEmphasisTileDescriptionText", false)
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppHomeThumbnailPrefetch = require(parent.SharedFlags).FFlagLuaAppHomeThumbnailPrefetch
local fFlagMigrateGameIconsToStore = require(parent.SharedFlags).FFlagMigrateGameIconsToStore
local fFlagLuaAppEdpMediaGalleryVideoPreview = require(parent.SharedFlags).FFlagLuaAppEdpMediaGalleryVideoPreview
local fFlagLuaAppEmphasisGameTileVideo = require(parent.SharedFlags).FFlagLuaAppEmphasisGameTileVideo
local fIntLuaAppGameTileVideoDwellTimeInSec = require(parent.SharedFlags).FIntLuaAppGameTileVideoDwellTimeInSec
local fIntLuaAppGameTileVideoVisiblePercent = require(parent.SharedFlags).FIntLuaAppGameTileVideoVisiblePercent
local fFlagLuaAppGameTileSelectionVideoPlayback = require(parent.SharedFlags).FFlagLuaAppGameTileSelectionVideoPlayback
local fFlagMigrateGameInfoToStore = require(parent.SharedFlags).FFlagMigrateGameInfoToStore
local var24 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p0) --[[ line: 110 ]]
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var24 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), fFlagLuaAppEmphasisGameTileVideo (ref), videoPlaybackCoordinator (ref), hoverTileCoordinatorModule (ref), videoEndReason (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), gameTileVideoThumbnailModule (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var25 = useDesignTokens()
	local var26 = useTokens()
	local universeId = p0.entry.universeId
	local var27 = useSelector(function(p1) --[[ line: 120 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p1.Personalization[gameInfosReducer.key][universeId]
	end)
	local var28 = nil
	local var29 = nil
	
	if fFlagMigrateGameInfoToStore then
		var28 = gameHydrationReactModule.useGameInfo(universeId)
		var29 = gameHydrationReactModule.useGameVotes(universeId)
	end
	local var40
	local var30 = useSelector(function(p2) --[[ line: 128 ]]
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var31 = useRoactService(roactNetworking)
	local var32 = useDispatch()
	reactModule.useEffect(function() --[[ line: 134 ]]
		-- upvalues: var30 (ref), var32 (ref), apiFetchGameDetails (copy), var31 (ref), universeId (ref)
		if var30 then
			return
		end
		var32(apiFetchGameDetails.Fetch(var31, { universeId }))
	end, { var30, universeId, var31, var32 })
	local var33 = getGameTileLayoutDataModule(var27, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var35 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var36 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p3) --[[ line: 152 ]]
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p3[bigGameIconReducer.key][universeId] then p3[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var37 = if fFlagLuaAppHomeThumbnailPrefetch then var24({
		isEmphasized = true,
		iconUrl = var36,
		universeId = universeId,
		placeId = p0.entry.placeId,
		useGridTile = var35,
		perEntryWideAssetId = p0.entry.primaryWideImageAssetId,
		game = var27,
		topicId = p0.topicId
	}) elseif var35 then formatExperienceThumbnailModule((if p0.entry.primaryWideImageAssetId then p0.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var33)) or (if var27 then var27.primaryWideAssetId else nil), p0.entry.placeId, true) else var36
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var39 = if fFlagMigrateGameInfoToStore then if var33 then var33.title elseif var28 then var28.name else "" elseif var33 then var33.title elseif var27 then var27.name else ""
	
	if not isVRAppBuild() and p0.useHoverTile then
		var40 = p0.impressionsTag ~= nil
	end
	local var41 = reactModule.useRef(nil)
	local var42 = `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`
	var42 = useIsHoveredTileModule(var41, var42, var40)
	local var43 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var43 = if p0.videoPlaybackContext and p0.videoPlaybackContext.videoPlaybackCoordinator then p0.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	end
	local var46, var47
	local var44 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: var42 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppEmphasisGameTileVideo (copy), var43 (write), videoEndReason (copy), universeId (ref), p0 (ref), gameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), var31 (ref)
		if var42 then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var43:reset(videoEndReason.TileClicked, nil, universeId, nil)
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
			sponsoredGamesRecordClick(var31, p0.entry.adId)
		end
	end, {
		universeId, p0.source, p0.onPeekViewClosed, p0.entry.isSponsored,
		p0.entry.adId,
		if fFlagLuaAppEmphasisGameTileVideo then p0.entry.tileType else nil,
		p0.reportGameDetailOpened, var31, p0.navigateToGameDetails, p0.referralSource,
		p0.index, var42, if fFlagLuaAppEmphasisGameTileVideo then var43 else nil
	})
	local showDescription = p0.showDescription or false
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		var46 = if var29 then var29.upVotes else 0
		var47 = if var29 then var29.downVotes else 0
	else
		var46 = if var27 then var27.totalUpVotes else 0
		var47 = if var27 then var27.totalDownVotes else 0
	end
	local name, var52, creatorName
	local hasVerifiedBadge = var30 and (var30.creator and var30.creator.hasVerifiedBadge)
	local var49 = if var30 then var30.description else ""
	local var50 = (if var30 then var30.licenseDescription else nil) or (if var30 then var30.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var50 ~= nil)
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local var54
		name = var28 and (var28.creator and var28.creator.name)
		
		if name ~= "" then
			var54 = name
			
			if not var54 then
				var54 = var30 and (var30.creator and var30.creator.name)
			end
			var52 = var54
		end
	elseif var27 and var27.creatorName ~= "" then
		creatorName = var27.creatorName
		
		if not creatorName then
			creatorName = var30 and (var30.creator and var30.creator.name)
		end
		var52 = creatorName
	end
	name = if var50 then 2 else 3
	local var55 = reactModule.useMemo(function() --[[ line: 290 ]]
		-- upvalues: var52 (write), showDescription (ref), name (ref), hideGameStats (ref), var50 (ref)
		local var86 = 0
		
		if var52 and var52 ~= "" then
			var86 += 1
		end
		if showDescription then
			var86 += name
		end
		if not hideGameStats then
			var86 += 1
		end
		if var50 then
			var86 += 1
		end
		return var86
	end, {
		var52,
		showDescription,
		hideGameStats,
		var50,
		name
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var25, p0.textSizeOffset, 1, var26, true, var55).playButtonHeight
	local var57 = reactModule.useCallback(function(...) --[[ line: 324 ]]
		-- upvalues: var42 (ref), hoverTileCoordinatorModule (copy), p0 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), var43 (write), videoEndReason (copy), universeId (ref)
		if var42 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var43:reset(videoEndReason.ExperienceLaunched, nil, universeId, nil)
		end
	end, {
		var42,
		p0.reportExperienceLaunched,
		if fFlagLuaAppEmphasisGameTileVideo then universeId else nil,
		if fFlagLuaAppEmphasisGameTileVideo then var43 else nil
	})
	local var58 = reactModule.useMemo(function() --[[ line: 351 ]]
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), var57 (ref), var44 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = var57,
			openGameDetails = var44,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource, var57, var44, p0.entry,
		p0.launchExperienceEventContext, playButtonHeight, p0.index, imageAspectRatio
	})
	local var59 = reactModule.useMemo(function() --[[ line: 382 ]]
		-- upvalues: reactModule (copy), var50 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), var52 (write), hasVerifiedBadge (ref), gameStatsModule (copy), var46 (write), var47 (write), p0 (ref), gameTileConstantsModule (copy), var35 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var49 (ref), name (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var50 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var50
			}) else nil,
			CreatorName = reactModule.createElement(creatorNameMetadataModule, {
				LayoutOrder = 2,
				name = var52,
				hasVerifiedBadge = hasVerifiedBadge
			}),
			GameStats = reactModule.createElement(gameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = var46,
					totalDownVotes = var47,
					playerCount = if p0.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p0.entry.playerCount else nil
				},
				isGridTile = var35,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var49,
				linesOfText = name,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		var52, var46, var47, p0.playerCountStyle, p0.entry.playerCount, var35,
		hideGameStats, gameTileLayoutType, showDescription, var49, var50,
		hasVerifiedBadge, name
	})
	local var60, var61 = reactModule.useState(Vector2.new(0, 0))
	local var62 = reactModule.useMemo(function() --[[ line: 451 ]]
		-- upvalues: gameTileViewConfigModule (copy), var25 (ref), var60 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var55 (ref), var26 (ref)
		return var60.Y - gameTileViewConfigModule.getTileHeight(var25, var60.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var55, var26, true)
	end, {
		var25, var60, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var55,
		var26
	})
	local var63 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 482 ]]
		-- upvalues: impressionsTagUtility (copy), var63 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var63, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 484 ]]
			-- upvalues: impressionsTagUtility (copy), var63 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var63, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var64 = nil
	local _ = nil
	local var65 = nil
	local var66 = nil
	local var67 = nil
	local _ = nil
	local var68 = nil
	local var69 = nil
	local var70 = nil
	local var71 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var70 = p0.videoPlaybackContext ~= nil and p0.videoPlaybackContext.disablePlayback == true
		local var72, var73 = reactModule.useState(false)
		var64 = var72
		local var74 = var73
		var65 = reactModule.useCallback(function(p4) --[[ line: 501 ]]
			-- upvalues: var74 (write)
			var74(p4)
		end, {})
		var66 = if p0.entry.primaryWideVideoAssetId then p0.entry.primaryWideVideoAssetId else var33 and (var33.primaryMediaAsset and var33.primaryMediaAsset.wideVideoAssetId)
		
		if fFlagLuaAppGameTileSelectionVideoPlayback then
			local var75, var76 = reactModule.useState(false)
			var67 = var75
			local var77 = var76
			var68 = reactModule.useCallback(function(...) --[[ line: 511 ]]
				-- upvalues: var77 (write), p0 (ref)
				var77(true)
				
				if p0.onSelectionGained then
					p0.onSelectionGained(...)
				end
			end, { p0.onSelectionGained })
			var69 = reactModule.useCallback(function(...) --[[ line: 519 ]]
				-- upvalues: var77 (write), p0 (ref)
				var77(false)
				
				if p0.onSelectionLost then
					p0.onSelectionLost(...)
				end
			end, { p0.onSelectionLost })
		end
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			var71 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		end
		reactModule.useEffect(function() --[[ line: 532 ]]
			-- upvalues: var70 (write), var74 (write)
			if var70 then
				var74(false)
			end
		end, { var70 })
	end
	local var78 = fFlagLuaAppEmphasisGameTileVideo and var66 ~= nil
	useTagAsViewportAutoplayCandidate(if fFlagLuaAppEmphasisGameTileVideo then var41 else var63, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then if fFlagLuaAppEmphasisGameTileVideo then var78 else false else nil)
	local var79 = nil
	local var80 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var79 = if var78 then reactModule.createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{var66}`,
			image = var37,
			playing = var64,
			Size = UDim2.fromScale(1, 1),
			isTileContained = isContained,
			cornerRadius = var26.Radius.Medium,
			itemIndex = p0.index,
			videoAnalytics = p0.videoAnalytics,
			universeId = universeId,
			videoPlaybackCoordinator = var43
		}) else nil
		
		if var78 and not var70 then
			local var83
			local createElement = reactModule.createElement
			local var81 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var42,
				itemIndex = p0.index,
				universeId = tostring(universeId),
				tileRef = var41,
				isHoverSupported = var40,
				isHovered = var42,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var67 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var83 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var83 = var71 == responsiveModule.Input.Touch
				var83 = nil
			else
				var83 = nil
			end
			t.autoplay = var83
			t.onPlaybackChange = var65
			t.videoAnalytics = p0.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.pageContext = p0.appPage
			t.videoPlaybackContext = p0.videoPlaybackContext
			var80 = createElement(var81, t)
		else
			var80 = nil
		end
	end
	local var84 = nil
	local var85 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
	
	if var85 then
		var84 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var85 })
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
			ref = var63,
			[reactModule.Change.AbsoluteSize] = function(p5) --[[ line: 612 ]]
				-- upvalues: var61 (ref)
				var61(p5.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var41,
				SelectionOrder = p0.SelectionOrder,
				isDisabled = p0.isDisabled,
				onActivated = var44,
				onSelectionGained = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var68 else p0.onSelectionGained,
				onSelectionLost = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var69 else p0.onSelectionLost,
				image = var37,
				thumbnailComponent = if fFlagLuaAppEmphasisGameTileVideo then var79 else nil,
				title = var39,
				numLinesForMetadata = var55,
				isHovered = var42,
				footerMetadata = var59,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var58,
				extraFooterSpace = if showDescription then nil else var62,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var84,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			}),
			VideoPlaybackDetector = if fFlagLuaAppEmphasisGameTileVideo then var80 else nil
		})
	})
end