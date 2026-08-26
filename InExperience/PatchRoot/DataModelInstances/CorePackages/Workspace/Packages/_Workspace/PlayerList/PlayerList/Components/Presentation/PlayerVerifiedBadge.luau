local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local useVerifiedBadge = require(parent.UserProfiles).Hooks.useVerifiedBadge
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore

return reactModule.memo(function(p1)
	-- upvalues: fFlagEnableVerifiedBadgeStore (ref), useVerifiedBadge (ref), reactModule (ref), verifiedBadgeModule (ref)
	return if if fFlagEnableVerifiedBadgeStore then useVerifiedBadge(p1.player) else p1.player.HasVerifiedBadge then reactModule.createElement(verifiedBadgeModule, { LayoutOrder = p1.layoutOrder }) else nil
end)