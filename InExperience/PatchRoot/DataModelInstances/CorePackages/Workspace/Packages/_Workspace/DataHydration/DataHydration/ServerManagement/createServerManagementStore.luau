local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchServerManagementModule = require(script.Parent.fetchServerManagement)
local _ = require(script.Parent.ServerManagementStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchServerManagementModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchServerManagementModule (copy), t (ref)
		return fetchServerManagementModule.fetchListRestartStatuses(p2, t)
	end)
	local var2 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchServerManagementModule (copy), t (ref)
		return fetchServerManagementModule.fetchForecastRestart(p2, t)
	end)
	
	return {
		getRestartStatuses = var1.get,
		fetchRestartStatuses = var1.fetch,
		getAndFetchRestartStatuses = var1.getAndFetch,
		getForecast = var2.get,
		fetchForecast = var2.fetch,
		getAndFetchForecast = var2.getAndFetch,
		launchRestart = function(p2, p3)
			-- upvalues: fetchServerManagementModule (copy), t (ref), var1 (ref)
			return fetchServerManagementModule.launchRestart(p2, p3, t):andThen(function(p4)
				-- upvalues: var1 (copy), p2 (ref)
				var1.fetch(p2)
				
				return p4
			end)
		end,
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