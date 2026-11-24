local SearchResults = script:FindFirstAncestor("SearchResults")
local Parent = SearchResults.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiTemplateStoreFunction = SduiSharedUtilitiesModule.getSduiTemplateStore
local AddSystemInfoToArgsFunction = require(Parent.DiscoveryUtils).AddSystemInfoToArgs
local GetSearchViewportSizeFunction = require(Parent.DiscoveryUtils).getSearchViewportSize
local GetSearchResultsPageUrlModule = require(script.Parent.getSearchResultsPageUrl)
local GetSearchResultsPageConfigKeyModule = require(script.Parent.getSearchResultsPageConfigKey)
local FFlagSearchEmphasisViewportSduiModule = require(SearchResults.Flags.FFlagSearchEmphasisViewportSdui)
local self = nil

local function getViewportSnapshot(ConfigKey)
	-- upvalues: self (ref), GetSduiApiStoreFunction (copy), GetSearchViewportSizeFunction (copy)
	if self == nil then
		self = setmetatable({}, { __mode = "k" })
	end
	local v1 = self
	local Data = GetSduiApiStoreFunction().getData(ConfigKey)
	local v2 = v1[Data]
	
	if v2 ~= nil then
		return v2
	end
	local SearchViewportSize = GetSearchViewportSizeFunction()
	
	if SearchViewportSize ~= nil then
		v1[Data] = SearchViewportSize
	end
	return SearchViewportSize
end

local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSduiSearchClientTemplateCache = SharedFlagsModule.FFlagSduiSearchClientTemplateCache
local FFlagSduiSearchGuidedPills = SharedFlagsModule.FFlagSduiSearchGuidedPills
local SduiSearchGuidedPillScopeModule = require(script.Parent.GuidedPill.SduiSearchGuidedPillScope)

local function buildPostBody(SearchQuery, SessionId, GlobalSessionId, CachedRobloxComponentToTemplateId, Vector, ConfigKey)
	-- upvalues: SduiSharedUtilitiesModule (copy), AddSystemInfoToArgsFunction (copy), FFlagSearchEmphasisViewportSduiModule (copy), FFlagSduiSearchClientTemplateCache (copy), FFlagSduiSearchGuidedPills (copy), SduiSearchGuidedPillScopeModule (copy)
	local config = {
		searchQuery = SearchQuery,
		sessionId = SessionId,
		globalSessionId = GlobalSessionId,
		clientCapabilities = SduiSharedUtilitiesModule.SduiCapabilities.buildClientCapabilities():jsonEncode()
	}
	AddSystemInfoToArgsFunction(config)
	
	if FFlagSearchEmphasisViewportSduiModule and Vector ~= nil then
		config.viewportWidth = Vector.X
		config.viewportHeight = Vector.Y
	end
	if FFlagSduiSearchClientTemplateCache and CachedRobloxComponentToTemplateId ~= nil and next(CachedRobloxComponentToTemplateId) ~= nil then
		config.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if FFlagSduiSearchGuidedPills and ConfigKey ~= nil then
		local SelectedOptionForRequest = SduiSearchGuidedPillScopeModule.getSelectedOptionForRequest(ConfigKey)
		
		if SelectedOptionForRequest ~= nil then
			local SuggestionsForRequest = SduiSearchGuidedPillScopeModule.getSuggestionsForRequest(ConfigKey)
			config.guidedSearchContext = {
				selectedOption = SelectedOptionForRequest,
				suggestions = if SuggestionsForRequest == nil or #SuggestionsForRequest <= 0 then nil else SuggestionsForRequest
			}
		end
	end
	return config
end

return function(SearchQuery, SessionId, GlobalSessionId, LoadTimer, p1)
	-- upvalues: FFlagSduiSearchClientTemplateCache (copy), GetSduiTemplateStoreFunction (copy), AppPage (copy), GetSearchResultsPageUrlModule (copy), GetSearchResultsPageConfigKeyModule (copy), FFlagSearchEmphasisViewportSduiModule (copy), getViewportSnapshot (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), SduiSharedUtilitiesModule (copy), buildPostBody (copy), FFlagSduiSearchGuidedPills (copy)
	local CachedRobloxComponentToTemplateId = if FFlagSduiSearchClientTemplateCache then GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.SearchPage) else nil
	local SearchResultsPageUrlModule = GetSearchResultsPageUrlModule(SearchQuery, SessionId, GlobalSessionId)
	local SearchResultsPageConfigKeyModule = GetSearchResultsPageConfigKeyModule(SessionId)
	local ViewportSnapshot = if FFlagSearchEmphasisViewportSduiModule then getViewportSnapshot(SearchResultsPageConfigKeyModule) else nil
	GetSduiApiStoreFunction().fetchIfNeeded({
		enableStreaming = true,
		responseType = SduiResponseType.Protobuf,
		url = SearchResultsPageUrlModule,
		surfaceKey = AppPage.SearchPage,
		configKey = SearchResultsPageConfigKeyModule,
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.search.search_results_page.GetSearchResultsPageResponse,
		enableTemplateCache = if FFlagSduiSearchClientTemplateCache then true else nil,
		mergeStrategy = SduiSharedUtilitiesModule.streamingFeedMergeStrategy,
		postConfig = {
			contentType = SduiSharedUtilitiesModule.SduiApiStorePostConfigContentType.Json,
			body = buildPostBody(SearchQuery, SessionId, GlobalSessionId, if FFlagSduiSearchClientTemplateCache then CachedRobloxComponentToTemplateId else nil, ViewportSnapshot, if FFlagSduiSearchGuidedPills then SearchResultsPageConfigKeyModule else nil)
		},
		buildRefreshPostBody = if FFlagSduiSearchGuidedPills then function()
			-- upvalues: buildPostBody (upval), SearchQuery (copy), SessionId (copy), GlobalSessionId (copy), FFlagSduiSearchClientTemplateCache (upval), GetSduiTemplateStoreFunction (upval), AppPage (upval), ViewportSnapshot (ref), FFlagSearchEmphasisViewportSduiModule (upval), getViewportSnapshot (upval), SearchResultsPageConfigKeyModule (copy)
			return (buildPostBody(SearchQuery, SessionId, GlobalSessionId, if FFlagSduiSearchClientTemplateCache then GetSduiTemplateStoreFunction().getCachedRobloxComponentToTemplateId(AppPage.SearchPage) else nil, ViewportSnapshot or (if FFlagSearchEmphasisViewportSduiModule then getViewportSnapshot(SearchResultsPageConfigKeyModule) else nil), SearchResultsPageConfigKeyModule))
		end else nil
	}, p1)
end