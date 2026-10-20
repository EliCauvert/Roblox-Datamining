local Parent = script:FindFirstAncestor("SongDetails").Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local GameCollectionsModule = require(Parent.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local FrameBoundsImpressionsTracker = require(Parent.Impressions).FrameBoundsImpressionsTracker
local SendItemImpressions = require(Parent.UnifiedLogging).SendItemImpressions
local SendItemActionEvent = require(Parent.UnifiedLogging).SendItemActionEvent
local ContentType = require(Parent.UnifiedLogging).ContentType
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local SongTile = require(Parent.SongTile).SongTile
local FFlagSongEdpCarouselIxp = require(Parent.SharedFlags).FFlagSongEdpCarouselIxp
local FFlagSongCarouselPropUpdate = require(Parent.SharedFlags).FFlagSongCarouselPropUpdate
local FFlagUpdateSongCarouselClipDefault = require(Parent.SharedFlags).FFlagUpdateSongCarouselClipDefault
local GameTileConstants = require(Parent.GameTile).GameTileConstants

return ReactModule.memo(function(p1)
	-- upvalues: UseTextSizeOffsetFunction (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseGetGameTileHeightFunction (copy), GameTileConstants (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), ReactModule (copy), UseGameCollectionLayoutParamsFunction (copy), FFlagSongEdpCarouselIxp (copy), SendItemActionEvent (copy), FFlagSongCarouselPropUpdate (copy), ContentType (copy), SongTile (copy), UseCollectionImpressionsSignalFunction (copy), SendItemImpressions (copy), FFlagUpdateSongCarouselClipDefault (copy), CollectionCarousel (copy), FrameBoundsImpressionsTracker (copy)
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Pointer
	local Narrow = UseGetGameTileHeightFunction(IsUsePreferredInputResultMatch, "Narrow", IsUsePreferredInputResultMatch, false, false, UseTextSizeOffsetResult, nil, GameTileConstants.TileTextLines.Narrow.titleTextLines)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Narrow1 = UseGameCollectionLayoutParamsFunction("Narrow", UseStateResult, false, {
		numColumns = p1.numColumns,
		sideMargin = if FFlagSongEdpCarouselIxp then 0 else nil,
		columnGap = if FFlagSongEdpCarouselIxp then p1.columnGap else nil,
		fractionalItemAmount = p1.fractionalItemAmount
	})
	local UseResult = ReactModule.useCallback(function(Id, p2)
		-- upvalues: SendItemActionEvent (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), p1 (copy), FFlagSongCarouselPropUpdate (upval), ContentType (upval)
		SendItemActionEvent.sendFromItemCollection(UseRoactServiceResult, UseRoactServiceResult1, { id = Id }, 1, p2, p1.pageContext, if FFlagSongCarouselPropUpdate then p1.collectionOrder else p1.layoutOrder, p1.referralId, #p1.songIds, ContentType.Song, "OpenSongDetails")
	end, {
		UseRoactServiceResult, UseRoactServiceResult1,
		if FFlagSongCarouselPropUpdate then p1.collectionOrder else p1.layoutOrder,
		p1.title, p1.songIds, p1.pageContext, p1.referralId
	})
	local UseResult1 = ReactModule.useCallback(function(ContentId, LayoutOrder, Size, _)
		-- upvalues: ReactModule (upval), SongTile (upval), IsUsePreferredInputResultMatch (copy), p1 (copy), UseResult (copy)
		return ReactModule.createElement(SongTile, {
			contentId = ContentId,
			hasBackground = IsUsePreferredInputResultMatch,
			impressionsTag = p1.impressionsTag,
			layoutOrder = LayoutOrder,
			size = Size,
			zIndex = -LayoutOrder,
			useLargerFooterFont = IsUsePreferredInputResultMatch,
			reportTileOpened = function()
				-- upvalues: UseResult (upval), ContentId (copy), LayoutOrder (copy)
				UseResult(ContentId, LayoutOrder)
			end
		}), "SongTile"
	end, {
		IsUsePreferredInputResultMatch,
		p1.impressionsTag,
		UseResult
	})
	local UseRefResult = ReactModule.useRef(nil)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction()
	local UseRefResult1 = ReactModule.useRef(os.clock())
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = os.clock()
	end, { p1.songIds })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = not FFlagSongEdpCarouselIxp and not FFlagUpdateSongCarouselClipDefault or (p1.clipsDescendants or false),
		Size = UDim2.fromScale(1, 1),
		ref = UseStateResult2
	}, {
		Carousel = ReactModule.createElement(CollectionCarousel, {
			columnGap = Narrow1.columnGap,
			fractionalItemAmount = Narrow1.fractionalItemAmount,
			getItemHeight = Narrow,
			items = p1.songIds,
			maxItemsToShow = Narrow1.maxTilesToShow,
			numColumns = Narrow1.numColumns,
			onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
			onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
			renderItem = UseResult1,
			scrollingFrameRef = UseRefResult,
			title = p1.title
		}),
		SongTileImpressionsTracker = ReactModule.createElement(FrameBoundsImpressionsTracker, {
			parentRef = UseRefResult,
			pageContext = p1.pageContext,
			impressionsTag = p1.impressionsTag,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = ReactModule.useCallback(function(p2)
				-- upvalues: p1 (copy), SendItemImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), FFlagSongCarouselPropUpdate (upval), ContentType (upval)
				if not p1.songIds then return end
				local List = {}
				
				for _, songId in ipairs(p1.songIds) do
					table.insert(List, { id = songId })
				end
				SendItemImpressions.sendFromItemCollection(UseRoactServiceResult, UseRoactServiceResult1, p2, List, #List, p1.pageContext, if FFlagSongCarouselPropUpdate then p1.collectionOrder else p1.layoutOrder, ContentType.Song, #List, nil, p1.referralId)
			end, {
				UseRoactServiceResult, UseRoactServiceResult1, p1.songIds, p1.title,
				if FFlagSongCarouselPropUpdate then p1.collectionOrder else p1.layoutOrder,
				p1.pageContext
			}),
			dataUpdatedTimestamp = UseRefResult1.current
		})
	})
end)