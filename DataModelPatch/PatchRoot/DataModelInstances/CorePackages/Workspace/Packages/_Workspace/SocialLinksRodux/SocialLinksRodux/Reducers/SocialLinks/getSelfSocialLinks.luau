local RoduxModule = require(script:FindFirstAncestor("SocialLinksRodux").Parent.Rodux)

return function(p1)
	-- upvalues: RoduxModule (copy)
	return RoduxModule.createReducer({}, {
		[p1.SocialLinksNetworking.GetSelfSocialLinks.Succeeded.name] = function(_, p2)
			return {
				socialLinks = {
					facebook = p2.responseBody.facebook,
					twitter = p2.responseBody.twitter,
					youtube = p2.responseBody.youtube,
					twitch = p2.responseBody.twitch,
					guilded = p2.responseBody.guilded
				},
				visibility = p2.responseBody.promotionChannelsVisibilityPrivacy
			}
		end
	})
end