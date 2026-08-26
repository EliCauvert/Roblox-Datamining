local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p1)
	-- upvalues: API_URLModule (ref)
	return p1.roduxNetworking.POST("SetSocialLinks", function(p2, p3)
		-- upvalues: API_URLModule (copy)
		return p2(API_URLModule):path("v1"):path("promotion-channels"):body({
			promotionChannelsVisibilityPrivacy = p3.promotionChannelsVisibilityPrivacy,
			facebook = p3.facebook,
			twitter = p3.twitter,
			youtube = p3.youtube,
			twitch = p3.twitch,
			guilded = p3.guilded
		})
	end)
end