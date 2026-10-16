local Parent = script:FindFirstAncestor("ProgressLoading").Parent
local Url = require(Parent.Http).Url
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder

return function(UniverseId) --[[ Line: 8 | Named "buildPlayerLocalizationChoiceUrl" ]]
	-- upvalues: UrlBuilder (copy), Url (copy)
	return UrlBuilder.new({
		path = "v1/user-localization-settings/player-choice/{universeId}",
		base = Url.GAME_INTERNATIONALIZATION_URL
	})({ universeId = UniverseId })
end