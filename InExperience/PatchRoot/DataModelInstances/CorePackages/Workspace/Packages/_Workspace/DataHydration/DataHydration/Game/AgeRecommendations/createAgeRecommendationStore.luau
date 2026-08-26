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
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSduiExperienceDetailsSupport = sharedFlagsModule.FFlagSduiExperienceDetailsSupport
local fFlagShowGameAgeRating = sharedFlagsModule.FFlagShowGameAgeRating

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), discoveryEventErrorLogger (ref), fetchAgeRecommendationModule (ref), ageRecommendationStoreTypesModule (ref), fFlagShowGameAgeRating (ref), fFlagSduiExperienceDetailsSupport (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		requestBatchSize = 1,
		cache = var1,
		logError = function(p1)
			-- upvalues: logResponseError (copy), discoveryEventErrorLogger (copy)
			if type(p1) == "table" then
				if p1.responseCode then
					logResponseError("experience-guidelines-api/get-age-recommendation", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					discoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				discoveryEventErrorLogger.reportError("FetchAgeRecommendationError", tostring(p1))
			end
		end,
		fetchFn = function(p1)
			-- upvalues: fetchAgeRecommendationModule (copy), ageRecommendationStoreTypesModule (copy), fFlagShowGameAgeRating (copy), fFlagSduiExperienceDetailsSupport (copy)
			local var3 = next(p1)
			
			if not var3 then
				error({
					errorType = "CreateAgeRecommendationStoreMissingUniverseId",
					errorMessage = "CreateAgeRecommendationStore requires universeId",
					customFields = { universeId = var3 }
				})
			end
			return fetchAgeRecommendationModule(var3):andThen(function(p2)
				-- upvalues: var3 (ref), ageRecommendationStoreTypesModule (copy), fFlagShowGameAgeRating (copy), fFlagSduiExperienceDetailsSupport (copy)
				if not p2 or not p2.responseBody then
					error({
						errorType = "FetchAgeRecommendationResponseError",
						responseCode = p2 and p2.responseCode,
						errorMessage = if p2 then "Missing response body" else "No response",
						customFields = { universeId = var3 }
					})
				end
				local var4, var5 = ageRecommendationStoreTypesModule.ageRecommendationResponseValidator(p2.responseBody)
				
				if not var4 then
					error({
						errorType = "FetchAgeRecommendationResponseInvalidInterface",
						responseCode = p2.responseCode,
						errorMessage = var5,
						customFields = { universeId = var3 }
					})
				end
				local t = {}
				local ageRecommendation = p2.responseBody.ageRecommendationDetails.summary.ageRecommendation
				
				if fFlagShowGameAgeRating and not ageRecommendation then
					t[var3] = {}
					
					return t
				end
				t[var3] = {
					displayName = ageRecommendation.displayName,
					displayNameWithHeaderShort = ageRecommendation.displayNameWithHeaderShort,
					minimumAgeDisplay = if fFlagShowGameAgeRating then ageRecommendation.minimumAgeDisplay else nil,
					igrsRating = if fFlagSduiExperienceDetailsSupport then ageRecommendation.igrsRating else nil,
					igrsRatingDisplayMessage = if fFlagSduiExperienceDetailsSupport then ageRecommendation.igrsRatingDisplayMessage else nil
				}
				
				return t
			end):catch(function(p2)
				error(p2)
			end)
		end
	})
	
	return {
		fetchAgeRecommendation = var2.fetchItem,
		getAgeRecommendation = var2.getCachedItem,
		getAndFetchAgeRecommendation = var2.getAndFetchItem,
		updateAgeRecommendations = if fFlagSduiExperienceDetailsSupport then var1.updateItems else nil,
		clear = var2.clear,
		dispose = var2.dispose
	}
end