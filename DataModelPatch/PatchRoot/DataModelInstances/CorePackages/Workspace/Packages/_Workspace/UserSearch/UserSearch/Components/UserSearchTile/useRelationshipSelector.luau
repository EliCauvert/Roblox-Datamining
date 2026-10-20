local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local RODUXKEY = require(UserSearch.Common.Constants).RODUX_KEY
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue

return function(LocalUserId)
	-- upvalues: UseSelectorFunction (copy), GetDeepValueFunction (copy), RODUXKEY (copy)
	return UseSelectorFunction(function(p1)
		-- upvalues: GetDeepValueFunction (upval), RODUXKEY (upval), LocalUserId (copy)
		return {
			status = GetDeepValueFunction(p1, string.format("%s.Friends.friendshipStatus.%s", RODUXKEY, LocalUserId)),
			following = (GetDeepValueFunction(p1, string.format("%s.Friends.followings.followingStatuses.%s", RODUXKEY, LocalUserId)) or {}).isFollowing or false,
			isMyself = p1.LocalUserId == LocalUserId
		}
	end)
end