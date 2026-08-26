local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseActivationModule = require(script.Parent.fetchUniverseActivation)
local _ = require(script.Parent.UniverseActivationStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseActivationModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchEligibility(p2, t)
	end)
	local var2 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchUniverseActivationModule (copy), t (ref)
		return fetchUniverseActivationModule.fetchAudiences(p2, t)
	end)
	
	return {
		getEligibility = var1.get,
		fetchEligibility = var1.fetch,
		getAndFetchEligibility = var1.getAndFetch,
		refreshEligibility = function(p2)
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var1 (ref)
			return fetchUniverseActivationModule.fetchEligibility(p2, t):andThen(function(p3)
				-- upvalues: var1 (copy), p2 (ref)
				var1.cache.replaceItem(tostring(p2), p3)
				
				return p3
			end)
		end,
		updateEligibility = var1.update,
		activate = function(p2, p3)
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var1 (ref)
			return fetchUniverseActivationModule.activate(p2, p3, t):andThen(function(p4)
				-- upvalues: var1 (copy), p2 (ref)
				var1.fetch(p2)
				
				return p4
			end)
		end,
		deactivate = function(p2)
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var1 (ref)
			return fetchUniverseActivationModule.deactivate(p2, t):andThen(function(p3)
				-- upvalues: var1 (copy), p2 (ref)
				var1.fetch(p2)
				
				return p3
			end)
		end,
		setAudiences = function(value, p2)
			-- upvalues: fetchUniverseActivationModule (copy), t (ref), var2 (ref)
			return fetchUniverseActivationModule.setAudiences(value, p2, t):andThen(function(p3)
				-- upvalues: var2 (copy), value (ref)
				var2.update(value, p3)
				
				return p3
			end)
		end,
		getAudiences = var2.get,
		fetchAudiences = var2.fetch,
		getAndFetchAudiences = var2.getAndFetch,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.dispose()
			var2.dispose()
		end
	}
end