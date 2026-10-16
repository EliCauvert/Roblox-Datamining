local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local Url = require(Parent.Http).Url

return function(List) --[[ Line: 11 | Named "requestGameDetails" ]]
	-- upvalues: Url (copy), HttpRequestModule (copy)
	return HttpRequestModule.config({
		requestFunction = function(p1, p2, p3) --[[ Line: 17 ]]
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end
	})(string.format("%sv1/games?universeIds=%s", Url.GAME_URL, (table.concat(List, ","))), "GET")
end