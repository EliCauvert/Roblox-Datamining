local Parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local Url = require(Parent.CoreScriptsCommon).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(UniverseId)
	-- upvalues: UrlBuilder (copy), Url (copy)
	return UrlBuilder.new({
		path = "v1/user-localization-settings/player-choice/{universeId}",
		base = Url.GAME_INTERNATIONALIZATION_URL
	})({ universeId = UniverseId })
end