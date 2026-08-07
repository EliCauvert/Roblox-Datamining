local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local text = require(parent.Foundation).Text
local useLocalization = require(parent.Localization).Hooks.useLocalization

return function(_) --[[ line: 13 | named "CommunityLocked" ]]
	-- upvalues: useLocalization (ref), textKeysModule (ref), reactModule (ref), text (ref)
	return reactModule.createElement(text, {
		tag = "padding-top-xlarge",
		Text = useLocalization({ groupLocked = textKeysModule.GroupLocked }).groupLocked
	})
end