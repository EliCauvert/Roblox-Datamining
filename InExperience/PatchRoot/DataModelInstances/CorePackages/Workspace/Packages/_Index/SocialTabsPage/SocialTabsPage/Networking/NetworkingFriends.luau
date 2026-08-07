local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(socialTabsPage.Parent.FriendsNetworking).config({
	roduxNetworking = require(socialTabsPage.Networking.myRoduxNetworking)
})