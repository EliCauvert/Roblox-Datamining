local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local t = {}

return function(p0, p1)
	-- upvalues: t (ref), url (ref), promiseModule (ref)
	if t[p1] then
		return t[p1]
	end
	t[p1] = p0(string.format("%sv1/games?universeIds=%s", url.GAME_URL, tostring(p1)), "GET"):andThen(function(p2)
		-- upvalues: promiseModule (copy)
		if not p2.responseBody or not p2.responseBody.data then
			promiseModule.reject("Unexpected response when fetching game name")
		end
		local var2 = p2.responseBody.data[1]
		
		if not var2 or not var2.name then
			promiseModule.reject("Unexpected response when fetching game name, no game info")
		end
		return promiseModule.resolve({
			Name = var2.name,
			Description = var2.description or "",
			Created = var2.created
		})
	end, function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
	
	return t[p1]
end