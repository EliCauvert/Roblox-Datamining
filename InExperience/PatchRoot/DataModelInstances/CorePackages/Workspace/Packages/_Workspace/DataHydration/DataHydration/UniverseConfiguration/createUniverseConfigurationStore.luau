local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseConfigurationModule = require(script.Parent.fetchUniverseConfiguration)
local getPrivacyTypeForAudiencesModule = require(script.Parent.getPrivacyTypeForAudiences)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseConfigurationModule (ref), cryoModule (ref), getPrivacyTypeForAudiencesModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = 0
	local t_1 = {}
	local var2 = createSingleEntityResolverModule(function(p2)
		-- upvalues: var1 (write), fetchUniverseConfigurationModule (copy), t (ref), t_1 (write), cryoModule (copy)
		var1 += 1
		local var3 = var1
		
		return fetchUniverseConfigurationModule.fetchSummary(p2, t):andThen(function(p3)
			-- upvalues: t_1 (copy), p2 (ref), var3 (ref), cryoModule (copy)
			local var4 = t_1[p2]
			
			if var4 == nil then
				return p3
			elseif var3 <= var4.generation then
				return cryoModule.Dictionary.join(p3, var4.patch)
			end
			t_1[p2] = nil
			
			return p3
		end)
	end)
	local var3 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchConfiguration(p2, t)
	end)
	local var4 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchTeamCreate(p2, t)
	end)
	
	local function getSummaryPatch(p2)
		-- upvalues: getPrivacyTypeForAudiencesModule (copy)
		local t = {}
		
		if p2.name ~= nil then
			t.name = p2.name
		end
		if p2.description ~= nil then
			t.description = p2.description
		end
		if p2.isArchived ~= nil then
			t.isArchived = p2.isArchived
		end
		if p2.audiences ~= nil then
			t.audiences = p2.audiences
			t.privacyType = getPrivacyTypeForAudiencesModule(p2.audiences)
		end
		return if next(t) == nil then nil else t
	end
	
	return {
		getSummary = var2.get,
		fetchSummary = var2.fetch,
		refreshSummary = function(p2)
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var2 (ref)
			return fetchUniverseConfigurationModule.fetchSummary(p2, t):andThen(function(p3)
				-- upvalues: var2 (copy), p2 (ref)
				var2.cache.replaceItem(tostring(p2), p3)
				
				return p3
			end)
		end,
		getAndFetchSummary = var2.getAndFetch,
		updateSummary = function(p2, p3)
			-- upvalues: var2 (ref), cryoModule (copy)
			local var5 = var2.get(p2).data(false)
			
			if var5 == nil then
				return
			end
			var2.update(p2, cryoModule.Dictionary.join(var5, p3))
		end,
		getConfiguration = var3.get,
		fetchConfiguration = var3.fetch,
		refreshConfiguration = function(p2)
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var3 (ref)
			return fetchUniverseConfigurationModule.fetchConfiguration(p2, t):andThen(function(p3)
				-- upvalues: var3 (copy), p2 (ref)
				var3.cache.replaceItem(tostring(p2), p3)
				
				return p3
			end)
		end,
		getAndFetchConfiguration = var3.getAndFetch,
		updateConfiguration = function(p2, p3)
			-- upvalues: var3 (ref), cryoModule (copy)
			local var5 = var3.get(p2).data(false)
			
			if var5 == nil then
				return
			end
			var3.update(p2, cryoModule.Dictionary.join(var5, p3))
		end,
		patchConfiguration = function(p2, p3)
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var3 (ref), getSummaryPatch (ref), var2 (ref), t_1 (write), var1 (write), cryoModule (copy)
			return fetchUniverseConfigurationModule.patchConfiguration(p2, p3, t):andThen(function(p4)
				-- upvalues: var3 (copy), p2 (ref), p3 (ref), getSummaryPatch (copy), var2 (copy), t_1 (copy), var1 (copy), cryoModule (copy)
				var3.update(p2, p4)
				var3.update(p2, p3)
				local var5 = getSummaryPatch(p3)
				
				if var5 ~= nil and var2.get(p2).data(false) ~= nil then
					t_1[p2] = { generation = var1, patch = var5 }
					local var6 = p2
					local var7 = var2.get(var6).data(false)
					
					if var7 ~= nil then
						var2.update(var6, cryoModule.Dictionary.join(var7, var5))
					end
				end
				return var3.get(p2).data(false)
			end)
		end,
		getTeamCreate = var4.get,
		fetchTeamCreate = var4.fetch,
		getAndFetchTeamCreate = var4.getAndFetch,
		setTeamCreate = function(value, p2)
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var4 (ref)
			return fetchUniverseConfigurationModule.setTeamCreate(value, p2, t):andThen(function(p3)
				-- upvalues: var4 (copy), value (ref)
				var4.update(value, p3)
				
				return p3
			end)
		end,
		clear = function()
			-- upvalues: var1 (write), t_1 (write), var2 (ref), var3 (ref), var4 (ref)
			var1 = 0
			t_1 = {}
			var2.clear()
			var3.clear()
			var4.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref), var3 (ref), var4 (ref)
			var2.dispose()
			var3.dispose()
			var4.dispose()
		end
	}
end