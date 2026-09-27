local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local t = {
	feedItemId = "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
	commentId = "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb",
	secondCommentId = "cccccccc-cccc-cccc-cccc-cccccccccccc",
	otherFeedItemId = "dddddddd-dddd-dddd-dddd-dddddddddddd",
	otherCommentId = "eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee",
	nonexistentCommentId = "ffffffff-ffff-ffff-ffff-ffffffffffff",
	thumbsUpEmoteId = "ceaa4d10-c6e5-4dbe-97ef-9c2ee37f9a30",
	unknownEmoteId = "b19f82d3-774b-45a3-a9f7-729d643d126e"
}
local t_1 = {
	roblox = {
		userId = "1",
		username = "Roblox",
		displayName = "Roblox",
		hasVerifiedBadge = true
	},
	builderman = {
		userId = "156",
		username = "builderman",
		displayName = "builderman",
		hasVerifiedBadge = true
	},
	shedletsky = {
		userId = "261",
		username = "Shedletsky",
		displayName = "Shedletsky"
	},
	sceleratis = {
		userId = "1237666",
		username = "Sceleratis",
		displayName = "Sceleratis"
	},
	webGL3D = {
		userId = "48103520",
		username = "WebGL3D",
		displayName = "WebGL3D"
	},
	unavailableAvatar = { userId = "999999999999999" },
	malformedAvatar = { userId = "not-a-user-id" }
}
local t_2 = {
	AUTHORS = t_1,
	ERRORS = {
		TextFilterRejected = {
			errorCode = "TextFilterRejected",
			message = "text did not pass filter"
		},
		RateLimited = { errorCode = "RateLimited", message = "too many requests" },
		ViewerNotEligibleToReact = {
			errorCode = "ViewerNotEligibleToReact",
			message = "the viewer cannot react to comments"
		}
	},
	REACTION_IDS = t,
	REACTIONS = {
		empty = { userReaction = nil, counts = {} },
		selectedThumbsUp = {
			counts = { { count = 3, emoteId = t.thumbsUpEmoteId } },
			userReaction = { emoteId = t.thumbsUpEmoteId }
		},
		selectedUnknown = {
			counts = { { count = 1, emoteId = t.unknownEmoteId } },
			userReaction = { emoteId = t.unknownEmoteId }
		}
	},
	makeComment = function(p1)
		-- upvalues: t_1 (ref)
		local t = {
			commentId = "c-1",
			feedItemId = "feed-1",
			status = "Active",
			text = "This moment is fire",
			createdAt = "2026-08-12T12:00:00Z",
			isAuthoredByViewer = false,
			author = t_1.roblox
		}
		
		if p1 then
			for i, v in p1 do
				t[i] = v
			end
		end
		return t
	end,
	makeEnvelope = function(p2)
		local t = {
			count = 25,
			countIsCapped = false,
			creatorEnabled = true,
			viewerCanRead = true,
			viewerCanWrite = true
		}
		
		if p2 then
			for i, v in p2 do
				t[i] = v
			end
		end
		return t
	end
}
local t_3 = { count = 99, countIsCapped = true }
local t_4 = {
	count = 25,
	countIsCapped = false,
	creatorEnabled = true,
	viewerCanRead = true,
	viewerCanWrite = true
}

if t_3 then
	for i, v in t_3 do
		t_4[i] = v
	end
end
t_2.cappedEnvelope = t_4

return t_2