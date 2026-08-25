return {
	Format = function(_, p0)
		return if p0 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest" or p0 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" then "Send Friend Request" elseif p0 == "InGame.FriendPlayerPrompt.Action.Send" then "Send" elseif p0 == "Feature.Friends.Action.FriendRequestSent" then "Friend Request Sent" elseif p0 == "CommonUI.Messages.Response.SomethingWentWrong" then "Something Went Wrong" else p0
	end,
	GetLocale = function()
		return "en-us"
	end,
	changed = require(script:FindFirstAncestor("UserRelationshipModals").Parent.AppCommonLib).Signal.new()
}