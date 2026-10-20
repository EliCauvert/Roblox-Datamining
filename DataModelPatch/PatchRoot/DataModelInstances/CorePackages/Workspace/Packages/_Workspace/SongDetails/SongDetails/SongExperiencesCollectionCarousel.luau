local Parent = script:FindFirstAncestor("SongDetails").Parent
local ReactModule = require(Parent.React)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local CryoModule = require(Parent.Cryo)
local GameCollectionsModule = require(Parent.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local UseRenderGameCollectionItemFunction = GameCollectionsModule.useRenderGameCollectionItem
local FrameBoundsImpressionsTracker = require(Parent.Impressions).FrameBoundsImpressionsTracker
local FlaggedMutedErrorFunction = require(Parent.Loggers).flaggedMutedError
local SendItemImpressions = require(Parent.UnifiedLogging).SendItemImpressions
local ContentType = require(Parent.UnifiedLogging).ContentType
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseGameCollectionLayoutParamsFunction (copy), UseTextSizeOffsetFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), RoactAnalyticsCommonGameEvents (copy), FlaggedMutedErrorFunction (copy), CryoModule (copy), SendItemImpressions (copy), ContentType (copy), UsePreferredInputFunction (copy), ResponsiveModule (copy), UseGetGameTileHeightFunction (copy), GameTileConstants (copy), UseCollectionImpressionsSignalFunction (copy), UseRenderGameCollectionItemFunction (copy), DiscoveryAnalyticsModule (copy), CollectionCarousel (copy), FrameBoundsImpressionsTracker (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local Narrow = UseGameCollectionLayoutParamsFunction("Narrow", UseStateResult, false, {
		fractionalItemAmount = p1.fractionalItemAmount,
		numColumns = p1.numColumns,
		sideMargin = p1.sideMargin
	})
	local UseTextSizeOffsetResult = UseTextSizeOffsetFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseRoactServiceResult (copy), FlaggedMutedErrorFunction (upval), UseRoactServiceResult2 (copy)
		local Items = p1.items
		
		if Items == nil or UseRoactServiceResult == nil or p2 == nil then return end
		local Item = Items[p2]
		
		if Item then
			UseRoactServiceResult2.reportOpenGameDetailFromSongDetail(Item.placeId, p2, #Items, Item.isSponsored, Item.adId, Item.universeId, p1.pageContext, p1.songId)
			
			return
		else
			FlaggedMutedErrorFunction("SongExperiencesCollectionCarouselMissingEntry", "Entry not found for index: " .. tostring(p2))
		end
	end, {
		p1.items, UseRoactServiceResult, UseRoactServiceResult1,
		UseRoactServiceResult2, p1.songId, p1.pageContext
	})
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), CryoModule (upval), SendItemImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), ContentType (upval)
		if p1.items ~= nil then
			local List = {}
			
			for _, item in ipairs(p1.items) do
				table.insert(List, (CryoModule.Dictionary.union(item, { id = item.universeId })))
			end
			SendItemImpressions.sendFromItemCollection(UseRoactServiceResult, UseRoactServiceResult1, p2, List, #List, p1.pageContext, p1.layoutOrder, ContentType.Game, #List, nil, p1.songId)
		end
	end, {
		UseRoactServiceResult, UseRoactServiceResult1, p1.items, p1.songId,
		p1.layoutOrder, p1.pageContext
	})
	local IsUsePreferredInputResultMatch = UsePreferredInputFunction() == ResponsiveModule.Input.Pointer
	local Narrow1 = UseGetGameTileHeightFunction(IsUsePreferredInputResultMatch, "Narrow", IsUsePreferredInputResultMatch, false, false, 0, 0, GameTileConstants.TileTextLines.Narrow.titleTextLines)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction()
	local UseRefResult1 = ReactModule.useRef(os.clock())
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = os.clock()
	end, { p1.items })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ref = UseStateResult2
	}, {
		GameCarousel = ReactModule.createElement(CollectionCarousel, {
			columnGap = Narrow.columnGap,
			fractionalItemAmount = Narrow.fractionalItemAmount,
			getItemHeight = Narrow1,
			items = p1.items,
			maxItemsToShow = Narrow.maxTilesToShow,
			numColumns = Narrow.numColumns,
			onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
			onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
			renderItem = UseRenderGameCollectionItemFunction(nil, false, "Narrow", true, false, p1.impressionsTag, false, UseResult, function()
				error("Need to implement")
			end, DiscoveryAnalyticsModule.Constants.Context.ExperienceTile, nil, nil, nil, nil, nil, false, nil, nil, false, false, nil, nil, nil, UseTextSizeOffsetResult, GameTileConstants.TileTextLines.Narrow.titleTextLines, nil, nil, nil, nil),
			scrollingFrameRef = UseRefResult,
			sideMargin = Narrow.sideMargin,
			title = p1.title
		}),
		SongTileImpressionsTracker = ReactModule.createElement(FrameBoundsImpressionsTracker, {
			parentRef = UseRefResult,
			pageContext = p1.pageContext,
			impressionsTag = p1.impressionsTag,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = UseResult1,
			dataUpdatedTimestamp = UseRefResult1.current
		})
	})
end)