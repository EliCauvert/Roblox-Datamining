local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchAgeRecommendationModule = require(script.Parent.fetchAgeRecommendation)
local ageRecommendationStoreTypesModule = require(script.Parent.AgeRecommendationStoreTypes)
local fFlagSduiExperienceDetailsSupport = require(parent.SharedFlags).FFlagSduiExperienceDetailsSupport

return function() --[[ line: 18 | named "createAgeRecommendationStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), fetchAgeRecommendationModule (ref), ageRecommendationStoreTypesModule (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var6 = createDataCacheModule()
	local var7 = createDataResolverModule({
		requestBatchSize = 1,
		cache = var6,
		logError = function(p0) --[[ line: 25 ]]
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p0) == "table" then
				if p0.responseCode then
					logResponseError("experience-guidelines-api/get-age-recommendation", { StatusCode = tonumber(p0.responseCode) })
				end
				if p0.errorType and p0.errorMessage then
					discoveryEventErrorLogger.reportError(p0.errorType, p0.errorMessage, p0.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchAgeRecommendationError", tostring(p0))
			end
		end,
		fetchFn = function(p1) --[[ line: 45 ]]
			-- upvalues: fetchAgeRecommendationModule (copy), ageRecommendationStoreTypesModule (copy), fFlagSduiExperienceDetailsSupport (copy)
			local var8 = next(p1)
			
			if not var8 then
				error({
					errorType = "CreateAgeRecommendationStoreMissingUniverseId",
					errorMessage = "CreateAgeRecommendationStore requires universeId",
					customFields = { universeId = var8 }
				})
			end
			return fetchAgeRecommendationModule(var8):andThen(function(p3) --[[ line: 57 ]]
				-- upvalues: var8 (ref), ageRecommendationStoreTypesModule (copy), fFlagSduiExperienceDetailsSupport (copy)
				if not p3 or not p3.responseBody then
					error({
						errorType = "FetchAgeRecommendationResponseError",
						responseCode = p3 and p3.responseCode,
						errorMessage = if p3 then "Missing response body" else "No response",
						customFields = { universeId = var8 }
					})
				end
				local var9, var10 = ageRecommendationStoreTypesModule.ageRecommendationResponseValidator(p3.responseBody)
				
				if not var9 then
					error({
						errorType = "FetchAgeRecommendationResponseInvalidInterface",
						responseCode = p3.responseCode,
						errorMessage = var10,
						customFields = { universeId = var8 }
					})
				end
				local t = {}
				local ageRecommendation = p3.responseBody.ageRecommendationDetails.summary.ageRecommendation
				t[var8] = {
					displayName = ageRecommendation.displayName,
					displayNameWithHeaderShort = ageRecommendation.displayNameWithHeaderShort,
					igrsRating = if fFlagSduiExperienceDetailsSupport then ageRecommendation.igrsRating else nil,
					igrsRatingDisplayMessage = if fFlagSduiExperienceDetailsSupport then ageRecommendation.igrsRatingDisplayMessage else nil
				}
				
				return t
			end):catch(function(p2) --[[ line: 94 ]]
				error(p2)
			end)
		end
	})
	
	return {
		fetchAgeRecommendation = var7.fetchItem,
		getAgeRecommendation = var7.getCachedItem,
		getAndFetchAgeRecommendation = var7.getAndFetchItem,
		updateAgeRecommendations = if fFlagSduiExperienceDetailsSupport then var6.updateItems else nil,
		clear = var7.clear,
		dispose = var7.dispose
	}
end