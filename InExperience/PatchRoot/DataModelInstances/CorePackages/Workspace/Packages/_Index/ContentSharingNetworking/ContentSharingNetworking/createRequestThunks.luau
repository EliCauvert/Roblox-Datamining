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

return function(p0)
	-- upvalues: fFlagContentFeedEnableReactions (ref), createAddReactionModule (ref), createCheckMomentsEligibilityModule (ref), createDeletePostModule (ref), networkRequests (ref), createGetPostsByCursorModule (ref), createGetPostsByPostIdModule (ref), createGetPostsByUserIdModule (ref), createGetThumbnailByAssetIdModule (ref), createRemoveReactionModule (ref)
	return {
		AddReaction = if fFlagContentFeedEnableReactions then createAddReactionModule(p0) else nil,
		CheckMomentsEligibility = createCheckMomentsEligibilityModule(p0),
		DeletePost = createDeletePostModule(p0),
		GetActiveCategories = require(networkRequests.createGetActiveCategories)(p0),
		GetPostsByCursor = createGetPostsByCursorModule(p0),
		GetPostsByPostId = createGetPostsByPostIdModule(p0),
		GetPostsByUserId = createGetPostsByUserIdModule(p0),
		GetThumbnailByAssetId = createGetThumbnailByAssetIdModule(p0),
		RemoveReaction = if fFlagContentFeedEnableReactions then createRemoveReactionModule(p0) else nil
	}
end