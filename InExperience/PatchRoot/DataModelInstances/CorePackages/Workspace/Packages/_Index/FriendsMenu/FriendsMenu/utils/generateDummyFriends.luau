local friendsMenu = script:FindFirstAncestor("FriendsMenu")
local parent = friendsMenu.Parent
local _ = require(friendsMenu.friendsMenuModalType)
local constantsModule = require(friendsMenu.Constants)
local getFFlagFriendsMenuDummyLoadingFriendsFix = require(parent.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix

local var1 = function(p1)
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
		friendFrequentRank = p1,
		friendRank = p1,
		id = if getFFlagFriendsMenuDummyLoadingFriendsFix() then constantsModule.DummyFriendsPrefix .. tostring(p1) else tostring(p1),
		lastOnline = DateTime.now()
	}
end

return function(p1)
	-- upvalues: var1 (ref)
	local t = {}
	
	for i = 1, p1 do
		t[i] = var1(i)
	end
	return t
end