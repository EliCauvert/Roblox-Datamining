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
	local var7 = createDataCacheModule()
	local var8 = createDataResolverModule({
		requestBatchSize = 1,
		cache = var7,
		logError = function(p0)
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
		fetchFn = function(p1)
			-- upvalues: fetchAgeRecommendationModule (copy), ageRecommendationStoreTypesModule (copy), fFlagShowGameAgeRating (copy), fFlagSduiExperienceDetailsSupport (copy)
			local var9 = next(p1)
			
			if not var9 then
				error({
					errorType = "CreateAgeRecommendationStoreMissingUniverseId",
					errorMessage = "CreateAgeRecommendationStore requires universeId",
					customFields = { universeId = var9 }
				})
			end
			return fetchAgeRecommendationModule(var9):andThen(function(p3)
				-- upvalues: var9 (ref), ageRecommendationStoreTypesModule (copy), fFlagShowGameAgeRating (copy), fFlagSduiExperienceDetailsSupport (copy)
				if not p3 or not p3.responseBody then
					error({
						errorType = "FetchAgeRecommendationResponseError",
						responseCode = p3 and p3.responseCode,
						errorMessage = if p3 then "Missing response body" else "No response",
						customFields = { universeId = var9 }
					})
				end
				local var10, var11 = ageRecommendationStoreTypesModule.ageRecommendationResponseValidator(p3.responseBody)
				
				if not var10 then
					error({
						errorType = "FetchAgeRecommendationResponseInvalidInterface",
						responseCode = p3.responseCode,
						errorMessage = var11,
						customFields = { universeId = var9 }
					})
				end
				local t = {}
				local ageRecommendation = p3.responseBody.ageRecommendationDetails.summary.ageRecommendation
				
				if fFlagShowGameAgeRating and not ageRecommendation then
					t[var9] = {}
					
					return t
				end
				t[var9] = {
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
		fetchAgeRecommendation = var8.fetchItem,
		getAgeRecommendation = var8.getCachedItem,
		getAndFetchAgeRecommendation = var8.getAndFetchItem,
		updateAgeRecommendations = if fFlagSduiExperienceDetailsSupport then var7.updateItems else nil,
		clear = var8.clear,
		dispose = var8.dispose
	}
end