local Url = require(script:FindFirstAncestor("FriendsMenu").Parent.Http).Url

return function(Callback, p1, Query, Limit, Cursor) --[[ Line: 6 ]]
	-- upvalues: Url (copy)
	return Callback(string.format("%s/users/%s/friends/search?%s", Url.FRIEND_URL, p1, (Url:makeQueryString({ query = Query, cursor = Cursor, limit = Limit }))), "GET")
end