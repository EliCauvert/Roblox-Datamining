local CorePackages = game:GetService("CorePackages")
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local DiscoveryAnalyticsModule = require(CorePackages.Workspace.Packages.DiscoveryAnalytics)
local ServerDrivenUiModule = require(CorePackages.Workspace.Packages.ServerDrivenUi)
local UseCollectionLayoutConfigFunction = require(CorePackages.Workspace.Packages.CollectionViews).useCollectionLayoutConfig
local FetchStatusRoduxModule = require(CorePackages.Workspace.Packages.FetchStatusRodux)
local FetchStatusReducer = FetchStatusRoduxModule.FetchStatusReducer
local FetchStatusNamespace = FetchStatusRoduxModule.FetchStatusNamespace
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local UseCurrentSquadIdFunction = require(CorePackages.Workspace.Packages.SquadsCore.Hooks).useCurrentSquadId
local SearchLandingPageSurface = require(CorePackages.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SearchConstants = Modules.Personalization.Search.SearchConstants
local SearchLandingPageSession = Modules.Personalization.Sessions.SearchLandingPageSession
local ApiFetchSearchLandingPageFunction = Modules.LuaApp.Thunks.Search.ApiFetchSearchLandingPage
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local OmniFeedViewLoadMoreModule = require(Modules1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore)
local SetSearchLandingPageSessionInfoModule = require(Modules1.Personalization.Sessions.setSearchLandingPageSessionInfo)
local SearchLandingPageSkeletonModule = require(script.Parent.SearchLandingPageSkeleton)
local FFlagLuaAppLayoutParamsInContext = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppLayoutParamsInContext
local SearchLandingPage1 = AppPage.SearchLandingPage

function SearchLandingPage(p1)
	-- upvalues: UseDispatchFunction (copy), UseDesignTokensFunction (copy), UseCurrentSquadIdFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), AppSessionService (copy), SearchConstants (copy), ReactModule (copy), FFlagLuaAppLayoutParamsInContext (copy), UseSelectorFunction (copy), SearchLandingPage1 (copy), SetSearchLandingPageSessionInfoModule (copy), ApiFetchSearchLandingPageFunction (copy), SearchLandingPageSession (copy), SearchLandingPageSurface (copy), UseCollectionLayoutConfigFunction (copy), ServerDrivenUiModule (copy), FetchStatusReducer (copy), FetchStatusNamespace (copy), RetrievalStatus (copy), SearchLandingPageSkeletonModule (copy), Focusable (copy), OmniFeedViewLoadMoreModule (copy), AppPage (copy), DiscoveryAnalyticsModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppSessionService)
	local SearchTokens = SearchConstants.getSearchTokens(UseDesignTokensResult)
	local ScrollingFrameRef = p1.scrollingFrameRef or ReactModule.useRef(nil)
	local v1 = nil
	local UseResult = nil
	
	if FFlagLuaAppLayoutParamsInContext then
		local UseStateResult2 = nil
		v1, UseStateResult2 = ReactModule.useState(nil)
		UseResult = ReactModule.useCallback(function(Current)
			-- upvalues: ScrollingFrameRef (copy), UseStateResult2 (ref)
			ScrollingFrameRef.current = Current
			UseStateResult2(Current)
		end, {})
	end
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: SearchLandingPage1 (upval)
		return p2.Personalization.OrderedOmniItems[SearchLandingPage1] or nil
	end)
	local AllItems = UseSelectorResult and UseSelectorResult.allItems or {}
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: SetSearchLandingPageSessionInfoModule (upval), UseRoactServiceResult1 (copy), UseCurrentSquadIdResult (copy), UseDispatchResult (copy), ApiFetchSearchLandingPageFunction (upval), UseRoactServiceResult (copy), SearchLandingPageSession (upval), SearchLandingPageSurface (upval)
		SetSearchLandingPageSessionInfoModule(UseRoactServiceResult1, true)
		
		return if UseCurrentSquadIdResult == "" or UseCurrentSquadIdResult == nil then UseDispatchResult(ApiFetchSearchLandingPageFunction(UseRoactServiceResult, SearchLandingPageSession:Get())) else UseDispatchResult(ApiFetchSearchLandingPageFunction(UseRoactServiceResult, SearchLandingPageSession:Get(), SearchLandingPageSurface.Party))
	end, {
		UseDispatchResult,
		UseRoactServiceResult,
		SearchLandingPageSession,
		UseCurrentSquadIdResult,
		UseRoactServiceResult1
	})
	local OnAbsoluteContentSizeChanged = p1.onAbsoluteContentSizeChanged
	local UseCollectionLayoutConfigResult = if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigFunction(v1) else nil
	local UseSduiContextFromRoduxAndProcessConfigsResult = ServerDrivenUiModule.useSduiContextFromRoduxAndProcessConfigs(SearchLandingPage1, if FFlagLuaAppLayoutParamsInContext then UseCollectionLayoutConfigResult else nil)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: FetchStatusReducer (upval), FetchStatusNamespace (upval), SearchLandingPageSession (upval), RetrievalStatus (upval)
		return p2.Personalization[FetchStatusReducer.key][FetchStatusNamespace.SearchLandingPage][SearchLandingPageSession:Get()] or RetrievalStatus.NotStarted
	end)
	
	return if ReactModule.useMemo(function()
		-- upvalues: AllItems (copy), RetrievalStatus (upval), UseSelectorResult1 (copy)
		return if next(AllItems) == nil then UseSelectorResult1 else RetrievalStatus.Done
	end, { UseSelectorResult1, AllItems }) == RetrievalStatus.Done then ReactModule.createElement(Focusable.Frame, {
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p1.layoutOrder,
		Size = p1.size or UDim2.new(1, 0, 1, 0),
		AnchorPoint = Vector2.new(0.5, 0),
		Position = p1.position or UDim2.new(0.5, 0, 0, 0),
		BackgroundColor3 = SearchTokens.backgroundContainer.backgroundColor3,
		BackgroundTransparency = SearchTokens.backgroundContainer.backgroundTransparency
	}, {
		SearchOmniAutocompleteFeedView = ReactModule.createElement(OmniFeedViewLoadMoreModule, {
			impressionsTag = "SEARCHLANDINGPAGE_FEEDITEM_IMPRESSIONS",
			createEndOfScrollElement = false,
			scrollBarThickness = 0,
			pageContext = AppPage.SearchLandingPage,
			refresh = UseResult1,
			omniFeedItems = AllItems,
			scrollingFrameRef = if FFlagLuaAppLayoutParamsInContext then UseResult else ScrollingFrameRef,
			analyticsContext = DiscoveryAnalyticsModule.Constants.Context.ExperienceTile,
			topPadding = SearchTokens.searchLandingPage.topPadding,
			bottomPadding = SearchTokens.searchLandingPage.bottomPadding,
			onAbsoluteContentSizeChanged = OnAbsoluteContentSizeChanged,
			sduiContext = UseSduiContextFromRoduxAndProcessConfigsResult,
			defaultContainerSize = p1.defaultContainerSize
		})
	}) else ReactModule.createElement(SearchLandingPageSkeletonModule, {
		Size = p1.size,
		LayoutOrder = p1.layoutOrder,
		onAbsoluteContentSizeChanged = OnAbsoluteContentSizeChanged,
		topPadding = SearchTokens.searchLandingPage.topPadding,
		bottomPadding = SearchTokens.searchLandingPage.bottomPadding,
		isCompactView = p1.isCompactView,
		defaultContainerSize = p1.defaultContainerSize
	})
end

return SearchLandingPage