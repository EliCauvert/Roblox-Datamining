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

return function() --[[ line: 17 | named "createUserVoteFeedbackMetadataStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), logResponseError (ref), userVoteFeedbackMetdataUrlBuilderModule (ref), fetchUserVoteFeedbackMetadataModule (ref), userVoteFeedbackMetadataStoreTypesModule (ref), discoveryEventErrorLogger (ref), userVoteFeedbackMetadataDerivedFieldsModule (ref)
	local var8 = createDataCacheModule()
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		cache = var8,
		logError = function(p0) --[[ line: 24 ]]
			-- upvalues: logResponseError (copy), userVoteFeedbackMetdataUrlBuilderModule (copy)
			logResponseError(userVoteFeedbackMetdataUrlBuilderModule.USER_VOTE_FEEDBACK_METADATA_URL, p0)
		end,
		fetchFn = function(p1, _) --[[ line: 27 ]]
			-- upvalues: fetchUserVoteFeedbackMetadataModule (copy), userVoteFeedbackMetadataStoreTypesModule (copy), discoveryEventErrorLogger (copy)
			return fetchUserVoteFeedbackMetadataModule(p1):andThen(function(p2) --[[ line: 33 ]]
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
		fetchUserVoteFeedbackMetadata = var9.fetchItem,
		fetchUserVoteFeedbackMetadatas = var9.fetchItems,
		getUserVoteFeedbackMetadata = var9.getCachedItem,
		getUserVoteFeedbackMetadatas = var9.getCachedItems,
		getAndFetchUserVoteFeedbackMetadata = var9.getAndFetchItem,
		getAndFetchUserVoteFeedbackMetadatas = var9.getAndFetchItems,
		clearItem = function(p3) --[[ line: 80 ]]
			-- upvalues: var8 (ref)
			var8.replaceItem(p3, nil)
		end,
		calculateDerivedField = userVoteFeedbackMetadataDerivedFieldsModule.calculateDerivedField,
		clear = function() --[[ line: 63 ]]
			-- upvalues: var8 (ref), var9 (ref)
			var8.clear()
			var9.clear()
		end,
		dispose = function() --[[ line: 68 ]]
			-- upvalues: var9 (ref)
			var9.dispose()
		end
	}
end