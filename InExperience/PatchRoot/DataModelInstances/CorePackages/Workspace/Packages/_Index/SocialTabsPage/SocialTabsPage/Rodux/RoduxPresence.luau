local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(socialTabsPage.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(socialTabsPage.Common.Constants).RODUX_KEY .. ".Presence"
})