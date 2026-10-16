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
local var1 = if fFlagLuaAppBroadenVideoAnalytics then nil else tModule.strictInterface({
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
local var2 = if fFlagLuaAppBroadenVideoAnalytics then {
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

return function(p1, p2)
	-- upvalues: fFlagLuaAppBroadenVideoAnalytics (ref), getVideoEventParamsValidatorModule (ref), var2 (ref), discoveryEventErrorLogger (ref), var1 (ref), mutedError (ref), loggingProtocolModule (ref), t (ref)
	if fFlagLuaAppBroadenVideoAnalytics then
		local var3 = getVideoEventParamsValidatorModule(p2)
		local var4 = var2 and var2[var3]
		
		if var4 == nil then
			discoveryEventErrorLogger.reportError("DiscoveryVideoEndEventMissingInterface", "No validator registered for video event interface key", { interfaceKey = var3 })
		else
			local var5, var6 = var4(p2)
			
			if not var5 then
				discoveryEventErrorLogger.reportError("DiscoveryVideoEndEventInvalidInterface", var6)
			end
		end
	else
		local var7, var8 = var1(p2)
		
		if not var7 then
			mutedError(var8)
		end
	end
	loggingProtocolModule.default:logRobloxTelemetryEvent(t, {
		"addSessionInfo",
		loggingProtocolModule.StandardizedFields.addOsInfo
	}, p2, p1)
end