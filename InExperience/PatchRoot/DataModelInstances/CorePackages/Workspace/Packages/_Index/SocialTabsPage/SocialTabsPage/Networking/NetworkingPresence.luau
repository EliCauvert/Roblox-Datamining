local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(socialTabsPage.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(socialTabsPage.Networking.myRoduxNetworking)
})