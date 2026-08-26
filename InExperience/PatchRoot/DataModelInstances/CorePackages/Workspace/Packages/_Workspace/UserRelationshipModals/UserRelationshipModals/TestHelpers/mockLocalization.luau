return {
	Format = function(_, p1)
		return if p1 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest" or p1 == "InGame.FriendPlayerPrompt.Title.SendFriendRequest.FriendsRename" then "Send Friend Request" elseif p1 == "InGame.FriendPlayerPrompt.Action.Send" then "Send" elseif p1 == "Feature.Friends.Action.FriendRequestSent" then "Friend Request Sent" elseif p1 == "CommonUI.Messages.Response.SomethingWentWrong" then "Something Went Wrong" else p1
	end,
	GetLocale = function()
		return "en-us"
	end,
	changed = require(script:FindFirstAncestor("UserRelationshipModals").Parent.AppCommonLib).Signal.new()
}