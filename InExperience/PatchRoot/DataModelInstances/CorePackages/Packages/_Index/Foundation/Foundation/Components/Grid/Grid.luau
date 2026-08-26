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

return reactModule.memo(reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t_1 (ref), useResponsiveModule (ref), reactModule (ref), useBreakpointModule (ref), getGridMetricsModule (ref), breakpointModule (ref), t (ref), viewModule (ref), withCommonPropsModule (ref), gridStyleSheetModule (ref)
	local var1 = withDefaultsModule(p1, t_1)
	local var2 = useResponsiveModule()
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = useBreakpointModule(var3)
	local var7 = getGridMetricsModule(var2.config, var5, var6.X)
	local xLarge = var2.config.breakpoint.widths[breakpointModule.XLarge]
	
	return reactModule.createElement(viewModule, withCommonPropsModule(var1, { tag = var1.tag, ref = p2 }), {
		GridMeasure = reactModule.createElement(viewModule, { tag = "size-full-0", ref = var4 }, {
			GridMeasureSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) })
		}),
		GridAlignment = reactModule.createElement(viewModule, {
			tag = `col flex-x-fill size-full-0 auto-y {t[var1.align]}`
		}, {
			GridStyleSheet = reactModule.createElement(gridStyleSheetModule, { breakpoint = var5, containerWidth = var6.X }),
			Grid = reactModule.createElement(viewModule, {
				tag = "auto-y",
				Size = UDim2.fromOffset(var6.X, 0),
				layout = {
					Padding = if not var1.Wraps then UDim.new(0, var7.gutterWidth) else nil,
					SortOrder = var1.SortOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalFlex = if var1.Wraps then Enum.UIFlexAlignment.SpaceBetween else nil,
					Wraps = var1.Wraps
				}
			}, {
				GridSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) }),
				GridMargin = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var7.margin),
					PaddingRight = UDim.new(0, var7.margin)
				})
			}, var1.children)
		})
	})
end))