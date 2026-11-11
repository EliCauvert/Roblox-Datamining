local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local ReportToDiagByCountryCodeFunction = require(Parent.Analytics).ReportToDiagByCountryCode
local PromiseModule = require(Parent.Promise)
local Modules = DiscoveryMonolith.Modules
local SetSearchInGamesStatusModule = require(Modules.LuaApp.Actions.SetSearchInGamesStatus)
local SearchRetrievalStatusModule = require(Modules.LuaApp.Enum.SearchRetrievalStatus)
local SearchGetOmniSearchModule = require(Modules.LuaApp.Http.Requests.SearchGetOmniSearch)
local HandleGameSearchResultsModule = require(Modules.LuaApp.Thunks.Search.HandleGameSearchResults)
local Number: number? = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"))

return function(p1, p2)
	-- upvalues: PromiseModule (copy), SearchRetrievalStatusModule (copy), SetSearchInGamesStatusModule (copy), SearchGetOmniSearchModule (copy), HandleGameSearchResultsModule (copy), ReportToDiagByCountryCodeFunction (copy), Number (copy)
	return function(p3)
		-- upvalues: p2 (copy), PromiseModule (upval), SearchRetrievalStatusModule (upval), SetSearchInGamesStatusModule (upval), SearchGetOmniSearchModule (upval), p1 (copy), HandleGameSearchResultsModule (upval), ReportToDiagByCountryCodeFunction (upval), Number (upval)
		local SearchKeyword = p2.searchKeyword
		local SearchUuid = p2.searchUuid
		
		if not SearchUuid then
			return PromiseModule.reject("Must have a searchUuid.")
		end
		if not SearchKeyword then
			return PromiseModule.reject("Must have a searchKeyword to search with.")
		end
		if p3:getState().RequestsStatus.SearchesInGamesStatus[SearchUuid] == SearchRetrievalStatusModule.Fetching then
			return PromiseModule.resolve("Search with Uuid " .. SearchUuid .. " has been debounced")
		end
		local config = {
			SearchQuery = SearchKeyword,
			SessionId = SearchUuid,
			PageType = "all",
			GlobalSessionId = p2.omniSearchUuid
		}
		
		if p2.isAppend then
			local SearchesInGame = p3:getState().Search.SearchesInGames[SearchUuid]
			assert(SearchesInGame, "Should always have SearchesInGames for searchUuid")
			config.PageToken = SearchesInGame.nextPageToken
		end
		p3:dispatch(SetSearchInGamesStatusModule(SearchUuid, SearchRetrievalStatusModule.Fetching))
		
		return SearchGetOmniSearchModule(p1, config):andThen(function(Result)
			-- upvalues: p3 (copy), HandleGameSearchResultsModule (upval), p1 (upval), p2 (upval), ReportToDiagByCountryCodeFunction (upval), Number (upval)
			local DispatchResult = p3:dispatch(HandleGameSearchResultsModule(p1, p2, Result))
			ReportToDiagByCountryCodeFunction("GamesList", "RoundTripTime", Result.responseTimeMs, Number)
			
			return DispatchResult
		end, function(p4)
			-- upvalues: p3 (copy), SetSearchInGamesStatusModule (upval), SearchUuid (copy), SearchRetrievalStatusModule (upval), PromiseModule (upval)
			p3:dispatch(SetSearchInGamesStatusModule(SearchUuid, SearchRetrievalStatusModule.Failed))
			
			return PromiseModule.reject(p4)
		end)
	end
end