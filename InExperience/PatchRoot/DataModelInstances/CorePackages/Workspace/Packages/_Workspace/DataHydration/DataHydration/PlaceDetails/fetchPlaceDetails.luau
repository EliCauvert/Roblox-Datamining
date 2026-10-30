local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local Url = require(Parent.Http).Url
local _ = require(script.Parent.PlaceDetailsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, List): string
	return ("%sv1/games/multiget-place-details?placeIds=%s"):format(p1, table.concat(List, "&placeIds="))
end

return function(List, p1)
	-- upvalues: FetchFunction (copy), Url (copy), AsPromiseFunction (copy)
	local P1 = p1 or {}
	
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "place-details.multiget",
		legacy = true,
		network = P1.network,
		url = ("%sv1/games/multiget-place-details?placeIds=%s"):format(P1.baseUrl or Url.GAME_URL, table.concat(List, "&placeIds=")),
		decode = function(p2)
			return p2
		end
	})))
end