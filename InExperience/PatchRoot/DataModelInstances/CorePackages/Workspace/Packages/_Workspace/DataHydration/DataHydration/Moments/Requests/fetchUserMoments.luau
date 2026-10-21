local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpModule = require(Parent.Http)
local HttpClientModule = require(Parent.HttpClient)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConvertApiMomentsToMomentItemsModule = require(DataHydration.Moments.Util.convertApiMomentsToMomentItems)
local ExtractCommentsByFeedItemIdModule = require(DataHydration.Moments.Util.extractCommentsByFeedItemId)
local ExtractReactionsByMomentIdModule = require(DataHydration.Moments.Util.extractReactionsByMomentId)
local ExtractShareInfoByMomentIdModule = require(DataHydration.Moments.Util.extractShareInfoByMomentId)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local FFlagMomentsResolvePublishedPostFeedItem = SharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem

local function collectExcludedMomentIds(p1)
	local Copy = table.clone(p1.moderatedMomentIds or {})
	local FailedMomentIds = p1.failedMomentIds or {}
	for _, failedMomentId in FailedMomentIds do
		table.insert(Copy, failedMomentId)
	end
	return Copy
end

return function(TargetUserId, PaginationContext, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpModule (copy), HttpClientModule (copy), ConvertApiMomentsToMomentItemsModule (copy), ExtractReactionsByMomentIdModule (copy), ExtractShareInfoByMomentIdModule (copy), FFlagMomentsComments (copy), ExtractCommentsByFeedItemIdModule (copy), FFlagMomentsResolvePublishedPostFeedItem (copy), collectExcludedMomentIds (copy)
	local GetUsersMoments, GetUsersMoments2 = ConstructApiUrlModule("content-captures-api/v2/moments/get-users-moments")
	
	return HttpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-users-moments",
		url = `{GetUsersMoments}?{HttpModule.Url:makeQueryString({
			count = 18,
			targetUserId = TargetUserId,
			paginationContext = PaginationContext
		})}`,
		headers = GetUsersMoments2,
		network = Network,
		decode = function(p2)
			-- upvalues: ConvertApiMomentsToMomentItemsModule (upval), PaginationContext (copy), ExtractReactionsByMomentIdModule (upval), ExtractShareInfoByMomentIdModule (upval), FFlagMomentsComments (upval), ExtractCommentsByFeedItemIdModule (upval), FFlagMomentsResolvePublishedPostFeedItem (upval), collectExcludedMomentIds (upval)
			local Items = p2.items
			local v1: boolean = Items ~= nil and #Items >= 18
			
			return {
				moments = ConvertApiMomentsToMomentItemsModule(Items),
				nextCursor = if v1 then p2.paginationContext or PaginationContext else nil,
				reactionsByMomentId = ExtractReactionsByMomentIdModule(Items),
				shareInfoByMomentId = ExtractShareInfoByMomentIdModule(Items),
				commentsByFeedItemId = if FFlagMomentsComments then ExtractCommentsByFeedItemIdModule(Items) else nil,
				excludedMomentIds = if FFlagMomentsResolvePublishedPostFeedItem then collectExcludedMomentIds(p2) else nil
			}
		end
	})
end