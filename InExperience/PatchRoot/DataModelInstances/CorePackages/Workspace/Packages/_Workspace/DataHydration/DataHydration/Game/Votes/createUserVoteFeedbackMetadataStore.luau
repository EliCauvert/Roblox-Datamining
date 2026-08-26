local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local userVoteFeedbackMetadataStoreTypesModule = require(script.Parent.UserVoteFeedbackMetadataStoreTypes)
local discoveryUtilsModule = require(parent.DiscoveryUtils)
local logResponseError = discoveryUtilsModule.logResponseError
local discoveryEventErrorLogger = discoveryUtilsModule.DiscoveryEventErrorLogger
local fetchUserVoteFeedbackMetadataModule = require(script.Parent.fetchUserVoteFeedbackMetadata)
local userVoteFeedbackMetdataUrlBuilderModule = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder)
local userVoteFeedbackMetadataDerivedFieldsModule = require(script.Parent.UserVoteFeedbackMetadataDerivedFields)

return function()
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), userVoteFeedbackMetdataUrlBuilderModule (ref), fetchUserVoteFeedbackMetadataModule (ref), userVoteFeedbackMetadataStoreTypesModule (ref), discoveryEventErrorLogger (ref), userVoteFeedbackMetadataDerivedFieldsModule (ref)
	local var1 = createDataCacheModule()
	local var2 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var1,
		logError = function(p1)
			-- upvalues: logResponseError (copy), userVoteFeedbackMetdataUrlBuilderModule (copy)
			logResponseError(userVoteFeedbackMetdataUrlBuilderModule.USER_VOTE_FEEDBACK_METADATA_URL, p1)
		end,
		fetchFn = function(p1, _)
			-- upvalues: fetchUserVoteFeedbackMetadataModule (copy), userVoteFeedbackMetadataStoreTypesModule (copy), discoveryEventErrorLogger (copy)
			return fetchUserVoteFeedbackMetadataModule(p1):andThen(function(p2)
				-- upvalues: userVoteFeedbackMetadataStoreTypesModule (copy), discoveryEventErrorLogger (copy), p1 (ref)
				local responseBody = p2.responseBody
				
				if not userVoteFeedbackMetadataStoreTypesModule.userVoteFeedbackMetadataResponseValidator(responseBody) then
					discoveryEventErrorLogger.reportError("createUserVoteFeedbackMetadataStore", "Invalid user vote feedback metadata response", { rootPlaceId = p1, responseBody = responseBody })
					error({ StatusCode = p2.responseCode })
				end
				return {
					rootPlaceId = p1,
					canSubmitReview = responseBody.capabilities and responseBody.capabilities.can_submit_review,
					canSubmitComment = responseBody.capabilities and responseBody.capabilities.can_submit_comment,
					categories = responseBody.categories or {},
					comment = responseBody.comment or {},
					metadata = responseBody.metadata or {}
				}
			end)
		end
	})
	
	return {
		fetchUserVoteFeedbackMetadata = var2.fetchItem,
		fetchUserVoteFeedbackMetadatas = var2.fetchItems,
		getUserVoteFeedbackMetadata = var2.getCachedItem,
		getUserVoteFeedbackMetadatas = var2.getCachedItems,
		getAndFetchUserVoteFeedbackMetadata = var2.getAndFetchItem,
		getAndFetchUserVoteFeedbackMetadatas = var2.getAndFetchItems,
		clearItem = function(p1)
			-- upvalues: var1 (ref)
			var1.replaceItem(p1, nil)
		end,
		calculateDerivedField = userVoteFeedbackMetadataDerivedFieldsModule.calculateDerivedField,
		clear = function()
			-- upvalues: var1 (ref), var2 (ref)
			var1.clear()
			var2.clear()
		end,
		dispose = function()
			-- upvalues: var2 (ref)
			var2.dispose()
		end
	}
end