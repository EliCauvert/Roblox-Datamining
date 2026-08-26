local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p1, p2)
	-- upvalues: url (ref)
	return p1(string.format("%sv2/games/%s/media", url.GAME_URL, p2), "GET")
end