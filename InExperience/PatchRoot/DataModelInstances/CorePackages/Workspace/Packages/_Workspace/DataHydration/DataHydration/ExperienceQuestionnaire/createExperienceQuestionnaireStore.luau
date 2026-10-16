local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local CreateSingleEntityResolverModule = require(DataHydration.createSingleEntityResolver)
local FetchExperienceQuestionnaireModule = require(script.Parent.fetchExperienceQuestionnaire)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)

return function(p1) --[[ Line: 23 | Named "createExperienceQuestionnaireStore" ]]
	-- upvalues: CreateSingleEntityResolverModule (copy), FetchExperienceQuestionnaireModule (copy), CreateDataCacheModule (copy), CreateDataResolverModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local SingleEntityResolverModule = CreateSingleEntityResolverModule(function(p2) --[[ Line: 27 ]]
		-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
		return FetchExperienceQuestionnaireModule.fetchEligibility(p2, config)
	end)
	local SingleEntityResolverModule1 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 30 ]]
		-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
		return FetchExperienceQuestionnaireModule.fetchMetadataStatus(p2, config)
	end)
	local SingleEntityResolverModule2 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 33 ]]
		-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
		return FetchExperienceQuestionnaireModule.fetchActiveResponse(p2, config)
	end)
	local SingleEntityResolverModule3 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 36 ]]
		-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
		return FetchExperienceQuestionnaireModule.fetchLatestQuestionnaire(p2, config)
	end)
	local SingleEntityResolverModule4 = CreateSingleEntityResolverModule(function(p2) --[[ Line: 39 ]]
		-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
		return FetchExperienceQuestionnaireModule.fetchLatestSubmission(p2, config)
	end)
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _) --[[ Line: 49 ]]
			-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
			return FetchExperienceQuestionnaireModule.fetchQuestionnaireById(p2, config)
		end
	})
	
	return {
		getEligibility = SingleEntityResolverModule.get,
		fetchEligibility = SingleEntityResolverModule.fetch,
		getAndFetchEligibility = SingleEntityResolverModule.getAndFetch,
		getMetadataStatus = SingleEntityResolverModule1.get,
		fetchMetadataStatus = SingleEntityResolverModule1.fetch,
		getAndFetchMetadataStatus = SingleEntityResolverModule1.getAndFetch,
		getActiveResponse = SingleEntityResolverModule2.get,
		fetchActiveResponse = SingleEntityResolverModule2.fetch,
		getAndFetchActiveResponse = SingleEntityResolverModule2.getAndFetch,
		getLatestQuestionnaire = SingleEntityResolverModule3.get,
		fetchLatestQuestionnaire = SingleEntityResolverModule3.fetch,
		getAndFetchLatestQuestionnaire = SingleEntityResolverModule3.getAndFetch,
		getQuestionnaireById = function(p2) --[[ Line: 104 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem(p2)
		end,
		fetchQuestionnaireById = function(p2) --[[ Line: 107 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem(p2)
		end,
		getAndFetchQuestionnaireById = function(p2) --[[ Line: 110 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem(p2)
		end,
		getLatestSubmission = SingleEntityResolverModule4.get,
		fetchLatestSubmission = SingleEntityResolverModule4.fetch,
		getAndFetchLatestSubmission = SingleEntityResolverModule4.getAndFetch,
		saveSubmission = function(p2, p3) --[[ Line: 57 ]]
			-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy), SingleEntityResolverModule2 (copy), SingleEntityResolverModule4 (copy)
			return FetchExperienceQuestionnaireModule.saveSubmission(p2, p3, config):andThen(function(Result) --[[ Line: 61 ]]
				-- upvalues: SingleEntityResolverModule2 (upval), p2 (copy), SingleEntityResolverModule4 (upval)
				SingleEntityResolverModule2.fetch(p2)
				SingleEntityResolverModule4.fetch(p2)
				
				return Result
			end)
		end,
		validateResponses = function(p2) --[[ Line: 119 ]]
			-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
			return FetchExperienceQuestionnaireModule.validateResponses(p2, config)
		end,
		previewSubmission = function(p2) --[[ Line: 122 ]]
			-- upvalues: FetchExperienceQuestionnaireModule (upval), config (copy)
			return FetchExperienceQuestionnaireModule.previewSubmission(p2, config)
		end,
		clear = function() --[[ Line: 69 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), SingleEntityResolverModule2 (copy), SingleEntityResolverModule3 (copy), DataResolverModule (copy), SingleEntityResolverModule4 (copy)
			SingleEntityResolverModule.clear()
			SingleEntityResolverModule1.clear()
			SingleEntityResolverModule2.clear()
			SingleEntityResolverModule3.clear()
			DataResolverModule.clear()
			SingleEntityResolverModule4.clear()
		end,
		dispose = function() --[[ Line: 78 ]]
			-- upvalues: SingleEntityResolverModule (copy), SingleEntityResolverModule1 (copy), SingleEntityResolverModule2 (copy), SingleEntityResolverModule3 (copy), DataResolverModule (copy), SingleEntityResolverModule4 (copy)
			SingleEntityResolverModule.dispose()
			SingleEntityResolverModule1.dispose()
			SingleEntityResolverModule2.dispose()
			SingleEntityResolverModule3.dispose()
			DataResolverModule.dispose()
			SingleEntityResolverModule4.dispose()
		end
	}
end