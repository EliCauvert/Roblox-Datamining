local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local PlayerContext = require(Parent.UIBlox).App.Indicator.PlayerContext

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), PlayerContext (copy)
	local ExperienceName = p1.experienceName
	
	return ReactModule.createElement(PlayerContext, {
		text = UseLocalizationFunction({
			playedTogetherText = if ExperienceName == "" then TextKeysModule.PlayedTogether else {
				TextKeysModule.PlayedTogetherInGameDescription,
				experience_name = ExperienceName
			}
		}).playedTogetherText
	})
end