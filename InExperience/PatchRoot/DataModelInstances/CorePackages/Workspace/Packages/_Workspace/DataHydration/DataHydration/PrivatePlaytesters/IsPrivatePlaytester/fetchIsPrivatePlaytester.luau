local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

local function _(p0, p1)
	return ("%s/universes/v1/universes/%d/is-private-playtester"):format(p0, p1)
end

return function(p2, p3)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p3 = p3 or {}
	
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "universe-private-playtester.get",
		network = p3.network,
		url = ("%s/universes/v1/universes/%d/is-private-playtester"):format(p3.baseUrl or urlBase.APIS, p2),
		decode = function(p4)
			return p4
		end
	}))
end