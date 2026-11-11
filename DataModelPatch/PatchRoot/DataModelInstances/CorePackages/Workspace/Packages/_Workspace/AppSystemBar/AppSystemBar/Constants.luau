return {
	TOP_BAR_SIZE = 64,
	GAMEPAD_BOTTOM_BAR_SIZE = 72,
	BOTTOM_BAR_SIZE = if require(script:FindFirstAncestor("AppSystemBar").Parent.SharedFlags).FFlagShrinkAppNavBar then 52 else 64
}