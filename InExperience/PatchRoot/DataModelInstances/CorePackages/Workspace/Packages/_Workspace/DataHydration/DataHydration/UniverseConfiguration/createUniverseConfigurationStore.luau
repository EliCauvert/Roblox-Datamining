local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local cryoModule = require(parent.Cryo)
local _ = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchUniverseConfigurationModule = require(script.Parent.fetchUniverseConfiguration)
local getPrivacyTypeForAudiencesModule = require(script.Parent.getPrivacyTypeForAudiences)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)
local fFlagBuildExperienceShareUseUniverseSummary = sharedFlagsModule.FFlagBuildExperienceShareUseUniverseSummary

return function(p0) --[[ line: 27 | named "createUniverseConfigurationStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchUniverseConfigurationModule (ref), cryoModule (ref), fFlagBuildExperienceShareUseUniverseSummary (ref), getPrivacyTypeForAudiencesModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var8 = 0
	local t_1 = {}
	local var10 = createSingleEntityResolverModule(function(p1) --[[ line: 33 ]]
		-- upvalues: var8 (write), fetchUniverseConfigurationModule (copy), t (ref), t_1 (write), cryoModule (copy)
		var8 += 1
		local var14 = var8
		
		return fetchUniverseConfigurationModule.fetchSummary(p1, t):andThen(function(p2) --[[ line: 36 ]]
			-- upvalues: t_1 (copy), p1 (ref), var14 (ref), cryoModule (copy)
			local var15 = t_1[p1]
			
			if var15 == nil then
				return p2
			elseif var14 <= var15.generation then
				return cryoModule.Dictionary.join(p2, var15.patch)
			end
			t_1[p1] = nil
			
			return p2
		end)
	end)
	local var11 = createSingleEntityResolverModule(function(p3) --[[ line: 49 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchConfiguration(p3, t)
	end)
	local var12 = createSingleEntityResolverModule(function(p4) --[[ line: 52 ]]
		-- upvalues: fetchUniverseConfigurationModule (copy), t (ref)
		return fetchUniverseConfigurationModule.fetchTeamCreate(p4, t)
	end)
	
	local function getSummaryPatch(p5) --[[ line: 56 ]]
		-- upvalues: fFlagBuildExperienceShareUseUniverseSummary (copy), getPrivacyTypeForAudiencesModule (copy)
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
		if fFlagBuildExperienceShareUseUniverseSummary and p5.audiences ~= nil then
			t.audiences = p5.audiences
			t.privacyType = getPrivacyTypeForAudiencesModule(p5.audiences)
		end
		return if next(t) == nil then nil else t
	end
	
	return {
		getSummary = var10.get,
		fetchSummary = var10.fetch,
		refreshSummary = function(p6) --[[ line: 101 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var10 (ref)
			return fetchUniverseConfigurationModule.fetchSummary(p6, t):andThen(function(p7) --[[ line: 102 ]]
				-- upvalues: var10 (copy), p6 (ref)
				var10.cache.replaceItem(tostring(p6), p7)
				
				return p7
			end)
		end,
		getAndFetchSummary = var10.getAndFetch,
		updateSummary = function(p8, p9) --[[ line: 89 ]]
			-- upvalues: var10 (ref), cryoModule (copy)
			local var17 = var10.get(p8).data(false)
			
			if var17 == nil then
				return
			end
			var10.update(p8, cryoModule.Dictionary.join(var17, p9))
		end,
		getConfiguration = var11.get,
		fetchConfiguration = var11.fetch,
		refreshConfiguration = function(p10) --[[ line: 108 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var11 (ref)
			return fetchUniverseConfigurationModule.fetchConfiguration(p10, t):andThen(function(p11) --[[ line: 111 ]]
				-- upvalues: var11 (copy), p10 (ref)
				var11.cache.replaceItem(tostring(p10), p11)
				
				return p11
			end)
		end,
		getAndFetchConfiguration = var11.getAndFetch,
		updateConfiguration = function(p12, p13) --[[ line: 79 ]]
			-- upvalues: var11 (ref), cryoModule (copy)
			local var18 = var11.get(p12).data(false)
			
			if var18 == nil then
				return
			end
			var11.update(p12, cryoModule.Dictionary.join(var18, p13))
		end,
		patchConfiguration = function(p14, p15) --[[ line: 117 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var11 (ref), getSummaryPatch (ref), var10 (ref), t_1 (write), var8 (write), cryoModule (copy)
			return fetchUniverseConfigurationModule.patchConfiguration(p14, p15, t):andThen(function(p16) --[[ line: 123 ]]
				-- upvalues: var11 (copy), p14 (ref), p15 (ref), getSummaryPatch (copy), var10 (copy), t_1 (copy), var8 (copy), cryoModule (copy)
				var11.update(p14, p16)
				var11.update(p14, p15)
				local var19 = getSummaryPatch(p15)
				
				if var19 ~= nil and var10.get(p14).data(false) ~= nil then
					t_1[p14] = { generation = var8, patch = var19 }
					local var20 = p14
					local var21 = var10.get(var20).data(false)
					
					if var21 ~= nil then
						var10.update(var20, cryoModule.Dictionary.join(var21, var19))
					end
				end
				return var11.get(p14).data(false)
			end)
		end,
		getTeamCreate = var12.get,
		fetchTeamCreate = var12.fetch,
		getAndFetchTeamCreate = var12.getAndFetch,
		setTeamCreate = function(value, p17) --[[ line: 140 ]]
			-- upvalues: fetchUniverseConfigurationModule (copy), t (ref), var12 (ref)
			return fetchUniverseConfigurationModule.setTeamCreate(value, p17, t):andThen(function(p18) --[[ line: 141 ]]
				-- upvalues: var12 (copy), value (ref)
				var12.update(value, p18)
				
				return p18
			end)
		end,
		clear = function() --[[ line: 147 ]]
			-- upvalues: var8 (write), t_1 (write), var10 (ref), var11 (ref), var12 (ref)
			var8 = 0
			t_1 = {}
			var10.clear()
			var11.clear()
			var12.clear()
		end,
		dispose = function() --[[ line: 155 ]]
			-- upvalues: var10 (ref), var11 (ref), var12 (ref)
			var10.dispose()
			var11.dispose()
			var12.dispose()
		end
	}
end