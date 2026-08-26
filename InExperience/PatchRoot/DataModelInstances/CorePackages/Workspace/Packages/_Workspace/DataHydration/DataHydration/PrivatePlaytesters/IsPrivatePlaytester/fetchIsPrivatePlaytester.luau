local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p1, p2)
	return ("%s/universes/v1/universes/%d/is-private-playtester"):format(p1, p2)
end

return function(p1, p2)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p2 = p2 or {}
	
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "universe-private-playtester.get",
		network = p2.network,
		url = ("%s/universes/v1/universes/%d/is-private-playtester"):format(p2.baseUrl or urlBase.APIS, p1),
		decode = function(p3)
			return p3
		end
	}))
end