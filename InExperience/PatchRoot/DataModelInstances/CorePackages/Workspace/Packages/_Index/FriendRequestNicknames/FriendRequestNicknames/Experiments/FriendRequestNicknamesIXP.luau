local friendRequestNicknames = script:FindFirstAncestor("FriendRequestNicknames")
local parent = friendRequestNicknames.Parent
local useUserExperiment = require(parent.RoactAppExperiment).useUserExperiment
local fStringSocialFriendsLayerModule = require(friendRequestNicknames.Flags.FStringSocialFriendsLayer)
local fStringCanSendNicknamesModule = require(friendRequestNicknames.Flags.FStringCanSendNicknames)
local fFlagFriendRequestNicknames = require(parent.SharedFlags).FFlagFriendRequestNicknames

local var1 = function(p1)
	-- upvalues: fFlagFriendRequestNicknames (ref), fStringSocialFriendsLayerModule (ref), fStringCanSendNicknamesModule (ref)
	return if fFlagFriendRequestNicknames then (p1[fStringSocialFriendsLayerModule] or {})[fStringCanSendNicknamesModule] == "True" else false
end

return {
	FFlagFriendRequestNicknames = fFlagFriendRequestNicknames,
	useFriendRequestNicknames = function()
		-- upvalues: fFlagFriendRequestNicknames (ref), useUserExperiment (ref), fStringSocialFriendsLayerModule (ref), var1 (ref)
		return if fFlagFriendRequestNicknames then useUserExperiment({ fStringSocialFriendsLayerModule }, var1) else false
	end
}