local UrlModule = require(script.Parent.Parent.Url)

return function(Callback, p1, UserSort)
	-- upvalues: UrlModule (copy)
	return Callback(string.format("%s/users/%s/friends?%s", UrlModule.FRIEND_URL, p1, (UrlModule:makeQueryString({ userSort = UserSort }))), "GET")
end