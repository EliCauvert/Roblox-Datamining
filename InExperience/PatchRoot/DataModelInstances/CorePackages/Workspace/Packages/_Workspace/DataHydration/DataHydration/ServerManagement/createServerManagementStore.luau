local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchServerManagementModule = require(script.Parent.fetchServerManagement)
local _ = require(script.Parent.ServerManagementStoreTypes)

return function(p0) --[[ line: 22 | named "createServerManagementStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchServerManagementModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var5 = createSingleEntityResolverModule(function(p1) --[[ line: 26 ]]
		-- upvalues: fetchServerManagementModule (copy), t (ref)
		return fetchServerManagementModule.fetchListRestartStatuses(p1, t)
	end)
	local var6 = createSingleEntityResolverModule(function(p2) --[[ line: 29 ]]
		-- upvalues: fetchServerManagementModule (copy), t (ref)
		return fetchServerManagementModule.fetchForecastRestart(p2, t)
	end)
	
	return {
		getRestartStatuses = var5.get,
		fetchRestartStatuses = var5.fetch,
		getAndFetchRestartStatuses = var5.getAndFetch,
		getForecast = var6.get,
		fetchForecast = var6.fetch,
		getAndFetchForecast = var6.getAndFetch,
		launchRestart = function(p3, p4) --[[ line: 33 ]]
			-- upvalues: fetchServerManagementModule (copy), t (ref), var5 (ref)
			return fetchServerManagementModule.launchRestart(p3, p4, t):andThen(function(p5) --[[ line: 34 ]]
				-- upvalues: var5 (copy), p3 (ref)
				var5.fetch(p3)
				
				return p5
			end)
		end,
		clear = function() --[[ line: 41 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.clear()
			var6.clear()
		end,
		dispose = function() --[[ line: 46 ]]
			-- upvalues: var5 (ref), var6 (ref)
			var5.dispose()
			var6.dispose()
		end
	}
end