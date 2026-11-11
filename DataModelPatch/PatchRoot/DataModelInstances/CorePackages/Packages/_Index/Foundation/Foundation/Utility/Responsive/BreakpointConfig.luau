local Foundation = script:FindFirstAncestor("Foundation")
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local BreakpointShortNameModule = require(Foundation.Enums.BreakpointShortName)

return {
	shortNames = {
		[BreakpointModule.XSmall] = BreakpointShortNameModule.xs,
		[BreakpointModule.Small] = BreakpointShortNameModule.sm,
		[BreakpointModule.Medium] = BreakpointShortNameModule.md,
		[BreakpointModule.Large] = BreakpointShortNameModule.lg,
		[BreakpointModule.XLarge] = BreakpointShortNameModule.xl,
		[BreakpointModule.XXLarge] = BreakpointShortNameModule.xxl
	},
	widths = {
		[BreakpointModule.XSmall] = 360,
		[BreakpointModule.Small] = 600,
		[BreakpointModule.Medium] = 1140,
		[BreakpointModule.Large] = 1520,
		[BreakpointModule.XLarge] = 1920,
		[BreakpointModule.XXLarge] = 1e999
	},
	order = {
		BreakpointModule.XSmall, BreakpointModule.Small, BreakpointModule.Medium,
		BreakpointModule.Large, BreakpointModule.XLarge, BreakpointModule.XXLarge
	}
}