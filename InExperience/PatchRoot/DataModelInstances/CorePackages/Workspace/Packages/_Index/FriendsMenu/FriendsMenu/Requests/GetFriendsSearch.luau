local url = require(script:FindFirstAncestor("FriendsMenu").Parent.Http).Url

return function(p0, p1, p2, p3, p4)
	-- upvalues: url (ref)
	return p0(string.format("%s/users/%s/friends/search?%s", url.FRIEND_URL, p1, url:makeQueryString({ query = p2, cursor = p4, limit = p3 })), "GET")
end