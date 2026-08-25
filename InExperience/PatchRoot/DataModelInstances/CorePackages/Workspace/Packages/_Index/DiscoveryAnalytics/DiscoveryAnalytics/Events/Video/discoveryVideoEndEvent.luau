local parent = script:FindFirstAncestor("DiscoveryAnalytics").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local mutedError = require(parent.Loggers).mutedError
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local tModule = require(parent.t)
local getVideoEventParamsValidatorModule = require(script.Parent.getVideoEventParamsValidator)
local videoEventInterfaceKeyModule = require(script.Parent.VideoEventInterfaceKey)
local discoveryVideoEndEventHundredthsPercent = game:DefineFastInt("DiscoveryVideoEndEventHundredthsPercent", 0)
local fFlagLuaAppBroadenVideoAnalytics = require(parent.SharedFlags).FFlagLuaAppBroadenVideoAnalytics
local fFlagLuaAppEnableHomepageOneByTwoTile = require(parent.SharedFlags).FFlagLuaAppEnableHomepageOneByTwoTile
local var5 = if fFlagLuaAppBroadenVideoAnalytics then nil else tModule.strictInterface({
	videoAssetId = tModule.string,
	videoPlaybackSessionId = tModule.string,
	endReason = tModule.string,
	playbackTime = tModule.number,
	universeId = tModule.string,
	rootPlaceId = tModule.string,
	gameSetTypeId = tModule.optional(tModule.string),
	sortPos = tModule.optional(tModule.number),
	targetUniverseId = tModule.optional(tModule.string)
})
local var6 = if fFlagLuaAppBroadenVideoAnalytics then {
	[videoEventInterfaceKeyModule.DefaultGameTile] = if fFlagLuaAppBroadenVideoAnalytics then tModule.strictInterface({
		videoAssetId = tModule.string,
		videoPlaybackSessionId = tModule.string,
		endReason = tModule.string,
		playbackTime = tModule.number,
		universeId = tModule.string,
		rootPlaceId = tModule.string,
		gameSetTypeId = tModule.optional(tModule.string),
		sortPos = tModule.optional(tModule.number),
		targetUniverseId = tModule.optional(tModule.string),
		nativeAdData = tModule.optional(tModule.string),
		tileType = tModule.optional(tModule.string),
		contentType = tModule.optional(tModule.string)
	}) else nil,
	[videoEventInterfaceKeyModule.OneByTwoTileAdLink] = if fFlagLuaAppEnableHomepageOneByTwoTile then if fFlagLuaAppEnableHomepageOneByTwoTile then tModule.strictInterface({
		videoAssetId = tModule.string,
		videoPlaybackSessionId = tModule.string,
		endReason = tModule.string,
		playbackTime = tModule.number,
		gameSetTypeId = tModule.optional(tModule.string),
		sortPos = tModule.optional(tModule.number),
		targetUniverseId = tModule.optional(tModule.string),
		nativeAdData = tModule.string,
		tileType = tModule.string,
		contentType = tModule.optional(tModule.string)
	}) else nil else nil,
	[videoEventInterfaceKeyModule.OneByTwoTileGame] = if fFlagLuaAppEnableHomepageOneByTwoTile then if fFlagLuaAppEnableHomepageOneByTwoTile then tModule.strictInterface({
		videoAssetId = tModule.string,
		videoPlaybackSessionId = tModule.string,
		endReason = tModule.string,
		playbackTime = tModule.number,
		universeId = tModule.string,
		rootPlaceId = tModule.string,
		gameSetTypeId = tModule.optional(tModule.string),
		sortPos = tModule.optional(tModule.number),
		targetUniverseId = tModule.optional(tModule.string),
		nativeAdData = tModule.string,
		tileType = tModule.string,
		contentType = tModule.optional(tModule.string)
	}) else nil else nil
} else nil
local t = {
	eventName = "discoveryVideoEnd",
	description = "Fire when discovery video stops playing",
	links = "",
	backends = {
		loggingProtocolModule.TelemetryBackends.Points,
		loggingProtocolModule.TelemetryBackends.EventIngest
	},
	throttlingPercentage = discoveryVideoEndEventHundredthsPercent,
	lastUpdated = { 25, 4, 23 }
}

return function(p0, p1)
	-- upvalues: fFlagLuaAppBroadenVideoAnalytics (ref), getVideoEventParamsValidatorModule (ref), var6 (ref), discoveryEventErrorLogger (ref), var5 (ref), mutedError (ref), loggingProtocolModule (ref), t (ref)
	if fFlagLuaAppBroadenVideoAnalytics then
		local var8 = getVideoEventParamsValidatorModule(p1)
		local var9 = var6 and var6[var8]
		
		if var9 == nil then
			discoveryEventErrorLogger.reportError("DiscoveryVideoEndEventMissingInterface", "No validator registered for video event interface key", { interfaceKey = var8 })
		else
			local var10, var11 = var9(p1)
			
			if not var10 then
				discoveryEventErrorLogger.reportError("DiscoveryVideoEndEventInvalidInterface", var11)
			end
		end
	else
		local var12, var13 = var5(p1)
		
		if not var12 then
			mutedError(var13)
		end
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, {
		"addSessionInfo",
		loggingProtocolModule.StandardizedFields.addOsInfo
	}, p1, p0)
end