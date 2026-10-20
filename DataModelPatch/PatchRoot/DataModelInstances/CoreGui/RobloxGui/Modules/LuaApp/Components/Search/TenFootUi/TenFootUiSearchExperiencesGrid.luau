local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local EmptyState = UIBloxModule.App.Indicator.EmptyState
local LoadingStateContainer = UIBloxModule.App.Container.LoadingStateContainer
local RetrievalStatus = UIBloxModule.App.Loading.Enum.RetrievalStatus
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalyticsCommonGameEvents = RoactServiceTagsModule.RoactAnalyticsCommonGameEvents
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local AppSessionService = RoactServiceTagsModule.AppSessionService
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local UseAnimatedScrollToSelectionFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useAnimatedScrollToSelection
local GameSortImpressionsDetector = require(CorePackages.Workspace.Packages.GameCollections).GameSortImpressionsDetector
local SendGameImpressions = require(CorePackages.Workspace.Packages.GameCollections).SendGameImpressions
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local GameTileConstants = require(CorePackages.Workspace.Packages.GameTile).GameTileConstants
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchRetrievalStatus = Modules.LuaApp.Enum.SearchRetrievalStatus
local FetchDataWithErrorToastsFunction = Modules.LuaApp.Thunks.FetchDataWithErrorToasts
local ApiFetchGameSearchResultsFunction = Modules.LuaApp.Thunks.Search.ApiFetchGameSearchResults
local GameGridTable = Modules.LuaApp.Components.Games.GameGridTable
local SearchTextBanner = Modules.Personalization.Search.SearchTextBanner
local RemoveTextSearchResultsFunction = Modules.LuaApp.Actions.RemoveTextSearchResults
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local UseLocalizationModule = require(Modules1.LuaApp.Hooks.useLocalization)
local RefreshScrollingFrameWithLoadMoreModule = require(Modules1.LuaApp.Components.RefreshScrollingFrameWithLoadMore)
local ConfirmSearchModule = require(Modules1.LuaApp.Thunks.ConfirmSearch)
local ConstantsModule = require(Modules1.LuaApp.Constants)
local FFlagLuaAppSearchStandardizeAssetCategorization = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSearchStandardizeAssetCategorization

local function v33(p1)
	return p1.ScreenSize
end

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), SearchRetrievalStatus (copy), UseSelectorFunction (copy), v33 (copy), UseDispatchFunction (copy), UseDesignTokensFunction (copy), DiscoveryTypesModule (copy), SearchTextBanner (copy), RemoveTextSearchResultsFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppEventIngestService (copy), RoactAnalyticsCommonGameEvents (copy), AppSessionService (copy), RoactAnalytics (copy), UseNavigationFunction (copy), UseAnimatedScrollToSelectionFunction (copy), FetchDataWithErrorToastsFunction (copy), ApiFetchGameSearchResultsFunction (copy), UseLocalizationModule (copy), FFlagLuaAppSearchStandardizeAssetCategorization (copy), SearchTypes (copy), ConfirmSearchModule (copy), AppPage (copy), SendGameImpressions (copy), EmptyState (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GameTileConstants (copy), RefreshScrollingFrameWithLoadMoreModule (copy), GameGridTable (copy), ConstantsModule (copy), GameSortImpressionsDetector (copy), Loading (copy), IconSize (copy), LoadingStateContainer (copy), RetrievalStatus (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local SearchKeyword = p1.searchKeyword
	local LayoutOrder = p1.layoutOrder
	local SearchType = p1.searchType
	local SearchUuid = p1.searchUuid
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Signal (upval)
		return Signal.new()
	end, {})
	
	local function selectSearchInGamesStatus(p2)
		-- upvalues: SearchUuid (copy), SearchRetrievalStatus (upval)
		local SearchesInGamesStatusEntry = p2.RequestsStatus.SearchesInGamesStatus[SearchUuid]
		
		if SearchesInGamesStatusEntry == nil then
			SearchesInGamesStatusEntry = SearchRetrievalStatus.NotStarted
		end
		return SearchesInGamesStatusEntry
	end
	
	local UseSelectorResult = UseSelectorFunction(v33)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: SearchUuid (copy)
		return p2.Search.SearchesInGames[SearchUuid] or {
			suggestedKeyword = nil,
			filteredKeyword = nil,
			correctedKeyword = nil,
			hasMoreRows = nil,
			emphasis = nil,
			algorithm = nil,
			suggestionAlgorithm = nil,
			entries = {}
		}
	end)
	local UseSelectorResult2 = UseSelectorFunction(selectSearchInGamesStatus)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseSelectorResult)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(UseStateResult.X)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local Entries = UseSelectorResult1.entries
	local Text = "SearchPage" .. tostring(SearchUuid)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult2 (copy), SearchRetrievalStatus (upval), UseStateResult2_2 (copy), UseStateResult3 (copy)
		if UseSelectorResult2 == SearchRetrievalStatus.Done then
			UseStateResult2_2(true)
			
			return
		end
		if UseSelectorResult2 == SearchRetrievalStatus.NotStarted and UseStateResult3 then
			UseStateResult2_2(false)
		end
	end, { UseSelectorResult2 })
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseSelectorResult3 = UseSelectorFunction(function(p2)
		-- upvalues: p1 (copy), DiscoveryTypesModule (upval)
		return p2.TextSearchResults[p1.searchUuid] and p2.TextSearchResults[p1.searchUuid][DiscoveryTypesModule.SearchTextTopicIds.HotlineSearchText] or nil
	end)
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult3 (copy), ReactModule (upval), SearchTextBanner (upval)
		return if UseSelectorResult3 then ReactModule.createElement(SearchTextBanner, { text = UseSelectorResult3.text }) else nil
	end, { UseSelectorResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseDispatchResult (copy), RemoveTextSearchResultsFunction (upval), SearchUuid (copy)
		return function()
			-- upvalues: UseDispatchResult (upval), RemoveTextSearchResultsFunction (upval), SearchUuid (upval)
			UseDispatchResult(RemoveTextSearchResultsFunction(SearchUuid))
		end
	end, { SearchUuid })
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactAnalyticsCommonGameEvents)
	local UseRoactServiceResult3 = UseRoactServiceFunction(AppSessionService)
	local UseRoactServiceResult4 = UseRoactServiceFunction(RoactAnalytics)
	local UseNavigationResult = UseNavigationFunction()
	
	local function v62(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize.X)
	end
	
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		if Frame then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end, {})
	local ScaledY = UseRefResult.current and UseRefResult.current.AbsoluteSize.Y * 0.35 or 0
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseAnimatedScrollToSelectionResult, UseAnimatedScrollToSelectionResult2 = UseAnimatedScrollToSelectionFunction(Enum.ScrollingDirection.Y, ScaledY)
	local UseResult1 = ReactModule.useCallback(function(ScrollFrame, p2, p3, p4)
		-- upvalues: UseStateResult2_3 (copy), ScaledY (copy), UseAnimatedScrollToSelectionResult2 (copy)
		UseStateResult2_3(ScaledY < ScrollFrame.CanvasPosition.Y)
		UseAnimatedScrollToSelectionResult2(ScrollFrame, p2, p3, p4)
	end, { ScaledY, UseAnimatedScrollToSelectionResult2 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), FetchDataWithErrorToastsFunction (upval), ApiFetchGameSearchResultsFunction (upval), UseRoactServiceResult (copy), SearchKeyword (copy), SearchUuid (copy)
		return UseDispatchResult(FetchDataWithErrorToastsFunction(ApiFetchGameSearchResultsFunction(UseRoactServiceResult, {
			isAppend = true,
			searchKeyword = SearchKeyword,
			searchUuid = SearchUuid
		})))
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		SearchKeyword,
		SearchUuid
	})
	local UseLocalizationModuleResult = UseLocalizationModule({
		failedMessage = "Feature.EmptyStatePage.Message.NoInternet",
		noResultsText = "Feature.GamePage.LabelNoSearchResults",
		players = "CommonUI.Features.Label.Players",
		games = if FFlagLuaAppSearchStandardizeAssetCategorization then "CommonUI.Features.Label.Games" else "CommonUI.Features.Label.Game"
	})
	ReactModule.useEffect(function()
		-- upvalues: SearchKeyword (copy), UseNavigationResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult3 (copy), SearchTypes (upval), UseDispatchResult (copy), ConfirmSearchModule (upval), ApiFetchGameSearchResultsFunction (upval), UseRoactServiceResult (copy), SearchUuid (copy)
		if SearchKeyword ~= "" then
			assert(UseNavigationResult, "Expected navigation, found none")
			assert(UseRoactServiceResult1, "Expected eventIngest, found none")
			assert(UseRoactServiceResult3, "Expected sessionService, found none")
			UseDispatchResult(ConfirmSearchModule(SearchKeyword, {
				isAutocompleteSuggestion = false,
				allAutocompleteSuggestions = false,
				isAvatarAutocompleteEnabled = false,
				searchType = SearchTypes.Games,
				pageOwner = UseNavigationResult.state.routeName,
				sessionService = UseRoactServiceResult3,
				eventIngest = UseRoactServiceResult1
			}))
			UseDispatchResult(ApiFetchGameSearchResultsFunction(UseRoactServiceResult, {
				isAppend = false,
				searchKeyword = SearchKeyword,
				searchUuid = SearchUuid
			}))
			
			return
		end
	end, {
		SearchKeyword, SearchUuid, UseDispatchResult, UseRoactServiceResult1,
		UseRoactServiceResult3, UseRoactServiceResult
	})
	local SearchBoxAndTypeOffset = UseDesignTokensResult.LuaApps.Search.SearchBoxAndTypeOffset
	
	local function ReportGameDetailOpened(p2)
		-- upvalues: UseSelectorResult1 (copy), UseRoactServiceResult2 (copy), AppPage (upval)
		local Entries = UseSelectorResult1.entries or {}
		local Entry = Entries[p2]
		
		if Entry ~= nil then
			UseRoactServiceResult2.reportOpenGameDetailFromSearch(Entry.placeId, p2, #Entries, Entry.isSponsored, Entry.adId, Entry.universeId, AppPage.SearchPage, nil, nil)
		end
	end
	
	local function SendGameImpressions1(p2)
		-- upvalues: SearchUuid (copy), UseSelectorResult1 (copy), SendGameImpressions (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult4 (copy), AppPage (upval)
		SendGameImpressions.sendFromSearch(UseRoactServiceResult1, UseRoactServiceResult4, p2, UseSelectorResult1.entries, AppPage.SearchPage, {
			seeAllFlag = 1,
			searchUuid = SearchUuid,
			emphasisFlag = if UseSelectorResult1.emphasis then 1 else 0
		}, nil, nil)
	end
	
	local NoUseMemoResult1: boolean = SearchType == SearchTypes.Games and (UseSelectorResult1 ~= nil and (not UseSelectorResult1.hasMoreRows and (if UseSelectorResult1.entries == nil then not UseMemoResult1 else #UseSelectorResult1.entries == 0 and not UseMemoResult1)))
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: NoUseMemoResult1 (copy), ReactModule (upval), SearchBoxAndTypeOffset (copy), LayoutOrder (copy), EmptyState (upval), UseLocalizationModuleResult (copy), UseSelectorResult (copy), FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy), GameTileConstants (upval), UseStateResult4 (copy), v62 (copy), UseMemoResult1 (copy), RefreshScrollingFrameWithLoadMoreModule (upval), UseRefResult (copy), UseAnimatedScrollToSelectionResult (copy), UseResult (copy), UseMemoResult (copy), UseSelectorResult1 (copy), UseResult2 (copy), UseResult1 (copy), DiscoveryTypesModule (upval), GameGridTable (upval), Entries (copy), UseStateResult1 (copy), UseStateResult (copy), ReportGameDetailOpened (copy), Text (copy), ConstantsModule (upval), GameSortImpressionsDetector (upval), AppPage (upval), SendGameImpressions1 (copy)
		if NoUseMemoResult1 then
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, -SearchBoxAndTypeOffset),
				Position = UDim2.new(0, 0, 0, SearchBoxAndTypeOffset),
				LayoutOrder = LayoutOrder
			}, {
				NoResultsView = ReactModule.createElement(EmptyState, {
					text = UseLocalizationModuleResult.noResultsText,
					maxSizeTextLabel = Vector2.new(UseSelectorResult.X - (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1000 else UseDesignTokensResult.Global.Size_500), UseSelectorResult.Y)
				})
			})
		else
			local Footer = GameTileConstants.PlayerCountStyleValues.Footer
			
			return ReactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				LayoutOrder = LayoutOrder,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				SelectionGroup = true,
				SelectionBehaviorUp = if UseStateResult4 then Enum.SelectionBehavior.Stop else nil,
				[ReactModule.Change.AbsoluteSize] = v62
			}, {
				CanvasGroupMask = ReactModule.createElement("CanvasGroup", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					TextComponent = if UseMemoResult1 then UseMemoResult1 else nil,
					ScrollingFrame = if UseMemoResult1 then nil else ReactModule.createElement(RefreshScrollingFrameWithLoadMoreModule, {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						CanvasSize = UDim2.new(1, 0, 1, 0),
						ref = UseRefResult,
						canvasPosition = UseAnimatedScrollToSelectionResult,
						onAbsoluteSizeChangedCallback = UseResult,
						onCanvasPositionChangedCallback = function()
							-- upvalues: UseMemoResult (upval)
							UseMemoResult:fire()
						end,
						onLoadMore = UseSelectorResult1.hasMoreRows and UseResult2 or nil,
						onSelectionChanged = UseResult1
					}, {
						Layout = ReactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Vertical,
							HorizontalAlignment = Enum.HorizontalAlignment.Center,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100)
						}),
						Padding = ReactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, 0),
							PaddingRight = UDim.new(0, 0),
							PaddingTop = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING),
							PaddingBottom = UDim.new(0, DiscoveryTypesModule.Constants.GAME_GRID_PADDING)
						}),
						GameGridWrapper = ReactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, 0, 0, 0),
							AutomaticSize = Enum.AutomaticSize.Y
						}, {
							Layout = ReactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
							Padding = ReactModule.createElement("UIPadding", { PaddingBottom = UDim.new(0, SearchBoxAndTypeOffset) }),
							GameGridTable = ReactModule.createElement(GameGridTable, {
								searchResultGrid = true,
								gameEmphasis = false,
								source = "SearchResults",
								useHoverTile = false,
								entries = Entries,
								screenSize = UseSelectorResult,
								windowSize = Vector2.new(UseStateResult1, UseStateResult.Y),
								reportGameDetailOpened = ReportGameDetailOpened,
								horizontalAlignment = Enum.HorizontalAlignment.Left,
								impressionsTag = Text,
								launchExperienceEventContext = ConstantsModule.AnalyticsContext.SearchExperienceTile,
								playerCountStyle = Footer
							}),
							GameSortImpressionsDetector = ReactModule.createElement(GameSortImpressionsDetector, {
								parentRef = UseRefResult,
								pageContext = AppPage.SearchPage,
								impressionsTag = Text,
								scrollViewPositionChangedSignal = UseMemoResult,
								sendGameImpressions = SendGameImpressions1
							})
						})
					})
				})
			})
		end
	end, {
		SearchBoxAndTypeOffset, LayoutOrder, UseDesignTokensResult,
		UseLocalizationModuleResult, v62, UseSelectorResult1, NoUseMemoResult1,
		UseResult, UseMemoResult, Entries, UseResult2, UseSelectorResult,
		UseStateResult, UseStateResult1, ReportGameDetailOpened, Text,
		SendGameImpressions1, UseMemoResult1
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult3 (copy), UseResult3 (copy), ReactModule (upval), SearchBoxAndTypeOffset (copy), LayoutOrder (copy), Loading (upval), IconSize (upval)
		return if UseStateResult3 and UseResult3 ~= nil then UseResult3() else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -SearchBoxAndTypeOffset),
			Position = UDim2.new(0, 0, 0, 0),
			LayoutOrder = LayoutOrder
		}, {
			LoadingSpinner = ReactModule.createElement(Loading, {
				size = IconSize.Small,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5)
			})
		})
	end, {
		UseStateResult3,
		UseDesignTokensResult,
		UseResult3,
		SearchBoxAndTypeOffset,
		LayoutOrder
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: ReactModule (upval), SearchBoxAndTypeOffset (copy), LayoutOrder (copy), EmptyState (upval), UseLocalizationModuleResult (copy), UseSelectorResult (copy), FFlagRenameDeprecatedUIBloxTokens (upval), UseDesignTokensResult (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, -SearchBoxAndTypeOffset),
			Position = UDim2.new(0, 0, 0, SearchBoxAndTypeOffset),
			LayoutOrder = LayoutOrder
		}, {
			NoResultsView = ReactModule.createElement(EmptyState, {
				text = UseLocalizationModuleResult.failedMessage,
				maxSizeTextLabel = Vector2.new(UseSelectorResult.X - (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_1000 else UseDesignTokensResult.Global.Size_500), UseSelectorResult.Y)
			})
		})
	end, {
		SearchBoxAndTypeOffset,
		LayoutOrder,
		UseSelectorResult,
		UseDesignTokensResult,
		UseLocalizationModuleResult.failedMessage
	})
	
	return if SearchType == SearchTypes.Games then ReactModule.createElement(LoadingStateContainer, {
		dataStatus = RetrievalStatus.fromRawValue(UseSelectorResult2),
		renderOnEmpty = function()
			return nil
		end,
		renderOnFailed = UseResult5,
		renderOnLoading = UseResult4,
		renderOnLoaded = UseResult3
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {})
end