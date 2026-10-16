local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local HttpModule = require(Parent.Http)
local UrlBuilderModule = require(Parent.UrlBuilder)
local _ = require(script.Parent.Parent.FriendsRequestsStoreTypes)
local FFlagAddFriendsSessionId = require(Parent.SharedFlags).FFlagAddFriendsSessionId
local FFlagAddFriendsPageHighlightUnseenRequests = require(Parent.SharedFlags).FFlagAddFriendsPageHighlightUnseenRequests
local FFlagFriendsRequestsRemoveRedundantParamsModule = require(DataHydration.Flags.FFlagFriendsRequestsRemoveRedundantParams)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(Cursor, Limit, p1) --[[ Line: 22 ]]
	-- upvalues: UrlBuilderModule (copy), HttpModule (copy), FFlagFriendsRequestsRemoveRedundantParamsModule (copy), FFlagAddFriendsPageHighlightUnseenRequests (copy), FFlagAddFriendsSessionId (copy), FetchFunction (copy), AsPromiseFunction (copy)
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "friends.get-friend-requests",
		url = UrlBuilderModule.UrlBuilder.addQueryString(`{HttpModule.Url.FRIEND_URL}/my/friends/requests`, {
			sortOrder = if FFlagFriendsRequestsRemoveRedundantParamsModule then nil else "Desc",
			fetchMutualFriends = if FFlagFriendsRequestsRemoveRedundantParamsModule then nil else "true",
			limit = Limit,
			cursor = Cursor,
			uprankUnseen = if FFlagAddFriendsPageHighlightUnseenRequests then "true" else nil,
			sessionId = if FFlagAddFriendsSessionId then p1 else nil
		}),
		decode = function(p2) --[[ Line: 40 ]]
			return p2
		end
	})))
end