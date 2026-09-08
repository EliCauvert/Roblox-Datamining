local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local httpModule = require(parent.Http)
local urlBuilderModule = require(parent.UrlBuilder)
local _ = require(script.Parent.Parent.FriendsRequestsStoreTypes)
local fFlagAddFriendsSessionId = require(parent.SharedFlags).FFlagAddFriendsSessionId
local fFlagAddFriendsPageHighlightUnseenRequests = require(parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2, p3)
	-- upvalues: urlBuilderModule (ref), httpModule (ref), fFlagAddFriendsPageHighlightUnseenRequests (ref), fFlagAddFriendsSessionId (ref), fetch (ref), asPromise (ref)
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "friends.get-friend-requests",
		url = urlBuilderModule.UrlBuilder.addQueryString(`{httpModule.Url.FRIEND_URL}/my/friends/requests`, {
			sortOrder = "Desc",
			fetchMutualFriends = "true",
			limit = p2,
			cursor = p1,
			uprankUnseen = if fFlagAddFriendsPageHighlightUnseenRequests then "true" else nil,
			sessionId = if fFlagAddFriendsSessionId then p3 else nil
		}),
		decode = function(p4)
			return p4
		end
	}))
end