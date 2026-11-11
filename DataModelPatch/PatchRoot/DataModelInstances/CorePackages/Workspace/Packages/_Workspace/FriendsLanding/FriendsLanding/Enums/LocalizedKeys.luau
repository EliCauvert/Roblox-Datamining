return require(script:FindFirstAncestor("FriendsLanding").dependencies).enumerate(script.Name, {
	ConnectionsHeader = "CommonUI.Features.Label.Connections",
	FriendsHeader = "CommonUI.Features.Label.Friends"
})