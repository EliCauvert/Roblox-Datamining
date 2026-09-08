return {
	ROBUX_ICON = "icons/common/robux",
	ROBUX_PACKAGE_IMAGE = "icons/common/robux",
	MIN_COLUMNS = 2,
	HOME_CATEGORY_ID = "home",
	SEARCH_DEBOUNCE_SECONDS = 0.25,
	SEARCH_MIN_LENGTH = 1,
	POLL_INITIAL_DELAY_SECONDS = 0.25,
	POLL_BACKOFF_MULTIPLIER = 2,
	COMPACT_BREAKPOINT_WIDTH = 480,
	MIN_TILE_WIDTH = game:DefineFastInt("ShopMinTileWidth", 98),
	ITEMS_PER_SECTION = game:DefineFastInt("ShopItemsPerSection", 6),
	BLACKLISTED_CATEGORY_NAMES = {},
	MAX_SEARCH_RESULTS = game:DefineFastInt("ShopMaxSearchResults", 50)
}