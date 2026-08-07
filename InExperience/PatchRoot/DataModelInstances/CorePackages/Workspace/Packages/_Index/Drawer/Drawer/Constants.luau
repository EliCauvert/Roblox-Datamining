return {
	SWIPE_OPEN_EDGE_THRESHOLD = 20,
	SCRIM_TRANSPARENCY = 0.35,
	DRAWER_VELOCITY_THRESHOLD = game:DefineFastInt("DrawerSwipeVelocityThreshold", 400),
	DRAWER_SWIPE_THRESHOLD_PERCENT = game:DefineFastInt("DrawerSwipeThresholdPercent", 30) / 100,
	DRAWER_ANIM_SETTINGS = {
		duration = 0.3,
		startingValue = nil,
		easingStyle = { 0.2, 0, 0, 1 }
	}
}