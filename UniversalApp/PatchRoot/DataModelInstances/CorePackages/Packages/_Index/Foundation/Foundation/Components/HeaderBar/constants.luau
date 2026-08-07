local constantsModule = require(script:FindFirstAncestor("Foundation").Constants)

return {
	LEADING_LAYOUT_ORDER = 1,
	CONTENT_LAYOUT_ORDER = 2,
	TRAILING_LAYOUT_ORDER = 3,
	LEADING_ACTIONS_LAYOUT_ORDER = constantsModule.MIN_LAYOUT_ORDER,
	TRAILING_ACTIONS_LAYOUT_ORDER = constantsModule.MAX_LAYOUT_ORDER - 1
}