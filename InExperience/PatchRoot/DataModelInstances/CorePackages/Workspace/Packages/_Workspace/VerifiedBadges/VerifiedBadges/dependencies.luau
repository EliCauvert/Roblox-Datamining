local parent = script:FindFirstAncestor("VerifiedBadges").Parent
local usersNetworkingModule = require(parent.UsersNetworking)
local httpRequestModule = require(parent.HttpRequest)
local var2 = require(parent.RoduxNetworking).config({
	keyPath = "VerifiedBadges.NetworkStatus",
	networkImpl = httpRequestModule.config({
		maxRetryCount = 0,
		requestFunction = httpRequestModule.requestFunctions.RequestInternal
	})
})

return {
	RoduxNetworking = var2,
	FriendsNetworking = require(parent.FriendsNetworking).config({ roduxNetworking = var2 }),
	UsersNetworking = usersNetworkingModule.config({ roduxNetworking = var2 })
}