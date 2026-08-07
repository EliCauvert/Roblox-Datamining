return {
	ShareLinksNetworking = require(script:FindFirstAncestor("ProfileShareLinks").Parent.ShareLinksNetworking).config({
		roduxNetworking = require(script.Parent.configuredRoduxNetworking)
	})
}