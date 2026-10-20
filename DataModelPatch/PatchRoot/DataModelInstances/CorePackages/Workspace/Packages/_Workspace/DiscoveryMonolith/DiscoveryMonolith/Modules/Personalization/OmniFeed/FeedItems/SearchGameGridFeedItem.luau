local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReactModule = require(Parent.React)
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.AppCommonLib)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local GameSortImpressionsDetector = require(Parent.GameCollections).GameSortImpressionsDetector
local SendGameImpressions = require(Parent.GameCollections).SendGameImpressions
local WaitForPropWrapper = require(Parent.GameCollections).WaitForPropWrapper
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SearchTypes = require(Parent.RobloxAppEnums).SearchTypes
local DiscoveryAnalyticsModule = require(Parent.DiscoveryAnalytics)
local GamePlayIntentFunction = DiscoveryAnalyticsModule.Events.gamePlayIntent
local Context = DiscoveryAnalyticsModule.Constants.Context
local GameTileConstants = require(Parent.GameTile).GameTileConstants
local LayoutConfig = require(Parent.RobloxAppEnums).LayoutConfig
local UseResponsiveLayoutFunction = require(Parent.UIBlox).Core.Layout.Responsive.useResponsiveLayout
local SignalsReactModule = require(Parent.SignalsReact)
local OmniFeedConstants = require(Parent.DiscoveryTypes).OmniFeedConstants
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local Modules = DiscoveryMonolith.Modules
local UseGridFlexFeedItemBoundsModule = require(Modules.Personalization.OmniFeed.useGridFlexFeedItemBounds)
local OmniFeedPropsModule = require(Modules.Personalization.OmniFeed.OmniFeedProps)
local GameGridSelectorModule = require(Modules.LuaApp.Components.Games.GameGridSelector)
local GetCurrentPageModule = require(Modules.LuaApp.getCurrentPage)
local GetEntitiesForPartialFeedItemModule = require(Modules.Personalization.OmniFeed.getEntitiesForPartialFeedItem)
local SearchSelectionTypeHeaderModule = require(Modules.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader)
local UseUpdateFeedItemRenderedRowsModule = require(Modules.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows)
local CollectionViewsModule = require(Parent.CollectionViews)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local GameCollectionsModule = require(Parent.GameCollections)
local GameCollectionGrid = GameCollectionsModule.GameCollectionGrid
local GameCollectionItemBuilder = GameCollectionsModule.GameCollectionItemBuilder
local GameCollectionItemTypes = GameCollectionsModule.GameCollectionItemTypes
local PlaceholderGameGrid = GameCollectionsModule.PlaceholderGameGrid
local FIntGameGridFlexFeedItemTileNumPerFeed = require(Parent.SharedFlags).FIntGameGridFlexFeedItemTileNumPerFeed
local FIntLuaAppDelayImpressionsMaxUpdates = require(Parent.SharedFlags).FIntLuaAppDelayImpressionsMaxUpdates
local FFlagLuaAppLayoutParamsInContext = require(Parent.SharedFlags).FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionAlways = require(Parent.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppSearchPlaceholderGrid = require(Parent.SharedFlags).FFlagLuaAppSearchPlaceholderGrid
local FFlagSignalsNavP3hMisc = require(Parent.SharedFlags).FFlagSignalsNavP3hMisc
local GetLegacyNavigationStore = if FFlagSignalsNavP3hMisc then require(Parent.NavigationRodux).GetLegacyNavigationStore else nil
local LuaAppDefaultInitialItemsPerRowForSearch = game:DefineFastFlag("LuaAppDefaultInitialItemsPerRowForSearch", false)
local FFlagLuaAppEnableNxMRoduxApportioning = require(Parent.SharedFlags).FFlagLuaAppEnableNxMRoduxApportioning
local t = {}
local t1 = {}

return function(p1)
	-- upvalues: OmniFeedPropsModule (copy), FFlagLuaAppCompositionAlways (copy), t (copy), OmniFeedConstants (copy), UseTokensFunction (copy), UseAppPolicyFunction (copy), ReactModule (copy), UseRoactServiceFunction (copy), RoactAnalyticsCommonGameEvents (copy), RoactAnalytics (copy), AppEventIngestService (copy), UseSelectorFunction (copy), FFlagSignalsNavP3hMisc (copy), GetLegacyNavigationStore (copy), SignalsReactModule (copy), GetCurrentPageModule (copy), FFlagLuaAppLayoutParamsInContext (copy), CollectionItemSize (copy), UsePageSideMarginFunction (copy), t1 (copy), LayoutConfig (copy), UseResponsiveLayoutFunction (copy), LuaAppDefaultInitialItemsPerRowForSearch (copy), FFlagLuaAppSearchPlaceholderGrid (copy), FIntGameGridFlexFeedItemTileNumPerFeed (copy), FFlagLuaAppEnableNxMRoduxApportioning (copy), UseGridFlexFeedItemBoundsModule (copy), GameCollectionItemTypes (copy), ArgCheckModule (copy), GetEntitiesForPartialFeedItemModule (copy), CryoModule (copy), GameCollectionItemBuilder (copy), AppPage (copy), UseUpdateFeedItemRenderedRowsModule (copy), GamePlayIntentFunction (copy), Context (copy), SendGameImpressions (copy), GameTileConstants (copy), PlaceholderGameGrid (copy), SearchSelectionTypeHeaderModule (copy), SearchTypes (copy), GameCollectionGrid (copy), FIntLuaAppDelayImpressionsMaxUpdates (copy), GameSortImpressionsDetector (copy), GameGridSelectorModule (copy), WaitForPropWrapper (copy)
	local SearchUuid = p1.searchUuid
	local FeedItemPosition = p1[OmniFeedPropsModule.key].feedItemPosition
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedPropsModule.key].appCompositionEnabled
	local TopicLayoutData = p1.topicLayoutData or t
	local TopicLayout = TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ContainedTile]
	local TopicLayout1 = TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.ComponentType]
	local IsTopicLayoutMatch = TopicLayout1 == OmniFeedConstants.ComponentTypeDataKeys.GridTile
	local TopicLayout2 = TopicLayoutData[OmniFeedConstants.TopicLayoutDataKeys.EnableCollectionGrid] or IsTopicLayoutMatch
	local UseTokensResult = UseTokensFunction()
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2.useGridPageLayout()
	end)
	local XXLarge = if IsTopicLayoutMatch and not TopicLayout and UseAppPolicyResult then UseTokensResult.Padding.XXLarge else nil
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: XXLarge (copy)
		return { verticalPadding = XXLarge }
	end, { XXLarge })
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppEventIngestService)
	local UseRefResult = ReactModule.useRef(nil)
	local SearchResultsName = if TopicLayout2 then nil else `SearchResults_{SearchUuid}_{p1.topicId}_{FeedItemPosition}`
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return p2.Search.SearchesInGames[SearchUuid]
	end)
	local Name = nil
	Name = if FFlagSignalsNavP3hMisc then SignalsReactModule.useSignalState(GetLegacyNavigationStore(false).getCurrentPage).name else UseSelectorFunction(function(p2)
		-- upvalues: GetCurrentPageModule (upval)
		return GetCurrentPageModule(p2)
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local Offset = nil
	
	if FFlagLuaAppCompositionAlways then
		Offset = nil
	elseif FFlagLuaAppLayoutParamsInContext then
		local SduiContext = p1[OmniFeedPropsModule.key].sduiContext
		local Small = CollectionItemSize.Small
		Offset = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
			-- upvalues: SduiContext (copy), Small (copy)
			return SduiContext.getPageLayoutConfig(Small)(p2).sideMargin
		end, { Small, SduiContext.getPageLayoutConfig })))
	else
		Offset = UsePageSideMarginFunction(p1[OmniFeedPropsModule.key].verticalScrollingFrameRef.current)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult1)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(if AppCompositionEnabled then UseSelectorResult1 else Vector2.new(UseSelectorResult1.X - 2 * Offset, UseSelectorResult1.Y))
	
	local function v72(Entries)
		-- upvalues: p1 (copy)
		local List = {}
		
		for _, entry in ipairs(Entries) do
			if entry.topicId == p1.topicId then
				table.insert(List, entry)
			end
		end
		return List
	end
	
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult (copy), v72 (copy), t1 (upval)
		return UseSelectorResult and v72(UseSelectorResult.entries) or t1
	end, { UseSelectorResult })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(UseMemoResult1)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_2 (copy), UseMemoResult1 (copy)
		UseStateResult2_2(UseMemoResult1)
	end, { UseMemoResult1 })
	
	local function v76(p2)
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy)
		if p2 then
			local AbsoluteContentSize = p2.AbsoluteContentSize
			
			if UseStateResult1.X == AbsoluteContentSize.X and UseStateResult1.Y == AbsoluteContentSize.Y then return end
			if AbsoluteContentSize.X > 0 and AbsoluteContentSize.Y > 0 then
				UseStateResult2_1(AbsoluteContentSize)
			end
		end
	end
	
	local function v77(Frame)
		-- upvalues: UseStateResult2 (copy)
		if Frame then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end
	
	local Columns = UseResponsiveLayoutFunction("columns", LayoutConfig.Kind.Experiences.WithFooter)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(if LuaAppDefaultInitialItemsPerRowForSearch then Columns or 2 else Columns)
	
	local function OnItemsPerRowChanged(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end
	
	local NumOfRows = if TopicLayoutData.numOfRows and TopicLayoutData.numOfRows >= 0 then TopicLayoutData.numOfRows else 1e999
	local NumOfRows1 = if FFlagLuaAppSearchPlaceholderGrid then if NumOfRows and NumOfRows > 0 and NumOfRows ~= 1e999 then NumOfRows else math.floor(FIntGameGridFlexFeedItemTileNumPerFeed / UseStateResult4) else nil
	local Text: string = `{p1.topicId}_{SearchUuid}`
	local v1 = nil
	local v2 = nil
	local UseMemoResult2 = nil
	
	if not FFlagLuaAppEnableNxMRoduxApportioning then
		v1 = UseGridFlexFeedItemBoundsModule(Text, FeedItemPosition, UseStateResult4, NumOfRows, UseStateResult3)
		v2 = v1 or {}
	end
	local Emphasis = UseSelectorResult and UseSelectorResult.emphasis or false
	
	if FFlagLuaAppEnableNxMRoduxApportioning then
		UseMemoResult2 = ReactModule.useMemo(function()
			-- upvalues: Emphasis (copy), UseStateResult3 (copy), GameCollectionItemTypes (upval)
			if Emphasis and #UseStateResult3 > 0 then
				local Copy = table.clone(UseStateResult3)
				local Copy1 = table.clone(UseStateResult3[1])
				Copy1.componentType = GameCollectionItemTypes.GameCollectionItemType.EmphasisTile
				Copy[1] = Copy1
				
				return Copy
			else
				return UseStateResult3
			end
		end, { UseStateResult3, Emphasis })
		v1 = UseGridFlexFeedItemBoundsModule(Text, FeedItemPosition, UseStateResult4, NumOfRows, UseMemoResult2)
		v2 = v1 or {}
	end
	local Emphasis1 = v2.firstIndex == 1 and Emphasis
	
	if Emphasis1 then
		ArgCheckModule.assert(NumOfRows >= 2, "feed item with emphasis takes at least 2 rows")
	end
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: FFlagLuaAppEnableNxMRoduxApportioning (upval), v2 (ref), UseMemoResult2 (ref), UseStateResult4 (copy), GetEntitiesForPartialFeedItemModule (upval), UseStateResult3 (copy), Emphasis (copy), NumOfRows (copy), TopicLayout2 (copy), Emphasis1 (copy), GameCollectionItemTypes (upval)
		local List = nil
		if FFlagLuaAppEnableNxMRoduxApportioning then
			List = {}
			local Layout = v2.layout
			local FirstIndex = v2.firstIndex or 1
			
			if Layout and UseMemoResult2 then
				local Count = 0
				
				for i = 1, #Layout do
					local LayoutEntry = Layout[i]
					
					if LayoutEntry then
						for i1 = 1, UseStateResult4 do
							local LayoutEntry1: number = LayoutEntry[i1]
							
							if LayoutEntry1 and LayoutEntry1 > 0 then
								local UseMemoResultEntry = UseMemoResult2[LayoutEntry1]
								
								if UseMemoResultEntry then
									local Copy = table.clone(UseMemoResultEntry)
									Copy.uiIndex = FirstIndex + Count
									Copy.topicContentsIndex = LayoutEntry1
									table.insert(List, Copy)
									Count += 1
								end
							end
						end
					end
				end
			end
		else
			List = GetEntitiesForPartialFeedItemModule(UseStateResult3, v2, Emphasis, UseStateResult4, NumOfRows)
		end
		if not TopicLayout2 then
			for i2, value in List do
				value.tileType = if Emphasis1 and i2 == 1 then GameCollectionItemTypes.GameCollectionItemType.EmphasisTile else GameCollectionItemTypes.GameCollectionItemType.GameTile
			end
		end
		return List
	end, {
		if FFlagLuaAppEnableNxMRoduxApportioning then UseMemoResult2 else UseStateResult3,
		v2, if FFlagLuaAppEnableNxMRoduxApportioning then nil else Emphasis,
		if FFlagLuaAppEnableNxMRoduxApportioning then nil else UseStateResult4,
		if FFlagLuaAppEnableNxMRoduxApportioning then nil else NumOfRows, TopicLayout2,
		Emphasis1
	})
	local UseMemoResult31 = ReactModule.useMemo(function()
		-- upvalues: TopicLayout2 (copy), FFlagLuaAppEnableNxMRoduxApportioning (upval), v2 (ref), UseMemoResult2 (ref), UseStateResult4 (copy), CryoModule (upval), GameCollectionItemBuilder (upval), UseAppPolicyResult (copy), AppPage (upval), Emphasis1 (copy), GameCollectionItemTypes (upval), UseMemoResult3 (copy)
		if not TopicLayout2 then
			return nil
		end
		if not FFlagLuaAppEnableNxMRoduxApportioning then
			return GameCollectionItemBuilder.BuildCollectionEntries(UseMemoResult3, UseStateResult4, if Emphasis1 then { [1] = { colSpan = 2, rowSpan = 2 } } else nil, if Emphasis1 then {
				[1] = GameCollectionItemTypes.GameCollectionItemType.EmphasisTile
			} else nil, not UseAppPolicyResult, AppPage.SearchPage, nil, nil)
		end
		if not v2.layout then
			return {}
		end
		local UseMemoResult1 = UseMemoResult2
		
		if UseMemoResult2 then
			local JoinResults = {}
			
			for i = 1, #v2.layout do
				local LayoutEntry = v2.layout[i]
				
				if LayoutEntry then
					for i1 = 1, UseStateResult4 do
						local LayoutEntry1: number = LayoutEntry[i1]
						
						if LayoutEntry1 and LayoutEntry1 > 0 then
							local UseMemoResultEntry = UseMemoResult2[LayoutEntry1]
							
							if UseMemoResultEntry then
								JoinResults[LayoutEntry1] = CryoModule.Dictionary.join(UseMemoResultEntry, { topicContentsIndex = LayoutEntry1 })
							end
						end
					end
				end
			end
			UseMemoResult1 = JoinResults
		end
		return GameCollectionItemBuilder.BuildCollectionEntries(UseMemoResult1, UseStateResult4, nil, nil, not UseAppPolicyResult, AppPage.SearchPage, nil, nil, v2.layout)
	end, {
		if FFlagLuaAppEnableNxMRoduxApportioning then nil else Emphasis1,
		if FFlagLuaAppEnableNxMRoduxApportioning then UseMemoResult2 else UseMemoResult3,
		UseStateResult4, UseAppPolicyResult, TopicLayout2,
		if FFlagLuaAppEnableNxMRoduxApportioning then v2 else nil
	})
	local ShowHeader = TopicLayoutData.showHeader
	local FeedItemStartRow = p1[OmniFeedPropsModule.key].feedItemStartRow
	UseUpdateFeedItemRenderedRowsModule(AppPage.SearchPage, p1.searchUuid, FeedItemPosition, (ReactModule.useMemo(function()
		-- upvalues: v2 (ref), FFlagLuaAppEnableNxMRoduxApportioning (upval), UseStateResult4 (copy), UseMemoResult3 (copy), NumOfRows (copy)
		if next(v2) == nil then
			return nil
		end
		if not FFlagLuaAppEnableNxMRoduxApportioning then
			local UiIndex = if #UseMemoResult3 > 0 then UseMemoResult3[#UseMemoResult3].uiIndex else 0
			local Ceiled: number = if UiIndex and UseStateResult4 and UseStateResult4 > 0 then math.ceil(UiIndex / UseStateResult4) else 0
			
			return if NumOfRows and NumOfRows >= 0 and Ceiled >= NumOfRows then NumOfRows else Ceiled
		end
		local CountLayout = if v2.layout then #v2.layout else nil
		
		if not CountLayout then
			if UseStateResult4 and UseStateResult4 > 0 then
				return (math.ceil(#UseMemoResult3 / UseStateResult4))
			end
			CountLayout = 0
		end
		return CountLayout
	end, {
		v2,
		UseMemoResult3,
		UseStateResult4,
		if FFlagLuaAppEnableNxMRoduxApportioning then nil else NumOfRows
	})))
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: FeedItemStartRow (copy), UseStateResult4 (copy)
		return if p2 and FeedItemStartRow and UseStateResult4 and UseStateResult4 > 0 then FeedItemStartRow + math.ceil(p2 / UseStateResult4) - 1 else nil
	end, { UseStateResult4, FeedItemStartRow })
	local ReportGameDetailOpened = if TopicLayout2 then nil else function(p2)
		-- upvalues: UseMemoResult3 (copy), UseResult (copy), UseRoactServiceResult (copy), Name (ref), FeedItemPosition (copy), p1 (copy), GameCollectionItemTypes (upval)
		local UseMemoResultEntry = UseMemoResult3[p2]
		local UseResultResult = UseResult(UseMemoResultEntry.uiIndex or p2)
		
		if UseMemoResultEntry ~= nil then
			UseRoactServiceResult.reportOpenGameDetailFromSearch(UseMemoResultEntry.placeIdOverride or UseMemoResultEntry.placeId, p2, #UseMemoResult3, UseMemoResultEntry.isSponsored, UseMemoResultEntry.adId, UseMemoResultEntry.universeId, Name, FeedItemPosition, p1.topicId, UseResultResult, UseMemoResultEntry.topicContentsIndex or p2, UseMemoResultEntry.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile)
		end
	end
	local ReportExperienceLaunched = if TopicLayout2 then nil else function(p2)
		-- upvalues: UseResult (copy), GamePlayIntentFunction (upval), UseRoactServiceResult2 (copy), Context (upval), FeedItemPosition (copy), p1 (copy), Name (ref), GameCollectionItemTypes (upval)
		GamePlayIntentFunction(UseRoactServiceResult2, Context.SearchExperienceTile, {
			placeId = p2.placeIdOverride or p2.placeId,
			rootPlaceId = tonumber(p2.placeId),
			sortEntryIndex = tostring(p2.index),
			sortIndex = FeedItemPosition,
			gameSetTypeId = p1.topicId,
			rowOnPage = UseResult(p2.uiIndex or p2.index),
			topicDataPosition = p2.topicContentsIndex or p2.index,
			universeId = p2.universeId,
			nativeAdData = p2.adId,
			pageName = Name,
			launchData = p2.launchDataOverride,
			tileType = p2.tileType or GameCollectionItemTypes.GameCollectionItemType.GameTile
		})
	end
	local SendGameImpressions1 = if TopicLayout2 then nil else function(p2)
		-- upvalues: UseSelectorResult (copy), SearchUuid (copy), Emphasis1 (copy), FeedItemPosition (copy), p1 (copy), SendGameImpressions (upval), UseRoactServiceResult2 (copy), UseRoactServiceResult1 (copy), UseMemoResult3 (copy), AppPage (upval), UseStateResult4 (copy), FeedItemStartRow (copy)
		if UseSelectorResult then
			SendGameImpressions.sendFromSearch(UseRoactServiceResult2, UseRoactServiceResult1, p2, UseMemoResult3, AppPage.SearchPage, {
				seeAllFlag = 1,
				searchUuid = SearchUuid,
				emphasisFlag = if Emphasis1 then 1 else 0,
				sortPos = FeedItemPosition,
				gameSetTypeId = p1.topicId
			}, UseStateResult4, FeedItemStartRow)
			
			return
		end
	end
	local Footer = GameTileConstants.PlayerCountStyleValues.Footer
	local UseMemoResult4 = ReactModule.useMemo(function()
		-- upvalues: SearchUuid (copy), Emphasis1 (copy)
		return { searchUuid = SearchUuid, hasEmphasizedTile = Emphasis1 }
	end, { SearchUuid, Emphasis1 })
	
	if FFlagLuaAppSearchPlaceholderGrid and (v1 == nil and #UseStateResult3 > 0) then
		return ReactModule.createElement(PlaceholderGameGrid, {
			gridSupportAllowed = true,
			isHoverSupportEnabled = true,
			shouldHideTileMetadata = false,
			shouldHideTileTitle = false,
			onItemsPerRowChanged = if AppCompositionEnabled then nil else OnItemsPerRowChanged,
			appCompositionEnabled = AppCompositionEnabled,
			useGridTiles = IsTopicLayoutMatch,
			componentType = TopicLayout1,
			gameTileLayoutType = if IsTopicLayoutMatch then "Wide" else "Narrow",
			numRows = NumOfRows1,
			sideMargin = if AppCompositionEnabled then nil else Offset,
			verticalScrollingFrameRef = p1[OmniFeedPropsModule.key].verticalScrollingFrameRef,
			containedTile = TopicLayout,
			headerComponent = if ShowHeader then ReactModule.createElement(SearchSelectionTypeHeaderModule, { LayoutOrder = 1, selectionType = SearchTypes.Games }) else nil
		})
	else
		local Element = if TopicLayout2 then ReactModule.createElement(GameCollectionGrid, {
			friendFooterEnabled = false,
			isSponsoredFooterAllowed = true,
			gridSupportAllowed = true,
			isHoverSupportEnabled = true,
			playButtonStyle = "Default",
			shouldHideTileMetadata = false,
			shouldHideTileTitle = false,
			entries = UseMemoResult31,
			headerComponent = if ShowHeader then ReactModule.createElement(SearchSelectionTypeHeaderModule, { LayoutOrder = 1, selectionType = SearchTypes.Games }) else nil,
			verticalScrollingFrameRef = p1[OmniFeedPropsModule.key].verticalScrollingFrameRef,
			maxNumRows = NumOfRows,
			useGridTiles = IsTopicLayoutMatch,
			gameSortId = p1.topicId,
			sortIndex = FeedItemPosition,
			pageContext = AppPage.SearchPage,
			scrollViewPositionChangedSignal = p1[OmniFeedPropsModule.key].scrollViewPositionChangedSignal,
			playerCountStyle = Footer,
			componentType = TopicLayout1,
			gameTileLayoutType = if IsTopicLayoutMatch then "Wide" else "Narrow",
			onItemsPerRowChanged = OnItemsPerRowChanged,
			startRow = FeedItemStartRow,
			sideMargin = if AppCompositionEnabled then nil else Offset,
			appCompositionEnabled = AppCompositionEnabled,
			numUpdatesToDelayImpressions = FIntLuaAppDelayImpressionsMaxUpdates,
			selectionOrderBase = p1[OmniFeedPropsModule.key].selectionOrderBase,
			searchParams = UseMemoResult4,
			containedTile = TopicLayout,
			layoutOverrides = if AppCompositionEnabled then nil else UseMemoResult,
			launchExperienceEventContextOverride = Context.SearchExperienceTile
		}) else nil
		local Element1 = if TopicLayout2 then nil else ReactModule.createElement(GameSortImpressionsDetector, {
			parentRef = UseRefResult,
			pageContext = AppPage.SearchPage,
			impressionsTag = SearchResultsName,
			scrollViewPositionChangedSignal = p1[OmniFeedPropsModule.key].scrollViewPositionChangedSignal,
			sendGameImpressions = SendGameImpressions1
		})
		
		return if TopicLayout2 then Element else ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(0, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = v77,
			ref = UseRefResult
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 16),
				[ReactModule.Change.AbsoluteContentSize] = v76
			}),
			Padding = if #UseMemoResult3 == 0 or AppCompositionEnabled then nil else ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, Offset),
				PaddingRight = UDim.new(0, Offset)
			}),
			Header = if #UseMemoResult3 == 0 then nil elseif ShowHeader then ReactModule.createElement(SearchSelectionTypeHeaderModule, { LayoutOrder = 1, selectionType = SearchTypes.Games }) else nil,
			GameGrid = ReactModule.createElement(GameGridSelectorModule, {
				LayoutOrder = 2,
				source = "SearchResults",
				searchResultGrid = true,
				entries = UseMemoResult3,
				reportGameDetailOpened = ReportGameDetailOpened,
				horizontalAlignment = Enum.HorizontalAlignment.Left,
				windowSize = Vector2.new(UseStateResult1.X, UseStateResult.Y),
				screenSize = UseSelectorResult1,
				gameEmphasis = Emphasis1,
				currentSidePadding = Offset,
				scrollViewPositionChangedSignal = p1[OmniFeedPropsModule.key].scrollViewPositionChangedSignal,
				impressionsTag = SearchResultsName,
				reportExperienceLaunched = ReportExperienceLaunched,
				launchExperienceEventContext = Context.SearchExperienceTile,
				onItemsPerRowChanged = OnItemsPerRowChanged,
				playerCountStyle = Footer,
				enableCollectionLayout = TopicLayoutData.enableCollectionLayout
			}),
			GameSortImpressionsDetector = ReactModule.createElement(WaitForPropWrapper, {
				waitForProp = FeedItemStartRow,
				maxUpdatesToDelay = FIntLuaAppDelayImpressionsMaxUpdates,
				wrappedComponent = Element1
			})
		})
	end
end