local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local TModule = require(Parent.t)
local GetVideoEventParamsValidatorModule = require(script.Parent.getVideoEventParamsValidator)
local VideoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local StrictInterfaceResult = if FFlagLuaAppEnableHomepageOneByTwoTile then TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	totalDuration = TModule.number,
	loadTime = TModule.number,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	nativeAdData = TModule.string,
	tileType = TModule.string,
	contentType = TModule.optional(TModule.string)
}) else nil
local StrictInterfaceResult1 = if FFlagLuaAppEnableHomepageOneByTwoTile then TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	totalDuration = TModule.number,
	loadTime = TModule.number,
	universeId = TModule.string,
	rootPlaceId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	nativeAdData = TModule.string,
	tileType = TModule.string,
	contentType = TModule.optional(TModule.string)
}) else nil
local config = {
	[VideoEventInterfaceKeyModule.DefaultGameTile] = TModule.strictInterface({
		videoAssetId = TModule.string,
		videoPlaybackSessionId = TModule.string,
		totalDuration = TModule.number,
		loadTime = TModule.number,
		universeId = TModule.string,
		rootPlaceId = TModule.string,
		gameSetTypeId = TModule.optional(TModule.string),
		sortPos = TModule.optional(TModule.number),
		nativeAdData = TModule.optional(TModule.string),
		tileType = TModule.optional(TModule.string),
		contentType = TModule.optional(TModule.string),
		isMoment = if require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.boolean) else nil
	}),
	[VideoEventInterfaceKeyModule.OneByTwoTileAdLink] = if FFlagLuaAppEnableHomepageOneByTwoTile then StrictInterfaceResult else nil,
	[VideoEventInterfaceKeyModule.OneByTwoTileGame] = if FFlagLuaAppEnableHomepageOneByTwoTile then StrictInterfaceResult1 else nil
}
local config1 = {
	eventName = "discoveryVideoLoadEvent",
	description = "Fire when discovery video finishes loading",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryVideoLoadEventHundredthsPercent", 0),
	lastUpdated = { 25, 4, 23 }
}

return function(p1, p2)
	-- upvalues: GetVideoEventParamsValidatorModule (copy), config (copy), DiscoveryEventErrorLogger (copy), LoggingProtocolModule (copy), config1 (copy)
	local VideoEventParamsValidatorModule = GetVideoEventParamsValidatorModule(p2)
	local Entry = config[VideoEventParamsValidatorModule]
	
	if Entry == nil then
		DiscoveryEventErrorLogger.reportError("DiscoveryVideoLoadEventMissingInterface", "No validator registered for video event interface key", { interfaceKey = VideoEventParamsValidatorModule })
	else
		local EntryResult, EntryResult2 = Entry(p2)
		
		if not EntryResult then
			DiscoveryEventErrorLogger.reportError("DiscoveryVideoLoadEventInvalidInterface", EntryResult2)
		end
	end
	LoggingProtocolModule.default:logRobloxTelemetryEvent(config1, {
		"addSessionInfo",
		LoggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end