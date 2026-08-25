local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local _ = require(friendsMenu.friendsMenuModalType)
local constantsModule = require(friendsMenu.Constants)
local getFFlagFriendsMenuDummyLoadingFriendsFix = require(parent.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix

local var2 = function(p0)
	-- upvalues: getFFlagFriendsMenuDummyLoadingFriendsFix (ref), constantsModule (ref)
	return {
		displayName = "",
		hasVerifiedBadge = false,
		isFetching = true,
		isFriend = true,
		lastLocation = "",
		name = "",
		presence = "",
		isLoadingPlaceholder = true,
		friendFrequentRank = p0,
		friendRank = p0,
		id = if getFFlagFriendsMenuDummyLoadingFriendsFix() then constantsModule.DummyFriendsPrefix .. tostring(p0) else tostring(p0),
		lastOnline = DateTime.now()
	}
end

return function(p1)
	-- upvalues: var2 (ref)
	local t = {}
	
	for i = 1, p1 do
		t[i] = var2(i)
	end
	return t
end