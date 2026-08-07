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
	local var6 = 0
	local t_1 = {}
	local var8 = createSingleEntityResolverModule(function(p1) --[[ line: 29 ]]
		-- upvalues: var6 (write), fetchUniverseConfigurationModule (copy), t (ref), t_1 (write), cryoModule (copy)
		var6 += 1
		local var12 = var6
		
		return fetchUniverseConfigurationModule.fetchSummary(p1, t):andThen(function(p2) --[[ line: 32 ]]
			-- upvalues: t_1 (copy), p1 (ref), var12 (ref), cryoModule (copy)
			local var13 = t_1[p1]
			
			if var13 == nil then
				return p2
			elseif var12 <= var13.generation then
				return cryoModule.Dictionary.join(p2, var13.patch)
			end
			t_1[p1] = nil
			
			return p2
		end)
	end)
	local var9 = createSingleEntityResolverModule(function(p3) --[[ line: 45 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchConfiguration(p3, t)
	end)
	local var10 = createSingleEntityResolverModule(function(p4) --[[ line: 48 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchTeamCreate(p4, t)
	end)
	
	local function getSummaryPatch(p5) --[[ line: 52 ]]
		local t = {}
		
		if p5.name ~= nil then
			t.name = p5.name
		end
		if p5.description ~= nil then
			t.description = p5.description
		end
		if p5.isArchived ~= nil then
			t.isArchived = p5.isArchived
		end
		return if next(t) == nil then nil else t
	end
	
	return {
		getSummary = var8.get,
		fetchSummary = var8.fetch,
		refreshSummary = function(p6) --[[ line: 93 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var8 (ref)
			return fetchUniverseConfigurationModule.fetchSummary(p6, t):andThen(function(p7) --[[ line: 94 ]]
				-- upvalues: var8 (copy), p6 (ref)
				var8.cache.replaceItem(tostring(p6), p7)
				
				return p7
			end)
		end,
		getAndFetchSummary = var8.getAndFetch,
		updateSummary = function(p8, p9) --[[ line: 81 ]]
			-- upvalues: var8 (ref), cryoModule (copy)
			local var15 = var8.get(p8).data(false)
			
			if var15 == nil then
				return
			end
			var8.update(p8, cryoModule.Dictionary.join(var15, p9))
		end,
		getConfiguration = var9.get,
		fetchConfiguration = var9.fetch,
		refreshConfiguration = function(p10) --[[ line: 100 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var9 (ref)
			return fetchUniverseConfigurationModule.fetchConfiguration(p10, t):andThen(function(p11) --[[ line: 103 ]]
				-- upvalues: var9 (copy), p10 (ref)
				var9.cache.replaceItem(tostring(p10), p11)
				
				return p11
			end)
		end,
		getAndFetchConfiguration = var9.getAndFetch,
		updateConfiguration = function(p12, p13) --[[ line: 71 ]]
			-- upvalues: var9 (ref), cryoModule (copy)
			local var16 = var9.get(p12).data(false)
			
			if var16 == nil then
				return
			end
			var9.update(p12, cryoModule.Dictionary.join(var16, p13))
		end,
		patchConfiguration = function(p14, p15) --[[ line: 109 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var9 (ref), getSummaryPatch (ref), var8 (ref), t_1 (write), var6 (write), cryoModule (copy)
			return fetchUniverseConfigurationModule.patchConfiguration(p14, p15, t):andThen(function(p16) --[[ line: 115 ]]
				-- upvalues: var9 (copy), p14 (ref), p15 (ref), getSummaryPatch (copy), var8 (copy), t_1 (copy), var6 (copy), cryoModule (copy)
				var9.update(p14, p16)
				var9.update(p14, p15)
				local var17 = getSummaryPatch(p15)
				
				if var17 ~= nil and var8.get(p14).data(false) ~= nil then
					t_1[p14] = { generation = var6, patch = var17 }
					local var18 = p14
					local var19 = var8.get(var18).data(false)
					
					if var19 ~= nil then
						var8.update(var18, cryoModule.Dictionary.join(var19, var17))
					end
				end
				return var9.get(p14).data(false)
			end)
		end,
		getTeamCreate = var10.get,
		fetchTeamCreate = var10.fetch,
		getAndFetchTeamCreate = var10.getAndFetch,
		setTeamCreate = function(value, p17) --[[ line: 132 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var10 (ref)
			return fetchUniverseConfigurationModule.setTeamCreate(value, p17, t):andThen(function(p18) --[[ line: 133 ]]
				-- upvalues: var10 (copy), value (ref)
				var10.update(value, p18)
				
				return p18
			end)
		end,
		clear = function() --[[ line: 139 ]]
			-- upvalues: var6 (write), t_1 (write), var8 (ref), var9 (ref), var10 (ref)
			var6 = 0
			t_1 = {}
			var8.clear()
			var9.clear()
			var10.clear()
		end,
		dispose = function() --[[ line: 147 ]]
			-- upvalues: var8 (ref), var9 (ref), var10 (ref)
			var8.dispose()
			var9.dispose()
			var10.dispose()
		end
	}
end