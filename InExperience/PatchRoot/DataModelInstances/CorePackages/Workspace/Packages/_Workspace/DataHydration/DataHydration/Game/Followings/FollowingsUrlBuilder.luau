local Parent = script:FindFirstAncestor("DataHydration").Parent
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local Url = require(Parent.Http).Url

return {
	buildFollowingStatusUrl = function(UserId, UniverseId)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}/status",
			base = Url.FOLLOWINGS_URL
		})({ userId = UserId, universeId = UniverseId })
	end,
	buildFollowingUpdateUrl = function(UserId, UniverseId)
		-- upvalues: UrlBuilder (copy), Url (copy)
		return UrlBuilder.new({
			path = "v1/users/{userId}/universes/{universeId}",
			base = Url.FOLLOWINGS_URL
		})({ userId = UserId, universeId = UniverseId })
	end,
	FOLLOWING_UPDATE_URL = UrlBuilder.new({ path = "v1/users/universes/", base = Url.FOLLOWINGS_URL }),
	FOLLOWING_STATUS_URL = UrlBuilder.new({
		path = "v1/users/universes/status",
		base = Url.FOLLOWINGS_URL
	})
}