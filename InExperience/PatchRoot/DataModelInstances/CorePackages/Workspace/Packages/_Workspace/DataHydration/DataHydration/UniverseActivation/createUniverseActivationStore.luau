local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchUniverseActivationModule = require(script.Parent.fetchUniverseActivation)
local _ = require(script.Parent.UniverseActivationStoreTypes)

return function(p1) --[[ Line: 19 | Named "createUniverseActivationStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchUniverseActivationModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 23 ]]
		-- upvalues: FetchUniverseActivationModule (upval), config (copy)
		return FetchUniverseActivationModule.fetchEligibility(p2, config)
	end)
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 26 ]]
		-- upvalues: FetchUniverseActivationModule (upval), config (copy)
		return FetchUniverseActivationModule.fetchAudiences(p2, config)
	end)
	
	return {
		getEligibility = SingleEntityResolverModule.get,
		fetchEligibility = SingleEntityResolverModule.fetch,
		getAndFetchEligibility = SingleEntityResolverModule.getAndFetch,
		refreshEligibility = function(p2) --[[ Line: 32 ]]
			-- upvalues: FetchUniverseActivationModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchUniverseActivationModule.fetchEligibility(p2, config):andThen(function(Result) --[[ Line: 35 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.cache.replaceItem(tostring(p2), Result)
				
				return Result
			end)
		end,
		updateEligibility = SingleEntityResolverModule.update,
		activate = function(p2, p3) --[[ Line: 41 ]]
			-- upvalues: FetchUniverseActivationModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchUniverseActivationModule.activate(p2, p3, config):andThen(function(Result) --[[ Line: 42 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.fetch(p2)
				
				return Result
			end)
		end,
		deactivate = function(p2) --[[ Line: 48 ]]
			-- upvalues: FetchUniverseActivationModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchUniverseActivationModule.deactivate(p2, config):andThen(function(Result) --[[ Line: 49 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.fetch(p2)
				
				return Result
			end)
		end,
		setAudiences = function(p2, p3) --[[ Line: 55 ]]
			-- upvalues: FetchUniverseActivationModule (upval), config (copy), SingleEntityResolverModule1 (copy)
			return FetchUniverseActivationModule.setAudiences(p2, p3, config):andThen(function(Result) --[[ Line: 58 ]]
				-- upvalues: SingleEntityResolverModule1 (upval), p2 (copy)
				SingleEntityResolverModule1.update(p2, Result)
				
				return Result
			end)
		end,
		getAudiences = SingleEntityResolverModule1.get,
		fetchAudiences = SingleEntityResolverModule1.fetch,
		getAndFetchAudiences = SingleEntityResolverModule1.getAndFetch,
		clear = function() --[[ Line: 64 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
		end,
		dispose = function() --[[ Line: 69 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
		end
	}
end