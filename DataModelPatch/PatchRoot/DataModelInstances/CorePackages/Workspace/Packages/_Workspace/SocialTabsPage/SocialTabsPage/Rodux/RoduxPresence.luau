local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(SocialTabsPage.Parent.LuaSocialLibrariesDeps).RoduxPresence.config({
	keyPath = require(SocialTabsPage.Common.Constants).RODUX_KEY .. ".Presence"
})