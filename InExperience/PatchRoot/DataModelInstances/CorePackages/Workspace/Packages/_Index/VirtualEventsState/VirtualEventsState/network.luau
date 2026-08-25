local virtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local httpRequestModule = require(virtualEventsState.Parent.HttpRequest)
local roduxNetworkingModule = require(virtualEventsState.Parent.RoduxNetworking)
local networkingVirtualEventsModule = require(virtualEventsState.Parent.NetworkingVirtualEvents)
local networkingGamesModule = require(virtualEventsState.Parent.NetworkingGames)
local loggerModule = require(virtualEventsState.logger)
local var6 = roduxNetworkingModule.config({
	keyPath = "VirtualEvents.networkStatus",
	networkImpl = httpRequestModule.config({
		requestFunction = function(p0, p1, p2)
			-- upvalues: loggerModule (ref), httpRequestModule (ref)
			loggerModule:debug("GET {}", p0)
			
			return httpRequestModule.requestFunctions.RequestInternal(p0, p1, p2)
		end,
		postRequestFunction = function(p3, p4)
			-- upvalues: loggerModule (ref)
			loggerModule:debug("{} {} {}", p3.StatusCode, p4.url, p3.Body)
		end,
		maxRetryCount = game:DefineFastInt("VirtualEventsHttpRetryCount", 3)
	})
})

return {
	RoduxNetworking = var6,
	NetworkingVirtualEvents = networkingVirtualEventsModule.config({ roduxNetworking = var6 }),
	NetworkingGames = networkingGamesModule.config({ roduxNetworking = var6 })
}