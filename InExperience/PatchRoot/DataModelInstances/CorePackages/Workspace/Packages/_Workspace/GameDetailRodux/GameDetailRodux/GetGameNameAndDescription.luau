local parent = script:FindFirstAncestor("GameDetailRodux").Parent
local promiseModule = require(parent.Promise)
local url = require(parent.Http).Url
local t = {}

return function(p1, p2)
	-- upvalues: t (ref), url (ref), promiseModule (ref)
	if t[p2] then
		return t[p2]
	end
	t[p2] = p1(string.format("%sv1/games?universeIds=%s", url.GAME_URL, tostring(p2)), "GET"):andThen(function(p3)
		-- upvalues: promiseModule (copy)
		if not p3.responseBody or not p3.responseBody.data then
			promiseModule.reject("Unexpected response when fetching game name")
		end
		local var1 = p3.responseBody.data[1]
		
		if not var1 or not var1.name then
			promiseModule.reject("Unexpected response when fetching game name, no game info")
		end
		return promiseModule.resolve({
			Name = var1.name,
			Description = var1.description or "",
			Created = var1.created
		})
	end, function(p3)
		-- upvalues: promiseModule (copy)
		return promiseModule.reject(p3)
	end)
	
	return t[p2]
end