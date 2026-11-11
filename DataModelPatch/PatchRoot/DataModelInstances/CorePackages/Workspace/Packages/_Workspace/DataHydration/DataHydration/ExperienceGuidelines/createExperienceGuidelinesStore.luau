local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchExperienceGuidelinesModule = require(script.Parent.fetchExperienceGuidelines)
local SyncGuidelinesAgeToGameStoresFunction = require(script.Parent.syncGuidelinesAgeToGameStores).syncGuidelinesAgeToGameStores
local _ = require(script.Parent.ExperienceGuidelinesStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchExperienceGuidelinesModule (copy), SyncGuidelinesAgeToGameStoresFunction (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchExperienceGuidelinesModule (upval), config (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
		return FetchExperienceGuidelinesModule.fetchDetailedGuidelines(p2, config):andThen(function(Result)
			-- upvalues: SyncGuidelinesAgeToGameStoresFunction (upval), p2 (copy)
			SyncGuidelinesAgeToGameStoresFunction(p2, Result)
			
			return Result
		end)
	end)
	
	return {
		getDetailedGuidelines = SingleEntityResolverModule.get,
		fetchDetailedGuidelines = SingleEntityResolverModule.fetch,
		getAndFetchDetailedGuidelines = SingleEntityResolverModule.getAndFetch,
		updateDetailedGuidelines = function(p2, p3)
			-- upvalues: SingleEntityResolverModule (copy), SyncGuidelinesAgeToGameStoresFunction (upval)
			SingleEntityResolverModule.update(p2, p3)
			SyncGuidelinesAgeToGameStoresFunction(p2, p3)
		end,
		clear = SingleEntityResolverModule.clear,
		dispose = SingleEntityResolverModule.dispose
	}
end