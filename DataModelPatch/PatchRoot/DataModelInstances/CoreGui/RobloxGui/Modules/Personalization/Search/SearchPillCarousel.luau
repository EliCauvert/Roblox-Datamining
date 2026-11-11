local TextService = game:GetService("TextService")
local CorePackages = game:GetService("CorePackages")
local UseCollectionImpressionsSignalFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionImpressionsSignal
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local FrameBoundsImpressionsTracker = require(CorePackages.Workspace.Packages.Impressions).FrameBoundsImpressionsTracker
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local ReactModule = require(CorePackages.Packages.React)
local UseUserExperimentFunction = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local RoactServiceTagsModule = require(CorePackages.Workspace.Packages.RoactServiceTags)
local AppSessionService = RoactServiceTagsModule.AppSessionService
local AppEventIngestService = RoactServiceTagsModule.AppEventIngestService
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local VariableItemWidthCarousel = require(CorePackages.Workspace.Packages.VariableItemWidthCarousel).VariableItemWidthCarousel
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchPill = Modules.Personalization.Search.SearchPill
local QuerySuggestionClickedFunction = Modules.Personalization.Analytics.querySuggestionClicked
local QueryImpressionsEventFunction = Modules.Personalization.Analytics.queryImpressionsEvent
local SearchConstants = Modules.Personalization.Search.SearchConstants
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local ConfirmSearchModule = require(Modules1.LuaApp.Thunks.ConfirmSearch)
local FetchAutocompleteSuggestionModule = require(Modules1.LuaApp.Thunks.FetchAutocompleteSuggestion)
local FIntSearchLandingPageSideMargin = Modules.Personalization.Search.FIntSearchLandingPageSideMargin
local GAMECAROUSELSIDECOMPACTPADDING = require(CorePackages.Workspace.Packages.DiscoveryTypes).Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING

function SearchPillCarousel(p1)
	-- upvalues: AppUserLayers (copy), UseUserExperimentFunction (copy), UseDesignTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), UseNavigationFunction (copy), RoactNetworking (copy), AppSessionService (copy), UseSelectorFunction (copy), FormFactor (copy), SearchConstants (copy), ReactModule (copy), UseCollectionImpressionsSignalFunction (copy), ConfirmSearchModule (copy), FetchAutocompleteSuggestionModule (copy), SearchTypes (copy), QuerySuggestionClickedFunction (copy), QueryImpressionsEventFunction (copy), TextService (copy), SearchPill (copy), VariableItemWidthCarousel (copy), GAMECAROUSELSIDECOMPACTPADDING (copy), FIntSearchLandingPageSideMargin (copy), FrameBoundsImpressionsTracker (copy)
	local UseUserExperimentResult = UseUserExperimentFunction({ AppUserLayers.SearchAutocompleteLayer }, function(p2)
		-- upvalues: AppUserLayers (upval)
		return p2[AppUserLayers.SearchAutocompleteLayer] or {}
	end)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AppSessionService)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.AutocompleteSuggestions
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2): boolean
		-- upvalues: FormFactor (upval)
		return p2.FormFactor == FormFactor.COMPACT
	end)
	local Entries = p1.entries
	local TrendingSearches = SearchConstants.getSearchTokens(UseDesignTokensResult).searchLandingPage.trendingSearches
	local PillTextSize = TrendingSearches.pillTextSize
	local PillVerticalPadding: number = TrendingSearches.pillVerticalPadding
	local PillHorizontalPadding = TrendingSearches.pillHorizontalPadding
	local PillFont = TrendingSearches.pillFont
	local PillTextColor = TrendingSearches.pillTextColor
	local PillBackgroundColor = TrendingSearches.pillBackgroundColor
	local PillBackgroundTransparency = TrendingSearches.pillBackgroundTransparency
	local ColumnGap = TrendingSearches.columnGap
	local NewPillTextSize = PillTextSize + PillVerticalPadding * 2
	local SearchPillCarouselName: string = `SearchPillCarousel_{p1.sortName}{p1.sortIndex}`
	local UseRefResult = ReactModule.useRef(nil)
	local UseCollectionImpressionsSignalResult, UseCollectionImpressionsSignalResult2 = UseCollectionImpressionsSignalFunction(p1.scrollViewPositionChangedSignal)
	local UseResult = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), ConfirmSearchModule (upval)
		return UseDispatchResult(ConfirmSearchModule(p2, p3))
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseSelectorResult (copy)
		return UseSelectorResult[p2]
	end, { UseSelectorResult })
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), FetchAutocompleteSuggestionModule (upval), UseRoactServiceResult1 (copy), UseUserExperimentResult (copy), SearchTypes (upval)
		if p2 then
			UseDispatchResult(FetchAutocompleteSuggestionModule.Fetch(UseRoactServiceResult1, p2, UseUserExperimentResult, SearchTypes.Auto))
			
			return
		else
			warn("requestAutocompleteSuggestion called with nil keyword")
		end
	end, {
		UseDispatchResult,
		UseRoactServiceResult1,
		UseUserExperimentResult
	})
	local UseResult3 = ReactModule.useCallback(function(QueryText, Pos)
		-- upvalues: SearchTypes (upval), UseNavigationResult (copy), UseRoactServiceResult2 (copy), UseRoactServiceResult (copy), UseResult (copy), QuerySuggestionClickedFunction (upval), p1 (copy), UseResult1 (copy), UseResult2 (copy)
		UseResult(QueryText, {
			isAutocompleteSuggestion = true,
			isAvatarAutocompleteEnabled = false,
			allAutocompleteSuggestions = {},
			searchType = SearchTypes.TopResults,
			navigation = UseNavigationResult,
			pageOwner = UseNavigationResult.state.routeName,
			sessionService = UseRoactServiceResult2,
			eventIngest = UseRoactServiceResult
		})
		QuerySuggestionClickedFunction(UseRoactServiceResult, p1.pageContext, {
			componentType = "Pill",
			pos = Pos,
			sortPos = p1.sortIndex,
			sortId = p1.sortName,
			queryText = QueryText
		})
		
		if not UseResult1(QueryText) then
			UseResult2(QueryText)
		end
	end, {
		UseResult, UseNavigationResult, UseRoactServiceResult2, UseRoactServiceResult,
		UseResult1, UseResult2
	})
	local UseResult4 = ReactModule.useCallback(function(List)
		-- upvalues: p1 (copy), QueryImpressionsEventFunction (upval), UseRoactServiceResult (copy)
		local List1 = {}
		local List2 = {}
		
		for _, value in ipairs(List) do
			local Entry = p1.entries[value]
			
			if Entry then
				table.insert(List1, value)
				table.insert(List2, Entry.query)
			end
		end
		QueryImpressionsEventFunction(UseRoactServiceResult, p1.pageContext, {
			componentType = "Pill",
			absPositions = table.concat(List1, ","),
			queryTexts = table.concat(List2, ","),
			sortPos = p1.sortIndex,
			sortId = p1.sortName
		})
	end, {
		QueryImpressionsEventFunction, UseRoactServiceResult, p1.pageContext,
		p1.sortIndex, p1.sortName, p1.entries
	})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ReactModule.createElement(VariableItemWidthCarousel, {
			hideHeaderButton = true,
			scrollButtonsEnabled = true,
			title = p1.headerText,
			items = Entries,
			renderItem = ReactModule.useCallback(function(p2, Index)
				-- upvalues: ReactModule (upval), SearchPill (upval), PillFont (copy), PillTextSize (copy), PillTextColor (copy), PillVerticalPadding (copy), PillHorizontalPadding (copy), PillBackgroundColor (copy), PillBackgroundTransparency (copy), UseResult3 (copy), SearchPillCarouselName (copy)
				return ReactModule.createElement(SearchPill, {
					layoutOrder = Index,
					text = p2.query,
					font = PillFont,
					textSize = PillTextSize,
					textColor = PillTextColor,
					verticalPadding = PillVerticalPadding,
					horizontalPadding = PillHorizontalPadding,
					backgroundColor = PillBackgroundColor,
					backgroundTransparency = PillBackgroundTransparency,
					onActivated = function()
						-- upvalues: UseResult3 (upval), p2 (copy), Index (copy)
						UseResult3(p2.query, Index)
					end,
					impressionsTag = SearchPillCarouselName,
					index = Index
				})
			end, {
				PillBackgroundColor, PillBackgroundTransparency, PillFont,
				PillHorizontalPadding, PillTextColor, PillTextSize, PillVerticalPadding,
				UseResult3, SearchPillCarouselName
			}),
			itemPadding = ColumnGap,
			itemHeight = NewPillTextSize,
			sideMargin = if UseSelectorResult1 then GAMECAROUSELSIDECOMPACTPADDING else FIntSearchLandingPageSideMargin,
			scrollingFrameRef = UseRefResult,
			calculateItemWidth = ReactModule.useCallback(function(p2): number
				-- upvalues: Entries (copy), TextService (upval), PillTextSize (copy), PillFont (copy), PillHorizontalPadding (copy)
				local Entry = Entries[p2]
				
				return if Entry then TextService:GetTextSize(Entry.query, PillTextSize, PillFont, Vector2.new(1e999, PillTextSize)).X + PillHorizontalPadding * 2 else 0
			end, { Entries, PillTextSize, PillFont, PillHorizontalPadding }),
			onCanvasPositionChanged = UseCollectionImpressionsSignalResult2
		}),
		ImpressionsTracker = if UseResult4 and SearchPillCarouselName then ReactModule.createElement(FrameBoundsImpressionsTracker, {
			parentRef = UseRefResult,
			pageContext = p1.pageContext,
			impressionsTag = SearchPillCarouselName,
			scrollViewPositionChangedSignal = UseCollectionImpressionsSignalResult,
			sendImpressions = UseResult4
		}) else nil
	})
end

return SearchPillCarousel