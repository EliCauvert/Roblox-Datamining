local Url = require(script:FindFirstAncestor("AuthCommon").Parent.Http).Url

return function(Callback, p1)
	-- upvalues: Url (copy)
	return Callback(string.format("%sv2/games/%s/media", Url.GAME_URL, p1), "GET")
end