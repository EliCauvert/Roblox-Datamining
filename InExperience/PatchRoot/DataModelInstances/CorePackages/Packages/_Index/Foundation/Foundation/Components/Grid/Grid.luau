local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local breakpointModule = require(foundation.Enums.Breakpoint)
local gridStyleSheetModule = require(script.Parent.GridStyleSheet)
local reactModule = require(parent.React)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local _ = require(foundation.Components.Types)
local viewModule = require(foundation.Components.View)
local getGridMetricsModule = require(foundation.Utility.getGridMetrics)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)
local withCommonPropsModule = require(foundation.Utility.withCommonProps)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = {
	[Enum.ItemLineAlignment.Start] = "items-start",
	[Enum.ItemLineAlignment.Center] = "items-center",
	[Enum.ItemLineAlignment.End] = "items-end"
}
local t_1 = {
	tag = "size-full-0 auto-y",
	Wraps = true,
	testId = "--foundation-grid",
	align = Enum.ItemLineAlignment.Start,
	SortOrder = Enum.SortOrder.LayoutOrder
}

return reactModule.memo(reactModule.forwardRef(function(p0, p1) --[[ line: 44 | named "Grid" ]]
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useResponsiveModule (ref), reactModule (ref), useBreakpointModule (ref), getGridMetricsModule (ref), breakpointModule (ref), t (ref), viewModule (ref), withCommonPropsModule (ref), gridStyleSheetModule (ref)
	local var12 = withDefaultsModule(p0, t_1)
	local var13 = useResponsiveModule()
	local var14, var15 = reactModule.useState(nil)
	local var16, var17 = useBreakpointModule(var14)
	local var18 = getGridMetricsModule(var13.config, var16, var17.X)
	local xLarge = var13.config.breakpoint.widths[breakpointModule.XLarge]
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var12, { tag = var12.tag, ref = p1 }), {
		GridMeasure = reactModule.createElement(viewModule, { tag = "size-full-0", ref = var15 }, {
			GridMeasureSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) })
		}),
		GridAlignment = reactModule.createElement(viewModule, {
			tag = `col flex-x-fill size-full-0 auto-y {t[var12.align]}`
		}, {
			GridStyleSheet = reactModule.createElement(gridStyleSheetModule, { breakpoint = var16, containerWidth = var17.X }),
			Grid = reactModule.createElement(viewModule, {
				tag = "auto-y",
				Size = UDim2.fromOffset(var17.X, 0),
				layout = {
					Padding = if not var12.Wraps then UDim.new(0, var18.gutterWidth) else nil,
					SortOrder = var12.SortOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = if var12.Wraps then Enum.UIFlexAlignment.SpaceBetween else nil,
					Wraps = var12.Wraps
				}
			}, {
				GridSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) }),
				GridMargin = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var18.margin),
					PaddingRight = UDim.new(0, var18.margin)
				})
			}, var12.children)
		})
	})
end))