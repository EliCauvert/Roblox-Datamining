local parent = script:FindFirstAncestor("DataHydration").Parent
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local url = require(parent.Http).Url

return {
	buildFollowingStatusUrl = function(p1, p2)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}/status",
			base = url.FOLLOWINGS_URL
		})({ userId = p1, universeId = p2 })
	end,
	buildFollowingUpdateUrl = function(p1, p2)
		-- upvalues: urlBuilder (ref), url (ref)
		return urlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}",
			base = url.FOLLOWINGS_URL
		})({ userId = p1, universeId = p2 })
	end,
	FOLLOWING_UPDATE_URL = urlBuilder.new({ path = "v1/users/universes/", base = url.FOLLOWINGS_URL }),
	FOLLOWING_STATUS_URL = urlBuilder.new({
		path = "v1/users/universes/status",
		base = url.FOLLOWINGS_URL
	})
}