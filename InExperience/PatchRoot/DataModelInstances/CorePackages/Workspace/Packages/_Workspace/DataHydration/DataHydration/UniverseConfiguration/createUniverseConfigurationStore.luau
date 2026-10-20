local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CryoModule = require(Parent.Cryo)
local _ = require(Parent.HttpClient)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchUniverseConfigurationModule = require(script.Parent.fetchUniverseConfiguration)
local GetPrivacyTypeForAudiencesModule = require(script.Parent.getPrivacyTypeForAudiences)
local _ = require(script.Parent.UniverseConfigurationStoreTypes)

return function(p1)
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchUniverseConfigurationModule (copy), CryoModule (copy), GetPrivacyTypeForAudiencesModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local Generation = 0
	local t = {}
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: Generation (ref), FetchUniverseConfigurationModule (upval), config (copy), t (ref), CryoModule (upval)
		Generation += 1
		local Generation1: number = Generation
		
		return FetchUniverseConfigurationModule.fetchSummary(p2, config):andThen(function(Result)
			-- upvalues: t (upval), p2 (copy), Generation1 (copy), CryoModule (upval)
			local Entry = t[p2]
			
			if Entry == nil then
				return Result
			elseif Generation1 <= Entry.generation then
				return CryoModule.Dictionary.join(Result, Entry.patch)
			else
				t[p2] = nil
				
				return Result
			end
		end)
	end)
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchUniverseConfigurationModule (upval), config (copy)
		return FetchUniverseConfigurationModule.fetchConfiguration(p2, config)
	end)
	local SingleEntityResolverModule2 = CreateSingleEntityResolverModule(function(p2)
		-- upvalues: FetchUniverseConfigurationModule (upval), config (copy)
		return FetchUniverseConfigurationModule.fetchTeamCreate(p2, config)
	end)
	
	local function getSummaryPatch(p2)
		-- upvalues: GetPrivacyTypeForAudiencesModule (upval)
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
			t.privacyType = GetPrivacyTypeForAudiencesModule(p2.audiences)
		end
		return if next(t) == nil then nil else t
	end
	
	return {
		getSummary = SingleEntityResolverModule.get,
		fetchSummary = SingleEntityResolverModule.fetch,
		refreshSummary = function(p2)
			-- upvalues: FetchUniverseConfigurationModule (upval), config (copy), SingleEntityResolverModule (copy)
			return FetchUniverseConfigurationModule.fetchSummary(p2, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule (upval), p2 (copy)
				SingleEntityResolverModule.cache.replaceItem(tostring(p2), Result)
				
				return Result
			end)
		end,
		getAndFetchSummary = SingleEntityResolverModule.getAndFetch,
		updateSummary = function(p2, p3)
			-- upvalues: SingleEntityResolverModule (copy), CryoModule (upval)
			local DataResult = SingleEntityResolverModule.get(p2).data(false)
			
			if DataResult ~= nil then
				SingleEntityResolverModule.update(p2, (CryoModule.Dictionary.join(DataResult, p3)))
				
				return
			end
		end,
		getConfiguration = SingleEntityResolverModule1.get,
		fetchConfiguration = SingleEntityResolverModule1.fetch,
		refreshConfiguration = function(p2)
			-- upvalues: FetchUniverseConfigurationModule (upval), config (copy), SingleEntityResolverModule1 (copy)
			return FetchUniverseConfigurationModule.fetchConfiguration(p2, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule1 (upval), p2 (copy)
				SingleEntityResolverModule1.cache.replaceItem(tostring(p2), Result)
				
				return Result
			end)
		end,
		getAndFetchConfiguration = SingleEntityResolverModule1.getAndFetch,
		updateConfiguration = function(p2, p3)
			-- upvalues: SingleEntityResolverModule1 (copy), CryoModule (upval)
			local DataResult = SingleEntityResolverModule1.get(p2).data(false)
			
			if DataResult ~= nil then
				SingleEntityResolverModule1.update(p2, (CryoModule.Dictionary.join(DataResult, p3)))
				
				return
			end
		end,
		patchConfiguration = function(p2, p3)
			-- upvalues: FetchUniverseConfigurationModule (upval), config (copy), SingleEntityResolverModule1 (copy), getSummaryPatch (copy), SingleEntityResolverModule (copy), t (ref), Generation (ref), CryoModule (upval)
			return FetchUniverseConfigurationModule.patchConfiguration(p2, p3, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule1 (upval), p2 (copy), p3 (copy), getSummaryPatch (upval), SingleEntityResolverModule (upval), t (upval), Generation (upval), CryoModule (upval)
				SingleEntityResolverModule1.update(p2, Result)
				SingleEntityResolverModule1.update(p2, p3)
				local SummaryPatch = getSummaryPatch(p3)
				
				if SummaryPatch ~= nil and SingleEntityResolverModule.get(p2).data(false) ~= nil then
					t[p2] = { generation = Generation, patch = SummaryPatch }
					local DataResult = SingleEntityResolverModule.get(p2).data(false)
					
					if DataResult ~= nil then
						SingleEntityResolverModule.update(p2, (CryoModule.Dictionary.join(DataResult, SummaryPatch)))
					end
				end
				return (SingleEntityResolverModule1.get(p2).data(false))
			end)
		end,
		getTeamCreate = SingleEntityResolverModule2.get,
		fetchTeamCreate = SingleEntityResolverModule2.fetch,
		getAndFetchTeamCreate = SingleEntityResolverModule2.getAndFetch,
		setTeamCreate = function(p2, p3)
			-- upvalues: FetchUniverseConfigurationModule (upval), config (copy), SingleEntityResolverModule2 (copy)
			return FetchUniverseConfigurationModule.setTeamCreate(p2, p3, config):andThen(function(Result)
				-- upvalues: SingleEntityResolverModule2 (upval), p2 (copy)
				SingleEntityResolverModule2.update(p2, Result)
				
				return Result
			end)
		end,
		clear = function()
			-- upvalues: Generation (ref), t (ref), SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), SingleEntityResolverModule2 (copy)
			Generation = 0
			t = {}
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
			SingleEntityResolverModule2.clear()
		end,
		dispose = function()
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), SingleEntityResolverModule2 (copy)
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
			SingleEntityResolverModule2.dispose()
		end
	}
end