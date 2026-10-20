local EnumsModule = require(script:FindFirstAncestor("ProfilePlatform").Common.Enums)

return function(AcceptFriendRequest)
	-- upvalues: EnumsModule (copy)
	return if AcceptFriendRequest then if AcceptFriendRequest == EnumsModule.ProfileActions.PendingFriendRequest then EnumsModule.FriendStatus.RequestSent elseif AcceptFriendRequest == EnumsModule.ProfileActions.AcceptFriendRequest then EnumsModule.FriendStatus.RequestReceived elseif AcceptFriendRequest == EnumsModule.ProfileActions.Chat or AcceptFriendRequest == EnumsModule.ProfileActions.JoinExperience then EnumsModule.FriendStatus.Friends elseif AcceptFriendRequest == EnumsModule.ProfileActions.EditProfile then EnumsModule.FriendStatus.Self elseif AcceptFriendRequest == EnumsModule.ProfileActions.Unfriend then EnumsModule.FriendStatus.Ineligible else EnumsModule.FriendStatus.NotFriends else EnumsModule.FriendStatus.Unknown
end