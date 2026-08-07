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
local var20 = if fFlagLuaAppHomeThumbnailPrefetch then require(gameTile.resolveGameTileThumbnailUri) else nil

return function(p0) --[[ line: 91 ]]
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), bigGameIconReducer (ref), fFlagLuaAppHomeThumbnailPrefetch (ref), var20 (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), gameTileViewConfigModule (ref), luaAppFixEmphasisHoverLogic (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), hoverTileCoordinatorModule (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var21 = useDesignTokens()
	local var22 = useTokens()
	local universeId = p0.entry.universeId
	local var23 = useSelector(function(p1) --[[ line: 99 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p1.Personalization[gameInfosReducer.key][universeId]
	end)
	local var24 = useSelector(function(p2) --[[ line: 102 ]]
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var25 = useRoactService(roactNetworking)
	local var26 = useDispatch()
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: var24 (ref), var26 (ref), apiFetchGameDetails (copy), var25 (ref), universeId (ref)
		if var24 then
			return
		end
		var26(apiFetchGameDetails.Fetch(var25, { universeId }))
	end, { var24, universeId, var25, var26 })
	local var27 = getGameTileLayoutDataModule(var23, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var29 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var30 = useSelector(function(p3) --[[ line: 122 ]]
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p3[bigGameIconReducer.key][universeId] then p3[bigGameIconReducer.key][universeId].url else ""
	end)
	local _ = nil
	local var31 = if fFlagLuaAppHomeThumbnailPrefetch then var20({
		isEmphasized = true,
		iconUrl = var30,
		universeId = universeId,
		placeId = p0.entry.placeId,
		useGridTile = var29,
		perEntryWideAssetId = p0.entry.primaryWideImageAssetId,
		game = var23,
		topicId = p0.topicId
	}) elseif var29 then formatExperienceThumbnailModule((if p0.entry.primaryWideImageAssetId then p0.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var27)) or (if var23 then var23.primaryWideAssetId else nil), p0.entry.placeId, true) else var30
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var33 = if var27 then var27.title elseif var23 then var23.name else ""
	local _ = nil
	local var34 = nil
	local _ = nil
	local var35 = nil
	
	if luaAppFixEmphasisHoverLogic then
		local var36
		if not isVRAppBuild() and p0.useHoverTile then
			var36 = p0.impressionsTag ~= nil
		end
		var34 = reactModule.useRef(nil)
		var35 = useIsHoveredTileModule(var34, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var36)
	end
	local var37 = reactModule.useCallback(function() --[[ line: 165 ]]
		-- upvalues: luaAppFixEmphasisHoverLogic (copy), var35 (write), hoverTileCoordinatorModule (copy), p0 (ref), gameCollectionItemTypes (copy), universeId (ref), sponsoredGamesRecordClick (copy), var25 (ref)
		if luaAppFixEmphasisHoverLogic and var35 then
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
			sponsoredGamesRecordClick(var25, p0.entry.adId)
		end
	end, {
		universeId, p0.source, p0.onPeekViewClosed, p0.entry.isSponsored,
		p0.entry.adId, p0.reportGameDetailOpened, var25, p0.navigateToGameDetails,
		p0.referralSource, p0.index, if luaAppFixEmphasisHoverLogic then var35 else nil
	})
	
	if not luaAppFixEmphasisHoverLogic then
		local var38
		if not isVRAppBuild() and p0.useHoverTile then
			var38 = p0.impressionsTag ~= nil
		end
		var34 = reactModule.useRef(nil)
		var35 = useIsHoveredTileModule(var34, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var38)
	end
	local creatorName
	local showDescription = p0.showDescription or false
	local var40 = if var23 then var23.totalUpVotes else 0
	local var41 = if var23 then var23.totalDownVotes else 0
	local hasVerifiedBadge = var24 and (var24.creator and var24.creator.hasVerifiedBadge)
	local var43 = if var24 then var24.description else ""
	local var44 = (if var24 then var24.licenseDescription else nil) or (if var24 then var24.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var44 ~= nil)
	
	if var23 and var23.creatorName ~= "" then
		creatorName = var23.creatorName or var24 and (var24.creator and var24.creator.name)
	end
	local var47 = if var44 then 2 else 3
	local var48 = reactModule.useMemo(function() --[[ line: 237 ]]
		-- upvalues: creatorName (ref), showDescription (ref), var47 (ref), hideGameStats (ref), var44 (ref)
		local var59 = 0
		
		if creatorName and creatorName ~= "" then
			var59 += 1
		end
		if showDescription then
			var59 += var47
		end
		if not hideGameStats then
			var59 += 1
		end
		if var44 then
			var59 += 1
		end
		return var59
	end, {
		creatorName,
		showDescription,
		hideGameStats,
		var44,
		var47
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var21, p0.textSizeOffset, 1, var22, true, var48).playButtonHeight
	local var50 = if luaAppFixEmphasisHoverLogic then reactModule.useCallback(function(...) --[[ line: 271 ]]
		-- upvalues: var35 (write), hoverTileCoordinatorModule (copy), p0 (ref)
		if var35 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
	end, { var35, p0.reportExperienceLaunched }) else nil
	local var51 = reactModule.useMemo(function() --[[ line: 283 ]]
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), luaAppFixEmphasisHoverLogic (copy), var50 (ref), var37 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = if luaAppFixEmphasisHoverLogic then var50 else p0.reportExperienceLaunched,
			openGameDetails = var37,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource,
		if luaAppFixEmphasisHoverLogic then var50 else p0.reportExperienceLaunched,
		var37, p0.entry, p0.launchExperienceEventContext, playButtonHeight, p0.index,
		imageAspectRatio
	})
	local var52 = reactModule.useMemo(function() --[[ line: 316 ]]
		-- upvalues: reactModule (copy), var44 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), creatorName (ref), hasVerifiedBadge (ref), gameStatsModule (copy), var40 (ref), var41 (ref), p0 (ref), gameTileConstantsModule (copy), var29 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var43 (ref), var47 (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var44 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var44
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
					totalUpVotes = var40,
					totalDownVotes = var41,
					playerCount = if p0.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p0.entry.playerCount else nil
				},
				isGridTile = var29,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var43,
				linesOfText = var47,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		creatorName, var40, var41, p0.playerCountStyle, p0.entry.playerCount, var29,
		hideGameStats, gameTileLayoutType, showDescription, var43, var44,
		hasVerifiedBadge, var47
	})
	local var53, var54 = reactModule.useState(Vector2.new(0, 0))
	local var55 = reactModule.useMemo(function() --[[ line: 385 ]]
		-- upvalues: gameTileViewConfigModule (copy), var21 (ref), var53 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var48 (ref), var22 (ref)
		return var53.Y - gameTileViewConfigModule.getTileHeight(var21, var53.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var48, var22, true)
	end, {
		var21, var53, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var48,
		var22
	})
	local var56 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 416 ]]
		-- upvalues: impressionsTagUtility (copy), var56 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var56, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 418 ]]
			-- upvalues: impressionsTagUtility (copy), var56 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var56, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	useTagAsViewportAutoplayCandidate(var56, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	local var57 = nil
	local var58 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
	
	if var58 then
		var57 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var58 })
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
			ref = var56,
			[reactModule.Change.AbsoluteSize] = function(p4) --[[ line: 451 ]]
				-- upvalues: var54 (ref)
				var54(p4.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var34,
				SelectionOrder = p0.SelectionOrder,
				isDisabled = p0.isDisabled,
				onActivated = var37,
				onSelectionGained = p0.onSelectionGained,
				onSelectionLost = p0.onSelectionLost,
				image = var31,
				title = var33,
				numLinesForMetadata = var48,
				isHovered = var35,
				footerMetadata = var52,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var51,
				extraFooterSpace = if showDescription then nil else var55,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = var57,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			})
		})
	})
end