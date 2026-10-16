local FriendsMenu = script:FindFirstAncestor("FriendsMenu")
local _ = require(FriendsMenu.friendsMenuModalType)
local ConstantsModule = require(FriendsMenu.Constants)
local GetFFlagFriendsMenuDummyLoadingFriendsFixFunction = require(FriendsMenu.Parent.SharedFlags).GetFFlagFriendsMenuDummyLoadingFriendsFix

local function v3(FriendFrequentRank) --[[ Line: 9 ]]
	-- upvalues: GetFFlagFriendsMenuDummyLoadingFriendsFixFunction (copy), ConstantsModule (copy)
	return {
		displayName = "",
		hasVerifiedBadge = false,
		isFetching = true,
		isFriend = true,
		lastLocation = "",
		name = "",
		presence = "",
		isLoadingPlaceholder = true,
		friendFrequentRank = FriendFrequentRank,
		friendRank = FriendFrequentRank,
		id = GetFFlagFriendsMenuDummyLoadingFriendsFixFunction() and ConstantsModule.DummyFriendsPrefix .. tostring(FriendFrequentRank) or tostring(FriendFrequentRank),
		lastOnline = DateTime.now()
	}
end

return function(p1) --[[ Line: 28 ]]
	-- upvalues: v3 (copy)
	local t = {}
	
	for i = 1, p1 do
		t[i] = v3(i)
	end
	return t
end