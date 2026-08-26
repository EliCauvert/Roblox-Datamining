local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchExperienceGuidelinesModule = require(script.Parent.fetchExperienceGuidelines)
local syncGuidelinesAgeToGameStores = require(script.Parent.syncGuidelinesAgeToGameStores).syncGuidelinesAgeToGameStores
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchExperienceGuidelinesModule (ref), syncGuidelinesAgeToGameStores (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceGuidelinesModule (copy), t (ref), syncGuidelinesAgeToGameStores (copy)
		return fetchExperienceGuidelinesModule.fetchDetailedGuidelines(p2, t):andThen(function(p3)
			-- upvalues: syncGuidelinesAgeToGameStores (copy), p2 (ref)
			syncGuidelinesAgeToGameStores(p2, p3)
			
			return p3
		end)
	end)
	
	return {
		getDetailedGuidelines = var1.get,
		fetchDetailedGuidelines = var1.fetch,
		refreshDetailedGuidelines = function(p2)
			-- upvalues: fetchExperienceGuidelinesModule (copy), t (ref), var1 (ref), syncGuidelinesAgeToGameStores (copy)
			return fetchExperienceGuidelinesModule.fetchDetailedGuidelines(p2, t):andThen(function(p3)
				-- upvalues: var1 (copy), p2 (ref), syncGuidelinesAgeToGameStores (copy)
				var1.cache.replaceItem(tostring(p2), p3)
				syncGuidelinesAgeToGameStores(p2, p3)
				
				return p3
			end)
		end,
		getAndFetchDetailedGuidelines = var1.getAndFetch,
		updateDetailedGuidelines = function(p2, p3)
			-- upvalues: var1 (ref), syncGuidelinesAgeToGameStores (copy)
			var1.update(p2, p3)
			syncGuidelinesAgeToGameStores(p2, p3)
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end