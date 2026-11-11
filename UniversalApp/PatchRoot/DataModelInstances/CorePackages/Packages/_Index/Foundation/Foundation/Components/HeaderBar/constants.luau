local Foundation = script:FindFirstAncestor("Foundation")
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local ConstantsModule = require(Foundation.Constants)

return {
	LEADING_LAYOUT_ORDER = 1,
	CONTENT_LAYOUT_ORDER = 2,
	TRAILING_LAYOUT_ORDER = 3,
	LEADING_ACTIONS_LAYOUT_ORDER = ConstantsModule.MIN_LAYOUT_ORDER,
	TRAILING_ACTIONS_LAYOUT_ORDER = ConstantsModule.MAX_LAYOUT_ORDER - 1,
	SIZE_BY_BREAKPOINT = {
		[BreakpointModule.XSmall] = 1400,
		[BreakpointModule.Small] = 1400,
		[BreakpointModule.Medium] = 1600,
		[BreakpointModule.Large] = 1600,
		[BreakpointModule.XLarge] = 1800,
		[BreakpointModule.XXLarge] = 1800
	}
}