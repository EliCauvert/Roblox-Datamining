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
local var24 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p0) --[[ line: 108 ]]
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var24 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), fFlagLuaAppEmphasisGameTileVideo (ref), videoPlaybackCoordinator (ref), hoverTileCoordinatorModule (ref), videoEndReason (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), gameTileVideoThumbnailModule (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var38
	local var25 = useDesignTokens()
	local var26 = useTokens()
	local universeId = p0.entry.universeId
	local var27 = useSelector(function(p1) --[[ line: 116 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p1.Personalization[gameInfosReducer.key][universeId]
	end)
	local var28 = useSelector(function(p2) --[[ line: 119 ]]
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var29 = useRoactService(roactNetworking)
	local var30 = useDispatch()
	reactModule.useEffect(function() --[[ line: 125 ]]
		-- upvalues: var28 (ref), var30 (ref), apiFetchGameDetails (copy), var29 (ref), universeId (ref)
		if var28 then
			return
		end
		var30(apiFetchGameDetails.Fetch(var29, { universeId }))
	end, { var28, universeId, var29, var30 })
	local var31 = getGameTileLayoutDataModule(var27, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var33 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var34 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p3) --[[ line: 143 ]]
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p3[bigGameIconReducer.key][universeId] then p3[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var35 = if fFlagLuaAppHomeThumbnailPrefetch then var24({
		isEmphasized = true,
		iconUrl = var34,
		universeId = universeId,
		placeId = p0.entry.placeId,
		useGridTile = var33,
		perEntryWideAssetId = p0.entry.primaryWideImageAssetId,
		game = var27,
		topicId = p0.topicId
	}) elseif var33 then formatExperienceThumbnailModule((if p0.entry.primaryWideImageAssetId then p0.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var31)) or (if var27 then var27.primaryWideAssetId else nil), p0.entry.placeId, true) else var34
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var37 = if var31 then var31.title elseif var27 then var27.name else ""
	
	if not isVRAppBuild() and p0.useHoverTile then
		var38 = p0.impressionsTag ~= nil
	end
	local var39 = reactModule.useRef(nil)
	local var40 = `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`
	var40 = useIsHoveredTileModule(var39, var40, var38)
	local var41 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var41 = if p0.videoPlaybackContext and p0.videoPlaybackContext.videoPlaybackCoordinator then p0.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	end
	local creatorName
	local var42 = reactModule.useCallback(function() --[[ line: 189 ]]
		-- upvalues: var40 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppEmphasisGameTileVideo (copy), var41 (write), videoEndReason (copy), universeId (ref), p0 (ref), gameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), var29 (ref)
		if var40 then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var41:reset(videoEndReason.TileClicked, nil, universeId, nil)
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
			sponsoredGamesRecordClick(var29, p0.entry.adId)
		end
	end, {
		universeId, p0.source, p0.onPeekViewClosed, p0.entry.isSponsored,
		p0.entry.adId,
		if fFlagLuaAppEmphasisGameTileVideo then p0.entry.tileType else nil,
		p0.reportGameDetailOpened, var29, p0.navigateToGameDetails, p0.referralSource,
		p0.index, var40, if fFlagLuaAppEmphasisGameTileVideo then var41 else nil
	})
	local showDescription = p0.showDescription or false
	local var44 = if var27 then var27.totalUpVotes else 0
	local var45 = if var27 then var27.totalDownVotes else 0
	local hasVerifiedBadge = var28 and (var28.creator and var28.creator.hasVerifiedBadge)
	local var47 = if var28 then var28.description else ""
	local var48 = (if var28 then var28.licenseDescription else nil) or (if var28 then var28.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var48 ~= nil)
	
	if var27 and var27.creatorName ~= "" then
		creatorName = var27.creatorName or var28 and (var28.creator and var28.creator.name)
	end
	local var51 = if var48 then 2 else 3
	local var52 = reactModule.useMemo(function() --[[ line: 262 ]]
		-- upvalues: creatorName (ref), showDescription (ref), var51 (ref), hideGameStats (ref), var48 (ref)
		local var83 = 0
		
		if creatorName and creatorName ~= "" then
			var83 += 1
		end
		if showDescription then
			var83 += var51
		end
		if not hideGameStats then
			var83 += 1
		end
		if var48 then
			var83 += 1
		end
		return var83
	end, {
		creatorName,
		showDescription,
		hideGameStats,
		var48,
		var51
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var25, p0.textSizeOffset, 1, var26, true, var52).playButtonHeight
	local var54 = reactModule.useCallback(function(...) --[[ line: 296 ]]
		-- upvalues: var40 (ref), hoverTileCoordinatorModule (copy), p0 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), var41 (write), videoEndReason (copy), universeId (ref)
		if var40 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var41:reset(videoEndReason.ExperienceLaunched, nil, universeId, nil)
		end
	end, {
		var40,
		p0.reportExperienceLaunched,
		if fFlagLuaAppEmphasisGameTileVideo then universeId else nil,
		if fFlagLuaAppEmphasisGameTileVideo then var41 else nil
	})
	local var55 = reactModule.useMemo(function() --[[ line: 323 ]]
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), var54 (ref), var42 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = var54,
			openGameDetails = var42,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource, var54, var42, p0.entry,
		p0.launchExperienceEventContext, playButtonHeight, p0.index, imageAspectRatio
	})
	local var56 = reactModule.useMemo(function() --[[ line: 354 ]]
		-- upvalues: reactModule (copy), var48 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), creatorName (ref), hasVerifiedBadge (ref), gameStatsModule (copy), var44 (ref), var45 (ref), p0 (ref), gameTileConstantsModule (copy), var33 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var47 (ref), var51 (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var48 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var48
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
					totalUpVotes = var44,
					totalDownVotes = var45,
					playerCount = if p0.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p0.entry.playerCount else nil
				},
				isGridTile = var33,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var47,
				linesOfText = var51,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		creatorName, var44, var45, p0.playerCountStyle, p0.entry.playerCount, var33,
		hideGameStats, gameTileLayoutType, showDescription, var47, var48,
		hasVerifiedBadge, var51
	})
	local var57, var58 = reactModule.useState(Vector2.new(0, 0))
	local var59 = reactModule.useMemo(function() --[[ line: 423 ]]
		-- upvalues: gameTileViewConfigModule (copy), var25 (ref), var57 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var52 (ref), var26 (ref)
		return var57.Y - gameTileViewConfigModule.getTileHeight(var25, var57.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var52, var26, true)
	end, {
		var25, var57, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var52,
		var26
	})
	local var60 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 454 ]]
		-- upvalues: impressionsTagUtility (copy), var60 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var60, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 456 ]]
			-- upvalues: impressionsTagUtility (copy), var60 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var60, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var61 = nil
	local _ = nil
	local var62 = nil
	local var63 = nil
	local var64 = nil
	local _ = nil
	local var65 = nil
	local var66 = nil
	local var67 = nil
	local var68 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var67 = p0.videoPlaybackContext ~= nil and p0.videoPlaybackContext.disablePlayback == true
		local var69, var70 = reactModule.useState(false)
		var61 = var69
		local var71 = var70
		var62 = reactModule.useCallback(function(p4) --[[ line: 473 ]]
			-- upvalues: var71 (write)
			var71(p4)
		end, {})
		var63 = if p0.entry.primaryWideVideoAssetId then p0.entry.primaryWideVideoAssetId else var31 and (var31.primaryMediaAsset and var31.primaryMediaAsset.wideVideoAssetId)
		
		if fFlagLuaAppGameTileSelectionVideoPlayback then
			local var72, var73 = reactModule.useState(false)
			var64 = var72
			local var74 = var73
			var65 = reactModule.useCallback(function(...) --[[ line: 483 ]]
				-- upvalues: var74 (write), p0 (ref)
				var74(true)
				
				if p0.onSelectionGained then
					p0.onSelectionGained(...)
				end
			end, { p0.onSelectionGained })
			var66 = reactModule.useCallback(function(...) --[[ line: 491 ]]
				-- upvalues: var74 (write), p0 (ref)
				var74(false)
				
				if p0.onSelectionLost then
					p0.onSelectionLost(...)
				end
			end, { p0.onSelectionLost })
		end
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			var68 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		end
		reactModule.useEffect(function() --[[ line: 504 ]]
			-- upvalues: var67 (write), var71 (write)
			if var67 then
				var71(false)
			end
		end, { var67 })
	end
	local var75 = fFlagLuaAppEmphasisGameTileVideo and var63 ~= nil
	useTagAsViewportAutoplayCandidate(if fFlagLuaAppEmphasisGameTileVideo then var39 else var60, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then if fFlagLuaAppEmphasisGameTileVideo then var75 else false else nil)
	local var76 = nil
	local var77 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var76 = if var75 then reactModule.createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{var63}`,
			image = var35,
			playing = var61,
			Size = UDim2.fromScale(1, 1),
			isTileContained = isContained,
			cornerRadius = var26.Radius.Medium,
			itemIndex = p0.index,
			videoAnalytics = p0.videoAnalytics,
			universeId = universeId,
			videoPlaybackCoordinator = var41
		}) else nil
		
		if var75 and not var67 then
			local var80
			local createElement = reactModule.createElement
			local var78 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var40,
				itemIndex = p0.index,
				universeId = tostring(universeId),
				tileRef = var39,
				isHoverSupported = var38,
				isHovered = var40,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var64 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var80 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var80 = var68 == responsiveModule.Input.Touch
				var80 = nil
			else
				var80 = nil
			end
			t.autoplay = var80
			t.onPlaybackChange = var62
			t.videoAnalytics = p0.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.pageContext = p0.appPage
			t.videoPlaybackContext = p0.videoPlaybackContext
			var77 = createElement(var78, t)
		else
			var77 = nil
		end
	end
	local var81 = nil
	local var82 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
	
	if var82 then
		var81 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var82 })
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
			ref = var60,
			[reactModule.Change.AbsoluteSize] = function(p5) --[[ line: 584 ]]
				-- upvalues: var58 (ref)
				var58(p5.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var39,
				SelectionOrder = p0.SelectionOrder,
				isDisabled = p0.isDisabled,
				onActivated = var42,
				onSelectionGained = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var65 else p0.onSelectionGained,
				onSelectionLost = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var66 else p0.onSelectionLost,
				image = var35,
				thumbnailComponent = if fFlagLuaAppEmphasisGameTileVideo then var76 else nil,
				title = var37,
				numLinesForMetadata = var52,
				isHovered = var40,
				footerMetadata = var56,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var55,
				extraFooterSpace = if showDescription then nil else var59,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var81,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			}),
			VideoPlaybackDetector = if fFlagLuaAppEmphasisGameTileVideo then var77 else nil
		})
	})
end