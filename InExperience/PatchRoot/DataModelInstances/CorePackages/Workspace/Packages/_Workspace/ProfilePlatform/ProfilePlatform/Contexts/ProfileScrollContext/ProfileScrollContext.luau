local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local FFlagProfileInspectAvatarSlideIn = require(Parent.SharedFlags).FFlagProfileInspectAvatarSlideIn
local FFlagProfileInspectAvatarShopChip = require(Parent.SharedFlags).FFlagProfileInspectAvatarShopChip

return (require(Parent.React).createContext({
	scrollY = 0,
	peekViewOpenPercent = 0,
	setAbsoluteYPosition = function() end,
	setPeekViewOpenPercent = function() end,
	isPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then true else nil,
	setIsPeekViewFullyOpen = if FFlagProfileInspectAvatarSlideIn or FFlagProfileInspectAvatarShopChip then function() end else nil
}))