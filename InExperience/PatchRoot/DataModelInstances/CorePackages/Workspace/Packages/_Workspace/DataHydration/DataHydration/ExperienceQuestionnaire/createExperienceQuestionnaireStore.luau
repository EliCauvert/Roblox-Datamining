local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchExperienceQuestionnaireModule = require(script.Parent.fetchExperienceQuestionnaire)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)

return function(p0) --[[ line: 24 | named "createExperienceQuestionnaireStore" ]]
	-- upvalues: createSingleEntityResolverModule (ref), fetchExperienceQuestionnaireModule (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	p0 = p0 or {}
	local t = { network = p0.network, baseUrl = p0.baseUrl }
	local var7 = createSingleEntityResolverModule(function(p1) --[[ line: 28 ]]
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchEligibility(p1, t)
	end)
	local var8 = createSingleEntityResolverModule(function(p2) --[[ line: 31 ]]
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchMetadataStatus(p2, t)
	end)
	local var9 = createSingleEntityResolverModule(function(p3) --[[ line: 34 ]]
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchActiveResponse(p3, t)
	end)
	local var10 = createSingleEntityResolverModule(function(p4) --[[ line: 37 ]]
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchLatestQuestionnaire(p4, t)
	end)
	local var11 = createSingleEntityResolverModule(function(p5) --[[ line: 40 ]]
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchLatestSubmission(p5, t)
	end)
	local var12 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		fetchFn = function(p6, _) --[[ line: 50 ]]
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.fetchQuestionnaireById(p6, t)
		end
	})
	
	return {
		getEligibility = var7.get,
		fetchEligibility = var7.fetch,
		getAndFetchEligibility = var7.getAndFetch,
		getMetadataStatus = var8.get,
		fetchMetadataStatus = var8.fetch,
		getAndFetchMetadataStatus = var8.getAndFetch,
		getActiveResponse = var9.get,
		fetchActiveResponse = var9.fetch,
		getAndFetchActiveResponse = var9.getAndFetch,
		getLatestQuestionnaire = var10.get,
		fetchLatestQuestionnaire = var10.fetch,
		getAndFetchLatestQuestionnaire = var10.getAndFetch,
		getQuestionnaireById = function(p7) --[[ line: 105 ]]
			-- upvalues: var12 (ref)
			return var12.getCachedItem(p7)
		end,
		fetchQuestionnaireById = function(p8) --[[ line: 108 ]]
			-- upvalues: var12 (ref)
			return var12.fetchItem(p8)
		end,
		getAndFetchQuestionnaireById = function(p9) --[[ line: 111 ]]
			-- upvalues: var12 (ref)
			return var12.getAndFetchItem(p9)
		end,
		getLatestSubmission = var11.get,
		fetchLatestSubmission = var11.fetch,
		getAndFetchLatestSubmission = var11.getAndFetch,
		saveSubmission = function(p10, p11) --[[ line: 58 ]]
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref), var9 (ref), var11 (ref)
			return fetchExperienceQuestionnaireModule.saveSubmission(p10, p11, t):andThen(function(p12) --[[ line: 62 ]]
				-- upvalues: var9 (copy), p10 (ref), var11 (copy)
				var9.fetch(p10)
				var11.fetch(p10)
				
				return p12
			end)
		end,
		validateResponses = function(p13) --[[ line: 120 ]]
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.validateResponses(p13, t)
		end,
		previewSubmission = function(p14) --[[ line: 123 ]]
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.previewSubmission(p14, t)
		end,
		clear = function() --[[ line: 70 ]]
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), var10 (ref), var12 (ref), var11 (ref)
			var7.clear()
			var8.clear()
			var9.clear()
			var10.clear()
			var12.clear()
			var11.clear()
		end,
		dispose = function() --[[ line: 79 ]]
			-- upvalues: var7 (ref), var8 (ref), var9 (ref), var10 (ref), var12 (ref), var11 (ref)
			var7.dispose()
			var8.dispose()
			var9.dispose()
			var10.dispose()
			var12.dispose()
			var11.dispose()
		end
	}
end