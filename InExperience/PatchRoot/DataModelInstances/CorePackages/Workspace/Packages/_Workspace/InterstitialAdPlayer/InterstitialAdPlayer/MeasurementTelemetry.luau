local _ = require(script.Parent.types)
local LuaAppInterstitialAdMeasurementThrottleHundredthsPercent = game:DefineFastInt("LuaAppInterstitialAdMeasurementThrottleHundredthsPercent", 10000)
local StandardizedFields = { "addOSInfo" }

local function makeConfig(EventName, Description)
	-- upvalues: LuaAppInterstitialAdMeasurementThrottleHundredthsPercent (copy)
	return {
		eventName = EventName,
		backends = { "EventIngest" },
		throttlingPercentage = LuaAppInterstitialAdMeasurementThrottleHundredthsPercent,
		lastUpdated = { 26, 11, 10 },
		description = Description
	}
end

local t = {}

for i, value in {
	ImmersiveAdLoad = "An interstitial ad's video is downloaded and ready to play.",
	ImmersiveAdVideoProgress = "An interstitial ad reached 0 (impression), 25, 50, 75 or 100 percent of its video.",
	ImmersiveAdViewableImpression = "An interstitial ad played on screen for 2 continuous seconds.",
	ImmersiveAdVideoMute = "The user muted an interstitial ad.",
	ImmersiveAdVideoUnmute = "The user unmuted an interstitial ad.",
	ImmersiveAdVideoPause = "The user paused an interstitial ad.",
	ImmersiveAdVideoResume = "The user resumed an interstitial ad.",
	ImmersiveAdClickCTA = "The user tapped a clickable element of an interstitial ad.",
	ImmersiveAdVideoGenericError = "An interstitial ad failed to load, render or play.",
	ImmersiveAdUnload = "An interstitial ad left the screen."
} do
	t[i] = makeConfig(i, value)
end
local MeasurementTelemetryModule = {
	fieldsFor = function(p1, p2, p3, Client_event_timestamp)
		local config = {
			ad_format = "Video2D",
			ad_instance_name = "InterstitialAd",
			universeid = string.format("%d", p3.universeId),
			placeid = string.format("%d", p3.placeId),
			client_event_timestamp = Client_event_timestamp,
			encrypted_ad_tracking_data = p2.trackingData.encryptedAdTrackingData,
			encryption_metadata = p2.trackingData.encryptionMetadata
		}
		
		if p3.playSessionId then
			config.play_session_id = p3.playSessionId
		end
		for i, field in p1.fields do
			config[i] = field
		end
		return config
	end
}

function MeasurementTelemetryModule.createSink(TelemetryService, Callback)
	-- upvalues: t (copy), makeConfig (copy), StandardizedFields (copy), MeasurementTelemetryModule (copy)
	return function(p4, p5, p6)
		-- upvalues: TelemetryService (copy), t (upval), makeConfig (upval), StandardizedFields (upval), MeasurementTelemetryModule (upval), Callback (copy)
		TelemetryService:LogEvent(t[p4.name] or makeConfig(p4.name, p4.name), {
			standardizedFields = StandardizedFields,
			customFields = MeasurementTelemetryModule.fieldsFor(p4, p5, p6, Callback())
		})
	end
end

return MeasurementTelemetryModule