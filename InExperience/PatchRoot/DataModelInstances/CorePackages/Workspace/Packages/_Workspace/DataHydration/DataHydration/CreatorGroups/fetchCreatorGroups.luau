local parent = script:FindFirstAncestor("DataHydration").Parent
local httpClientModule = require(parent.HttpClient)
local urlBase = require(parent.UrlBuilder).UrlBase
local _ = require(script.Parent.CreatorGroupsStoreTypes)
local fetch = httpClientModule.fetch
local asPromise = httpClientModule.asPromise

return function(p1, p2)
	-- upvalues: urlBase (ref), fetch (ref), asPromise (ref)
	p2 = p2 or {}
	
	return asPromise(fetch({
		method = "GET",
		analyticsKey = "creator-home.groups",
		network = p2.network,
		url = ("%s/creator-home-api/v1/groups?surface=%s"):format(p2.baseUrl or urlBase.APIS, p1),
		decode = function(p3)
			return p3
		end
	}))
end