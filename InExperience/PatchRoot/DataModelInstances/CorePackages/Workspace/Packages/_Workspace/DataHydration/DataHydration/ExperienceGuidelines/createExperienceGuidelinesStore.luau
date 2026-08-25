local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchExperienceGuidelinesModule = require(script.Parent.fetchExperienceGuidelines)
local syncGuidelinesAgeToGameStores = require(script.Parent.syncGuidelinesAgeToGameStores).syncGuidelinesAgeToGameStores
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return function(p0)
	-- upvalues: createSingleEntityResolverModule (ref), fetchExperienceGuidelinesModule (ref), syncGuidelinesAgeToGameStores (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1)
		-- upvalues: fetchExperienceGuidelinesModule (copy), t (ref), syncGuidelinesAgeToGameStores (copy)
		return fetchExperienceGuidelinesModule.fetchDetailedGuidelines(p1, t):andThen(function(p2)
			-- upvalues: syncGuidelinesAgeToGameStores (copy), p1 (ref)
			syncGuidelinesAgeToGameStores(p1, p2)
			
			return p2
		end)
	end)
	
	return {
		getDetailedGuidelines = var5.get,
		fetchDetailedGuidelines = var5.fetch,
		refreshDetailedGuidelines = function(p3)
			-- upvalues: fetchExperienceGuidelinesModule (copy), t (ref), var5 (ref), syncGuidelinesAgeToGameStores (copy)
			return fetchExperienceGuidelinesModule.fetchDetailedGuidelines(p3, t):andThen(function(p4)
				-- upvalues: var5 (copy), p3 (ref), syncGuidelinesAgeToGameStores (copy)
				var5.cache.replaceItem(tostring(p3), p4)
				syncGuidelinesAgeToGameStores(p3, p4)
				
				return p4
			end)
		end,
		getAndFetchDetailedGuidelines = var5.getAndFetch,
		updateDetailedGuidelines = function(p5, p6)
			-- upvalues: var5 (ref), syncGuidelinesAgeToGameStores (copy)
			var5.update(p5, p6)
			syncGuidelinesAgeToGameStores(p5, p6)
		end,
		clear = var5.clear,
		dispose = var5.dispose
	}
end