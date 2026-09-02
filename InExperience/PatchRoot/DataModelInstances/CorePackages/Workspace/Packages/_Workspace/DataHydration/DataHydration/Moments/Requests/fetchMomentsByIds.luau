local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local momentsTypesModule = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local momentsFixBatchedGetMomentsQueryParams = game:DefineFastFlag("MomentsFixBatchedGetMomentsQueryParams", false)
local fFlagMomentsPassFeedItemIdToBackendApis = sharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local momentGetIdType = momentsTypesModule.Enums.MomentGetIdType
local shareLinkTargetIdType = momentsTypesModule.Enums.ShareLinkTargetIdType

return function(p1, p2, p3)
	-- upvalues: constructApiUrlModule (ref), momentsFixBatchedGetMomentsQueryParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shareLinkTargetIdType (ref), momentGetIdType (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref)
	local var1, var2 = constructApiUrlModule("content-captures-api/v2/moments/get-moments")
	local t = { Ids = table.concat(p1, ",") }
	
	if momentsFixBatchedGetMomentsQueryParams then
		t.Ids = p1
	end
	if fFlagMomentsPassFeedItemIdToBackendApis then
		t.type = if p3 == shareLinkTargetIdType.FeedItemId then momentGetIdType.FeedItemId else momentGetIdType.MomentId
	end
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments",
		url = `{var1}?{httpModule.Url:makeQueryString(t)}`,
		headers = var2,
		network = p2,
		decode = function(p4)
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy)
			return {
				moments = convertApiMomentsToMomentItemsModule(p4.items),
				reactionsByMomentId = extractReactionsByMomentIdModule(p4.items),
				shareInfoByMomentId = extractShareInfoByMomentIdModule(p4.items)
			}
		end
	})
end