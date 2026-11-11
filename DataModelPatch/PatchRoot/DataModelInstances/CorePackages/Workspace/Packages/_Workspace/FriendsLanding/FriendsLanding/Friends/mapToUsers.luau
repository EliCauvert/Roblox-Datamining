local DependenciesModule = require(script:FindFirstAncestor("FriendsLanding").dependencies)
local Llama = DependenciesModule.llama
local T = DependenciesModule.t
local RoduxPresence = DependenciesModule.RoduxPresence
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local GetRbxthumbWithTypeSizeAndOptionsFunction = DependenciesModule.getRbxthumbWithTypeSizeAndOptions
local UserLibConstants = DependenciesModule.UserLibConstants

return function(p1)
	-- upvalues: T (copy), GetDeepValueFunction (copy), Llama (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), UserLibConstants (copy), RoduxPresence (copy)
	return function(p2)
		-- upvalues: T (upval), GetDeepValueFunction (upval), p1 (copy), Llama (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UserLibConstants (upval), RoduxPresence (upval)
		assert(T.string(p2))
		local DeletedUsers = p1.FriendsLanding.DeletedUsers or nil
		local VerifiedUsers = p1.FriendsLanding.VerifiedUsers
		
		return Llama.Dictionary.map(GetDeepValueFunction(p1, string.format("FriendsLanding.Friends.byUserId.%s", p2)) or {}, function(p3)
			-- upvalues: p1 (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), UserLibConstants (upval), Llama (upval), GetDeepValueFunction (upval), RoduxPresence (upval), DeletedUsers (copy), VerifiedUsers (copy)
			return Llama.Dictionary.join(GetDeepValueFunction(p1, string.format("FriendsLanding.Users.byUserId.%s", p3)), RoduxPresence.Selectors.getUserPresenceByUserId(p1, p3), {
				thumbnail = if p1.isTest then "" else GetRbxthumbWithTypeSizeAndOptionsFunction(p3, UserLibConstants.RbxthumbTypes.Avatar, 352)
			}, { isDeleted = DeletedUsers and DeletedUsers[p3] }, { hasVerifiedBadge = VerifiedUsers and VerifiedUsers[p3] }, {
				isInactiveFriend = GetDeepValueFunction(p1, `FriendsLanding.InactiveFriends.{p3}`)
			}, {
				friendRank = GetDeepValueFunction(p1, `FriendsLanding.Friends.friendsRankByUserId.{p1.LocalUserId}.{p3}`)
			})
		end)
	end
end