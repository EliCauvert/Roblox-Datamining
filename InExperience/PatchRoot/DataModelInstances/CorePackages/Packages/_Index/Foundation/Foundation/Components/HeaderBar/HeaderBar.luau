local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.Breakpoint)
local FlagsModule = require(Foundation.Utility.Flags)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseViewportBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useViewportBreakpoint)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { hasBackground = true, testId = "--foundation-header-bar" }

return ReactModule.memo(function(p1)
	-- upvalues: WithDefaultsModule (copy), config (copy), UseViewportBreakpointModule (copy), FlagsModule (copy), ReactModule (copy), HeaderBarSlotModule (copy), ViewModule (copy), WithCommonPropsModule (copy), ConstantsModule (copy), HeaderBarContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseViewportBreakpointModuleResult = UseViewportBreakpointModule()
	
	if FlagsModule.FoundationHeaderBarSlotSizing then
		local UseStateResult, UseStateResult2 = ReactModule.useState({ leading = 0, trailing = 0 })
		
		return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			tag = {
				["padding-x-medium"] = true,
				["bg-surface-0"] = WithDefaultsModuleResult.hasBackground,
				[`size-full-{ConstantsModule.SIZE_BY_BREAKPOINT[UseViewportBreakpointModuleResult]}`] = true
			}
		}), ReactModule.createElement(HeaderBarContextModule.Provider, {
			testId = WithDefaultsModuleResult.testId,
			leadingWidth = UseStateResult.leading,
			trailingWidth = UseStateResult.trailing,
			onSideWidthChanged = ReactModule.useCallback(function(Leading, p2)
				-- upvalues: UseStateResult2 (copy), HeaderBarSlotModule (upval)
				UseStateResult2(function(p3)
					-- upvalues: Leading (copy), HeaderBarSlotModule (upval), p2 (copy)
					local Leading1 = if Leading == HeaderBarSlotModule.Leading then p2 else p3.leading
					local Trailing = if Leading == HeaderBarSlotModule.Trailing then p2 else p3.trailing
					
					return if Leading1 == p3.leading and Trailing == p3.trailing then p3 else { leading = Leading1, trailing = Trailing }
				end)
			end, {})
		}, WithDefaultsModuleResult.children))
	else
		return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, {
			tag = {
				["row flex-between gap-small padding-medium"] = true,
				["bg-surface-0"] = WithDefaultsModuleResult.hasBackground,
				[`size-full-{ConstantsModule.SIZE_BY_BREAKPOINT[UseViewportBreakpointModuleResult]}`] = true
			}
		}), ReactModule.createElement(HeaderBarContextModule.Provider, { testId = WithDefaultsModuleResult.testId }, WithDefaultsModuleResult.children))
	end
end)