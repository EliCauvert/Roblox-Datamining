local urlModule = require(script.Parent.Parent.Url)

return function(p1, p2, p3)
	-- upvalues: urlModule (ref)
	return p1(string.format("%s/users/%s/friends?%s", urlModule.FRIEND_URL, p2, urlModule:makeQueryString({ userSort = p3 })), "GET")
end