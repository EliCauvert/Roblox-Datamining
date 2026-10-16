local APIURLModule = require(script.Parent.Parent.API_URL)

return function(p1) --[[ Line: 17 ]]
	-- upvalues: APIURLModule (copy)
	return p1.roduxNetworking.POST("SetSocialLinks", function(Callback, p2) --[[ Line: 20 ]]
		-- upvalues: APIURLModule (upval)
		return Callback(APIURLModule):path("v1"):path("promotion-channels"):body({
			promotionChannelsVisibilityPrivacy = p2.promotionChannelsVisibilityPrivacy,
			facebook = p2.facebook,
			twitter = p2.twitter,
			youtube = p2.youtube,
			twitch = p2.twitch,
			guilded = p2.guilded
		})
	end)
end