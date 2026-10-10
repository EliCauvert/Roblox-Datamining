return table.freeze({
	CATEGORY = "ExperienceLoading",
	PAGE = "TiltLoadingScreen",
	EVENT_NAME = "ExperienceLoadingScreen",
	DismissSource = table.freeze({
		NormalReady = "NormalReady",
		DeveloperOverride = "DeveloperOverride"
	}),
	Milestone = table.freeze({
		ScreenVisible = "ScreenVisible",
		DismissRequested = "DismissRequested",
		DismissGateReleased = "DismissGateReleased",
		DismissStarted = "DismissStarted",
		ScreenHidden = "ScreenHidden"
	}),
	AbortReason = table.freeze({
		Cancelled = "cancelled",
		VRHandoff = "vr_handoff",
		Unmounted = "unmounted",
		Replaced = "replaced",
		InitializationFailed = "initialization_failed"
	}),
	Outcome = table.freeze({
		Completed = "completed",
		InstrumentationError = "instrumentation_error"
	})
})