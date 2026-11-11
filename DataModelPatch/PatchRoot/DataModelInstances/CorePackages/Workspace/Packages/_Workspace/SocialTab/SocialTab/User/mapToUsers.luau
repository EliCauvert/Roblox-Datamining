local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local Llama = DependenciesModule.llama
local T = DependenciesModule.t
local RoduxPresence = DependenciesModule.RoduxPresence
local GetStandardSizeAvatarHeadShotRbxthumbFunction = DependenciesModule.getStandardSizeAvatarHeadShotRbxthumb

return function(p1, _)
	-- upvalues: T (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), Llama (copy), RoduxPresence (copy)
	return function(p2)
		-- upvalues: T (upval), p1 (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (upval), Llama (upval), RoduxPresence (upval)
		assert(T.string(p2))
		
		return if p1.SocialTab.Users.byUserId[p2] then Llama.Dictionary.join(p1.SocialTab.Users.byUserId[p2], RoduxPresence.Selectors.getUserPresenceByUserId(p1, p2), {
			thumbnail = GetStandardSizeAvatarHeadShotRbxthumbFunction(p2),
			isPremium = p1.SocialTab.PremiumByUserId[p2] or false,
			hasVerifiedBadge = if p1.VerifiedBadges and p1.VerifiedBadges.VerifiedUsers then p1.VerifiedBadges.VerifiedUsers[p2] or false else nil
		}) else nil
	end
end