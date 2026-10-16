local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local IsCanonicalNonzeroUuidModule = require(DataHydration.Moments.Util.isCanonicalNonzeroUuid)

local function _(p1, p2): string --[[ Line: 14 | Named "reactionPath" ]]
	return `moment-comments-api/v1/moments/{p1}/comments/{p2}/reactions`
end

return function(p1, p2, EmoteId, Network, StatusCodeActions) --[[ Line: 18 | Named "putMomentCommentReaction" ]]
	-- upvalues: IsCanonicalNonzeroUuidModule (copy), ConstructApiUrlModule (copy), HttpClientModule (copy)
	assert(IsCanonicalNonzeroUuidModule(p1), "putMomentCommentReaction: feedItemId must be a canonical nonzero UUID")
	assert(IsCanonicalNonzeroUuidModule(p2), "putMomentCommentReaction: commentId must be a canonical nonzero UUID")
	assert(IsCanonicalNonzeroUuidModule(EmoteId), "putMomentCommentReaction: emoteId must be a canonical nonzero UUID")
	local ConstructApiUrlModuleResult, ConstructApiUrlModuleResult2 = ConstructApiUrlModule(`moment-comments-api/v1/moments/{p1}/comments/{p2}/reactions`)
	
	return HttpClientModule.fetch({
		method = "PUT",
		analyticsKey = "moments.put-comment-reaction",
		retry = false,
		url = ConstructApiUrlModuleResult,
		headers = ConstructApiUrlModuleResult2,
		body = { reactionType = "thumbsup", emoteId = EmoteId },
		network = Network,
		statusCodeActions = StatusCodeActions,
		decode = function(_) --[[ Line: 43 ]]
			return nil
		end
	})
end