local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchIsPrivatePlaytesterModule = require(script.Parent.fetchIsPrivatePlaytester)
local _ = require(script.Parent.IsPrivatePlaytesterStoreTypes)

return function(p0) --[[ line: 18 | named "createIsPrivatePlaytesterStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchIsPrivatePlaytesterModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 22 ]]
		-- upvalues: fetchIsPrivatePlaytesterModule (copy), t (ref)
		return fetchIsPrivatePlaytesterModule(p1, t)
	end)
	
	return {
		get = var5.get,
		fetch = var5.fetch,
		getAndFetch = var5.getAndFetch,
		update = var5.update,
		clear = var5.clear,
		dispose = var5.dispose
	}
end