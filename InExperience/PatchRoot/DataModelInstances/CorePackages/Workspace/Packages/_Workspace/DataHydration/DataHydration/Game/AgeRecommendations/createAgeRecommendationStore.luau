local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local DiscoveryUtilsModule = require(Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchAgeRecommendationModule = require(script.Parent.fetchAgeRecommendation)
local AgeRecommendationStoreTypesModule = require(script.Parent.AgeRecommendationStoreTypes)
local FFlagShowGameAgeRating = require(Parent.SharedFlags).FFlagShowGameAgeRating

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), DiscoveryEventErrorLogger (copy), FetchAgeRecommendationModule (copy), AgeRecommendationStoreTypesModule (copy), FFlagShowGameAgeRating (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		requestBatchSize = 1,
		cache = DataCacheModule,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval), DiscoveryEventErrorLogger (upval)
			if type(p1) == "table" then
				if p1.responseCode then
					LogResponseErrorFunction("experience-guidelines-api/get-age-recommendation", { StatusCode = tonumber(p1.responseCode) })
				end
				if p1.errorType and p1.errorMessage then
					DiscoveryEventErrorLogger.reportError(p1.errorType, p1.errorMessage, p1.customFields)
					
					return
				end
			else
				DiscoveryEventErrorLogger.reportError("FetchAgeRecommendationError", (tostring(p1)))
			end
		end,
		fetchFn = function(p1)
			-- upvalues: FetchAgeRecommendationModule (upval), AgeRecommendationStoreTypesModule (upval), FFlagShowGameAgeRating (upval)
			local NextEntry = next(p1)
			
			if not NextEntry then
				error({
					errorType = "CreateAgeRecommendationStoreMissingUniverseId",
					errorMessage = "CreateAgeRecommendationStore requires universeId",
					customFields = { universeId = NextEntry }
				})
			end
			return FetchAgeRecommendationModule(NextEntry):andThen(function(Result)
				-- upvalues: NextEntry (copy), AgeRecommendationStoreTypesModule (upval), FFlagShowGameAgeRating (upval)
				if not Result or not Result.responseBody then
					error({
						errorType = "FetchAgeRecommendationResponseError",
						responseCode = Result and Result.responseCode,
						errorMessage = if Result then "Missing response body" else "No response",
						customFields = { universeId = NextEntry }
					})
				end
				local AgeRecommendationResponseValidatorResult, AgeRecommendationResponseValidatorResult2 = AgeRecommendationStoreTypesModule.ageRecommendationResponseValidator(Result.responseBody)
				
				if not AgeRecommendationResponseValidatorResult then
					error({
						errorType = "FetchAgeRecommendationResponseInvalidInterface",
						responseCode = Result.responseCode,
						errorMessage = AgeRecommendationResponseValidatorResult2,
						customFields = { universeId = NextEntry }
					})
				end
				local t = {}
				local AgeRecommendation = Result.responseBody.ageRecommendationDetails.summary.ageRecommendation
				
				if FFlagShowGameAgeRating and not AgeRecommendation then
					t[NextEntry] = {}
					
					return t
				else
					t[NextEntry] = {
						displayName = AgeRecommendation.displayName,
						displayNameWithHeaderShort = AgeRecommendation.displayNameWithHeaderShort,
						minimumAgeDisplay = if FFlagShowGameAgeRating then AgeRecommendation.minimumAgeDisplay else nil,
						igrsRating = AgeRecommendation.igrsRating,
						igrsRatingDisplayMessage = AgeRecommendation.igrsRatingDisplayMessage
					}
					
					return t
				end
			end):catch(function(Err)
				error(Err)
			end)
		end
	})
	
	return {
		fetchAgeRecommendation = DataResolverModule.fetchItem,
		getAgeRecommendation = DataResolverModule.getCachedItem,
		getAndFetchAgeRecommendation = DataResolverModule.getAndFetchItem,
		updateAgeRecommendations = DataCacheModule.updateItems,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end