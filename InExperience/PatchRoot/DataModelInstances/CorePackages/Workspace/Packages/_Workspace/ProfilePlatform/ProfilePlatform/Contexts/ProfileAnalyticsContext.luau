local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local _ = require(profilePlatform.Analytics.EventNames)

return require(parent.React).createContext({
	fireAnalyticsEvent = function() --[[ line: 29 ]] end,
	scrollViewPositionChangedSignal = require(parent.AppCommonLib).Signal.new()
})