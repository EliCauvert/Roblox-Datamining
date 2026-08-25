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

return function(p0)
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var24 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), fFlagLuaAppEmphasisGameTileVideo (ref), videoPlaybackCoordinator (ref), hoverTileCoordinatorModule (ref), videoEndReason (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), gameTileVideoThumbnailModule (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var25 = useDesignTokens()
	local var26 = useTokens()
	local universeId = p0.entry.universeId
	local var27 = useSelector(function(p1)
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
	local var30 = useSelector(function(p2)
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var31 = useRoactService(roactNetworking)
	local var32 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var30 (ref), var32 (ref), apiFetchGameDetails (copy), var31 (ref), universeId (ref)
		if var30 then
			return
		end
		var32(apiFetchGameDetails.Fetch(var31, { universeId }))
	end, { var30, universeId, var31, var32 })
	local var33 = getGameTileLayoutDataModule(var27, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var35 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var36 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p3)
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
	local var43 = useIsHoveredTileModule(var41, var42, var40)
	local var44 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var44 = if p0.videoPlaybackContext and p0.videoPlaybackContext.videoPlaybackCoordinator then p0.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	end
	local var47, var48
	local var45 = reactModule.useCallback(function()
		-- upvalues: var43 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppEmphasisGameTileVideo (copy), var44 (write), videoEndReason (copy), universeId (ref), p0 (ref), gameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), var31 (ref)
		if var43 then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var44:reset(videoEndReason.TileClicked, nil, universeId, nil)
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
		p0.index, var43, if fFlagLuaAppEmphasisGameTileVideo then var44 else nil
	})
	local showDescription = p0.showDescription or false
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		var47 = if var29 then var29.upVotes else 0
		var48 = if var29 then var29.downVotes else 0
	else
		var47 = if var27 then var27.totalUpVotes else 0
		var48 = if var27 then var27.totalDownVotes else 0
	end
	local name, var53, creatorName
	local hasVerifiedBadge = var30 and (var30.creator and var30.creator.hasVerifiedBadge)
	local var50 = if var30 then var30.description else ""
	local var51 = (if var30 then var30.licenseDescription else nil) or (if var30 then var30.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var51 ~= nil)
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local var55
		name = var28 and (var28.creator and var28.creator.name)
		
		if name ~= "" then
			var55 = name
			
			if not var55 then
				var55 = var30 and (var30.creator and var30.creator.name)
			end
			var53 = var55
		end
	elseif var27 and var27.creatorName ~= "" then
		creatorName = var27.creatorName
		
		if not creatorName then
			creatorName = var30 and (var30.creator and var30.creator.name)
		end
		var53 = creatorName
	end
	name = if var51 then 2 else 3
	local var56 = reactModule.useMemo(function()
		-- upvalues: var53 (write), showDescription (ref), name (ref), hideGameStats (ref), var51 (ref)
		local var87 = 0
		
		if var53 and var53 ~= "" then
			var87 += 1
		end
		if showDescription then
			var87 += name
		end
		if not hideGameStats then
			var87 += 1
		end
		if var51 then
			var87 += 1
		end
		return var87
	end, {
		var53,
		showDescription,
		hideGameStats,
		var51,
		name
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var25, p0.textSizeOffset, 1, var26, true, var56).playButtonHeight
	local var58 = reactModule.useCallback(function(...)
		-- upvalues: var43 (ref), hoverTileCoordinatorModule (copy), p0 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), var44 (write), videoEndReason (copy), universeId (ref)
		if var43 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var44:reset(videoEndReason.ExperienceLaunched, nil, universeId, nil)
		end
	end, {
		var43,
		p0.reportExperienceLaunched,
		if fFlagLuaAppEmphasisGameTileVideo then universeId else nil,
		if fFlagLuaAppEmphasisGameTileVideo then var44 else nil
	})
	local var59 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), var58 (ref), var45 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = var58,
			openGameDetails = var45,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource, var58, var45, p0.entry,
		p0.launchExperienceEventContext, playButtonHeight, p0.index, imageAspectRatio
	})
	local var60 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var51 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), var53 (write), hasVerifiedBadge (ref), gameStatsModule (copy), var47 (write), var48 (write), p0 (ref), gameTileConstantsModule (copy), var35 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var50 (ref), name (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var51 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var51
			}) else nil,
			CreatorName = reactModule.createElement(creatorNameMetadataModule, {
				LayoutOrder = 2,
				name = var53,
				hasVerifiedBadge = hasVerifiedBadge
			}),
			GameStats = reactModule.createElement(gameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = var47,
					totalDownVotes = var48,
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
				text = var50,
				linesOfText = name,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		var53, var47, var48, p0.playerCountStyle, p0.entry.playerCount, var35,
		hideGameStats, gameTileLayoutType, showDescription, var50, var51,
		hasVerifiedBadge, name
	})
	local var61, var62 = reactModule.useState(Vector2.new(0, 0))
	local var63 = reactModule.useMemo(function()
		-- upvalues: gameTileViewConfigModule (copy), var25 (ref), var61 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var56 (ref), var26 (ref)
		return var61.Y - gameTileViewConfigModule.getTileHeight(var25, var61.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var56, var26, true)
	end, {
		var25, var61, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var56,
		var26
	})
	local var64 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var64 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var64, p0.impressionsTag, p0.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var64 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var64, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var65 = nil
	local _ = nil
	local var66 = nil
	local var67 = nil
	local var68 = nil
	local _ = nil
	local var69 = nil
	local var70 = nil
	local var71 = nil
	local var72 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var71 = p0.videoPlaybackContext ~= nil and p0.videoPlaybackContext.disablePlayback == true
		local var73, var74 = reactModule.useState(false)
		var65 = var73
		local var75 = var74
		var66 = reactModule.useCallback(function(p4)
			-- upvalues: var75 (write)
			var75(p4)
		end, {})
		var67 = if p0.entry.primaryWideVideoAssetId then p0.entry.primaryWideVideoAssetId else var33 and (var33.primaryMediaAsset and var33.primaryMediaAsset.wideVideoAssetId)
		
		if fFlagLuaAppGameTileSelectionVideoPlayback then
			local var76, var77 = reactModule.useState(false)
			var68 = var76
			local var78 = var77
			var69 = reactModule.useCallback(function(...)
				-- upvalues: var78 (write), p0 (ref)
				var78(true)
				
				if p0.onSelectionGained then
					p0.onSelectionGained(...)
				end
			end, { p0.onSelectionGained })
			var70 = reactModule.useCallback(function(...)
				-- upvalues: var78 (write), p0 (ref)
				var78(false)
				
				if p0.onSelectionLost then
					p0.onSelectionLost(...)
				end
			end, { p0.onSelectionLost })
		end
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			var72 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		end
		reactModule.useEffect(function()
			-- upvalues: var71 (write), var75 (write)
			if var71 then
				var75(false)
			end
		end, { var71 })
	end
	local var79 = fFlagLuaAppEmphasisGameTileVideo and var67 ~= nil
	useTagAsViewportAutoplayCandidate(if fFlagLuaAppEmphasisGameTileVideo then var41 else var64, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then if fFlagLuaAppEmphasisGameTileVideo then var79 else false else nil)
	local var80 = nil
	local var81 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var80 = if var79 then reactModule.createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{var67}`,
			image = var37,
			playing = var65,
			Size = UDim2.fromScale(1, 1),
			isTileContained = isContained,
			cornerRadius = var26.Radius.Medium,
			itemIndex = p0.index,
			videoAnalytics = p0.videoAnalytics,
			universeId = universeId,
			videoPlaybackCoordinator = var44
		}) else nil
		
		if var79 and not var71 then
			local var84
			local createElement = reactModule.createElement
			local var82 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var42,
				itemIndex = p0.index,
				universeId = tostring(universeId),
				tileRef = var41,
				isHoverSupported = var40,
				isHovered = var43,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var68 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var84 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var84 = var72 == responsiveModule.Input.Touch
				var84 = nil
			else
				var84 = nil
			end
			t.autoplay = var84
			t.onPlaybackChange = var66
			t.videoAnalytics = p0.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.pageContext = p0.appPage
			t.videoPlaybackContext = p0.videoPlaybackContext
			var81 = createElement(var82, t)
		else
			var81 = nil
		end
	end
	local var85 = nil
	local var86 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
	
	if var86 then
		var85 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var86 })
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
			ref = var64,
			[reactModule.Change.AbsoluteSize] = function(p5)
				-- upvalues: var62 (ref)
				var62(p5.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var41,
				SelectionOrder = p0.SelectionOrder,
				isDisabled = p0.isDisabled,
				onActivated = var45,
				onSelectionGained = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var69 else p0.onSelectionGained,
				onSelectionLost = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var70 else p0.onSelectionLost,
				image = var37,
				thumbnailComponent = if fFlagLuaAppEmphasisGameTileVideo then var80 else nil,
				title = var39,
				numLinesForMetadata = var56,
				isHovered = var43,
				footerMetadata = var60,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var59,
				extraFooterSpace = if showDescription then nil else var63,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var85,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			}),
			VideoPlaybackDetector = if fFlagLuaAppEmphasisGameTileVideo then var81 else nil
		})
	})
end