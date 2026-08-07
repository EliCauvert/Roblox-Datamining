local appChatNetworking = script:FindFirstAncestor("AppChatNetworking")

return require(appChatNetworking.Parent.RoduxNetworking).config({
	keyPath = "ChatAppReducer.networkStatus",
	killRequestWithFilteredIds = true,
	networkImpl = require(appChatNetworking.url.HttpRequest).default
})