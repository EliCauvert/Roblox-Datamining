local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpModule = require(parent.Http)
local httpClientModule = require(parent.HttpClient)
local sharedFlagsModule = require(parent.SharedFlags)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local convertApiMomentsToMomentItemsModule = require(dataHydration.Moments.Util.convertApiMomentsToMomentItems)
local extractCommentsByFeedItemIdModule = require(dataHydration.Moments.Util.extractCommentsByFeedItemId)
local extractReactionsByMomentIdModule = require(dataHydration.Moments.Util.extractReactionsByMomentId)
local extractShareInfoByMomentIdModule = require(dataHydration.Moments.Util.extractShareInfoByMomentId)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagProfileMomentsOrderingAndReactions = sharedFlagsModule.FFlagProfileMomentsOrderingAndReactions

return function(p1, p2, p3)
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), fFlagProfileMomentsOrderingAndReactions (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref), fFlagMomentsComments (ref), extractCommentsByFeedItemIdModule (ref)
	local var1, var2 = constructApiUrlModule("content-captures-api/v2/moments/get-users-moments")
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-users-moments",
		url = `{var1}?{httpModule.Url:makeQueryString({ count = 18, targetUserId = p1, paginationContext = p2 })}`,
		headers = var2,
		network = p3,
		decode = function(p4)
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), p2 (ref), fFlagProfileMomentsOrderingAndReactions (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy), fFlagMomentsComments (copy), extractCommentsByFeedItemIdModule (copy)
			local items = p4.items
			
			return {
				moments = convertApiMomentsToMomentItemsModule(items),
				nextCursor = if items ~= nil and #items >= 18 then p4.paginationContext or p2 else nil,
				reactionsByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractReactionsByMomentIdModule(items) else nil,
				shareInfoByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractShareInfoByMomentIdModule(items) else nil,
				commentsByFeedItemId = if fFlagMomentsComments then extractCommentsByFeedItemIdModule(items) else nil
			}
		end
	})
end