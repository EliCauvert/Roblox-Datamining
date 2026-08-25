local url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(p0, p1)
	-- upvalues: url (ref)
	return p0(string.format("%sv2/games/%s/media", url.GAME_URL, p1), "GET")
end