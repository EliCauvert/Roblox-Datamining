local Parent = script:FindFirstAncestor("DataHydration").Parent
local HttpClientModule = require(Parent.HttpClient)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)
local FetchFunction = HttpClientModule.fetch
local AsPromiseFunction = HttpClientModule.asPromise

local function _(p1, p2): string
	return ("%s/universes/v1/universes/%d/is-private-playtester"):format(p1, p2)
end

return function(p1, p2)
	-- upvalues: UrlBase (copy), FetchFunction (copy), AsPromiseFunction (copy)
	local P3 = p2 or {}
	
	return AsPromiseFunction((FetchFunction({
		method = "GET",
		analyticsKey = "universe-private-playtester.get",
		network = P3.network,
		url = ("%s/universes/v1/universes/%d/is-private-playtester"):format(P3.baseUrl or UrlBase.APIS, p1),
		decode = function(p3)
			return p3
		end
	})))
end