local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpClientModule = require(parent.HttpClient)
local _ = require(parent.MomentsTypes)
local _ = require(dataHydration.Moments.MomentsStoreTypes)
local constructApiUrlModule = require(dataHydration.Moments.Util.constructApiUrl)
local isCanonicalNonzeroUuidModule = require(dataHydration.Moments.Util.isCanonicalNonzeroUuid)

local function _(p1, p2)
	return `moment-comments-api/v1/moments/{p1}/comments/{p2}/reactions`
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: isCanonicalNonzeroUuidModule (ref), constructApiUrlModule (ref), httpClientModule (ref)
	assert(isCanonicalNonzeroUuidModule(p1), "putMomentCommentReaction: feedItemId must be a canonical nonzero UUID")
	assert(isCanonicalNonzeroUuidModule(p2), "putMomentCommentReaction: commentId must be a canonical nonzero UUID")
	assert(isCanonicalNonzeroUuidModule(p3), "putMomentCommentReaction: emoteId must be a canonical nonzero UUID")
	local var1, var2 = constructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments/{p2}/reactions`)
	
	return httpClientModule.fetch({
		method = "PUT",
		analyticsKey = "moments.put-comment-reaction",
		retry = false,
		url = var1,
		headers = var2,
		body = { reactionType = "thumbsup", emoteId = p3 },
		network = p4,
		statusCodeActions = p5,
		decode = function(_)
			return nil
		end
	})
end