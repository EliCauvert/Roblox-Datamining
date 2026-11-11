local AddFriendsState = script:FindFirstAncestor("AddFriendsState")

return require(AddFriendsState.Parent.FriendsNetworking).config({
	roduxNetworking = require(AddFriendsState.Networking.myRoduxNetworking)
})