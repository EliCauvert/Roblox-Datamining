local parent = script.Parent
local networkRequests = parent.networkRequests
local fFlagContentFeedEnableReactions = require(parent.Parent.SharedFlags).FFlagContentFeedEnableReactions
local createAddReactionModule = require(networkRequests.createAddReaction)
local createCheckMomentsEligibilityModule = require(networkRequests.createCheckMomentsEligibility)
local createDeletePostModule = require(networkRequests.createDeletePost)
local createGetPostsByCursorModule = require(networkRequests.createGetPostsByCursor)
local createGetPostsByPostIdModule = require(networkRequests.createGetPostsByPostId)
local createGetPostsByUserIdModule = require(networkRequests.createGetPostsByUserId)
local createGetThumbnailByAssetIdModule = require(networkRequests.createGetThumbnailByAssetId)
local createRemoveReactionModule = require(networkRequests.createRemoveReaction)

return function(p1)
	-- upvalues: fFlagContentFeedEnableReactions (ref), createAddReactionModule (ref), createCheckMomentsEligibilityModule (ref), createDeletePostModule (ref), networkRequests (ref), createGetPostsByCursorModule (ref), createGetPostsByPostIdModule (ref), createGetPostsByUserIdModule (ref), createGetThumbnailByAssetIdModule (ref), createRemoveReactionModule (ref)
	return {
		AddReaction = if fFlagContentFeedEnableReactions then createAddReactionModule(p1) else nil,
		CheckMomentsEligibility = createCheckMomentsEligibilityModule(p1),
		DeletePost = createDeletePostModule(p1),
		GetActiveCategories = require(networkRequests.createGetActiveCategories)(p1),
		GetPostsByCursor = createGetPostsByCursorModule(p1),
		GetPostsByPostId = createGetPostsByPostIdModule(p1),
		GetPostsByUserId = createGetPostsByUserIdModule(p1),
		GetThumbnailByAssetId = createGetThumbnailByAssetIdModule(p1),
		RemoveReaction = if fFlagContentFeedEnableReactions then createRemoveReactionModule(p1) else nil
	}
end