return table.freeze({
	CATEGORY = "ExperienceLoading",
	PAGE = "TiltLoadingScreen",
	TILT_EVENT_NAME = "ExperienceLoadingScreen_Tilt",
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