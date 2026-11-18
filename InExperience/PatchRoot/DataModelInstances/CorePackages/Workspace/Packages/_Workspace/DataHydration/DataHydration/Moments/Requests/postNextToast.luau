local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpClientModule = require(Parent.HttpClient)
local _ = require(Parent.MomentsTypes)
local _ = require(DataHydration.Moments.MomentsStoreTypes)
local ConstructApiUrlModule = require(DataHydration.Moments.Util.constructApiUrl)
local config = {
	comments = true,
	reactionMilestone = true,
	likes = true,
	rollup = true
}
local config1 = { creator = true, commenter = true }

local function _(p1)
	return if type(p1) == "number" then p1 else nil
end

local _ = function(p1)
	return if type(p1) == "table" then p1 else {}
end

local function decodeToast(Toast)
	-- upvalues: config (copy), config1 (copy)
	assert(type(Toast) == "table", "postNextToast: toast was not an object")
	local Kind = Toast.kind
	assert(type(Kind) == "string" and config[Kind], `postNextToast: unknown toast kind {tostring(Kind)}`)
	local FeedItemId = Toast.feedItemId
	assert(type(FeedItemId) == "string", "postNextToast: toast had no feedItemId")
	local ActorUserIds = {}
	local ActorUserIds1 = Toast.actorUserIds
	
	if type(ActorUserIds1) == "table" then
		for _, value in ActorUserIds1 do
			if type(value) == "number" then
				table.insert(ActorUserIds, value)
			end
		end
	end
	local Category = Toast.category
	local Category1 = if type(Category) == "string" and config1[Category] then Category else nil
	local Counts = Toast.counts
	local Counts1 = if type(Counts) == "table" then Counts else {}
	local Comments = Counts1.comments
	local Comments1 = if type(Comments) == "number" then Comments else nil
	local Commenters = Counts1.commenters
	local Commenters1 = if type(Commenters) == "number" then Commenters else nil
	local Milestone = Counts1.milestone
	local Milestone1 = if type(Milestone) == "number" then Milestone else nil
	local Moments = Counts1.moments
	local Moments1 = if type(Moments) == "number" then Moments else nil
	local ReactionMilestones = Counts1.reactionMilestones
	local ReactionMilestones1 = if type(ReactionMilestones) == "number" then ReactionMilestones else nil
	local LikedComments = Counts1.likedComments
	local CommentId = Toast.commentId
	
	return {
		kind = Kind,
		category = Category1,
		feedItemId = FeedItemId,
		commentId = if type(CommentId) == "string" then CommentId else nil,
		actorUserIds = ActorUserIds,
		counts = {
			comments = Comments1,
			commenters = Commenters1,
			milestone = Milestone1,
			moments = Moments1,
			reactionMilestones = ReactionMilestones1,
			likedComments = if type(LikedComments) == "number" then LikedComments else nil
		},
		truncated = Toast.truncated == true
	}
end

return function(Body, Network)
	-- upvalues: ConstructApiUrlModule (copy), HttpClientModule (copy), decodeToast (copy)
	local NextToast, NextToast2 = ConstructApiUrlModule("engagement-activity-api/v1/activity/next-toast")
	
	return HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "moments.next-toast",
		retry = false,
		url = NextToast,
		headers = NextToast2,
		body = Body,
		network = Network,
		decode = function(p1)
			-- upvalues: decodeToast (upval)
			local T = if type(p1) == "table" then p1 else {}
			local RetryAfter = T.retryAfter
			
			return {
				toast = if T.toast == nil then nil else decodeToast(T.toast),
				retryAfter = if type(RetryAfter) == "number" then RetryAfter else nil
			}
		end
	})
end