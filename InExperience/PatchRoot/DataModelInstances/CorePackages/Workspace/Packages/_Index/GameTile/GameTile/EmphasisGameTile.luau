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
local fFlagLuaAppGameTileLockedBadge = require(parent.SharedFlags).FFlagLuaAppGameTileLockedBadge
local luaAppFixEmphasisHoverLogic = game:DefineFastFlag("LuaAppFixEmphasisHoverLogic", false)
local fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone = require(parent.SharedFlags).FFlagLuaAppHomeFirstTileThumbnailLoadedMilestone
local fFlagLuaAppHomeTouchAutoplay = require(parent.SharedFlags).FFlagLuaAppHomeTouchAutoplay
local fFlagLuaAppTileVideoCandidateOnly = require(parent.SharedFlags).FFlagLuaAppTileVideoCandidateOnly
local fFlagLuaAppFixCustomTileBugs = require(parent.SharedFlags).FFlagLuaAppFixCustomTileBugs

return function(p0) --[[ line: 92 ]]
	-- upvalues: useDesignTokens (ref), useTokens (ref), useSelector (ref), gameInfosReducer (ref), useRoactService (ref), roactNetworking (ref), useDispatch (ref), reactModule (ref), apiFetchGameDetails (ref), getGameTileLayoutDataModule (ref), itemLayoutDataParsingUtilsModule (ref), formatExperienceThumbnailModule (ref), bigGameIconReducer (ref), gameTileViewConfigModule (ref), luaAppFixEmphasisHoverLogic (ref), isVRAppBuild (ref), useIsHoveredTileModule (ref), hoverTileCoordinatorModule (ref), gameCollectionItemTypes (ref), sponsoredGamesRecordClick (ref), appExperienceActionRowModule (ref), gridTileTextFooterModule (ref), creatorNameMetadataModule (ref), gameStatsModule (ref), gameTileConstantsModule (ref), wrapEmphasisTileDescriptionText (ref), impressionsTagUtility (ref), fFlagLuaAppHomeTouchAutoplay (ref), useTagAsViewportAutoplayCandidate (ref), fFlagLuaAppTileVideoCandidateOnly (ref), fFlagLuaAppGameTileLockedBadge (ref), getTileBadgeByPositionConfigFromEntryModule (ref), gameTileThumbnailBadgesModule (ref), gameTileViewModule (ref), fFlagLuaAppFixCustomTileBugs (ref), userGameSettingsService (ref), fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone (ref)
	local var20 = useDesignTokens()
	local var21 = useTokens()
	local universeId = p0.entry.universeId
	local var22 = useSelector(function(p1) --[[ line: 100 ]]
		-- upvalues: gameInfosReducer (copy), universeId (ref)
		return p1.Personalization[gameInfosReducer.key][universeId]
	end)
	local var23 = useSelector(function(p2) --[[ line: 103 ]]
		-- upvalues: universeId (ref)
		return p2.GameDetails[universeId]
	end)
	local var24 = useRoactService(roactNetworking)
	local var25 = useDispatch()
	reactModule.useEffect(function() --[[ line: 109 ]]
		-- upvalues: var23 (ref), var25 (ref), apiFetchGameDetails (copy), var24 (ref), universeId (ref)
		if var23 then
			return
		end
		var25(apiFetchGameDetails.Fetch(var24, { universeId }))
	end, { var23, universeId, var24, var25 })
	local var26 = getGameTileLayoutDataModule(var22, p0.topicId)
	local gameTileLayoutType = p0.gameTileLayoutType or "Narrow"
	local var28 = if gameTileLayoutType ~= "Wide" then gameTileLayoutType == "Event" else true
	local var29 = if var28 then formatExperienceThumbnailModule((if p0.entry.primaryWideImageAssetId then p0.entry.primaryWideImageAssetId else itemLayoutDataParsingUtilsModule.getWideImageAssetId(var26)) or (if var22 then var22.primaryWideAssetId else nil), p0.entry.placeId, true) else useSelector(function(p3) --[[ line: 130 ]]
		-- upvalues: bigGameIconReducer (copy), universeId (ref)
		return if p3[bigGameIconReducer.key][universeId] then p3[bigGameIconReducer.key][universeId].url else ""
	end)
	local imageAspectRatio = gameTileViewConfigModule.getImageAspectRatio(gameTileLayoutType)
	local var31 = if var26 then var26.title elseif var22 then var22.name else ""
	local _ = nil
	local var32 = nil
	local _ = nil
	local var33 = nil
	
	if luaAppFixEmphasisHoverLogic then
		local var34
		if not isVRAppBuild() and p0.useHoverTile then
			var34 = p0.impressionsTag ~= nil
		end
		var32 = reactModule.useRef(nil)
		var33 = useIsHoveredTileModule(var32, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var34)
	end
	local var35 = reactModule.useCallback(function() --[[ line: 153 ]]
		-- upvalues: luaAppFixEmphasisHoverLogic (copy), var33 (write), hoverTileCoordinatorModule (copy), p0 (ref), gameCollectionItemTypes (copy), universeId (ref), sponsoredGamesRecordClick (copy), var24 (ref)
		if luaAppFixEmphasisHoverLogic and var33 then
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
			sponsoredGamesRecordClick(var24, p0.entry.adId)
		end
	end, {
		universeId, p0.source, p0.onPeekViewClosed, p0.entry.isSponsored,
		p0.entry.adId, p0.reportGameDetailOpened, var24, p0.navigateToGameDetails,
		p0.referralSource, p0.index, if luaAppFixEmphasisHoverLogic then var33 else nil
	})
	
	if not luaAppFixEmphasisHoverLogic then
		local var36
		if not isVRAppBuild() and p0.useHoverTile then
			var36 = p0.impressionsTag ~= nil
		end
		var32 = reactModule.useRef(nil)
		var33 = useIsHoveredTileModule(var32, `{p0.impressionsTag or ""}_{p0.index}_{gameTileLayoutType}`, var36)
	end
	local creatorName
	local showDescription = p0.showDescription or false
	local var38 = if var22 then var22.totalUpVotes else 0
	local var39 = if var22 then var22.totalDownVotes else 0
	local hasVerifiedBadge = var23 and (var23.creator and var23.creator.hasVerifiedBadge)
	local var41 = if var23 then var23.description else ""
	local var42 = (if var23 then var23.licenseDescription else nil) or (if var23 then var23.localizedFiatPrice else nil)
	local hideGameStats = p0.hideGameStats or (showDescription or var42 ~= nil)
	
	if var22 and var22.creatorName ~= "" then
		creatorName = var22.creatorName or var23 and (var23.creator and var23.creator.name)
	end
	local var45 = if var42 then 2 else 3
	local var46 = reactModule.useMemo(function() --[[ line: 225 ]]
		-- upvalues: creatorName (ref), showDescription (ref), var45 (ref), hideGameStats (ref), var42 (ref)
		local var57 = 0
		
		if creatorName and creatorName ~= "" then
			var57 += 1
		end
		if showDescription then
			var57 += var45
		end
		if not hideGameStats then
			var57 += 1
		end
		if var42 then
			var57 += 1
		end
		return var57
	end, {
		creatorName,
		showDescription,
		hideGameStats,
		var42,
		var45
	})
	local isContained = p0.isContained or false
	local playButtonHeight = gameTileViewConfigModule.getElementSizes(var20, p0.textSizeOffset, 1, var21, true, var46).playButtonHeight
	local var48 = if luaAppFixEmphasisHoverLogic then reactModule.useCallback(function(...) --[[ line: 259 ]]
		-- upvalues: var33 (write), hoverTileCoordinatorModule (copy), p0 (ref)
		if var33 then
			hoverTileCoordinatorModule.default:reset()
		end
		if p0.reportExperienceLaunched then
			p0.reportExperienceLaunched(...)
		end
	end, { var33, p0.reportExperienceLaunched }) else nil
	local var49 = reactModule.useMemo(function() --[[ line: 271 ]]
		-- upvalues: reactModule (copy), appExperienceActionRowModule (copy), universeId (ref), p0 (ref), luaAppFixEmphasisHoverLogic (copy), var48 (ref), var35 (ref), imageAspectRatio (ref), playButtonHeight (ref)
		return reactModule.createElement(appExperienceActionRowModule, {
			launchSource = "FeaturedSearchTile",
			horizontalPadding = 0,
			verticalPadding = 0,
			isUnifiedGameTileEnabled = true,
			universeId = universeId,
			referralSource = p0.referralSource,
			reportExperienceLaunched = if luaAppFixEmphasisHoverLogic then var48 else p0.reportExperienceLaunched,
			openGameDetails = var35,
			entry = p0.entry,
			launchExperienceEventContext = p0.launchExperienceEventContext,
			showButtonText = imageAspectRatio > 1,
			height = playButtonHeight,
			index = p0.index
		})
	end, {
		universeId, p0.referralSource,
		if luaAppFixEmphasisHoverLogic then var48 else p0.reportExperienceLaunched,
		var35, p0.entry, p0.launchExperienceEventContext, playButtonHeight, p0.index,
		imageAspectRatio
	})
	local var50 = reactModule.useMemo(function() --[[ line: 304 ]]
		-- upvalues: reactModule (copy), var42 (ref), gridTileTextFooterModule (copy), creatorNameMetadataModule (copy), creatorName (ref), hasVerifiedBadge (ref), gameStatsModule (copy), var38 (ref), var39 (ref), p0 (ref), gameTileConstantsModule (copy), var28 (ref), hideGameStats (ref), gameTileLayoutType (ref), showDescription (ref), var41 (ref), var45 (ref), wrapEmphasisTileDescriptionText (copy)
		return reactModule.createElement(reactModule.Fragment, {}, {
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ExtraMetadata = if var42 then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 1,
				useLargerFont = true,
				isUnifiedGameTile = true,
				text = var42
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
					totalUpVotes = var38,
					totalDownVotes = var39,
					playerCount = if p0.playerCountStyle == gameTileConstantsModule.PlayerCountStyleValues.Footer then p0.entry.playerCount else nil
				},
				isGridTile = var28,
				hideGameStats = hideGameStats,
				gameTileLayoutType = gameTileLayoutType
			}),
			Description = if showDescription then reactModule.createElement(gridTileTextFooterModule, {
				LayoutOrder = 4,
				useLargerFont = true,
				isUnifiedGameTile = true,
				ClipsDescendants = true,
				text = var41,
				linesOfText = var45,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = if wrapEmphasisTileDescriptionText then true else nil
			}) else nil
		})
	end, {
		creatorName, var38, var39, p0.playerCountStyle, p0.entry.playerCount, var28,
		hideGameStats, gameTileLayoutType, showDescription, var41, var42,
		hasVerifiedBadge, var45
	})
	local var51, var52 = reactModule.useState(Vector2.new(0, 0))
	local var53 = reactModule.useMemo(function() --[[ line: 373 ]]
		-- upvalues: gameTileViewConfigModule (copy), var20 (ref), var51 (ref), gameTileLayoutType (ref), isContained (ref), p0 (ref), var46 (ref), var21 (ref)
		return var51.Y - gameTileViewConfigModule.getTileHeight(var20, var51.X, gameTileLayoutType, isContained, false, false, p0.textSizeOffset, nil, 1, var46, var21, true)
	end, {
		var20, var51, gameTileLayoutType, isContained, p0.textSizeOffset, 1, var46,
		var21
	})
	local var54 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 404 ]]
		-- upvalues: impressionsTagUtility (copy), var54 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var54, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 406 ]]
			-- upvalues: impressionsTagUtility (copy), var54 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var54, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	
	if fFlagLuaAppHomeTouchAutoplay then
		useTagAsViewportAutoplayCandidate(var54, p0.videoPlaybackContext, if fFlagLuaAppTileVideoCandidateOnly then false else nil)
	end
	local var55 = nil
	
	if fFlagLuaAppGameTileLockedBadge then
		local var56 = getTileBadgeByPositionConfigFromEntryModule(p0.entry)
		
		if var56 then
			var55 = reactModule.createElement(gameTileThumbnailBadgesModule, { tileBadgesByPosition = var56 })
		end
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
			ref = var54,
			[reactModule.Change.AbsoluteSize] = function(p4) --[[ line: 443 ]]
				-- upvalues: var52 (ref)
				var52(p4.AbsoluteSize)
			end
		}, {
			GameTileView = reactModule.createElement(gameTileViewModule, {
				numLinesForTitle = 1,
				isUnifiedGameTile = true,
				hidePlayButton = true,
				forwardRef = var32,
				selectionOrder = if fFlagLuaAppFixCustomTileBugs then nil else p0.selectionOrder,
				SelectionOrder = if fFlagLuaAppFixCustomTileBugs then p0.SelectionOrder else nil,
				isDisabled = p0.isDisabled,
				onActivated = var35,
				onSelectionGained = p0.onSelectionGained,
				onSelectionLost = p0.onSelectionLost,
				image = var29,
				title = var31,
				numLinesForMetadata = var46,
				isHovered = var33,
				footerMetadata = var50,
				imageAspectRatio = imageAspectRatio,
				isContained = isContained,
				extraFooterContent = if showDescription then nil else var49,
				extraFooterSpace = if showDescription then nil else var53,
				reducedMotion = userGameSettingsService.ReducedMotion,
				thumbnailOverlay = if fFlagLuaAppGameTileLockedBadge then var55 else nil,
				onTileImageLoaded = if fFlagLuaAppHomeFirstTileThumbnailLoadedMilestone then p0.onTileImageLoaded else nil
			})
		})
	})
end