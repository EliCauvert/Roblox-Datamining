local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local urlBuilderModule = require(parent.UrlBuilder)
local _ = require(script.Parent.Parent.FriendsRecommendationsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p0, p1) --[[ line: 16 ]]
	-- upvalues: urlBuilderModule (ref), httpModule (ref), fetch (ref), asPromise (ref)
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "friends.get-friend-recommendations",
		url = urlBuilderModule.UrlBuilder.addQueryString(`{httpModule.Url.FRIEND_URL}/users/{p0}/friends/recommendations`, { source = p1 }),
		decode = function(p2) --[[ line: 29 ]]
			return p2
		end
	}))
end