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
local fFlagMomentsResolvePublishedPostFeedItem = sharedFlagsModule.FFlagMomentsResolvePublishedPostFeedItem
local fFlagProfileMomentsOrderingAndReactions = sharedFlagsModule.FFlagProfileMomentsOrderingAndReactions

local function collectExcludedMomentIds(p1)
	local cloned = table.clone(p1.moderatedMomentIds or {})
	
	for i, v in p1.failedMomentIds or {} do
		table.insert(cloned, v)
	end
	return cloned
end

return function(p2, p3, p4)
	-- upvalues: constructApiUrlModule (ref), httpModule (ref), httpClientModule (ref), convertApiMomentsToMomentItemsModule (ref), fFlagProfileMomentsOrderingAndReactions (ref), extractReactionsByMomentIdModule (ref), extractShareInfoByMomentIdModule (ref), fFlagMomentsComments (ref), extractCommentsByFeedItemIdModule (ref), fFlagMomentsResolvePublishedPostFeedItem (ref), collectExcludedMomentIds (ref)
	local var1, var2 = constructApiUrlModule("content-captures-api/v2/moments/get-users-moments")
	
	return httpClientModule.fetch({
		method = "GET",
		analyticsKey = "moments.get-users-moments",
		url = `{var1}?{httpModule.Url:makeQueryString({ count = 18, targetUserId = p2, paginationContext = p3 })}`,
		headers = var2,
		network = p4,
		decode = function(p5)
			-- upvalues: convertApiMomentsToMomentItemsModule (copy), p3 (ref), fFlagProfileMomentsOrderingAndReactions (copy), extractReactionsByMomentIdModule (copy), extractShareInfoByMomentIdModule (copy), fFlagMomentsComments (copy), extractCommentsByFeedItemIdModule (copy), fFlagMomentsResolvePublishedPostFeedItem (copy), collectExcludedMomentIds (copy)
			local items = p5.items
			
			return {
				moments = convertApiMomentsToMomentItemsModule(items),
				nextCursor = if items ~= nil and #items >= 18 then p5.paginationContext or p3 else nil,
				reactionsByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractReactionsByMomentIdModule(items) else nil,
				shareInfoByMomentId = if fFlagProfileMomentsOrderingAndReactions then extractShareInfoByMomentIdModule(items) else nil,
				commentsByFeedItemId = if fFlagMomentsComments then extractCommentsByFeedItemIdModule(items) else nil,
				excludedMomentIds = if fFlagMomentsResolvePublishedPostFeedItem then collectExcludedMomentIds(p5) else nil
			}
		end
	})
end