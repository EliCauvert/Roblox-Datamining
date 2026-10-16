local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local _ = require(ProfilePlatform.Analytics.EventNames)

return require(Parent.React).createContext({
	fireAnalyticsEvent = function() --[[ Line: 29 ]] end,
	scrollViewPositionChangedSignal = require(Parent.AppCommonLib).Signal.new()
})