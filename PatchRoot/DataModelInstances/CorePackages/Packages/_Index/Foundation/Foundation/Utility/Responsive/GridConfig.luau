-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local breakpointModule = require(script:FindFirstAncestor("Foundation").Enums.Breakpoint)

return {
	columns = {
		[breakpointModule.XSmall] = 3,
		[breakpointModule.Small] = 6,
		[breakpointModule.Medium] = 12,
		[breakpointModule.Large] = 12,
		[breakpointModule.XLarge] = 12,
		[breakpointModule.XXLarge] = 12
	},
	margins = {
		[breakpointModule.XSmall] = 12,
		[breakpointModule.Small] = 20,
		[breakpointModule.Medium] = 24,
		[breakpointModule.Large] = 24,
		[breakpointModule.XLarge] = 32,
		[breakpointModule.XXLarge] = 48
	},
	gutters = {
		[breakpointModule.XSmall] = 8,
		[breakpointModule.Small] = 12,
		[breakpointModule.Medium] = 16,
		[breakpointModule.Large] = 16,
		[breakpointModule.XLarge] = 20,
		[breakpointModule.XXLarge] = 20
	},
	gaps = {
		[breakpointModule.XSmall] = 8,
		[breakpointModule.Small] = 12,
		[breakpointModule.Medium] = 16,
		[breakpointModule.Large] = 16,
		[breakpointModule.XLarge] = 20,
		[breakpointModule.XXLarge] = 20
	}
}