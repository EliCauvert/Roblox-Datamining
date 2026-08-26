local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local urlBuilderModule = require(parent.UrlBuilder)
local _ = require(script.Parent.Parent.FriendsRequestsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2)
	-- upvalues: urlBuilderModule (ref), httpModule (ref), fetch (ref), asPromise (ref)
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "friends.get-friend-requests",
		url = urlBuilderModule.UrlBuilder.addQueryString(`{httpModule.Url.FRIEND_URL}/my/friends/requests`, {
			sortOrder = "Desc",
			fetchMutualFriends = "true",
			limit = p2,
			cursor = p1
		}),
		decode = function(p3)
			return p3
		end
	}))
end