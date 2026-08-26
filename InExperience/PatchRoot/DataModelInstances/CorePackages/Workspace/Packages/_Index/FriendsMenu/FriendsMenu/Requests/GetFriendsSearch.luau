local url = require(script:FindFirstAncestor("FriendsMenu").Parent.Http).Url

return function(p1, p2, p3, p4, p5)
	-- upvalues: url (ref)
	return p1(string.format("%s/users/%s/friends/search?%s", url.FRIEND_URL, p2, url:makeQueryString({ query = p3, cursor = p5, limit = p4 })), "GET")
end