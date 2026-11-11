local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Analytics.EventNames)

return require(Parent.React).createContext({
	fireAnalyticsEvent = function() end,
	scrollViewPositionChangedSignal = require(Parent.AppCommonLib).Signal.new()
})