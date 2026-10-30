return {
	eventName = "accountSecurityChallengeRoCaptchaEvent",
	throttlingPercentage = 10000,
	description = "Tracks lifecycle events for the RoCaptcha GCS challenge",
	links = "https://docs.google.com/document/d/10lZvtSW6yN8uhNzo6628hYpHi_61YeHrGxjaqWum6Ko",
	backends = {
		require(script:FindFirstAncestor("GenericChallenges").Parent.LoggingProtocol).TelemetryBackends.EventIngest
	},
	lastUpdated = { 26, 10, 27 }
}