local HttpClientModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchMomentsByIdsModule = require(script.Parent.Requests.fetchMomentsByIds)

return function(p1)
	-- upvalues: HttpClientModule (copy), FetchMomentsByIdsModule (copy)
	local P0 = p1 or {}
	
	return {
		getMomentsByIds = function(p2, p3)
			-- upvalues: HttpClientModule (upval), FetchMomentsByIdsModule (upval), P0 (copy)
			return HttpClientModule.asPromise(FetchMomentsByIdsModule(p2, P0.network, p3))
		end
	}
end