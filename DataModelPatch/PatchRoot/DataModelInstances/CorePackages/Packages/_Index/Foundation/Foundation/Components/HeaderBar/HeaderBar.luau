local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	[BreakpointModule.XSmall] = "size-full-1400",
	[BreakpointModule.Small] = "size-full-1400",
	[BreakpointModule.Medium] = "size-full-1600",
	[BreakpointModule.Large] = "size-full-1600",
	[BreakpointModule.XLarge] = "size-full-1800",
	[BreakpointModule.XXLarge] = "size-full-1800"
}
local config1 = { hasBackground = true, testId = "--foundation-header-bar" }

return ReactModule.memo(function(p1)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), ReactModule (copy), UseBreakpointModule (copy), ViewModule (copy), WithCommonPropsModule (copy), config (copy), HeaderBarContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
		tag = {
			["row flex-between gap-small padding-medium"] = true,
			["bg-surface-0"] = WithDefaultsModuleResult.hasBackground,
			[config[UseBreakpointModule(UseStateResult)]] = true
		},
		ref = UseStateResult2
	}), ReactModule.createElement(HeaderBarContextModule.Provider, { testId = WithDefaultsModuleResult.testId }, WithDefaultsModuleResult.children))
end)