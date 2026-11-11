local Url = require(script:FindFirstAncestor("DiscoveryMonolith").Parent.Http).Url

return function(Callback, p1)
	-- upvalues: Url (copy)
	assert(typeof(p1) == "string", "universe has to be a string")
	
	return Callback(string.format("%sv2/games/%s/media", Url.GAME_URL, p1), "GET")
end