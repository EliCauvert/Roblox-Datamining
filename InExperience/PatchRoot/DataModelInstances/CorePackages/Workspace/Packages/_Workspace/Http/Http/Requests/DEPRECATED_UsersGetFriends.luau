local urlModule = require(script.Parent.Parent.Url)

return function(p0, p1, p2)
	-- upvalues: urlModule (ref)
	return p0(string.format("%s/users/%s/friends?%s", urlModule.FRIEND_URL, p1, urlModule:makeQueryString({ userSort = p2 })), "GET")
end