local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")

return require(AppChatNetworking.Parent.RoduxNetworking).config({
	keyPath = "ChatAppReducer.networkStatus",
	killRequestWithFilteredIds = true,
	networkImpl = require(AppChatNetworking.url.HttpRequest).default
})