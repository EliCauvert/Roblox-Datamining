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

return function(p0, p1, p2) --[[ line: 33 | named "fetchMomentsByIds" ]]
	-- upvalues: constructApiUrlModule (ref), momentsFixBatchedGetMomentsQueryParams (ref), fFlagMomentsPassFeedItemIdToBackendApis (ref), shareLinkTargetIdType (ref), momentGetIdType (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref)
	local var10, var11 = constructApiUrlModule("content-captures-api/v2/moments/get-moments")
	local t = { Ids = table.concat(p0, ",") }
	
	if momentsFixBatchedGetMomentsQueryParams then
		t.Ids = p0
	end
	if fFlagMomentsPassFeedItemIdToBackendApis then
		t.type = if p2 == shareLinkTargetIdType.FeedItemId then momentGetIdType.FeedItemId else momentGetIdType.MomentId
	end
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments",
		url = `{var10}?{httpModule.Url:makeQueryString(t)}`,
		headers = var11,
		network = p1,
		decode = function(p3) --[[ line: 57 ]]
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy)
			return {
				moments = convertApiMomentsToMomentItemsModule(p3.items),
				reactionsByMomentId = extractReactionsByMomentIdModule(p3.items),
				shareInfoByMomentId = extractShareInfoByMomentIdModule(p3.items)
			}
		end
	})
end