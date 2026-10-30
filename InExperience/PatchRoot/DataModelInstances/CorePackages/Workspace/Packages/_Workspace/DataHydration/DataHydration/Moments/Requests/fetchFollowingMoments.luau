local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractCommentsByFeedItemIdModule = require(DataHydration.Moments.Util.extractCommentsByFeedItemId)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments

return function(PaginationContext, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpClientModule (copy), ConvertApiMomentsToMomentItemsModule (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy), FFlagMomentsComments (copy), ExtractCommentsByFeedItemIdModule (copy)
	local GetFollowingMoments, GetFollowingMoments2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-following-moments")
	local QueryString = HttpModule.Url:makeQueryString({ paginationContext = PaginationContext })
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-following-moments",
		url = if QueryString == "" then GetFollowingMoments else `{GetFollowingMoments}?{QueryString}`,
		headers = GetFollowingMoments2,
		network = Network,
		decode = function(p1)
			-- upvalues: ConvertApiMomentsToMomentItemsModule (upval), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval), FFlagMomentsComments (upval), ExtractCommentsByFeedItemIdModule (upval)
			local PaginationContext = p1.paginationContext
			
			return {
				moments = ConvertApiMomentsToMomentItemsModule(p1.items),
				nextCursor = if PaginationContext == nil or PaginationContext == "" then nil else PaginationContext,
				reactionsByMomentId = ExtractReactionsByMomentIdModule(p1.items),
				shareInfoByMomentId = ExtractShareInfoByMomentIdModule(p1.items),
				commentsByFeedItemId = if FFlagMomentsComments then ExtractCommentsByFeedItemIdModule(p1.items) else nil
			}
		end
	})
end