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
local var1 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p1)
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), fFlagMigrateGameInfoToStore (ref), gameHydrationReactModule (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var1 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), fFlagLuaAppEmphasisGameTileVideo (ref), videoPlaybackCoordinator (ref), hoverTileCoordinatorModule (ref), videoEndReason (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), gameTileVideoThumbnailModule (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var2 = useDesignTokens()
	local var3 = useTokens()
	local universeId = p1.entry.universeId
	local var4 = useSelector(function(p2)
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p2.Personalization[gameInfosReducer.key][universeId]
	end)
	local var5 = nil
	local var6 = nil
	
	if fFlagMigrateGameInfoToStore then
		var5 = gameHydrationReactModule.useGameInfo(universeId)
		var6 = gameHydrationReactModule.useGameVotes(universeId)
	end
	local var7
	local var8 = useSelector(function(p2)
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var9 = useRoactService(roactNetworking)
	local var10 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var10 (ref), apiFetchGameDetails (copy), var9 (ref), universeId (ref)
		if var8 then
			return
		end
		var10(apiFetchGameDetails.Fetch(var9, { universeId }))
	end, { var8, universeId, var9, var10 })
	local var11 = getGameTileLayoutDataModule(var4, p1.topicId)
	local gameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local var12 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var13 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p2)
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p2[bigGameIconReducer.key][universeId] then p2[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var14 = if fFlagLuaAppHomeThumbnailPrefetch then var1({
		isEmphasized = true,
		iconUrl = var13,
		universeId = universeId,
		placeId = p1.entry.placeId,
		useGridTile = var12,
		perEntryWideAssetId = p1.entry.primaryWideImageAssetId,
		game = var4,
		topicId = p1.topicId
	}) elseif var12 then formatExperienceThumbnailModule((if p1.entry.primaryWideImageAssetId then p1.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var11)) or (if var4 then var4.primaryWideAssetId else nil), p1.entry.placeId, true) else var13
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var15 = if fFlagMigrateGameInfoToStore then if var11 then var11.title elseif var5 then var5.name else "" elseif var11 then var11.title elseif var4 then var4.name else ""
	
	if not isVRAppBuild() and p1.useHoverTile then
		var7 = p1.impressionsTag ~= nil
	end
	local var16 = reactModule.useRef(nil)
	local var17 = `{p1.impressionsTag or ""}_{p1.index}_{gameTileLayoutType}`
	local var18 = useIsHoveredTileModule(var16, var17, var7)
	local var19 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var19 = if p1.videoPlaybackContext and p1.videoPlaybackContext.videoPlaybackCoordinator then p1.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	end
	local var20, var21
	local var22 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppEmphasisGameTileVideo (copy), var19 (write), videoEndReason (copy), universeId (ref), p1 (ref), gameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), var9 (ref)
		if var18 then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var19:reset(videoEndReason.TileClicked, nil, universeId, nil)
		end
		p1.navigateToGameDetails(universeId, {
			source = p1.source,
			index = p1.index,
			referralSource = p1.referralSource,
			onPeekViewClosed = p1.onPeekViewClosed,
			experienceJoinData = {
				tileType = p1.entry.tileType or gameCollectionItemTypes.GameCollectionItemType.EmphasisTile,
				nativeAdData = p1.entry.adId
			}
		})
		p1.reportGameDetailOpened(p1.index, universeId)
		
		if p1.entry.isSponsored then
			sponsoredGamesRecordClick(var9, p1.entry.adId)
		end
	end, {
		universeId, p1.source, p1.onPeekViewClosed, p1.entry.isSponsored,
		p1.entry.adId,
		if fFlagLuaAppEmphasisGameTileVideo then p1.entry.tileType else nil,
		p1.reportGameDetailOpened, var9, p1.navigateToGameDetails, p1.referralSource,
		p1.index, var18, if fFlagLuaAppEmphasisGameTileVideo then var19 else nil
	})
	local showDescription = p1.showDescription or false
	local _ = nil
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		var20 = if var6 then var6.upVotes else 0
		var21 = if var6 then var6.downVotes else 0
	else
		var20 = if var4 then var4.totalUpVotes else 0
		var21 = if var4 then var4.totalDownVotes else 0
	end
	local name, var23, creatorName
	local hasVerifiedBadge = var8 and (var8.creator and var8.creator.hasVerifiedBadge)
	local var24 = if var8 then var8.description else ""
	local var25 = (if var8 then var8.licenseDescription else nil) or (if var8 then var8.localizedFiatPrice else nil)
	local hideGameStats = p1.hideGameStats or (showDescription or var25 ~= nil)
	local _ = nil
	
	if fFlagMigrateGameInfoToStore then
		local var26
		name = var5 and (var5.creator and var5.creator.name)
		
		if name ~= "" then
			var26 = name
			
			if not var26 then
				var26 = var8 and (var8.creator and var8.creator.name)
			end
			var23 = var26
		end
	elseif var4 and var4.creatorName ~= "" then
		creatorName = var4.creatorName
		
		if not creatorName then
			creatorName = var8 and (var8.creator and var8.creator.name)
		end
		var23 = creatorName
	end
	name = if var25 then 2 else 3
	local var27 = reactModule.useMemo(function()
		-- upvalues: var23 (write), showDescription (ref), name (ref), hideGameStats (ref), var25 (ref)
		local var28 = 0
		
		if var23 and var23 ~= "" then
			var28 += 1
		end
		if showDescription then
			var28 += name
		end
		if not hideGameStats then
			var28 += 1
		end
		if var25 then
			var28 += 1
		end
		return var28
	end, {
		var23,
		showDescription,
		hideGameStats,
		var25,
		name
	})
	local isContained = p1.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var2, p1.textSizeOffset, 1, var3, true, var27).playButtonHeight
	local var28 = reactModule.useCallback(function(...)
		-- upvalues: var18 (ref), hoverTileCoordinatorModule (copy), p1 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), var19 (write), videoEndReason (copy), universeId (ref)
		if var18 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched(...)
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var19:reset(videoEndReason.ExperienceLaunched, nil, universeId, nil)
		end
	end, {
		var18,
		p1.reportExperienceLaunched,
		if fFlagLuaAppEmphasisGameTileVideo then universeId else nil,
		if fFlagLuaAppEmphasisGameTileVideo then var19 else nil
	})
	local var29 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p1 (ref), var28 (ref), var22 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p1.referralSource,
			reportExperienceLaunched = var28,
			openGameDetails = var22,
			entry = p1.entry,
			launchExperienceEventContext = p1.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p1.index
		})
	end, {
		universeId, p1.referralSource, var28, var22, p1.entry,
		p1.launchExperienceEventContext, playButtonHeight, p1.index, imageAspectRatio
	})
	local var30 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var25 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), var23 (write), hasVerifiedBadge (ref), gameStatsModule (copy), var20 (write), var21 (write), p1 (ref), gameTileConstantsModule (copy), var12 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var24 (ref), name (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var25 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var25
			}) else nil,
			CreatorName = reactModule.createElement(creatorNameMetadataModule, {
				LayoutOrder = 2,
				name = var23,
				hasVerifiedBadge = hasVerifiedBadge
			}),
			GameStats = reactModule.createElement(gameStatsModule, {
				LayoutOrder = 3,
				useLargerFont = true,
				isUnifiedGameTile = true,
				stats = {
					totalUpVotes = var20,
					totalDownVotes = var21,
					playerCount = if p1.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p1.entry.playerCount else nil
				},
				isGridTile = var12,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var24,
				linesOfText = name,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		var23, var20, var21, p1.playerCountStyle, p1.entry.playerCount, var12,
		hideGameStats, gameTileLayoutType, showDescription, var24, var25,
		hasVerifiedBadge, name
	})
	local var31, var32 = reactModule.useState(Vector2.new(0, 0))
	local var33 = reactModule.useMemo(function()
		-- upvalues: gameTileViewConfigModule (copy), var2 (ref), var31 (ref), gameTileLayoutType (ref), isContained (ref), p1 (ref), var27 (ref), var3 (ref)
		return var31.Y - gameTileViewConfigModule.getTileHeight(var2, var31.X, gameTileLayoutType, isContained, false, false, p1.textSizeOffset, nil, 1, var27, var3, true)
	end, {
		var2, var31, gameTileLayoutType, isContained, p1.textSizeOffset, 1, var27,
		var3
	})
	local var34 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var34 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var34, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var34 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var34, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var35 = nil
	local _ = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	local _ = nil
	local var39 = nil
	local var40 = nil
	local var41 = nil
	local var42 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var41 = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
		local var43, var44 = reactModule.useState(false)
		var35 = var43
		local var45 = var44
		var36 = reactModule.useCallback(function(p2)
			-- upvalues: var45 (write)
			var45(p2)
		end, {})
		var37 = if p1.entry.primaryWideVideoAssetId then p1.entry.primaryWideVideoAssetId else var11 and (var11.primaryMediaAsset and var11.primaryMediaAsset.wideVideoAssetId)
		
		if fFlagLuaAppGameTileSelectionVideoPlayback then
			local var46, var47 = reactModule.useState(false)
			var38 = var46
			local var48 = var47
			var39 = reactModule.useCallback(function(...)
				-- upvalues: var48 (write), p1 (ref)
				var48(true)
				
				if p1.onSelectionGained then
					p1.onSelectionGained(...)
				end
			end, { p1.onSelectionGained })
			var40 = reactModule.useCallback(function(...)
				-- upvalues: var48 (write), p1 (ref)
				var48(false)
				
				if p1.onSelectionLost then
					p1.onSelectionLost(...)
				end
			end, { p1.onSelectionLost })
		end
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			var42 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		end
		reactModule.useEffect(function()
			-- upvalues: var41 (write), var45 (write)
			if var41 then
				var45(false)
			end
		end, { var41 })
	end
	local var49 = fFlagLuaAppEmphasisGameTileVideo and var37 ~= nil
	useTagAsViewportAutoplayCandidate(if fFlagLuaAppEmphasisGameTileVideo then var16 else var34, p1.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then if fFlagLuaAppEmphasisGameTileVideo then var49 else false else nil)
	local var50 = nil
	local var51 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var50 = if var49 then reactModule.createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{var37}`,
			image = var14,
			playing = var35,
			Size = UDim2.fromScale(1, 1),
			isTileContained = isContained,
			cornerRadius = var3.Radius.Medium,
			itemIndex = p1.index,
			videoAnalytics = p1.videoAnalytics,
			universeId = universeId,
			videoPlaybackCoordinator = var19
		}) else nil
		
		if var49 and not var41 then
			local var52
			local createElement = reactModule.createElement
			local var53 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var17,
				itemIndex = p1.index,
				universeId = tostring(universeId),
				tileRef = var16,
				isHoverSupported = var7,
				isHovered = var18,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var38 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var52 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var52 = var42 == responsiveModule.Input.Touch
				var52 = nil
			else
				var52 = nil
			end
			t.autoplay = var52
			t.onPlaybackChange = var36
			t.videoAnalytics = p1.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.pageContext = p1.appPage
			t.videoPlaybackContext = p1.videoPlaybackContext
			var51 = createElement(var53, t)
		else
			var51 = nil
		end
	end
	local var54 = nil
	local var55 = getTileBadgeByPositionConfigFromEntryModule(p1.entry)
	
	if var55 then
		var54 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var55 })
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		ZIndex = -p1.index
	}, {
		EmphasisTileContainer = reactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 0),
			Position = UDim2.fromScale(0, 0),
			Size = p1.size,
			BackgroundTransparency = 1,
			ref = var34,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var32 (ref)
				var32(p2.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var16,
				SelectionOrder = p1.SelectionOrder,
				isDisabled = p1.isDisabled,
				onActivated = var22,
				onSelectionGained = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var39 else p1.onSelectionGained,
				onSelectionLost = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var40 else p1.onSelectionLost,
				image = var14,
				thumbnailComponent = if fFlagLuaAppEmphasisGameTileVideo then var50 else nil,
				title = var15,
				numLinesForMetadata = var27,
				isHovered = var18,
				footerMetadata = var30,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var29,
				extraFooterSpace = if showDescription then nil else var33,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var54,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
			}),
			VideoPlaybackDetector = if fFlagLuaAppEmphasisGameTileVideo then var51 else nil
		})
	})
end