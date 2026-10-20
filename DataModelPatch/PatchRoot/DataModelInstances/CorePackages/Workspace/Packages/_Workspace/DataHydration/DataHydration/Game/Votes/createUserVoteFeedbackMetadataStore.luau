local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local UserVoteFeedbackMetadataStoreTypesModule = require(script.Parent.UserVoteFeedbackMetadataStoreTypes)
local DiscoveryUtilsModule = require(DataHydration.Parent.DiscoveryUtils)
local LogResponseErrorFunction = DiscoveryUtilsModule.logResponseError
local DiscoveryEventErrorLogger = DiscoveryUtilsModule.DiscoveryEventErrorLogger
local FetchUserVoteFeedbackMetadataModule = require(script.Parent.fetchUserVoteFeedbackMetadata)
local UserVoteFeedbackMetdataUrlBuilderModule = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder)
local UserVoteFeedbackMetadataDerivedFieldsModule = require(script.Parent.UserVoteFeedbackMetadataDerivedFields)

return function()
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), LogResponseErrorFunction (copy), UserVoteFeedbackMetdataUrlBuilderModule (copy), FetchUserVoteFeedbackMetadataModule (copy), UserVoteFeedbackMetadataStoreTypesModule (copy), DiscoveryEventErrorLogger (copy), UserVoteFeedbackMetadataDerivedFieldsModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		logError = function(p1)
			-- upvalues: LogResponseErrorFunction (upval), UserVoteFeedbackMetdataUrlBuilderModule (upval)
			LogResponseErrorFunction(UserVoteFeedbackMetdataUrlBuilderModule.USER_VOTE_FEEDBACK_METADATA_URL, p1)
		end,
		fetchFn = function(RootPlaceId, _)
			-- upvalues: FetchUserVoteFeedbackMetadataModule (upval), UserVoteFeedbackMetadataStoreTypesModule (upval), DiscoveryEventErrorLogger (upval)
			return FetchUserVoteFeedbackMetadataModule(RootPlaceId):andThen(function(Result)
				-- upvalues: UserVoteFeedbackMetadataStoreTypesModule (upval), DiscoveryEventErrorLogger (upval), RootPlaceId (copy)
				local ResponseBody = Result.responseBody
				
				if not UserVoteFeedbackMetadataStoreTypesModule.userVoteFeedbackMetadataResponseValidator(ResponseBody) then
					DiscoveryEventErrorLogger.reportError("createUserVoteFeedbackMetadataStore", "Invalid user vote feedback metadata response", { rootPlaceId = RootPlaceId, responseBody = ResponseBody })
					error({ StatusCode = Result.responseCode })
				end
				return {
					rootPlaceId = RootPlaceId,
					canSubmitReview = ResponseBody.capabilities and ResponseBody.capabilities.can_submit_review,
					canSubmitComment = ResponseBody.capabilities and ResponseBody.capabilities.can_submit_comment,
					categories = ResponseBody.categories or {},
					comment = ResponseBody.comment or {},
					metadata = ResponseBody.metadata or {}
				}
			end)
		end
	})
	
	return {
		fetchUserVoteFeedbackMetadata = DataResolverModule.fetchItem,
		fetchUserVoteFeedbackMetadatas = DataResolverModule.fetchItems,
		getUserVoteFeedbackMetadata = DataResolverModule.getCachedItem,
		getUserVoteFeedbackMetadatas = DataResolverModule.getCachedItems,
		getAndFetchUserVoteFeedbackMetadata = DataResolverModule.getAndFetchItem,
		getAndFetchUserVoteFeedbackMetadatas = DataResolverModule.getAndFetchItems,
		clearItem = function(p1)
			-- upvalues: DataCacheModule (copy)
			DataCacheModule.replaceItem(p1, nil)
		end,
		calculateDerivedField = UserVoteFeedbackMetadataDerivedFieldsModule.calculateDerivedField,
		clear = function()
			-- upvalues: DataCacheModule (copy), DataResolverModule (copy)
			DataCacheModule.clear()
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.dispose()
		end
	}
end