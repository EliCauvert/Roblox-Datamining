local CorePackages = game:GetService("CorePackages")
local PromiseModule = require(CorePackages.Packages.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local SearchTypes = require(CorePackages.Workspace.Packages.RobloxAppEnums).SearchTypes
local Modules = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules
local SetSearchInGamesStatusFunction = Modules.LuaApp.Actions.SetSearchInGamesStatus
local SearchRetrievalStatus = Modules.LuaApp.Enum.SearchRetrievalStatus
local SearchGetOmniSearchFunction = Modules.LuaApp.Http.Requests.SearchGetOmniSearch
local HandleGameSearchResultsFunction = Modules.LuaApp.Thunks.Search.HandleGameSearchResults
local Modules1 = game:GetService("CoreGui").RobloxGui.Modules
local SetSearchTypeModule = require(Modules1.LuaApp.Actions.SetSearchType)
local OmniSearchVerticalTypeModule = require(Modules1.LuaApp.Enum.OmniSearchVerticalType)
local HandleUserSearchResultsModule = require(Modules1.LuaApp.Components.UserSearch.Thunks.HandleUserSearchResults)
local GetAutoFetchNameModule = require(Modules1.LuaApp.Thunks.Search.getAutoFetchName)

return function(p1, p2)
	-- upvalues: PerformFetch (copy), GetAutoFetchNameModule (copy), SetSearchInGamesStatusFunction (copy), SearchRetrievalStatus (copy), SearchGetOmniSearchFunction (copy), OmniSearchVerticalTypeModule (copy), SearchTypes (copy), SetSearchTypeModule (copy), HandleUserSearchResultsModule (copy), HandleGameSearchResultsFunction (copy), PromiseModule (copy)
	return PerformFetch.Single(GetAutoFetchNameModule(p2.searchKeyword), function(p3)
		-- upvalues: p2 (copy), SetSearchInGamesStatusFunction (upval), SearchRetrievalStatus (upval), SearchGetOmniSearchFunction (upval), p1 (copy), OmniSearchVerticalTypeModule (upval), SearchTypes (upval), SetSearchTypeModule (upval), HandleUserSearchResultsModule (upval), HandleGameSearchResultsFunction (upval), PromiseModule (upval)
		local config = {
			verticalType = "auto",
			searchQuery = p2.searchKeyword,
			sessionId = p2.searchUuid,
			globalSessionId = p2.omniSearchUuid
		}
		p3:dispatch(SetSearchInGamesStatusFunction(p2.searchUuid, SearchRetrievalStatus.Fetching))
		
		return SearchGetOmniSearchFunction(p1, config):andThen(function(Result)
			-- upvalues: OmniSearchVerticalTypeModule (upval), SearchTypes (upval), p3 (copy), SetSearchTypeModule (upval), p2 (upval), SetSearchInGamesStatusFunction (upval), SearchRetrievalStatus (upval), HandleUserSearchResultsModule (upval), p1 (upval), HandleGameSearchResultsFunction (upval)
			local Players = if Result.responseBody.vertical == OmniSearchVerticalTypeModule.User then SearchTypes.Players else SearchTypes.Games
			p3:dispatch(SetSearchTypeModule(p2.searchUuid, Players))
			
			if Players == SearchTypes.Players then
				p3:dispatch(SetSearchInGamesStatusFunction(p2.searchUuid, SearchRetrievalStatus.NotStarted))
				
				return p3:dispatch(HandleUserSearchResultsModule(p1, p2, Result))
			else
				return p3:dispatch(HandleGameSearchResultsFunction(p1, p2, Result))
			end
		end, function(p4)
			-- upvalues: p3 (copy), SetSearchInGamesStatusFunction (upval), p2 (upval), SearchRetrievalStatus (upval), PromiseModule (upval)
			p3:dispatch(SetSearchInGamesStatusFunction(p2.searchUuid, SearchRetrievalStatus.Failed))
			
			return PromiseModule.reject(p4)
		end)
	end)
end