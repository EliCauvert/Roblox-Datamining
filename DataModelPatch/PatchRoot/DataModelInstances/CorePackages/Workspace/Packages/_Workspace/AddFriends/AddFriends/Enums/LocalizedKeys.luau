return require(script:FindFirstAncestor("AddFriends").Parent.enumerate)(script.Name, {
	AddFriend = "Feature.Friends.Action.Add",
	RequestPending = "Feature.Friends.Label.Pending"
})