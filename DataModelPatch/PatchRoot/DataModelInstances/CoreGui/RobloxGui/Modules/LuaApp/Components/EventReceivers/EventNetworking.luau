local CorePackages = game:GetService("CorePackages")
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local HttpRequest = LuaSocialLibrariesDepsModule.httpRequest
local RoduxModule = require(CorePackages.Packages.Rodux)
local ConfigResult = HttpRequest.config({
	requestFunction = function(p1, p2, p3)
		-- upvalues: HttpRequest (copy)
		return HttpRequest.requestFunctions.HttpRbxApi(p1, p2, p3)
	end,
	maxRetryCount = game:DefineFastInt("EventNetworkHttpRetryCount", 3)
})
local ConfigResult1 = LuaSocialLibrariesDepsModule.RoduxNetworking.config({
	keyPath = "EventReceievers.NetworkStatus",
	networkImpl = ConfigResult
})

return {
	RoduxKey = "EventReceievers",
	networkImpl = ConfigResult,
	RoduxNetworking = ConfigResult1,
	installReducer = function()
		-- upvalues: RoduxModule (copy), ConfigResult1 (copy)
		return RoduxModule.combineReducers({ NetworkStatus = ConfigResult1.installReducer() })
	end,
	FriendsNetworking = require(CorePackages.Workspace.Packages.FriendsNetworking).config({ roduxNetworking = ConfigResult1 }),
	NetworkingPresence = LuaSocialLibrariesDepsModule.NetworkingPresence.config({ roduxNetworking = ConfigResult1 }),
	RoduxFriends = require(CorePackages.Workspace.Packages.FriendsRodux).config({ keyPath = "EventReceievers.Friends" }),
	RoduxUsers = LuaSocialLibrariesDepsModule.RoduxUsers.config({ keyPath = "EventReceievers.Users" }),
	RoduxPresence = LuaSocialLibrariesDepsModule.RoduxPresence.config({ keyPath = "EventReceievers.Presence" }),
	ShareLinksNetworking = require(CorePackages.Workspace.Packages.ShareLinksNetworking).config({
		useMockedResponse = false,
		roduxNetworking = ConfigResult1
	})
}