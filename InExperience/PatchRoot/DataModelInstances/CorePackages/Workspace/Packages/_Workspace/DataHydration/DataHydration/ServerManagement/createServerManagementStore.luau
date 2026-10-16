local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchServerManagementModule = require(script.Parent.fetchServerManagement)
local _ = require(script.Parent.ServerManagementStoreTypes)

return function(p1) --[[ Line: 21 | Named "createServerManagementStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchServerManagementModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 25 ]]
		-- upvalues: FetchServerManagementModule (upval), config (copy)
		return FetchServerManagementModule.fetchListRestartStatuses(p2, config)
	end)
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 28 ]]
		-- upvalues: FetchServerManagementModule (upval), config (copy)
		return FetchServerManagementModule.fetchForecastRestart(p2, config)
	end)
	
	return {
		getRestartStatuses = SingleEntityResolverModule.get,
		fetchRestartStatuses = SingleEntityResolverModule.fetch,
		getAndFetchRestartStatuses = SingleEntityResolverModule.getAndFetch,
		getForecast = SingleEntityResolverModule1.get,
		fetchForecast = SingleEntityResolverModule1.fetch,
		getAndFetchForecast = SingleEntityResolverModule1.getAndFetch,
		launchRestart = function(p2, p3) --[[ Line: 32 ]]
			-- upvalues: FetchServerManagementModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchServerManagementModule.launchRestart(p2, p3, config):andThen(function(Result) --[[ Line: 33 ]]
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.fetch(p2)
				
				return Result
			end)
		end,
		clear = function() --[[ Line: 40 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
		end,
		dispose = function() --[[ Line: 45 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy)
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
		end
	}
end