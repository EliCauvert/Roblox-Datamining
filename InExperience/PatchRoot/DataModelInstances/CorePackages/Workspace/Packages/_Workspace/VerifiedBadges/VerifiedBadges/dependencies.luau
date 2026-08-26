local parent = script:FindFirstAncestor("VerifiedBadges").Parent
local usersNetworkingModule = require(parent.UsersNetworking)
local httpRequestModule = require(parent.HttpRequest)
local var1 = require(parent.RoduxNetworking).config({
	keyPath = "VerifiedBadges.NetworkStatus",
	networkImpl = httpRequestModule.config({
		maxRetryCount = 0,
		requestFunction = httpRequestModule.requestFunctions.RequestInternal
	})
})

return {
	RoduxNetworking = var1,
	FriendsNetworking = require(parent.FriendsNetworking).config({ roduxNetworking = var1 }),
	UsersNetworking = usersNetworkingModule.config({ roduxNetworking = var1 })
}