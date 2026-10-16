local SocialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(SocialTabsPage.Parent.RoduxNetworking).config({
	keyPath = require(SocialTabsPage.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = require(SocialTabsPage.Networking.networkImpl)
})