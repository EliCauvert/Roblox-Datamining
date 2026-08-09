local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseConfigurationModule = require(script.Parent.fetchUniverseConfiguration)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)

return function(p0) --[[ line: 23 | named "createUniverseConfigurationStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseConfigurationModule (ref), cryoModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var6 = createSingleEntityResolverModule(function(p1) --[[ line: 27 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchSummary(p1, t)
	end)
	local var7 = createSingleEntityResolverModule(function(p2) --[[ line: 30 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchConfiguration(p2, t)
	end)
	local var8 = createSingleEntityResolverModule(function(p3) --[[ line: 33 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchTeamCreate(p3, t)
	end)
	
	return {
		getSummary = var6.get,
		fetchSummary = var6.fetch,
		getAndFetchSummary = var6.getAndFetch,
		updateSummary = var6.update,
		getConfiguration = var7.get,
		fetchConfiguration = var7.fetch,
		getAndFetchConfiguration = var7.getAndFetch,
		updateConfiguration = function(p4, p5) --[[ line: 37 ]]
			-- upvalues: var7 (ref), cryoModule (copy)
			local var9 = var7.get(p4).data(false)
			
			if var9 == nil then
				return
			end
			var7.update(p4, cryoModule.Dictionary.join(var9, p5))
		end,
		patchConfiguration = function(p6, p7) --[[ line: 47 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var7 (ref), cryoModule (copy)
			return fetchUniverseConfigurationModule.patchConfiguration(p6, p7, t):andThen(function(p8) --[[ line: 53 ]]
				-- upvalues: var7 (copy), p6 (ref), cryoModule (copy)
				local var10 = var7.get(p6).data(false)
				local var11 = if var10 ~= nil then p8 else cryoModule.Dictionary.join(var10, p8)
				var7.update(p6, var11)
				
				return var11
			end)
		end,
		getTeamCreate = var8.get,
		fetchTeamCreate = var8.fetch,
		getAndFetchTeamCreate = var8.getAndFetch,
		setTeamCreate = function(value, p9) --[[ line: 63 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var8 (ref)
			return fetchUniverseConfigurationModule.setTeamCreate(value, p9, t):andThen(function(p10) --[[ line: 64 ]]
				-- upvalues: var8 (copy), value (ref)
				var8.update(value, p10)
				
				return p10
			end)
		end,
		clear = function() --[[ line: 70 ]]
			-- upvalues: var6 (ref), var7 (ref), var8 (ref)
			var6.clear()
			var7.clear()
			var8.clear()
		end,
		dispose = function() --[[ line: 76 ]]
			-- upvalues: var6 (ref), var7 (ref), var8 (ref)
			var6.dispose()
			var7.dispose()
			var8.dispose()
		end
	}
end