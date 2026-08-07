-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local breakpointModule = require(foundation.Enums.Breakpoint)
local breakpointShortNameModule = require(foundation.Enums.BreakpointShortName)

return {
	shortNames = {
		[breakpointModule.XSmall] = breakpointShortNameModule.xs,
		[breakpointModule.Small] = breakpointShortNameModule.sm,
		[breakpointModule.Medium] = breakpointShortNameModule.md,
		[breakpointModule.Large] = breakpointShortNameModule.lg,
		[breakpointModule.XLarge] = breakpointShortNameModule.xl,
		[breakpointModule.XXLarge] = breakpointShortNameModule.xxl
	},
	widths = {
		[breakpointModule.XSmall] = 360,
		[breakpointModule.Small] = 600,
		[breakpointModule.Medium] = 1140,
		[breakpointModule.Large] = 1520,
		[breakpointModule.XLarge] = 1920,
		[breakpointModule.XXLarge] = 1e999
	},
	order = {
		breakpointModule.XSmall, breakpointModule.Small, breakpointModule.Medium,
		breakpointModule.Large, breakpointModule.XLarge, breakpointModule.XXLarge
	}
}