local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(SocialTabsPage.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(SocialTabsPage.Networking.myRoduxNetworking)
})