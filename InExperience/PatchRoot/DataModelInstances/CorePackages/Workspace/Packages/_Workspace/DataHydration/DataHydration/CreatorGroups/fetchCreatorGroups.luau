local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.CreatorGroupsStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

return function(p1, p2)
	-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local P1 = p2 or {}
	
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "creator-home.groups",
		network = P1.network,
		url = ("%s/creator-home-api/v1/groups?surface=%s"):format(P1.baseUrl or UrlBase.APIS, p1),
		decode = function(p3)
			return p3
		end
	})))
end