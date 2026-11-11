local HttpService = game:GetService("HttpService")
local CorePackages = game:GetService("CorePackages")
local SearchGetOmniSearchFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Http.Requests.SearchGetOmniSearch
local PromiseModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Promise)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local HandleUserSearchResultsModule = require(script.Parent.Parent.Thunks.HandleUserSearchResults)
local UsersError = require(CorePackages.Packages.enumerate)("UsersError", {
	Unknown = 0,
	TooManyIds = 1,
	TooManyUsernames = 2,
	InvalidUserId = 3,
	TooManyRequests = 4,
	KeywordFiltered = 5,
	KeywordTooShort = 6
})

local function _(Text): string
	return "luaapp.users.playersearch." .. Text
end

return {
	Fetch = function(p1, p2)
		-- upvalues: PerformFetch (copy), PromiseModule (copy), SearchGetOmniSearchFunction (copy), HandleUserSearchResultsModule (copy), HttpService (copy), UsersError (copy)
		local Keyword = p2.keyword
		
		return PerformFetch.Single("luaapp.users.playersearch." .. Keyword, function(p3)
			-- upvalues: Keyword (copy), PromiseModule (upval), SearchGetOmniSearchFunction (upval), p1 (copy), p2 (copy), HandleUserSearchResultsModule (upval), HttpService (upval), UsersError (upval)
			local UsersSearchResult = p3:getState().UsersSearchResults[Keyword]
			local NextPageCursor = UsersSearchResult and UsersSearchResult.nextPageCursor or nil
			
			return if NextPageCursor == "EndOfPlayerSearch" then PromiseModule.resolve("Data has been already fetched") else SearchGetOmniSearchFunction(p1, {
				verticalType = "user",
				searchQuery = Keyword,
				pageToken = NextPageCursor,
				sessionId = p2.searchUuid,
				globalSessionId = p2.omniSearchUuid
			}):andThen(function(Result)
				-- upvalues: Keyword (upval), p2 (upval), NextPageCursor (copy), p3 (copy), HandleUserSearchResultsModule (upval), p1 (upval)
				return p3:dispatch(HandleUserSearchResultsModule(p1, {
					searchKeyword = Keyword,
					searchUuid = p2.searchUuid,
					curPageCursor = NextPageCursor
				}, Result))
			end, function(p4)
				-- upvalues: HttpService (upval), UsersError (upval), PromiseModule (upval)
				return if p4.Body and UsersError.fromRawValue(HttpService:JSONDecode(p4.Body).errors[1].code) == UsersError.KeywordFiltered then PromiseModule.resolve() else PromiseModule.reject(p4)
			end)
		end)
	end,
	GetFetchingStatus = function(p1, Text)
		-- upvalues: PerformFetch (copy)
		return PerformFetch.GetStatus(p1, "luaapp.users.playersearch." .. Text)
	end
}