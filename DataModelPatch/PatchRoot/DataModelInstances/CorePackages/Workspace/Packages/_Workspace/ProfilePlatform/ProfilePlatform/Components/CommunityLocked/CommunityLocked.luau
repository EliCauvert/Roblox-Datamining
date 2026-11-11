local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local Text = require(Parent.Foundation).Text
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(_)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "padding-top-xlarge",
		Text = UseLocalizationFunction({ groupLocked = TextKeysModule.GroupLocked }).groupLocked
	})
end