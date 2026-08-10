local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseActivationModule = require(script.Parent.fetchUniverseActivation)
local _ = require(script.Parent.UniverseActivationStoreTypes)

return function(p0) --[[ line: 19 | named "createUniverseActivationStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseActivationModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 23 ]]
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchEligibility(p1, t)
	end)
	local var6 = createSingleEntityResolverModule(function(p2) --[[ line: 26 ]]
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchAudiences(p2, t)
	end)
	
	return {
		getEligibility = var5.get,
		fetchEligibility = var5.fetch,
		getAndFetchEligibility = var5.getAndFetch,
		refreshEligibility = function(p3) --[[ line: 32 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var5 (ref)
			return fetchUniverseActivationModule.fetchEligibility(p3, t):andThen(function(p4) --[[ line: 35 ]]
				-- upvalues: var5 (copy), p3 (ref)
				var5.cache.replaceItem(tostring(p3), p4)
				
				return p4
			end)
		end,
		updateEligibility = var5.update,
		activate = function(p5, p6) --[[ line: 41 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var5 (ref)
			return fetchUniverseActivationModule.activate(p5, p6, t):andThen(function(p7) --[[ line: 42 ]]
				-- upvalues: var5 (copy), p5 (ref)
				var5.fetch(p5)
				
				return p7
			end)
		end,
		deactivate = function(p8) --[[ line: 48 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var5 (ref)
			return fetchUniverseActivationModule.deactivate(p8, t):andThen(function(p9) --[[ line: 49 ]]
				-- upvalues: var5 (copy), p8 (ref)
				var5.fetch(p8)
				
				return p9
			end)
		end,
		setAudiences = function(value, p10) --[[ line: 55 ]]
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var6 (ref)
			return fetchUniverseActivationModule.setAudiences(value, p10, t):andThen(function(p11) --[[ line: 58 ]]
				-- upvalues: var6 (copy), value (ref)
				var6.update(value, p11)
				
				return p11
			end)
		end,
		getAudiences = var6.get,
		fetchAudiences = var6.fetch,
		getAndFetchAudiences = var6.getAndFetch,
		clear = function() --[[ line: 64 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.clear()
			var6.clear()
		end,
		dispose = function() --[[ line: 69 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.dispose()
			var6.dispose()
		end
	}
end