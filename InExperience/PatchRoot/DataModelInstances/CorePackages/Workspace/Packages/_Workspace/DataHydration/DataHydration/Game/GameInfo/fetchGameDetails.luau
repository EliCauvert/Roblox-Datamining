local parent = script:FindFirstAncestor("DataHydration").Parent
local httpRequestModule = require(parent.HttpRequest)
local url = require(parent.Http).Url

return function(p0) --[[ line: 11 | named "requestGameDetails" ]]
	-- upvalues: url (ref), httpRequestModule (ref)
	return httpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ line: 17 ]]
			-- upvalues: httpRequestModule (copy)
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(string.format("%sv1/games?universeIds=%s", url.GAME_URL, table.concat(p0, ",")), "GET")
end