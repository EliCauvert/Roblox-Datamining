local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local _ = require(Parent.PeekView).PeekViewState
local FFlagProfileInspectAvatarSlideIn = require(Parent.SharedFlags).FFlagProfileInspectAvatarSlideIn
local FFlagProfileInspectAvatarShopChip = require(Parent.SharedFlags).FFlagProfileInspectAvatarShopChip
local FFlagProfilePlatformSeededPymk = require(Parent.SharedFlags).FFlagProfilePlatformSeededPymk

return (require(Parent.React).createContext({
	scrollY = 0,
	peekViewOpenPercent = 0,
	setAbsoluteYPosition = function() end,
	setPeekViewOpenPercent = function() end,
	isPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then true else nil,
	setIsPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then function() end else nil,
	setPeekViewState = if FFlagProfilePlatformSeededPymk then function() end else nil,
	requestFullView = if FFlagProfilePlatformSeededPymk then function() end else nil
}))