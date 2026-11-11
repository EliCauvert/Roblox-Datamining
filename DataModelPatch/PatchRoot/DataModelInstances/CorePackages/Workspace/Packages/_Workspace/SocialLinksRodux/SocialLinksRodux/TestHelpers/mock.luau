local RoduxModule = require(script:FindFirstAncestor("SocialLinksRodux").Parent.Rodux)

return {
	mockGetSocialLinks = "SOCIAL_LINKS_SUCCEEDED",
	mockGetSelfSocialLinks = "SELF_SOCIAL_LINKS_SUCCEEDED",
	mockGetSocialLinksAction = RoduxModule.makeActionCreator("SOCIAL_LINKS_SUCCEEDED", function()
		return {
			namedIds = { users = "123" },
			responseBody = {
				facebook = "facebookUrl",
				twitter = "twitterUrl",
				youtube = "youtubeUrl",
				twitch = "twitchUrl",
				guilded = nil
			},
			queryArgs = { alwaysReturnUrls = true }
		}
	end),
	mockGetSelfSocialLinksAction = RoduxModule.makeActionCreator("SELF_SOCIAL_LINKS_SUCCEEDED", function()
		return {
			responseBody = {
				promotionChannelsVisibilityPrivacy = "NoOne",
				facebook = "url",
				twitter = "url",
				youtube = "url",
				twitch = "url",
				guilded = nil
			}
		}
	end)
}