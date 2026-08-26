local parent = script:FindFirstAncestor("DataHydration").Parent
local httpRequestModule = require(parent.HttpRequest)
local url = require(parent.Http).Url

return function(p1)
	-- upvalues: url (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})(string.format("%sv1/games/multiget-playability-status?universeIds=%s", url.GAME_URL, table.concat(p1, ",")), "GET")
end