local Parent = script.Parent.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local UseVerifiedBadgeFunction = require(Parent.UserProfiles).Hooks.useVerifiedBadge
local VerifiedBadgeModule = require(Parent.VerifiedBadges.VerifiedBadge)
local FFlagEnableVerifiedBadgeStore = require(Parent.SharedFlags).FFlagEnableVerifiedBadgeStore

return ReactModule.memo(function(p1) --[[ Line: 13 | Named "PlayerVerifiedBadge" ]]
	-- upvalues: FFlagEnableVerifiedBadgeStore (copy), UseVerifiedBadgeFunction (copy), ReactModule (copy), VerifiedBadgeModule (copy)
	return if if FFlagEnableVerifiedBadgeStore then UseVerifiedBadgeFunction(p1.player) else p1.player.HasVerifiedBadge then ReactModule.createElement(VerifiedBadgeModule, { LayoutOrder = p1.layoutOrder }) else nil
end)