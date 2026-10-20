return {
	Attempted = {
		eventName = "iosAuthServiceSignupPasswordSaveAttempted",
		throttlingPercentage = 10000,
		description = "Event fired when save password to iOS Keychain is attempted on signup",
		links = "",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 2, 10 }
	},
	Success = {
		eventName = "iosAuthServiceSignupPasswordSaveSuccess",
		throttlingPercentage = 10000,
		description = "Event fired when save password to iOS Keychain succeeds on signup",
		links = "",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 2, 10 }
	},
	Failure = {
		eventName = "iosAuthServiceSignupPasswordSaveFailure",
		throttlingPercentage = 10000,
		description = "Event fired when save password to iOS Keychain fails on signup",
		links = "",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 2, 10 }
	},
	Skipped = {
		eventName = "iosAuthServiceSignupPasswordSaveSkipped",
		throttlingPercentage = 10000,
		description = "Event fired when save password to iOS Keychain is skipped on signup",
		links = "",
		backends = { "EventIngest" },
		lastUpdated = { 2026, 2, 10 }
	}
}