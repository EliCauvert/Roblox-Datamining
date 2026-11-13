local VirtualEventsState = script:FindFirstAncestor("VirtualEventsState")
local HttpRequestModule = require(VirtualEventsState.Parent.HttpRequest)
local NetworkingVirtualEventsModule = require(VirtualEventsState.Parent.NetworkingVirtualEvents)
local NetworkingGamesModule = require(VirtualEventsState.Parent.NetworkingGames)
local LoggerModule = require(VirtualEventsState.logger)
local ConfigResult = require(VirtualEventsState.Parent.RoduxNetworking).config({
	keyPath = "VirtualEvents.networkStatus",
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: LoggerModule (copy), HttpRequestModule (copy)
			LoggerModule:debug("GET {}", p1)
			
			return HttpRequestModule.requestFunctions.RequestInternal(p1, p2, p3)
		end,
		postRequestFunction = function(p1, p2)
			-- upvalues: LoggerModule (copy)
			LoggerModule:debug("{} {} {}", p1.StatusCode, p2.url, p1.Body)
		end,
		maxRetryCount = game:DefineFastInt("VirtualEventsHttpRetryCount", 3)
	})
})

return {
	RoduxNetworking = ConfigResult,
	NetworkingVirtualEvents = NetworkingVirtualEventsModule.config({ roduxNetworking = ConfigResult }),
	NetworkingGames = NetworkingGamesModule.config({ roduxNetworking = ConfigResult })
}