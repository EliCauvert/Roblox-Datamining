local Foundation = script:FindFirstAncestor("Foundation")
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local GridStyleSheetModule = require(script.Parent.GridStyleSheet)
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetGridMetricsModule = require(Foundation.Utility.getGridMetrics)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = {
	[Enum.ItemLineAlignment.Start] = "items-start",
	[Enum.ItemLineAlignment.Center] = "items-center",
	[Enum.ItemLineAlignment.End] = "items-end"
}
local config1 = {
	tag = "size-full-0 auto-y",
	Wraps = true,
	testId = "--foundation-grid",
	align = Enum.ItemLineAlignment.Start,
	SortOrder = Enum.SortOrder.LayoutOrder
}

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: WithDefaultsModule (copy), config1 (copy), UseResponsiveModule (copy), ReactModule (copy), UseBreakpointModule (copy), GetGridMetricsModule (copy), BreakpointModule (copy), config (copy), ViewModule (copy), WithCommonPropsModule (copy), GridStyleSheetModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config1)
	local UseResponsiveModuleResult = UseResponsiveModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseBreakpointModuleResult, UseBreakpointModuleResult2 = UseBreakpointModule(UseStateResult)
	local GridMetricsModule = GetGridMetricsModule(UseResponsiveModuleResult.config, UseBreakpointModuleResult, UseBreakpointModuleResult2.X)
	local Width = UseResponsiveModuleResult.config.breakpoint.widths[BreakpointModule.XLarge]
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(WithDefaultsModuleResult, { tag = WithDefaultsModuleResult.tag, ref = Ref }), {
		GridMeasure = ReactModule.createElement(ViewModule, { tag = "size-full-0", ref = UseStateResult2 }, {
			GridMeasureSizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Width, 1e999) })
		}),
		GridAlignment = ReactModule.createElement(ViewModule, {
			tag = `col flex-x-fill size-full-0 auto-y {config[WithDefaultsModuleResult.align]}`
		}, {
			GridStyleSheet = ReactModule.createElement(GridStyleSheetModule, {
				breakpoint = UseBreakpointModuleResult,
				containerWidth = UseBreakpointModuleResult2.X
			}),
			Grid = ReactModule.createElement(ViewModule, {
				tag = "auto-y",
				Size = UDim2.fromOffset(UseBreakpointModuleResult2.X, 0),
				layout = {
					Padding = if WithDefaultsModuleResult.Wraps then nil else UDim.new(0, GridMetricsModule.gutterWidth),
					SortOrder = WithDefaultsModuleResult.SortOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = if WithDefaultsModuleResult.Wraps then Enum.UIFlexAlignment.SpaceBetween else nil,
					Wraps = WithDefaultsModuleResult.Wraps
				}
			}, {
				GridSizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Width, 1e999) }),
				GridMargin = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, GridMetricsModule.margin),
					PaddingRight = UDim.new(0, GridMetricsModule.margin)
				})
			}, WithDefaultsModuleResult.children)
		})
	})
end))