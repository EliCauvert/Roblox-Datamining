local _ = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes)
local config = {
	feedItemId = "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
	commentId = "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb",
	secondCommentId = "cccccccc-cccc-cccc-cccc-cccccccccccc",
	otherFeedItemId = "dddddddd-dddd-dddd-dddd-dddddddddddd",
	otherCommentId = "eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee",
	nonexistentCommentId = "ffffffff-ffff-ffff-ffff-ffffffffffff",
	thumbsUpEmoteId = "ceaa4d10-c6e5-4dbe-97ef-9c2ee37f9a30",
	unknownEmoteId = "b19f82d3-774b-45a3-a9f7-729d643d126e"
}
local config1 = {
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
local config2 = {
	AUTHORS = config1,
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
	REACTION_IDS = config,
	REACTIONS = {
		empty = { userReaction = nil, counts = {} },
		selectedThumbsUp = {
			counts = { { count = 3, emoteId = config.thumbsUpEmoteId } },
			userReaction = { emoteId = config.thumbsUpEmoteId }
		},
		selectedUnknown = {
			counts = { { count = 1, emoteId = config.unknownEmoteId } },
			userReaction = { emoteId = config.unknownEmoteId }
		}
	},
	makeComment = function(List) --[[ Line: 97 ]]
		-- upvalues: config1 (copy)
		local config = {
			commentId = "c-1",
			feedItemId = "feed-1",
			status = "Active",
			text = "This moment is fire",
			createdAt = "2026-08-12T12:00:00Z",
			isAuthoredByViewer = false,
			author = config1.roblox
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return config
	end,
	makeEnvelope = function(List) --[[ Line: 115 ]]
		local config = {
			count = 25,
			countIsCapped = false,
			creatorEnabled = true,
			viewerCanRead = true,
			viewerCanWrite = true
		}
		
		if List then
			for i, value in List do
				config[i] = value
			end
		end
		return config
	end
}
local config3 = { count = 99, countIsCapped = true }
local CappedEnvelope = {
	count = 25,
	countIsCapped = false,
	creatorEnabled = true,
	viewerCanRead = true,
	viewerCanWrite = true
}

if config3 then
	for i, value in config3 do
		CappedEnvelope[i] = value
	end
end
config2.cappedEnvelope = CappedEnvelope

return config2