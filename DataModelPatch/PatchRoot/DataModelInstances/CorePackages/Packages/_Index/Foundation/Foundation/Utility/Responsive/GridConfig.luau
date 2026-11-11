local BreakpointModule = require(script:FindFirstAncestor("Foundation").Enums.Breakpoint)

return {
	columns = {
		[BreakpointModule.XSmall] = 3,
		[BreakpointModule.Small] = 6,
		[BreakpointModule.Medium] = 12,
		[BreakpointModule.Large] = 12,
		[BreakpointModule.XLarge] = 12,
		[BreakpointModule.XXLarge] = 12
	},
	margins = {
		[BreakpointModule.XSmall] = 12,
		[BreakpointModule.Small] = 20,
		[BreakpointModule.Medium] = 24,
		[BreakpointModule.Large] = 24,
		[BreakpointModule.XLarge] = 32,
		[BreakpointModule.XXLarge] = 48
	},
	gutters = {
		[BreakpointModule.XSmall] = 8,
		[BreakpointModule.Small] = 12,
		[BreakpointModule.Medium] = 16,
		[BreakpointModule.Large] = 16,
		[BreakpointModule.XLarge] = 20,
		[BreakpointModule.XXLarge] = 20
	},
	gaps = {
		[BreakpointModule.XSmall] = 8,
		[BreakpointModule.Small] = 12,
		[BreakpointModule.Medium] = 16,
		[BreakpointModule.Large] = 16,
		[BreakpointModule.XLarge] = 20,
		[BreakpointModule.XXLarge] = 20
	}
}