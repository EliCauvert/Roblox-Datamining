local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildFollowingStatusUrl = function(p0, p1) --[[ line: 14 ]]
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}/status",
			base = url.FOLLOWINGS_URL
		})({ userId = p0, universeId = p1 })
	end,
	buildFollowingUpdateUrl = function(p2, p3) --[[ line: 29 ]]
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}",
			base = url.FOLLOWINGS_URL
		})({ userId = p2, universeId = p3 })
	end,
	FOLLOWING_UPDATE_URL = urlBuilder.new({ path = "v1/users/universes/", base = url.FOLLOWINGS_URL }),
	FOLLOWING_STATUS_URL = urlBuilder.new({
		path = "v1/users/universes/status",
		base = url.FOLLOWINGS_URL
	})
}