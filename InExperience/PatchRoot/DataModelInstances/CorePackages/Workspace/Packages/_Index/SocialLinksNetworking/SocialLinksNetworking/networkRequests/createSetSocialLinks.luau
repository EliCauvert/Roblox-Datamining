local API_URLModule = require(script.Parent.Parent.API_URL)

return function(p0) --[[ line: 17 ]]
	-- upvalues: API_URLModule (ref)
	return p0.roduxNetworking.POST("SetSocialLinks", function(p1, p2) --[[ line: 20 ]]
		-- upvalues: API_URLModule (copy)
		return p1(API_URLModule):path("v1"):path("promotion-channels"):body({
			promotionChannelsVisibilityPrivacy = p2.promotionChannelsVisibilityPrivacy,
			facebook = p2.facebook,
			twitter = p2.twitter,
			youtube = p2.youtube,
			twitch = p2.twitch,
			guilded = p2.guilded
		})
	end)
end