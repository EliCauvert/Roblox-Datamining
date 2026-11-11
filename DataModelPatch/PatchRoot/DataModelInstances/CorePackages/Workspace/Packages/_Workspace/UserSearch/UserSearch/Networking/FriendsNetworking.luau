local UserSearch = script:FindFirstAncestor("UserSearch")

return (require(UserSearch.Parent.FriendsNetworking).config({
	roduxNetworking = require(UserSearch.Networking.myRoduxNetworking)
}))