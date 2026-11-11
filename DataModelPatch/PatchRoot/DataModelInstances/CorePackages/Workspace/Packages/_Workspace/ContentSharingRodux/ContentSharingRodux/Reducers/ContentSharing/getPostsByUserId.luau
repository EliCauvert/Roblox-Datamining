local ContentSharingRodux = script:FindFirstAncestor("ContentSharingRodux")
local Parent = ContentSharingRodux.Parent
local CryoModule = require(Parent.Cryo)
local RoduxModule = require(Parent.Rodux)
local MergeSortPostsModule = require(ContentSharingRodux.Utils.mergeSortPosts)
local FFlagContentFeedEnableReactions = require(Parent.SharedFlags).FFlagContentFeedEnableReactions
local config = { byUserId = {} }

local function _(p1: number, p2: number)
	return if p1 == nil or p2 == nil then nil else math.max(p1, p2)
end

local _ = function(p1: number, p2: number)
	return if p1 == nil or p2 == nil then nil else math.min(p1, p2)
end

local function v9(Posts)
	local t = {}
	
	for _, post in Posts do
		local t1 = {}
		
		if post.reactions then
			for _, reaction in post.reactions do
				t1[reaction.emoteId] = reaction
			end
		end
		t[post.postId] = t1
	end
	return t
end

local _ = function(p1)
	-- upvalues: FFlagContentFeedEnableReactions (copy), v9 (copy)
	return {
		nextTimeCursor = p1.responseBody.nextTimeCursor,
		posts = p1.responseBody.posts,
		previousTimeCursor = p1.responseBody.previousTimeCursor,
		reactionsByPostId = if FFlagContentFeedEnableReactions then v9(p1.responseBody.posts) else nil
	}
end

local function v11(p1, p2)
	-- upvalues: MergeSortPostsModule (copy), FFlagContentFeedEnableReactions (copy), CryoModule (copy), v9 (copy)
	if #p2.responseBody.posts == 0 then
		return p1
	end
	local Text = tostring(p2.responseBody.posts[1].creatorUserId)
	local t = {}
	
	if p1.byUserId[Text] == nil then
		t[Text] = {
			nextTimeCursor = p2.responseBody.nextTimeCursor,
			posts = p2.responseBody.posts,
			previousTimeCursor = p2.responseBody.previousTimeCursor,
			reactionsByPostId = if FFlagContentFeedEnableReactions then v9(p2.responseBody.posts) else nil
		}
	else
		local NextTimeCursor: number = p1.byUserId[Text].nextTimeCursor
		local NextTimeCursor1: number = p2.responseBody.nextTimeCursor
		local Largest = if NextTimeCursor == nil or NextTimeCursor1 == nil then nil else math.max(NextTimeCursor, NextTimeCursor1)
		local PreviousTimeCursor: number = p1.byUserId[Text].previousTimeCursor
		local PreviousTimeCursor1: number = p2.responseBody.previousTimeCursor
		t[Text] = {
			nextTimeCursor = Largest,
			posts = MergeSortPostsModule(p1.byUserId[Text].posts or {}, p2.responseBody.posts),
			previousTimeCursor = if PreviousTimeCursor == nil or PreviousTimeCursor1 == nil then nil else math.min(PreviousTimeCursor, PreviousTimeCursor1),
			reactionsByPostId = if FFlagContentFeedEnableReactions then CryoModule.Dictionary.join(p1.byUserId[Text].reactionsByPostId or {}, (v9(p2.responseBody.posts))) else nil
		}
	end
	return { byUserId = CryoModule.Dictionary.join(p1.byUserId, t) }
end

local function v12(p1, p2)
	-- upvalues: CryoModule (copy), FFlagContentFeedEnableReactions (copy), v9 (copy)
	return {
		byUserId = CryoModule.Dictionary.join(p1.byUserId, {
			[tostring(p2.queryArgs.userId)] = {
				nextTimeCursor = p2.responseBody.nextTimeCursor,
				posts = p2.responseBody.posts,
				previousTimeCursor = p2.responseBody.previousTimeCursor,
				reactionsByPostId = if FFlagContentFeedEnableReactions then v9(p2.responseBody.posts) else nil
			}
		})
	}
end

return function(p1)
	-- upvalues: RoduxModule (copy), config (copy), v12 (copy), v11 (copy)
	local ContentSharingNetworking = p1.ContentSharingNetworking
	
	return RoduxModule.createReducer(config, {
		[ContentSharingNetworking.GetPostsByUserId.Succeeded.name] = v12,
		[ContentSharingNetworking.GetPostsByPostId.Succeeded.name] = v12,
		[ContentSharingNetworking.GetPostsByCursor.Succeeded.name] = v11
	})
end