local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return if require(socialTabsPage.Flags.FFlagSocialTabsPagePresenceSignalsMigration) then nil else require(socialTabsPage.Parent.LuaSocialLibrariesDeps).NetworkingPresence.config({
	roduxNetworking = require(socialTabsPage.Networking.myRoduxNetworking)
})