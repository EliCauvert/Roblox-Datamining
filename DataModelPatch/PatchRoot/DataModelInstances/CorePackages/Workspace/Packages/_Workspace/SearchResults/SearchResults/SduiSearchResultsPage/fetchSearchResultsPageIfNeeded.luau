local Parent = script:FindFirstAncestor("SearchResults").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local SduiResponseType = SduiSharedUtilitiesModule.SduiResponseType
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSearchResultsPageUrlModule = require(script.Parent.getSearchResultsPageUrl)
local GetSearchResultsPageConfigKeyModule = require(script.Parent.getSearchResultsPageConfigKey)
local FFlagLuaAppEnableSearchStreamingEndpoint = require(Parent.SharedFlags).FFlagLuaAppEnableSearchStreamingEndpoint

return function(p1, p2, p3, LoadTimer, p4)
	-- upvalues: GetSearchResultsPageUrlModule (copy), GetSearchResultsPageConfigKeyModule (copy), Parent (copy), GetSduiApiStoreFunction (copy), SduiResponseType (copy), AppPage (copy), FFlagLuaAppEnableSearchStreamingEndpoint (copy), SduiSharedUtilitiesModule (copy)
	GetSduiApiStoreFunction().fetchIfNeeded({
		responseType = SduiResponseType.Protobuf,
		url = GetSearchResultsPageUrlModule(p1, p2, p3),
		surfaceKey = AppPage.SearchPage,
		configKey = GetSearchResultsPageConfigKeyModule(p2),
		loadTimer = LoadTimer,
		apiProto = require(Parent.ServiceContractsProto).apppageplatform.search.search_results_page.GetSearchResultsPageResponse,
		enableStreaming = if FFlagLuaAppEnableSearchStreamingEndpoint then true else nil,
		mergeStrategy = if FFlagLuaAppEnableSearchStreamingEndpoint then SduiSharedUtilitiesModule.streamingFeedMergeStrategy else nil
	}, p4)
end