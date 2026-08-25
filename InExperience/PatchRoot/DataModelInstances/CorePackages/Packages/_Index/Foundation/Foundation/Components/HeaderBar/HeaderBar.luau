local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local breakpointModule = require(foundation.Enums.Breakpoint)
local headerBarContextModule = require(foundation.Components.HeaderBar.HeaderBarContext)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
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

return reactModule.memo(function(p0)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useViewportBreakpointModule (ref), reactModule (ref), viewModule (ref), withCommonPropsModule (ref), t (ref), headerBarContextModule (ref)
	local var10 = withDefaultsModule(p0, t_1)
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var10, {
		tag = {
			["row flex-between gap-small padding-medium"] = true,
			["bg-surface-0"] = var10.hasBackground,
			[t[useViewportBreakpointModule()]] = true
		}
	}), reactModule.createElement(headerBarContextModule.Provider, { testId = var10.testId }, var10.children))
end)