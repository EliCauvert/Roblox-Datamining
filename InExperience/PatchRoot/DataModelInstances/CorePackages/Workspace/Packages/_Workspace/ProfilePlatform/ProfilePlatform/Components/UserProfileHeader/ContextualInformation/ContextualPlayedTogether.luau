local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local textKeysModule = require(profilePlatform.Common.TextKeys)
local playerContext = require(parent.UIBlox).App.Indicator.PlayerContext

return function(p1)
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), playerContext (ref)
	local experienceName = p1.experienceName
	
	return reactModule.createElement(playerContext, {
		text = useLocalization({
			playedTogetherText = if experienceName ~= "" then textKeysModule.PlayedTogether else {
				textKeysModule.PlayedTogetherInGameDescription,
				experience_name = experienceName
			}
		}).playedTogetherText
	})
end