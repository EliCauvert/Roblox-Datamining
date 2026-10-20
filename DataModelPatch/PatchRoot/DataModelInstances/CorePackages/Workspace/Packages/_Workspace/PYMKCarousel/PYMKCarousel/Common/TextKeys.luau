local PYMKFriendsToastRename = game:DefineFastFlag("PYMKFriendsToastRename", false)

return {
	FriendRequestSentToast = "Feature.Friends.Action.FriendRequestSent",
	SomethingIsWrongToast = "Feature.Toast.NetworkingError.SomethingIsWrong",
	FriendAddedToast = "Feature.AddFriends.Action.FriendAdded",
	FriendRequestContext = "Feature.Friends.Label.FriendRequest",
	ConnectionRequestContext = "Feature.Friends.Label.ConnectionRequest",
	FindFriendsLabel = "Feature.Friends.Action.FindFriends",
	SeeAllLabel = "Feature.Home.ActionSeeAll",
	NewText = "Feature.Catalog.Label.New",
	FindFriendsTooltipTitle = "Feature.AddFriends.Title.AddFriendsTooltipTitle",
	FindFriendsTooltipBody = "Feature.AddFriends.Label.AddFriendsTooltip",
	FromContacts = "Feature.Friends.Description.FromContacts",
	ConnectionRequestSentToast = if PYMKFriendsToastRename then "Feature.Friends.Action.FriendRequestSent" else "Feature.Friends.Action.ConnectionRequestSent",
	ConnectionAddedToast = if PYMKFriendsToastRename then "Feature.Friends.Action.FriendAdded" else "Feature.Friends.Action.ConnectionAdded"
}