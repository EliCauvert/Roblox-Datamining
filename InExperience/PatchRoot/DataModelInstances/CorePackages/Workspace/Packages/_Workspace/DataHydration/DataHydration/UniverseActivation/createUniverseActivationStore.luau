local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseActivationModule = require(script.Parent.fetchUniverseActivation)
local _ = require(script.Parent.UniverseActivationStoreTypes)

return function(p0) --[[ line: 20 | named "createUniverseActivationStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseActivationModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 24 ]]
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchEligibility(p1, t)
	end)
	local var6 = createSingleEntityResolverModule(function(p2) --[[ line: 27 ]]
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchAudiences(p2, t)
	end)
	
	return {
		getEligibility = var5.get,
		fetchEligibility = var5.fetch,
		getAndFetchEligibility = var5.getAndFetch,
		updateEligibility = var5.update,
		activate = function(p3, p4) --[[ line: 31 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var5 (ref)
			return fetchUniverseActivationModule.activate(p3, p4, t):andThen(function(p5) --[[ line: 32 ]]
				-- upvalues: var5 (copy), p3 (ref)
				var5.fetch(p3)
				
				return p5
			end)
		end,
		deactivate = function(p6) --[[ line: 38 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var5 (ref)
			return fetchUniverseActivationModule.deactivate(p6, t):andThen(function(p7) --[[ line: 39 ]]
				-- upvalues: var5 (copy), p6 (ref)
				var5.fetch(p6)
				
				return p7
			end)
		end,
		setAudiences = function(value, p8) --[[ line: 45 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var6 (ref)
			return fetchUniverseActivationModule.setAudiences(value, p8, t):andThen(function(p9) --[[ line: 48 ]]
				-- upvalues: var6 (copy), value (ref)
				var6.update(value, p9)
				
				return p9
			end)
		end,
		getAudiences = var6.get,
		fetchAudiences = var6.fetch,
		getAndFetchAudiences = var6.getAndFetch,
		clear = function() --[[ line: 54 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.clear()
			var6.clear()
		end,
		dispose = function() --[[ line: 59 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.dispose()
			var6.dispose()
		end
	}
end