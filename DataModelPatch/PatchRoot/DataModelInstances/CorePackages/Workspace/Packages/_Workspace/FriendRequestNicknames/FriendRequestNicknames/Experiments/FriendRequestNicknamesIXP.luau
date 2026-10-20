local FriendRequestNicknames = script:FindFirstAncestor("FriendRequestNicknames")
local Parent = FriendRequestNicknames.Parent
local UseUserExperimentFunction = require(Parent.RoactAppExperiment).useUserExperiment
local FStringSocialFriendsLayerModule = require(FriendRequestNicknames.Flags.FStringSocialFriendsLayer)
local FStringCanSendNicknamesModule = require(FriendRequestNicknames.Flags.FStringCanSendNicknames)
local FFlagFriendRequestNicknames = require(Parent.SharedFlags).FFlagFriendRequestNicknames

local function v5(p1): boolean
	-- upvalues: FFlagFriendRequestNicknames (copy), FStringSocialFriendsLayerModule (copy), FStringCanSendNicknamesModule (copy)
	return if FFlagFriendRequestNicknames then (p1[FStringSocialFriendsLayerModule] or {})[FStringCanSendNicknamesModule] == "True" else false
end

return {
	FFlagFriendRequestNicknames = FFlagFriendRequestNicknames,
	useFriendRequestNicknames = function()
		-- upvalues: FFlagFriendRequestNicknames (copy), UseUserExperimentFunction (copy), FStringSocialFriendsLayerModule (copy), v5 (copy)
		return if FFlagFriendRequestNicknames then UseUserExperimentFunction({ FStringSocialFriendsLayerModule }, v5) else false
	end
}