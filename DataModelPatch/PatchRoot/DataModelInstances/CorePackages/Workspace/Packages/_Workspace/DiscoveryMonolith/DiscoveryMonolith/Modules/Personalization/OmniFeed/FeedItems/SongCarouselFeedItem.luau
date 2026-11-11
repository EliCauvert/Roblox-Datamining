local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SongTile = require(Parent.SongTile).SongTile
local TModule = require(Parent.t)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local UseCollectionImpressionsSignalFunction = CollectionViewsModule.useCollectionImpressionsSignal
local ValidatePropsFunction = require(Parent.DiscoveryUtils).validateProps
local MutedErrorFunction = require(Parent.Loggers).mutedError
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus
local OmniFeedPropsModule = require(DiscoveryMonolith.Modules.Personalization.OmniFeed.OmniFeedProps)
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local TopicInfosRoduxModule = require(Parent.TopicInfosRodux)
local TopicInfosReducer = TopicInfosRoduxModule.TopicInfosReducer
local TopicInfoModel = TopicInfosRoduxModule.TopicInfoModel
local TopicContentsReducer = require(Parent.TopicContentsRodux).TopicContentsReducer
local FetchStatusRoduxModule = require(Parent.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local GameCollectionsModule = require(Parent.GameCollections)
local UseGameCollectionLayoutParamsFunction = GameCollectionsModule.useGameCollectionLayoutParams
local UseGameSortTooltipParamsFunction = GameCollectionsModule.useGameSortTooltipParams
local UseGetGameTileHeightFunction = GameCollectionsModule.useGetGameTileHeight
local ImpressionsModule = require(Parent.Impressions)
local ScreenSizeImpressionsTracker = ImpressionsModule.ScreenSizeImpressionsTracker
local FrameBoundsImpressionsTracker = ImpressionsModule.FrameBoundsImpressionsTracker
local UnifiedLoggingModule = require(Parent.UnifiedLogging)
local SendItemImpressions = UnifiedLoggingModule.SendItemImpressions
local SendItemActionEvent = UnifiedLoggingModule.SendItemActionEvent
local ContentType = UnifiedLoggingModule.ContentType
local UseTextSizeOffsetFunction = require(Parent.UIBlox).Core.Style.useTextSizeOffset
local OpenSongListFunction = require(Parent.DiscoveryRouting).OpenSongList
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppUseFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseFrameBoundsImpressions
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local StrictInterfaceResult = TModule.strictInterface({
	[OmniFeedPropsModule.key] = OmniFeedPropsModule.interface,
	sortIndex = TModule.number,
	isOmni = TModule.optional(TModule.boolean),
	topicLayoutData = TModule.optional(TModule.table)
})

return function(p1)
	-- upvalues: ValidatePropsFunction (copy), StrictInterfaceResult (copy), OmniFeedPropsModule (copy), FFlagLuaAppCompositionAlways (copy), FFlagEnableTopSongsSort (copy), UseSelectorFunction (copy), GameSortGroups (copy), TopicInfosReducer (copy), TopicContentsReducer (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), RoactAnalytics (copy), RoactAnalyticsCommonGameEvents (copy), ReactModule (copy), SendItemActionEvent (copy), ContentType (copy), SongTile (copy), UsePageSideMarginFunction (copy), UseTextSizeOffsetFunction (copy), UseGetGameTileHeightFunction (copy), GameTileConstants (copy), UseGameCollectionLayoutParamsFunction (copy), UseDispatchFunction (copy), OpenSongListFunction (copy), UseGameSortTooltipParamsFunction (copy), TopicInfoModel (copy), UseCollectionImpressionsSignalFunction (copy), SendItemImpressions (copy), AppPage (copy), MutedErrorFunction (copy), CollectionCarousel (copy), CollectionItemSize (copy), FFlagLuaAppUseFrameBoundsImpressions (copy), FrameBoundsImpressionsTracker (copy), ScreenSizeImpressionsTracker (copy)
	ValidatePropsFunction(StrictInterfaceResult, p1)
	local v1 = p1[OmniFeedPropsModule.key]
	local AppPage1 = v1.appPage
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else v1.appCompositionEnabled
	assert(FFlagEnableTopSongsSort, "SongCarouselFeedItem should only be used when FFlagEnableTopSongsSort is enabled")
	local Sort = UseSelectorFunction(function(p2)
		-- upvalues: GameSortGroups (upval)
		return p2.GameSortGroups[GameSortGroups.Games]
	end).sorts[p1.sortIndex]
	local TOPSONGSName: string = `TOPSONGS_CAROUSEL_${Sort}`
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: TopicInfosReducer (upval), Sort (copy)
		return p2.Personalization[TopicInfosReducer.key][Sort]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval), Sort (copy)
		return p2.Personalization[TopicContentsReducer.key][Sort]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: FetchStatusReducer (upval), FetchStatusNamespace (upval), Sort (copy), RetrievalStatus (upval)
		return p2.Personalization[FetchStatusReducer.key][FetchStatusNamespace.GameSorts][Sort] or RetrievalStatus.NotStarted
	end)
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: Sort (copy), TopicContentsReducer (upval)
		return if Sort then p2.Personalization and (p2.Personalization[TopicContentsReducer.key] and (p2.Personalization[TopicContentsReducer.key][Sort] and p2.Personalization[TopicContentsReducer.key][Sort].updatedTimestamp)) else nil
	end)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local Entries = UseSelectorResult1 and UseSelectorResult1.entries or nil
	local UseResult = ReactModule.useCallback(function(Id, p2)
		-- upvalues: Entries (copy), SendItemActionEvent (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), AppPage1 (copy), p1 (copy), Sort (copy), ContentType (upval)
		if Entries then
			SendItemActionEvent.sendFromItemCollection(UseRoactServiceResult, UseRoactServiceResult1, { id = Id }, 1, p2, AppPage1, p1.sortIndex, Sort, #Entries, ContentType.Song, "OpenSongDetails")
			
			return
		end
	end, {
		UseRoactServiceResult, UseRoactServiceResult1, Sort, Entries, p1.sortIndex,
		AppPage1
	})
	local UseResult1 = ReactModule.useCallback(function(p2, LayoutOrder, Size, _)
		-- upvalues: ReactModule (upval), SongTile (upval), TOPSONGSName (copy), UseResult (copy)
		return ReactModule.createElement(SongTile, {
			contentId = p2.contentId,
			zIndex = -LayoutOrder,
			size = Size,
			layoutOrder = LayoutOrder,
			impressionsTag = TOPSONGSName,
			reportTileOpened = function()
				-- upvalues: UseResult (upval), p2 (copy), LayoutOrder (copy)
				UseResult(p2.contentId, LayoutOrder)
			end
		}), "SongTile"
	end, { UseResult, TOPSONGSName })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local Narrow = UseGetGameTileHeightFunction(false, "Narrow", false, false, false, UseTextSizeOffsetFunction(), nil, GameTileConstants.TileTextLines.Narrow.titleTextLines)
	local Narrow1 = UseGameCollectionLayoutParamsFunction("Narrow", UseStateResult, false, {
		sideMargin = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(UseStateResult)
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), OpenSongListFunction (upval), Sort (copy), AppPage1 (copy), UseRoactServiceResult2 (copy), p1 (copy)
		UseDispatchResult(OpenSongListFunction(Sort, AppPage1))
		UseRoactServiceResult2.reportSeeAllWithId(Sort, nil, p1.sortIndex)
	end, {
		UseDispatchResult,
		Sort,
		AppPage1,
		UseRoactServiceResult2,
		p1.sortIndex
	})
	local UseGameSortTooltipParamsResult, UseGameSortTooltipParamsResult2 = UseGameSortTooltipParamsFunction(UseSelectorResult or TopicInfoModel.new(), false, UseSelectorResult and UseSelectorResult.topicLayoutData and UseSelectorResult.topicLayoutData.infoText or nil)
	local IsNotUseGameSortTooltipParamsResultMatch: boolean = UseGameSortTooltipParamsResult2 and UseGameSortTooltipParamsResult2 ~= ""
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1[OmniFeedPropsModule.key].scrollViewPositionChangedSignal)
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: Entries (copy), SendItemImpressions (upval), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), AppPage1 (copy), p1 (copy), ContentType (upval), Sort (copy)
		if Entries ~= nil then
			local List = {}
			
			for _, entry in ipairs(Entries) do
				table.insert(List, { id = entry.contentId })
			end
			SendItemImpressions.sendFromItemCollection(UseRoactServiceResult, UseRoactServiceResult1, p2, List, #List, AppPage1, p1.sortIndex, ContentType.Song, #List, nil, Sort)
		end
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		Entries,
		Sort,
		p1.sortIndex
	})
	
	if AppPage1 == AppPage.Games then
		return if UseSelectorResult and UseSelectorResult2 == RetrievalStatus.Done and Entries and #Entries ~= 0 then ReactModule.createElement(ReactModule.Fragment, nil, {
			SongCarousel = ReactModule.createElement(CollectionCarousel, {
				collectionItemSize = if AppCompositionEnabled then CollectionItemSize.Small else nil,
				columnGap = if AppCompositionEnabled then nil else Narrow1.columnGap,
				containerRef = UseStateResult2,
				fractionalItemAmount = if AppCompositionEnabled then nil else Narrow1.fractionalItemAmount,
				onViewableItemsChanged = UseCollectionImpressionsSignalResult2,
				onChangeCanvasPosition = UseCollectionImpressionsSignalResult2,
				getItemHeight = Narrow,
				items = Entries,
				maxItemsToShow = Narrow1.maxTilesToShow,
				numColumns = if AppCompositionEnabled then nil else Narrow1.numColumns,
				onActivateHeader = UseResult2,
				onActivateInfoIcon = IsNotUseGameSortTooltipParamsResultMatch and UseGameSortTooltipParamsResult or nil,
				renderItem = UseResult1,
				scrollingFrameRef = UseRefResult,
				sideMargin = if AppCompositionEnabled then nil else Narrow1.sideMargin,
				subtitle = UseSelectorResult.subtitle,
				thresholdFromEnd = Narrow1.loadMoreThreshold,
				title = UseSelectorResult.displayName,
				tooltipInfoText = IsNotUseGameSortTooltipParamsResultMatch and UseGameSortTooltipParamsResult2 or nil
			}),
			SongCarouselImpressionDetector = ReactModule.createElement(if FFlagLuaAppUseFrameBoundsImpressions then FrameBoundsImpressionsTracker else ScreenSizeImpressionsTracker, {
				parentRef = UseRefResult,
				pageContext = AppPage1,
				impressionsTag = TOPSONGSName,
				scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
				sendImpressions = UseResult3,
				dataUpdatedTimestamp = UseSelectorResult3
			})
		}) else nil
	else
		MutedErrorFunction("SongCarouselFeedItem should only be used on AppPage.Games")
		
		return nil
	end
end