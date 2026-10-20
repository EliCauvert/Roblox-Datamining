local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local CommentFixturesModule = require(script.Parent.CommentFixtures)
local list = {
	{
		commentId = "c-3",
		text = "okay the camera turn at the end was actually perfect",
		ageSeconds = 64800,
		author = CommentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-4",
		text = "i tried this and immediately fell off the map 😭",
		ageSeconds = 86400,
		author = CommentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-5",
		text = "what settings are you using for this?",
		ageSeconds = 172800,
		author = CommentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-6",
		text = "avatar service said no, but this comment should still render normally",
		ageSeconds = 259200,
		author = CommentFixturesModule.AUTHORS.unavailableAvatar
	},
	{
		commentId = "c-7",
		text = "no way you landed that first try",
		ageSeconds = 432000,
		author = CommentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-8",
		text = "saving this so i can practice later",
		ageSeconds = 518400,
		author = CommentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-9",
		text = "the sound effect took me out 💀",
		ageSeconds = 604800,
		author = CommentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-10",
		text = "full tutorial please — camera sensitivity, keybinds, timing cues, practice route, and how you recover when the second jump goes wrong 🙏",
		ageSeconds = 864000,
		author = CommentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-25",
		text = "okay i have watched this an unreasonable number of times and i still cannot figure out how you kept enough momentum after the first turn to clear the second platform, because every time i try it i either clip the corner, lose all my speed, or launch in completely the wrong direction. i changed my sensitivity, copied the camera angle, slowed the clip down frame by frame, and even practiced the opening section for an entire evening, but the closest i got was landing on the edge and immediately sliding off. please make a full breakdown that shows the inputs, camera movement, timing, backup route, and what to do when the setup is slightly off, because this one clip has somehow become my personal final boss and i refuse to give up until i can land it consistently.",
		ageSeconds = 1036800,
		author = CommentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-11",
		text = "first attempt: fell instantly\nsecond attempt: missed the ledge\nthird attempt: somehow landed it 😭",
		ageSeconds = 1209600,
		author = CommentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-12",
		text = "that recovery was unbelievably clean",
		ageSeconds = 1728000,
		author = CommentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-13",
		text = "i keep coming back to watch the last five seconds",
		ageSeconds = 2505600,
		author = CommentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-14",
		text = "this convinced me to try the game again",
		ageSeconds = 2592000,
		author = CommentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-15",
		text = "the movement looks so smooth here",
		ageSeconds = 3888000,
		author = CommentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-16",
		text = "still one of the best clips from this update",
		ageSeconds = 5184000,
		author = CommentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-17",
		text = "this author id is malformed, so the row should use its fallback avatar and name",
		ageSeconds = 10368000,
		author = CommentFixturesModule.AUTHORS.malformedAvatar
	},
	{
		commentId = "c-18",
		text = "the timing on every jump is so satisfying",
		ageSeconds = 20736000,
		author = CommentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-19",
		text = "almost a year later and this strategy still works",
		ageSeconds = 31449600,
		author = CommentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-20",
		text = "this was the clip that got me into speedrunning",
		ageSeconds = 31536000,
		author = CommentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-21",
		text = "two years later and i finally managed to do it",
		ageSeconds = 63072000,
		author = CommentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-22",
		text = "the nostalgia in this comment section is unreal",
		ageSeconds = 94608000,
		author = CommentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-23",
		text = "this moment aged perfectly",
		ageSeconds = 157680000,
		author = CommentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-24",
		text = "an all-time classic",
		ageSeconds = 252288000,
		author = CommentFixturesModule.AUTHORS.shedletsky
	}
}

local function _(p1, p2)
	return DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - p1):ToIsoDate()
end

local _ = function(p1, p2): string
	return `{p1}:{p2}`
end

local function page1(FeedItemId, p1)
	-- upvalues: CommentFixturesModule (copy)
	return {
		nextCursor = "page-empty",
		hasMore = true,
		comments = {
			CommentFixturesModule.makeComment({
				text = "can't believe that worked on the first try lol",
				commentId = `{FeedItemId}:c-1`,
				feedItemId = FeedItemId,
				createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - 7200):ToIsoDate(),
				author = CommentFixturesModule.AUTHORS.roblox
			}),
			CommentFixturesModule.makeComment({
				text = "the music sync at the end is so good",
				commentId = `{FeedItemId}:c-2`,
				feedItemId = FeedItemId,
				createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - 25200):ToIsoDate(),
				author = CommentFixturesModule.AUTHORS.builderman
			})
		}
	}
end

local function reactionPage(FeedItemId, p1)
	-- upvalues: CommentFixturesModule (copy)
	local REACTIONIDS = CommentFixturesModule.REACTION_IDS
	
	return {
		nextCursor = nil,
		hasMore = false,
		comments = if FeedItemId == REACTIONIDS.feedItemId then {
			CommentFixturesModule.makeComment({
				text = "canonical comment reaction fixture",
				commentId = REACTIONIDS.commentId,
				feedItemId = FeedItemId,
				createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - 3600):ToIsoDate(),
				author = CommentFixturesModule.AUTHORS.roblox,
				reactions = CommentFixturesModule.REACTIONS.empty
			}),
			CommentFixturesModule.makeComment({
				text = "canonical selected reaction fixture",
				commentId = REACTIONIDS.secondCommentId,
				feedItemId = FeedItemId,
				createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - 7200):ToIsoDate(),
				author = CommentFixturesModule.AUTHORS.builderman,
				reactions = CommentFixturesModule.REACTIONS.selectedUnknown
			})
		} else {
			CommentFixturesModule.makeComment({
				text = "canonical wrong-parent reaction fixture",
				commentId = REACTIONIDS.otherCommentId,
				feedItemId = FeedItemId,
				createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - 3600):ToIsoDate(),
				author = CommentFixturesModule.AUTHORS.shedletsky,
				reactions = CommentFixturesModule.REACTIONS.empty
			})
		}
	}
end

local function page3(FeedItemId, p1)
	-- upvalues: list (copy), CommentFixturesModule (copy)
	local Buffer = table.create(#list)
	
	for _, value in list do
		table.insert(Buffer, CommentFixturesModule.makeComment({
			commentId = `{FeedItemId}:{value.commentId}`,
			feedItemId = FeedItemId,
			text = value.text,
			createdAt = DateTime.fromUnixTimestamp((p1 or DateTime.now().UnixTimestamp) - value.ageSeconds):ToIsoDate(),
			author = value.author
		}))
	end
	return { nextCursor = nil, hasMore = false, comments = Buffer }
end

return {
	EMPTY_HAS_MORE_CURSOR = "page-empty",
	PAGE_3_CURSOR = "page-3",
	page1 = page1,
	reactionPage = reactionPage,
	emptyHasMorePage = function()
		return { nextCursor = "page-3", hasMore = true, comments = {} }
	end,
	page3 = page3,
	pageForCursor = function(FeedItemId, p2, p3)
		-- upvalues: CommentFixturesModule (copy), reactionPage (copy), page1 (copy), page3 (copy)
		return if (p2 == nil or p2 == "") and (FeedItemId == CommentFixturesModule.REACTION_IDS.feedItemId or FeedItemId == CommentFixturesModule.REACTION_IDS.otherFeedItemId) then reactionPage(FeedItemId, p3) elseif p2 == nil or p2 == "" then page1(FeedItemId, p3) elseif p2 == "page-empty" then { nextCursor = "page-3", hasMore = true, comments = {} } elseif p2 == "page-3" then page3(FeedItemId, p3) else { nextCursor = nil, hasMore = false, comments = {} }
	end
}