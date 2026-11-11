local Parent = script:FindFirstAncestor("ContentSharingRodux").Parent
local FFlagContentFeedEnableReactions = require(Parent.SharedFlags).FFlagContentFeedEnableReactions

return {
	mockGetPostsByUserId = "GET_POSTS_BY_ID_SUCCEEDED",
	mockGetPostsByUserIdAction = require(Parent.Rodux).makeActionCreator("GET_POSTS_BY_ID_SUCCEEDED", function()
		-- upvalues: FFlagContentFeedEnableReactions (copy)
		return {
			responseBody = {
				nextTimeCursor = 1715815334691,
				previousTimeCursor = 1715815334691,
				posts = {
					[1] = {
						creatorUserId = 11112295953,
						postId = "b01b7782-4619-49df-85ae-cd15ca868991",
						contentLinkId = "3b156f3794f9a7b3a34d12a61c88dd0159628a25a84e6272ee969c06e71322da",
						type = 1,
						caption = "mock post text",
						uploadedAtTimestamp = 1715815334691,
						experienceContext = { experienceId = 123, placeId = 123123 },
						reactions = if FFlagContentFeedEnableReactions then {
							{
								emoteId = "like",
								count = 12,
								hasUserReacted = false,
								reactionsPage = {}
							},
							{
								emoteId = "love",
								count = 40,
								hasUserReacted = true,
								reactionsPage = {}
							}
						} else nil
					}
				}
			}
		}
	end)
}