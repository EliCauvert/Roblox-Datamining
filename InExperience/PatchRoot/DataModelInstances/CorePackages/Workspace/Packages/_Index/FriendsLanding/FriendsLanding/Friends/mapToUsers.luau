local friendsLanding = script:FindFirstAncestor("FriendsLanding")
local dependenciesModule = require(friendsLanding.dependencies)
local llama = dependenciesModule.llama
local t = dependenciesModule.t
local roduxPresence = dependenciesModule.RoduxPresence
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local getRbxthumbWithTypeSizeAndOptions = dependenciesModule.getRbxthumbWithTypeSizeAndOptions
local userLibConstants = dependenciesModule.UserLibConstants

return if require(friendsLanding.Flags.FFlagFriendsLandingDeprecateUnusedMapToUsers) then nil else function(p0) --[[ line: 17 ]]
	-- upvalues: t (ref), getDeepValue (ref), llama (ref), getRbxthumbWithTypeSizeAndOptions (ref), userLibConstants (ref), roduxPresence (ref)
	return function(p1) --[[ line: 18 ]]
		-- upvalues: t (copy), getDeepValue (copy), p0 (ref), llama (copy), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), roduxPresence (copy)
		assert(t.string(p1))
		local var2 = getDeepValue(p0, string.format("FriendsLanding.Friends.byUserId.%s", p1)) or {}
		local deletedUsers = p0.FriendsLanding.DeletedUsers or nil
		local verifiedUsers = p0.FriendsLanding.VerifiedUsers
		
		return llama.Dictionary.map(var2, function(p2) --[[ line: 24 ]]
			-- upvalues: p0 (copy), getRbxthumbWithTypeSizeAndOptions (copy), userLibConstants (copy), llama (copy), getDeepValue (copy), roduxPresence (copy), deletedUsers (ref), verifiedUsers (ref)
			return llama.Dictionary.join(getDeepValue(p0, string.format("FriendsLanding.Users.byUserId.%s", p2)), roduxPresence.Selectors.getUserPresenceByUserId(p0, p2), {
				thumbnail = if p0.isTest then "" else getRbxthumbWithTypeSizeAndOptions(p2, userLibConstants.RbxthumbTypes.Avatar, 352)
			}, { isDeleted = deletedUsers and deletedUsers[p2] }, { hasVerifiedBadge = verifiedUsers and verifiedUsers[p2] }, {
				isInactiveFriend = getDeepValue(p0, `FriendsLanding.InactiveFriends.{p2}`)
			}, {
				friendRank = getDeepValue(p0, `FriendsLanding.Friends.friendsRankByUserId.{p0.LocalUserId}.{p2}`)
			})
		end)
	end
end