-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointModule = require(foundation.Enums.Breakpoint)
local flagsModule = require(foundation.Utility.Flags)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useViewportBreakpointModule = require(foundation.Providers.Responsive.Hooks.useViewportBreakpoint)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	[breakpointModule.XSmall] = "size-full-1400",
	[breakpointModule.Small] = "size-full-1400",
	[breakpointModule.Medium] = "size-full-1600",
	[breakpointModule.Large] = "size-full-1600",
	[breakpointModule.XLarge] = "size-full-1800",
	[breakpointModule.XXLarge] = "size-full-1800"
}
local t_1 = { hasBackground = true, testId = "--foundation-header-bar" }

return reactModule.memo(function(p0) --[[ line: 37 | named "HeaderBar" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), flagsModule (ref), reactModule (ref), useViewportBreakpointModule (ref), useBreakpointModule (ref), viewModule (ref), withCommonPropsModule (ref), t (ref), headerBarContextModule (ref)
	local var12 = withDefaultsModule(p0, t_1)
	local var13 = nil
	local var14 = nil
	
	if not flagsModule.FoundationHeaderBarDualPaneBreakpointsStaySynced then
		local var15, var16 = reactModule.useState(nil)
		var13 = var15
		var14 = var16
	end
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, {
		tag = {
			["row flex-between gap-small padding-medium"] = true,
			["bg-surface-0"] = var12.hasBackground,
			[t[if flagsModule.FoundationHeaderBarDualPaneBreakpointsStaySynced then useViewportBreakpointModule() else useBreakpointModule(var13)]] = true
		},
		ref = if flagsModule.FoundationHeaderBarDualPaneBreakpointsStaySynced then nil else var14
	}), reactModule.createElement(headerBarContextModule.Provider, { testId = var12.testId }, var12.children))
end)