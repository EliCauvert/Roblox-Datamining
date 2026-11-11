local Parent = script:FindFirstAncestor("VerifiedBadges").Parent
local HttpRequestModule = require(Parent.HttpRequest)
local ConfigResult = require(Parent.RoduxNetworking).config({
	keyPath = "VerifiedBadges.NetworkStatus",
	networkImpl = HttpRequestModule.config({
		maxRetryCount = 0,
		requestFunction = HttpRequestModule.requestFunctions.RequestInternal
	})
})

return {
	RoduxNetworking = ConfigResult,
	FriendsNetworking = require(Parent.FriendsNetworking).config({ roduxNetworking = ConfigResult }),
	UsersNetworking = require(Parent.UsersNetworking).config({ roduxNetworking = ConfigResult })
}