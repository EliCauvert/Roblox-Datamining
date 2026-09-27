local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local commentFixturesModule = require(script.Parent.CommentFixtures)
local list = {
	{
		commentId = "c-3",
		text = "okay the camera turn at the end was actually perfect",
		ageSeconds = 64800,
		author = commentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-4",
		text = "i tried this and immediately fell off the map \240\159\152\173",
		ageSeconds = 86400,
		author = commentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-5",
		text = "what settings are you using for this?",
		ageSeconds = 172800,
		author = commentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-6",
		text = "avatar service said no, but this comment should still render normally",
		ageSeconds = 259200,
		author = commentFixturesModule.AUTHORS.unavailableAvatar
	},
	{
		commentId = "c-7",
		text = "no way you landed that first try",
		ageSeconds = 432000,
		author = commentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-8",
		text = "saving this so i can practice later",
		ageSeconds = 518400,
		author = commentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-9",
		text = "the sound effect took me out \240\159\146\128",
		ageSeconds = 604800,
		author = commentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-10",
		text = "full tutorial please \226\128\148 camera sensitivity, keybinds, timing cues, practice route, and how you recover when the second jump goes wrong \240\159\153\143",
		ageSeconds = 864000,
		author = commentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-25",
		text = "okay i have watched this an unreasonable number of times and i still cannot figure out how you kept enough momentum after the first turn to clear the second platform, because every time i try it i either clip the corner, lose all my speed, or launch in completely the wrong direction. i changed my sensitivity, copied the camera angle, slowed the clip down frame by frame, and even practiced the opening section for an entire evening, but the closest i got was landing on the edge and immediately sliding off. please make a full breakdown that shows the inputs, camera movement, timing, backup route, and what to do when the setup is slightly off, because this one clip has somehow become my personal final boss and i refuse to give up until i can land it consistently.",
		ageSeconds = 1036800,
		author = commentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-11",
		text = "first attempt: fell instantly\nsecond attempt: missed the ledge\nthird attempt: somehow landed it \240\159\152\173",
		ageSeconds = 1209600,
		author = commentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-12",
		text = "that recovery was unbelievably clean",
		ageSeconds = 1728000,
		author = commentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-13",
		text = "i keep coming back to watch the last five seconds",
		ageSeconds = 2505600,
		author = commentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-14",
		text = "this convinced me to try the game again",
		ageSeconds = 2592000,
		author = commentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-15",
		text = "the movement looks so smooth here",
		ageSeconds = 3888000,
		author = commentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-16",
		text = "still one of the best clips from this update",
		ageSeconds = 5184000,
		author = commentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-17",
		text = "this author id is malformed, so the row should use its fallback avatar and name",
		ageSeconds = 10368000,
		author = commentFixturesModule.AUTHORS.malformedAvatar
	},
	{
		commentId = "c-18",
		text = "the timing on every jump is so satisfying",
		ageSeconds = 20736000,
		author = commentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-19",
		text = "almost a year later and this strategy still works",
		ageSeconds = 31449600,
		author = commentFixturesModule.AUTHORS.shedletsky
	},
	{
		commentId = "c-20",
		text = "this was the clip that got me into speedrunning",
		ageSeconds = 31536000,
		author = commentFixturesModule.AUTHORS.sceleratis
	},
	{
		commentId = "c-21",
		text = "two years later and i finally managed to do it",
		ageSeconds = 63072000,
		author = commentFixturesModule.AUTHORS.builderman
	},
	{
		commentId = "c-22",
		text = "the nostalgia in this comment section is unreal",
		ageSeconds = 94608000,
		author = commentFixturesModule.AUTHORS.roblox
	},
	{
		commentId = "c-23",
		text = "this moment aged perfectly",
		ageSeconds = 157680000,
		author = commentFixturesModule.AUTHORS.webGL3D
	},
	{
		commentId = "c-24",
		text = "an all-time classic",
		ageSeconds = 252288000,
		author = commentFixturesModule.AUTHORS.shedletsky
	}
}

local function _(p1, p2)
	return DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - p1):ToIsoDate()
end

local _ = function(p1, p2)
	return `{p1}:{p2}`
end

local function page1(p1, p2)
	-- upvalues: commentFixturesModule (ref)
	return {
		nextCursor = "page-empty",
		hasMore = true,
		comments = {
			commentFixturesModule.makeComment({
				text = "can't believe that worked on the first try lol",
				commentId = `{p1}:c-1`,
				feedItemId = p1,
				createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - 7200):ToIsoDate(),
				author = commentFixturesModule.AUTHORS.roblox
			}),
			commentFixturesModule.makeComment({
				text = "the music sync at the end is so good",
				commentId = `{p1}:c-2`,
				feedItemId = p1,
				createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - 25200):ToIsoDate(),
				author = commentFixturesModule.AUTHORS.builderman
			})
		}
	}
end

local function emptyHasMorePage()
	return { nextCursor = "page-3", hasMore = true, comments = {} }
end

local function reactionPage(p1, p2)
	-- upvalues: commentFixturesModule (ref)
	local REACTION_IDS = commentFixturesModule.REACTION_IDS
	
	return {
		nextCursor = nil,
		hasMore = false,
		comments = if p1 == REACTION_IDS.feedItemId then {
			commentFixturesModule.makeComment({
				text = "canonical comment reaction fixture",
				commentId = REACTION_IDS.commentId,
				feedItemId = p1,
				createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - 3600):ToIsoDate(),
				author = commentFixturesModule.AUTHORS.roblox,
				reactions = commentFixturesModule.REACTIONS.empty
			}),
			commentFixturesModule.makeComment({
				text = "canonical selected reaction fixture",
				commentId = REACTION_IDS.secondCommentId,
				feedItemId = p1,
				createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - 7200):ToIsoDate(),
				author = commentFixturesModule.AUTHORS.builderman,
				reactions = commentFixturesModule.REACTIONS.selectedUnknown
			})
		} else {
			commentFixturesModule.makeComment({
				text = "canonical wrong-parent reaction fixture",
				commentId = REACTION_IDS.otherCommentId,
				feedItemId = p1,
				createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - 3600):ToIsoDate(),
				author = commentFixturesModule.AUTHORS.shedletsky,
				reactions = commentFixturesModule.REACTIONS.empty
			})
		}
	}
end

local function page3(p1, p2)
	-- upvalues: list (ref), commentFixturesModule (ref)
	local list_1 = table.create(#list)
	
	for i, v in list do
		table.insert(list_1, commentFixturesModule.makeComment({
			commentId = `{p1}:{v.commentId}`,
			feedItemId = p1,
			text = v.text,
			createdAt = DateTime.fromUnixTimestamp((p2 or DateTime.now().UnixTimestamp) - v.ageSeconds):ToIsoDate(),
			author = v.author
		}))
	end
	return { nextCursor = nil, hasMore = false, comments = list_1 }
end

return {
	EMPTY_HAS_MORE_CURSOR = "page-empty",
	PAGE_3_CURSOR = "page-3",
	page1 = page1,
	reactionPage = reactionPage,
	emptyHasMorePage = emptyHasMorePage,
	page3 = page3,
	pageForCursor = function(p3, p4, p5)
		-- upvalues: commentFixturesModule (ref), reactionPage (ref), page1 (ref), page3 (ref)
		return if (p4 == nil or p4 == "") and (p3 == commentFixturesModule.REACTION_IDS.feedItemId or p3 == commentFixturesModule.REACTION_IDS.otherFeedItemId) then reactionPage(p3, p5) elseif p4 == nil or p4 == "" then page1(p3, p5) elseif p4 == "page-empty" then { nextCursor = "page-3", hasMore = true, comments = {} } elseif p4 == "page-3" then page3(p3, p5) else { nextCursor = nil, hasMore = false, comments = {} }
	end
}