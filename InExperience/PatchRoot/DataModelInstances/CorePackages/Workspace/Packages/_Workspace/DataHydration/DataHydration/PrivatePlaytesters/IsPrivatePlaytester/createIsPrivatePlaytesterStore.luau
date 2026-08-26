local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchIsPrivatePlaytesterModule = require(script.Parent.fetchIsPrivatePlaytester)
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchIsPrivatePlaytesterModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchIsPrivatePlaytesterModule (copy), t (ref)
		return fetchIsPrivatePlaytesterModule(p2, t)
	end)
	
	return {
		get = var1.get,
		fetch = var1.fetch,
		getAndFetch = var1.getAndFetch,
		update = var1.update,
		clear = var1.clear,
		dispose = var1.dispose
	}
end