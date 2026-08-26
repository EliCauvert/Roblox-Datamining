local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local createSingleEntityResolverModule = require(dataHydration.createSingleEntityResolver)
local fetchExperienceQuestionnaireModule = require(script.Parent.fetchExperienceQuestionnaire)
local _ = require(script.Parent.ExperienceQuestionnaireStoreTypes)

return function(p1)
	-- upvalues: createSingleEntityResolverModule (ref), fetchExperienceQuestionnaireModule (ref), createDataCacheModule (ref), createDataResolverModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchEligibility(p2, t)
	end)
	local var2 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchMetadataStatus(p2, t)
	end)
	local var3 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchActiveResponse(p2, t)
	end)
	local var4 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchLatestQuestionnaire(p2, t)
	end)
	local var5 = createSingleEntityResolverModule(function(p2)
		-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
		return fetchExperienceQuestionnaireModule.fetchLatestSubmission(p2, t)
	end)
	local var6 = createDataResolverModule({
		supportsMultiGet = false,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.fetchQuestionnaireById(p2, t)
		end
	})
	
	return {
		getEligibility = var1.get,
		fetchEligibility = var1.fetch,
		getAndFetchEligibility = var1.getAndFetch,
		getMetadataStatus = var2.get,
		fetchMetadataStatus = var2.fetch,
		getAndFetchMetadataStatus = var2.getAndFetch,
		getActiveResponse = var3.get,
		fetchActiveResponse = var3.fetch,
		getAndFetchActiveResponse = var3.getAndFetch,
		getLatestQuestionnaire = var4.get,
		fetchLatestQuestionnaire = var4.fetch,
		getAndFetchLatestQuestionnaire = var4.getAndFetch,
		getQuestionnaireById = function(p2)
			-- upvalues: var6 (ref)
			return var6.getCachedItem(p2)
		end,
		fetchQuestionnaireById = function(p2)
			-- upvalues: var6 (ref)
			return var6.fetchItem(p2)
		end,
		getAndFetchQuestionnaireById = function(p2)
			-- upvalues: var6 (ref)
			return var6.getAndFetchItem(p2)
		end,
		getLatestSubmission = var5.get,
		fetchLatestSubmission = var5.fetch,
		getAndFetchLatestSubmission = var5.getAndFetch,
		saveSubmission = function(p2, p3)
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref), var3 (ref), var5 (ref)
			return fetchExperienceQuestionnaireModule.saveSubmission(p2, p3, t):andThen(function(p4)
				-- upvalues: var3 (copy), p2 (ref), var5 (copy)
				var3.fetch(p2)
				var5.fetch(p2)
				
				return p4
			end)
		end,
		validateResponses = function(p2)
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.validateResponses(p2, t)
		end,
		previewSubmission = function(p2)
			-- upvalues: fetchExperienceQuestionnaireModule (copy), t (ref)
			return fetchExperienceQuestionnaireModule.previewSubmission(p2, t)
		end,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref), var6 (ref), var5 (ref)
			var1.clear()
			var2.clear()
			var3.clear()
			var4.clear()
			var6.clear()
			var5.clear()
		end,
		dispose = function()
			-- upvalues: var1 (ref), var2 (ref), var3 (ref), var4 (ref), var6 (ref), var5 (ref)
			var1.dispose()
			var2.dispose()
			var3.dispose()
			var4.dispose()
			var6.dispose()
			var5.dispose()
		end
	}
end