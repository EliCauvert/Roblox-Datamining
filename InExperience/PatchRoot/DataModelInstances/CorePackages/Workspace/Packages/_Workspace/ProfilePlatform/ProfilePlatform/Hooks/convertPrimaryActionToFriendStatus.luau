local enumsModule = require(script:FindFirstAncestor("ProfilePlatform").Common.Enums)

return function(p0) --[[ line: 5 ]]
	-- upvalues: enumsModule (ref)
	return if p0 then if p0 == enumsModule.ProfileActions.PendingFriendRequest then enumsModule.FriendStatus.RequestSent elseif p0 == enumsModule.ProfileActions.AcceptFriendRequest then enumsModule.FriendStatus.RequestReceived elseif p0 == enumsModule.ProfileActions.Chat or p0 == enumsModule.ProfileActions.JoinExperience then enumsModule.FriendStatus.Friends elseif p0 == enumsModule.ProfileActions.EditProfile then enumsModule.FriendStatus.Self elseif p0 == enumsModule.ProfileActions.Unfriend then enumsModule.FriendStatus.Ineligible else enumsModule.FriendStatus.NotFriends else enumsModule.FriendStatus.Unknown
end