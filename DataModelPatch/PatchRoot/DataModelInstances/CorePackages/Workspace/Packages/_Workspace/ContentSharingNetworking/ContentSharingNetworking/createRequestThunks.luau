local Parent = script.Parent
local NetworkRequests = Parent.networkRequests
local FFlagContentFeedEnableReactions = require(Parent.Parent.SharedFlags).FFlagContentFeedEnableReactions
local CreateAddReactionModule = require(NetworkRequests.createAddReaction)
local CreateCheckMomentsEligibilityModule = require(NetworkRequests.createCheckMomentsEligibility)
local CreateDeletePostModule = require(NetworkRequests.createDeletePost)
local CreateGetPostsByCursorModule = require(NetworkRequests.createGetPostsByCursor)
local CreateGetPostsByPostIdModule = require(NetworkRequests.createGetPostsByPostId)
local CreateGetPostsByUserIdModule = require(NetworkRequests.createGetPostsByUserId)
local CreateGetThumbnailByAssetIdModule = require(NetworkRequests.createGetThumbnailByAssetId)
local CreateRemoveReactionModule = require(NetworkRequests.createRemoveReaction)

return function(p1)
	-- upvalues: FFlagContentFeedEnableReactions (copy), CreateAddReactionModule (copy), CreateCheckMomentsEligibilityModule (copy), CreateDeletePostModule (copy), NetworkRequests (copy), CreateGetPostsByCursorModule (copy), CreateGetPostsByPostIdModule (copy), CreateGetPostsByUserIdModule (copy), CreateGetThumbnailByAssetIdModule (copy), CreateRemoveReactionModule (copy)
	return {
		AddReaction = if FFlagContentFeedEnableReactions then CreateAddReactionModule(p1) else nil,
		CheckMomentsEligibility = CreateCheckMomentsEligibilityModule(p1),
		DeletePost = CreateDeletePostModule(p1),
		GetActiveCategories = require(NetworkRequests.createGetActiveCategories)(p1),
		GetPostsByCursor = CreateGetPostsByCursorModule(p1),
		GetPostsByPostId = CreateGetPostsByPostIdModule(p1),
		GetPostsByUserId = CreateGetPostsByUserIdModule(p1),
		GetThumbnailByAssetId = CreateGetThumbnailByAssetIdModule(p1),
		RemoveReaction = if FFlagContentFeedEnableReactions then CreateRemoveReactionModule(p1) else nil
	}
end