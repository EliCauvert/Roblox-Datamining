local parent = script.Parent.Parent.Parent.Parent
local reactModule = require(parent.React)
local useVerifiedBadge = require(parent.UserProfiles).Hooks.useVerifiedBadge
local verifiedBadgeModule = require(parent.VerifiedBadges.VerifiedBadge)
local fFlagEnableVerifiedBadgeStore = require(parent.SharedFlags).FFlagEnableVerifiedBadgeStore

return reactModule.memo(function(p0) --[[ line: 13 | named "PlayerVerifiedBadge" ]]
	-- upvalues: fFlagEnableVerifiedBadgeStore (ref), useVerifiedBadge (ref), reactModule (ref), verifiedBadgeModule (ref)
	return if if fFlagEnableVerifiedBadgeStore then useVerifiedBadge(p0.player) else p0.player.HasVerifiedBadge then reactModule.createElement(verifiedBadgeModule, { LayoutOrder = p0.layoutOrder }) else nil
end)