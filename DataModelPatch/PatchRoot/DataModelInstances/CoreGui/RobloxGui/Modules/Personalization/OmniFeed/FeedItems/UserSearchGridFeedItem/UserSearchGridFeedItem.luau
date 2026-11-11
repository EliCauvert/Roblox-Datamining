local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local BreakpointConfig = ResponsiveModule.BreakpointConfig
local ScreenSizeImpressionsTracker = require(CorePackages.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local CollectionViewsModule = require(CorePackages.Workspace.Packages.CollectionViews)
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local UsePageSideMarginFunction = CollectionViewsModule.usePageSideMargin
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local OmniFeedProps = Modules.Personalization.OmniFeed.OmniFeedProps
local SearchSelectionTypeHeader = Modules.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader
local UseUpdateFeedItemRenderedRowsFunction = Modules.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local ApiModule = require(Modules1.LuaApp.Components.UserSearch.api)
local AnalyticsFunction = ApiModule.Analytics.Analytics
local FireImpressionEventFunction = ApiModule.Analytics.fireImpressionEvent
local PlayerGridWithUserSearchHydrationLayerWrapperModule = require(Modules1.LuaApp.Components.UserSearch.Players.PlayerGridWithUserSearchHydrationLayerWrapper)
local FFlagLuaAppLayoutParamsInContext = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppLayoutParamsInContext
local FFlagLuaAppCompositionAlways = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways
local FFlagLuaAppSearchPeopleUnifiedSchemaFields = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields
local LuaAppUserSearchGridReactiveContainer = game:DefineFastFlag("LuaAppUserSearchGridReactiveContainer", false)

return function(p1)
	-- upvalues: ReactModule (copy), FFlagLuaAppCompositionAlways (copy), OmniFeedProps (copy), UseSelectorFunction (copy), FFlagLuaAppLayoutParamsInContext (copy), CollectionItemSize (copy), SignalsReactModule (copy), UsePageSideMarginFunction (copy), LuaAppUserSearchGridReactiveContainer (copy), FFlagLuaAppSearchPeopleUnifiedSchemaFields (copy), AnalyticsFunction (copy), BreakpointConfig (copy), ResponsiveModule (copy), UseUpdateFeedItemRenderedRowsFunction (copy), AppPage (copy), FireImpressionEventFunction (copy), SearchSelectionTypeHeader (copy), SearchTypes (copy), PlayerGridWithUserSearchHydrationLayerWrapperModule (copy), ScreenSizeImpressionsTracker (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedProps.key].appCompositionEnabled
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy)
		return p2.UsersSearchResults[p1.searchUuid]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end)
	local UseSignalStateResult = nil
	
	if FFlagLuaAppCompositionAlways then
		UseSignalStateResult = nil
	elseif FFlagLuaAppLayoutParamsInContext then
		local SduiContext = p1[OmniFeedProps.key].sduiContext
		local XSmall = CollectionItemSize.XSmall
		UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
			-- upvalues: SduiContext (copy), XSmall (copy)
			return SduiContext.getPageLayoutConfig(XSmall)(p2).sideMargin
		end, { XSmall, SduiContext.getPageLayoutConfig })))
	else
		UseSignalStateResult = UsePageSideMarginFunction(p1[OmniFeedProps.key].verticalScrollingFrameRef.current)
	end
	local Offset: number = UseSignalStateResult
	local Callback = nil
	local UseStateResult = nil
	
	if LuaAppUserSearchGridReactiveContainer then
		UseStateResult, Callback = ReactModule.useState(nil)
	else
		UseStateResult = UseRefResult and UseRefResult.current and UseRefResult.current.AbsoluteSize or nil
	end
	local _Vector2 = Vector2.new(if AppCompositionEnabled then if UseStateResult and UseStateResult.X > 0 then UseStateResult.X else 0 elseif UseStateResult and UseStateResult.X > 0 then UseStateResult.X - 2 * Offset else 0, UseSelectorResult1.Y)
	local FeedItemPosition = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1[OmniFeedProps.key].feedItemPosition else nil
	local AnalyticsResult = AnalyticsFunction({
		infoForAllEvents = {
			userSearchSessionId = p1.searchUuid,
			sortPosition = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then FeedItemPosition else nil,
			sortId = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1.topicId else nil,
			pageContext = if FFlagLuaAppSearchPeopleUnifiedSchemaFields then p1[OmniFeedProps.key].appPage else nil
		}
	})
	local IsXBelow = UseSelectorResult1.X < BreakpointConfig.getMinWidthFor(ResponsiveModule.Keys.Small)
	local NumOfRows = if BreakpointConfig.getMinWidthFor(ResponsiveModule.Keys.Large) <= UseSelectorResult1.X or IsXBelow then 1 else p1.topicLayoutData.numOfRows
	
	if NumOfRows < 0 then
		NumOfRows = nil
	end
	local UseStateResult1, UseStateResult2 = ReactModule.useState(1)
	
	local function OnItemsPerRowChanged(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end
	
	if not FFlagLuaAppSearchPeopleUnifiedSchemaFields then
		FeedItemPosition = p1[OmniFeedProps.key].feedItemPosition
	end
	local CountEntries: number = if UseSelectorResult and UseSelectorResult.entries then #UseSelectorResult.entries else 0
	local Ceiled: number = if CountEntries and UseStateResult1 and UseStateResult1 > 0 then math.ceil(CountEntries / UseStateResult1) else 0
	local FeedItemStartRow = p1[OmniFeedProps.key].feedItemStartRow
	UseUpdateFeedItemRenderedRowsFunction(AppPage.SearchPage, p1.searchUuid, FeedItemPosition, if NumOfRows and NumOfRows >= 0 and Ceiled >= NumOfRows then NumOfRows else Ceiled)
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ref = UseRefResult,
		[ReactModule.Change.AbsoluteSize] = if LuaAppUserSearchGridReactiveContainer then function(Frame)
			-- upvalues: Callback (ref)
			Callback(Frame.AbsoluteSize)
		end else nil
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}),
		UIPadding = if AppCompositionEnabled then nil else ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset)
		}),
		Header = if p1.topicLayoutData and p1.topicLayoutData.showHeader then ReactModule.createElement(SearchSelectionTypeHeader, { LayoutOrder = 1, selectionType = SearchTypes.Players }) else nil,
		HydrationWrapper = ReactModule.createElement(PlayerGridWithUserSearchHydrationLayerWrapperModule, {
			LayoutOrder = 2,
			shouldUseCompactTiles = true,
			impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS",
			subpage = "UserSearchFeedItem",
			horizontalAlignment = Enum.HorizontalAlignment.Left,
			windowSize = _Vector2,
			numberOfRowsToShow = NumOfRows,
			searchParameters = { searchKeyword = UseSelectorResult.keyword },
			entries = UseSelectorResult.entries,
			Analytics = AnalyticsResult,
			onItemsPerRowChanged = OnItemsPerRowChanged,
			startRowNumber = FeedItemStartRow,
			itemsPerRow = UseStateResult1
		}),
		ScreenSizeImpressionsDetector = ReactModule.createElement(ScreenSizeImpressionsTracker, {
			impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS",
			parentRef = UseRefResult,
			pageContext = AppPage.SearchPage,
			sendImpressions = ReactModule.useCallback(function(Impressions)
				-- upvalues: FireImpressionEventFunction (upval), UseSelectorResult (copy), FeedItemStartRow (copy), UseStateResult1 (copy), AnalyticsResult (copy)
				FireImpressionEventFunction({
					impressions = Impressions,
					entries = UseSelectorResult and UseSelectorResult.entries or nil,
					startRowNumber = FeedItemStartRow,
					itemsPerRow = UseStateResult1
				}, AnalyticsResult.fireAnalyticsEvent)
			end, {
				UseSelectorResult,
				FeedItemStartRow,
				UseStateResult1,
				AnalyticsResult.fireAnalyticsEvent
			}),
			scrollViewPositionChangedSignal = p1[OmniFeedProps.key].scrollViewPositionChangedSignal
		})
	})
end