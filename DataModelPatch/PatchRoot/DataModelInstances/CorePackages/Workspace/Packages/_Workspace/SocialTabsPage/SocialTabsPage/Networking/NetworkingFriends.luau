local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(SocialTabsPage.Parent.FriendsNetworking).config({
	roduxNetworking = require(SocialTabsPage.Networking.myRoduxNetworking)
})