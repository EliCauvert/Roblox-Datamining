return require(script:FindFirstAncestor("ProfileQRCode").Parent.FriendsNetworking).config({
	roduxNetworking = require(script.Parent.configuredRoduxNetworking)
})