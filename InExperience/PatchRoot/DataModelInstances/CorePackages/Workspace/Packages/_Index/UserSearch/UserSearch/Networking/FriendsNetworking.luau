local userSearch = script:FindFirstAncestor("UserSearch")

return require(userSearch.Parent.FriendsNetworking).config({
	roduxNetworking = require(userSearch.Networking.myRoduxNetworking)
})