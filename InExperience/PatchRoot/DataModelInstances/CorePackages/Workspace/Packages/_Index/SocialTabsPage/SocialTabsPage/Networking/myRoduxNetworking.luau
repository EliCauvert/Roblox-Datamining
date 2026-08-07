local socialTabsPage = script:FindFirstAncestor("SocialTabsPage")

return require(socialTabsPage.Parent.RoduxNetworking).config({
	keyPath = require(socialTabsPage.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = require(socialTabsPage.Networking.networkImpl)
})