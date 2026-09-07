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
local var1 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p1)
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), fFlagMigrateGameIconsToStore (ref), gameHydrationReactModule (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var1 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), fFlagLuaAppEmphasisGameTileVideo (ref), videoPlaybackCoordinator (ref), hoverTileCoordinatorModule (ref), videoEndReason (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppGameTileSelectionVideoPlayback (ref), fFlagLuaAppEdpMediaGalleryVideoPreview (ref), usePreferredInput (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), gameTileVideoThumbnailModule (ref), gameVideoPlaybackDetectorModule (ref), responsiveModule (ref), fIntLuaAppGameTileVideoDwellTimeInSec (ref), fIntLuaAppGameTileVideoVisiblePercent (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var2
	local var3 = useDesignTokens()
	local var4 = useTokens()
	local universeId = p1.entry.universeId
	local var5 = useSelector(function(p2)
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p2.Personalization[gameInfosReducer.key][universeId]
	end)
	local var6 = useSelector(function(p2)
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var7 = useRoactService(roactNetworking)
	local var8 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var8 (ref), apiFetchGameDetails (copy), var7 (ref), universeId (ref)
		if var6 then
			return
		end
		var8(apiFetchGameDetails.Fetch(var7, { universeId }))
	end, { var6, universeId, var7, var8 })
	local var9 = getGameTileLayoutDataModule(var5, p1.topicId)
	local gameTileLayoutType = p1.gameTileLayoutType or "Narrow"
	local var10 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var11 = if fFlagMigrateGameIconsToStore then gameHydrationReactModule.useLargeGameIcon(universeId) or "" else useSelector(function(p2)
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p2[bigGameIconReducer.key][universeId] then p2[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var12 = if fFlagLuaAppHomeThumbnailPrefetch then var1({
		isEmphasized = true,
		iconUrl = var11,
		universeId = universeId,
		placeId = p1.entry.placeId,
		useGridTile = var10,
		perEntryWideAssetId = p1.entry.primaryWideImageAssetId,
		game = var5,
		topicId = p1.topicId
	}) elseif var10 then formatExperienceThumbnailModule((if p1.entry.primaryWideImageAssetId then p1.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var9)) or (if var5 then var5.primaryWideAssetId else nil), p1.entry.placeId, true) else var11
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var13 = if var9 then var9.title elseif var5 then var5.name else ""
	
	if not isVRAppBuild() and p1.useHoverTile then
		var2 = p1.impressionsTag ~= nil
	end
	local var14 = reactModule.useRef(nil)
	local var15 = `{p1.impressionsTag or ""}_{p1.index}_{gameTileLayoutType}`
	var15 = useIsHoveredTileModule(var14, var15, var2)
	local var16 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var16 = if p1.videoPlaybackContext and p1.videoPlaybackContext.videoPlaybackCoordinator then p1.videoPlaybackContext.videoPlaybackCoordinator else videoPlaybackCoordinator.default
	end
	local creatorName
	local var17 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), hoverTileCoordinatorModule (copy), fFlagLuaAppEmphasisGameTileVideo (copy), var16 (write), videoEndReason (copy), universeId (ref), p1 (ref), gameCollectionItemTypes (copy), sponsoredGamesRecordClick (copy), var7 (ref)
		if var15 then
			hoverTileCoordinatorModule.default:reset()
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var16:reset(videoEndReason.TileClicked, nil, universeId, nil)
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
			sponsoredGamesRecordClick(var7, p1.entry.adId)
		end
	end, {
		universeId, p1.source, p1.onPeekViewClosed, p1.entry.isSponsored,
		p1.entry.adId,
		if fFlagLuaAppEmphasisGameTileVideo then p1.entry.tileType else nil,
		p1.reportGameDetailOpened, var7, p1.navigateToGameDetails, p1.referralSource,
		p1.index, var15, if fFlagLuaAppEmphasisGameTileVideo then var16 else nil
	})
	local showDescription = p1.showDescription or false
	local var18 = if var5 then var5.totalUpVotes else 0
	local var19 = if var5 then var5.totalDownVotes else 0
	local hasVerifiedBadge = var6 and (var6.creator and var6.creator.hasVerifiedBadge)
	local var20 = if var6 then var6.description else ""
	local var21 = (if var6 then var6.licenseDescription else nil) or (if var6 then var6.localizedFiatPrice else nil)
	local hideGameStats = p1.hideGameStats or (showDescription or var21 ~= nil)
	
	if var5 and var5.creatorName ~= "" then
		creatorName = var5.creatorName or var6 and (var6.creator and var6.creator.name)
	end
	local var22 = if var21 then 2 else 3
	local var23 = reactModule.useMemo(function()
		-- upvalues: creatorName (ref), showDescription (ref), var22 (ref), hideGameStats (ref), var21 (ref)
		local var24 = 0
		
		if creatorName and creatorName ~= "" then
			var24 += 1
		end
		if showDescription then
			var24 += var22
		end
		if not hideGameStats then
			var24 += 1
		end
		if var21 then
			var24 += 1
		end
		return var24
	end, {
		creatorName,
		showDescription,
		hideGameStats,
		var21,
		var22
	})
	local isContained = p1.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var3, p1.textSizeOffset, 1, var4, true, var23).playButtonHeight
	local var24 = reactModule.useCallback(function(...)
		-- upvalues: var15 (ref), hoverTileCoordinatorModule (copy), p1 (ref), fFlagLuaAppEmphasisGameTileVideo (copy), var16 (write), videoEndReason (copy), universeId (ref)
		if var15 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p1.reportExperienceLaunched then
			p1.reportExperienceLaunched(...)
		end
		if fFlagLuaAppEmphasisGameTileVideo then
			var16:reset(videoEndReason.ExperienceLaunched, nil, universeId, nil)
		end
	end, {
		var15,
		p1.reportExperienceLaunched,
		if fFlagLuaAppEmphasisGameTileVideo then universeId else nil,
		if fFlagLuaAppEmphasisGameTileVideo then var16 else nil
	})
	local var25 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p1 (ref), var24 (ref), var17 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p1.referralSource,
			reportExperienceLaunched = var24,
			openGameDetails = var17,
			entry = p1.entry,
			launchExperienceEventContext = p1.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p1.index
		})
	end, {
		universeId, p1.referralSource, var24, var17, p1.entry,
		p1.launchExperienceEventContext, playButtonHeight, p1.index, imageAspectRatio
	})
	local var26 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var21 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), creatorName (ref), hasVerifiedBadge (ref), gameStatsModule (copy), var18 (ref), var19 (ref), p1 (ref), gameTileConstantsModule (copy), var10 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var20 (ref), var22 (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var21 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var21
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
					totalUpVotes = var18,
					totalDownVotes = var19,
					playerCount = if p1.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p1.entry.playerCount else nil
				},
				isGridTile = var10,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var20,
				linesOfText = var22,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		creatorName, var18, var19, p1.playerCountStyle, p1.entry.playerCount, var10,
		hideGameStats, gameTileLayoutType, showDescription, var20, var21,
		hasVerifiedBadge, var22
	})
	local var27, var28 = reactModule.useState(Vector2.new(0, 0))
	local var29 = reactModule.useMemo(function()
		-- upvalues: gameTileViewConfigModule (copy), var3 (ref), var27 (ref), gameTileLayoutType (ref), isContained (ref), p1 (ref), var23 (ref), var4 (ref)
		return var27.Y - gameTileViewConfigModule.getTileHeight(var3, var27.X, gameTileLayoutType, isContained, false, false, p1.textSizeOffset, nil, 1, var23, var4, true)
	end, {
		var3, var27, gameTileLayoutType, isContained, p1.textSizeOffset, 1, var23,
		var4
	})
	local var30 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var30 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var30, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var30 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var30, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var31 = nil
	local _ = nil
	local var32 = nil
	local var33 = nil
	local var34 = nil
	local _ = nil
	local var35 = nil
	local var36 = nil
	local var37 = nil
	local var38 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var37 = p1.videoPlaybackContext ~= nil and p1.videoPlaybackContext.disablePlayback == true
		local var39, var40 = reactModule.useState(false)
		var31 = var39
		local var41 = var40
		var32 = reactModule.useCallback(function(p2)
			-- upvalues: var41 (write)
			var41(p2)
		end, {})
		var33 = if p1.entry.primaryWideVideoAssetId then p1.entry.primaryWideVideoAssetId else var9 and (var9.primaryMediaAsset and var9.primaryMediaAsset.wideVideoAssetId)
		
		if fFlagLuaAppGameTileSelectionVideoPlayback then
			local var42, var43 = reactModule.useState(false)
			var34 = var42
			local var44 = var43
			var35 = reactModule.useCallback(function(...)
				-- upvalues: var44 (write), p1 (ref)
				var44(true)
				
				if p1.onSelectionGained then
					p1.onSelectionGained(...)
				end
			end, { p1.onSelectionGained })
			var36 = reactModule.useCallback(function(...)
				-- upvalues: var44 (write), p1 (ref)
				var44(false)
				
				if p1.onSelectionLost then
					p1.onSelectionLost(...)
				end
			end, { p1.onSelectionLost })
		end
		if not fFlagLuaAppGameTileSelectionVideoPlayback then
			var38 = if fFlagLuaAppEdpMediaGalleryVideoPreview then usePreferredInput() else nil
		end
		reactModule.useEffect(function()
			-- upvalues: var37 (write), var41 (write)
			if var37 then
				var41(false)
			end
		end, { var37 })
	end
	local var45 = fFlagLuaAppEmphasisGameTileVideo and var33 ~= nil
	useTagAsViewportAutoplayCandidate(if fFlagLuaAppEmphasisGameTileVideo then var14 else var30, p1.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then if fFlagLuaAppEmphasisGameTileVideo then var45 else false else nil)
	local var46 = nil
	local var47 = nil
	
	if fFlagLuaAppEmphasisGameTileVideo then
		var46 = if var45 then reactModule.createElement(gameTileVideoThumbnailModule, {
			looped = true,
			ZIndex = -2,
			video = `rbxassetid://{var33}`,
			image = var12,
			playing = var31,
			Size = UDim2.fromScale(1, 1),
			isTileContained = isContained,
			cornerRadius = var4.Radius.Medium,
			itemIndex = p1.index,
			videoAnalytics = p1.videoAnalytics,
			universeId = universeId,
			videoPlaybackCoordinator = var16
		}) else nil
		
		if var45 and not var37 then
			local var48
			local createElement = reactModule.createElement
			local var49 = gameVideoPlaybackDetectorModule
			local t = {
				videoKey = var15,
				itemIndex = p1.index,
				universeId = tostring(universeId),
				tileRef = var14,
				isHoverSupported = var2,
				isHovered = var15,
				isSelected = if fFlagLuaAppGameTileSelectionVideoPlayback then var34 else nil
			}
			
			if fFlagLuaAppGameTileSelectionVideoPlayback then
				var48 = nil
			elseif fFlagLuaAppEdpMediaGalleryVideoPreview then
				var48 = var38 == responsiveModule.Input.Touch
				var48 = nil
			else
				var48 = nil
			end
			t.autoplay = var48
			t.onPlaybackChange = var32
			t.videoAnalytics = p1.videoAnalytics
			t.videoDwellTimeInSec = fIntLuaAppGameTileVideoDwellTimeInSec
			t.videoVisiblePercent = fIntLuaAppGameTileVideoVisiblePercent
			t.pageContext = p1.appPage
			t.videoPlaybackContext = p1.videoPlaybackContext
			var47 = createElement(var49, t)
		else
			var47 = nil
		end
	end
	local var50 = nil
	local var51 = getTileBadgeByPositionConfigFromEntryModule(p1.entry)
	
	if var51 then
		var50 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var51 })
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
			ref = var30,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var28 (ref)
				var28(p2.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var14,
				SelectionOrder = p1.SelectionOrder,
				isDisabled = p1.isDisabled,
				onActivated = var17,
				onSelectionGained = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var35 else p1.onSelectionGained,
				onSelectionLost = if fFlagLuaAppEmphasisGameTileVideo and fFlagLuaAppGameTileSelectionVideoPlayback then var36 else p1.onSelectionLost,
				image = var12,
				thumbnailComponent = if fFlagLuaAppEmphasisGameTileVideo then var46 else nil,
				title = var13,
				numLinesForMetadata = var23,
				isHovered = var15,
				footerMetadata = var26,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var25,
				extraFooterSpace = if showDescription then nil else var29,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var50,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p1.onTileImageLoaded else nil
			}),
			VideoPlaybackDetector = if fFlagLuaAppEmphasisGameTileVideo then var47 else nil
		})
	})
end