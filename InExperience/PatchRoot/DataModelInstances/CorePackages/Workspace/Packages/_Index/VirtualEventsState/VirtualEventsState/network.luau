local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local httpRequestModule = require(virtualEventsState.Parent.HttpRequest)
local roduxNetworkingModule = require(virtualEventsState.Parent.RoduxNetworking)
local networkingVirtualEventsModule = require(virtualEventsState.Parent.NetworkingVirtualEvents)
local networkingGamesModule = require(virtualEventsState.Parent.NetworkingGames)
local loggerModule = require(virtualEventsState.logger)
local var1 = roduxNetworkingModule.config({
	keyPath = "VirtualEvents.networkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: loggerModule (ref), httpRequestModule (ref)
			loggerModule:debug("GET {}", p1)
			
			return httpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: loggerModule (ref)
			loggerModule:debug("{} {} {}", p1.StatusCode, p2.url, p1.Body)
		end,
		maxRetryCount = game:DefineFastInt("VirtualEventsHttpRetryCount", 3)
	})
})

return {
	RoduxNetworking = var1,
	NetworkingVirtualEvents = networkingVirtualEventsModule.config({ roduxNetworking = var1 }),
	NetworkingGames = networkingGamesModule.config({ roduxNetworking = var1 })
}