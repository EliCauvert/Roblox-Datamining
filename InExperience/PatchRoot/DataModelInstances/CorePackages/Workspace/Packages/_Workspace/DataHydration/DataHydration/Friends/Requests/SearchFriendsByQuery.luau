local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local UrlBuilderModule = require(Parent.UrlBuilder)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, p2)
	-- upvalues: PromiseModule (copy), FetchFunction (copy), UrlBuilderModule (copy), HttpModule (copy), AsPromiseFunction (copy)
	return if p1 == nil or tostring(p1) == "" then PromiseModule.reject("SearchFriendsByQuery called with nil userId") else AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "friends.search-friends",
		url = UrlBuilderModule.UrlBuilder.addQueryString(`{HttpModule.Url.FRIEND_URL}/users/{p1}/friends/search`, { query = p2.query, limit = p2.limit, cursor = p2.cursor }),
		decode = function(p3)
			return p3
		end
	})))
end