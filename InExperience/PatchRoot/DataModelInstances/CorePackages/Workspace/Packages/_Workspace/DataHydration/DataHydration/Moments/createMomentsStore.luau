local httpClientModule = require(script:FindFirstAncestor("DataHydration").Parent.HttpClient)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchMomentsByIdsModule = require(script.Parent.Requests.fetchMomentsByIds)

return function(p0) --[[ line: 13 | named "createMomentsStore" ]]
	-- upvalues: httpClientModule (ref), fetchMomentsByIdsModule (ref)
	p0 = p0 or {}
	
	return {
		getMomentsByIds = function(p1) --[[ line: 16 ]]
			-- upvalues: httpClientModule (copy), fetchMomentsByIdsModule (copy), p0 (ref)
			return httpClientModule.asPromise(fetchMomentsByIdsModule(p1, p0.network))
		end
	}
end