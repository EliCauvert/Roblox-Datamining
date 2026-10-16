local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local MomentsTypesModule = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractCommentsByFeedItemIdModule = require(DataHydration.Moments.Util.extractCommentsByFeedItemId)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local MomentsFixBatchedGetMomentsQueryParams = game:DefineFastFlag("MomentsFixBatchedGetMomentsQueryParams", false)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local MomentGetIdType = MomentsTypesModule.Enums.MomentGetIdType
local ShareLinkTargetIdType = MomentsTypesModule.Enums.ShareLinkTargetIdType

return function(List, Network, FeedItemId) --[[ Line: 30 | Named "fetchMomentsByIds" ]]
	-- upvalues: ConstructApiUrlModule (copy), MomentsFixBatchedGetMomentsQueryParams (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), ShareLinkTargetIdType (copy), MomentGetIdType (copy), HttpModule (copy), HttpClientModule (copy), ConvertApiMomentsToMomentItemsModule (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy), FFlagMomentsComments (copy), ExtractCommentsByFeedItemIdModule (copy)
	local GetMoments, GetMoments2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-moments")
	local config = { Ids = table.concat(List, ",") }
	
	if MomentsFixBatchedGetMomentsQueryParams then
		config.Ids = List
	end
	if FFlagMomentsPassFeedItemIdToBackendApis then
		config.type = if FeedItemId == ShareLinkTargetIdType.FeedItemId then MomentGetIdType.FeedItemId else MomentGetIdType.MomentId
	end
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-moments",
		url = `{GetMoments}?{HttpModule.Url:makeQueryString(config)}`,
		headers = GetMoments2,
		network = Network,
		decode = function(p1) --[[ Line: 54 ]]
			-- upvalues: ConvertApiMomentsToMomentItemsModule (upval), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval), FFlagMomentsComments (upval), ExtractCommentsByFeedItemIdModule (upval)
			return {
				moments = ConvertApiMomentsToMomentItemsModule(p1.items),
				reactionsByMomentId = ExtractReactionsByMomentIdModule(p1.items),
				shareInfoByMomentId = ExtractShareInfoByMomentIdModule(p1.items),
				commentsByFeedItemId = if FFlagMomentsComments then ExtractCommentsByFeedItemIdModule(p1.items) else nil
			}
		end
	})
end