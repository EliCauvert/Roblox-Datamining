local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local UrlBuilderModule = require(Parent.UrlBuilder)
local _ = require(script.Parent.Parent.FriendsRecommendationsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, Source)
	-- upvalues: UrlBuilderModule (copy), HttpModule (copy), FetchFunction (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "friends.get-friend-recommendations",
		url = UrlBuilderModule.UrlBuilder.addQueryString(`{HttpModule.Url.FRIEND_URL}/users/{p1}/friends/recommendations`, { source = Source }),
		decode = function(p2)
			return p2
		end
	})))
end