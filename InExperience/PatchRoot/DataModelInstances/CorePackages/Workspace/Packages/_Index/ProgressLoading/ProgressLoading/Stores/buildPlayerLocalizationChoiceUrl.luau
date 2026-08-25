local parent = script:FindFirstAncestor("ProgressLoading").Parent
local url = require(parent.Http).Url
local urlBuilder = require(parent.UrlBuilder).UrlBuilder

return function(p0)
	-- upvalues: urlBuilder (ref), url (ref)
	return urlBuilder.new({
		path = "v1/user-localization-settings/player-choice/{universeId}",
		base = url.GAME_INTERNATIONALIZATION_URL
	})({ universeId = p0 })
end