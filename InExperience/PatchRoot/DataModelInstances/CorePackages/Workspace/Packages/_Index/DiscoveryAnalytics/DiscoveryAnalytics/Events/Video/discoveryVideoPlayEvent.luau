local Parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local MutedErrorFunction = require(Parent.Loggers).mutedError
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local TModule = require(Parent.t)
local GetVideoEventParamsValidatorModule = require(script.Parent.getVideoEventParamsValidator)
local VideoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local FFlagLuaAppBroadenVideoAnalytics = require(Parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics
local FFlagLuaAppEnableHomepageOneByTwoTile = require(Parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry
local StrictInterfaceResult = if FFlagLuaAppBroadenVideoAnalytics then nil else TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	universeId = TModule.string,
	rootPlaceId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.boolean) else nil
})
local StrictInterfaceResult1 = if FFlagLuaAppBroadenVideoAnalytics then TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	universeId = TModule.string,
	rootPlaceId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	nativeAdData = TModule.optional(TModule.string),
	tileType = TModule.optional(TModule.string),
	contentType = TModule.optional(TModule.string),
	isMoment = if FFlagLuaAppDiscoveryMomentVideoTelemetry then TModule.optional(TModule.boolean) else nil
}) else nil
local StrictInterfaceResult2 = if FFlagLuaAppEnableHomepageOneByTwoTile then TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	nativeAdData = TModule.string,
	tileType = TModule.string,
	contentType = TModule.optional(TModule.string)
}) else nil
local StrictInterfaceResult3 = if FFlagLuaAppEnableHomepageOneByTwoTile then TModule.strictInterface({
	videoAssetId = TModule.string,
	videoPlaybackSessionId = TModule.string,
	universeId = TModule.string,
	rootPlaceId = TModule.string,
	gameSetTypeId = TModule.optional(TModule.string),
	sortPos = TModule.optional(TModule.number),
	nativeAdData = TModule.string,
	tileType = TModule.string,
	contentType = TModule.optional(TModule.string)
}) else nil
local Config = if FFlagLuaAppBroadenVideoAnalytics then {
	[VideoEventInterfaceKeyModule.DefaultGameTile] = StrictInterfaceResult1,
	[VideoEventInterfaceKeyModule.OneByTwoTileAdLink] = if FFlagLuaAppEnableHomepageOneByTwoTile then StrictInterfaceResult2 else nil,
	[VideoEventInterfaceKeyModule.OneByTwoTileGame] = if FFlagLuaAppEnableHomepageOneByTwoTile then StrictInterfaceResult3 else nil
} else nil
local config = {
	eventName = "discoveryVideoPlay",
	description = "Fire when discovery video playback session starts",
	links = "",
	backends = {
		LoggingProtocolModule.TelemetryBackends.Points,
		LoggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = game:DefineFastInt("DiscoveryVideoPlayEventHundredthsPercent", 0),
	lastUpdated = { 25, 4, 23 }
}

return function(p1, p2)
	-- upvalues: FFlagLuaAppBroadenVideoAnalytics (copy), GetVideoEventParamsValidatorModule (copy), Config (copy), DiscoveryEventErrorLogger (copy), StrictInterfaceResult (copy), MutedErrorFunction (copy), LoggingProtocolModule (copy), config (copy)
	if FFlagLuaAppBroadenVideoAnalytics then
		local VideoEventParamsValidatorModule = GetVideoEventParamsValidatorModule(p2)
		local Entry = Config and Config[VideoEventParamsValidatorModule]
		
		if Entry == nil then
			DiscoveryEventErrorLogger.reportError("DiscoveryVideoPlayEventMissingInterface", "No validator registered for video event interface key", { interfaceKey = VideoEventParamsValidatorModule })
		else
			local EntryResult, EntryResult2 = Entry(p2)
			
			if not EntryResult then
				DiscoveryEventErrorLogger.reportError("DiscoveryVideoPlayEventInvalidInterface", EntryResult2)
			end
		end
	else
		local StrictInterfaceResultResult, StrictInterfaceResultResult2 = StrictInterfaceResult(p2)
		
		if not StrictInterfaceResultResult then
			MutedErrorFunction(StrictInterfaceResultResult2)
		end
	end
	LoggingProtocolModule.default:logRobloxTelemetryEvent(config, {
		"addSessionInfo",
		LoggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end