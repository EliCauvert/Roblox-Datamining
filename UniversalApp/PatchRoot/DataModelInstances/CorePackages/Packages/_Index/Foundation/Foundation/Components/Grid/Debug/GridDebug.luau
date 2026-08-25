local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local breakpointModule = require(foundation.Enums.Breakpoint)
local gridDebugStyleSheetModule = require(script.Parent.GridDebugStyleSheet)
local reactModule = require(parent.React)
local styleSheetContextModule = require(foundation.Providers.Style.StyleSheetContext)
local textModule = require(foundation.Components.Text)
local viewModule = require(foundation.Components.View)
local getGridMetricsModule = require(foundation.Utility.getGridMetrics)
local useBreakpointModule = require(foundation.Providers.Responsive.Hooks.useBreakpoint)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)

local function DebugCol(p1)
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		Size = p1.size or UDim2.new(0, p1.width or 0, 1, 0),
		backgroundStyle = p1.backgroundStyle,
		LayoutOrder = p1.LayoutOrder,
		tag = p1.tag
	})
end

local t = { debugTransparency = 0.7 }

return function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), useResponsiveModule (ref), useBreakpointModule (ref), getGridMetricsModule (ref), breakpointModule (ref), DebugCol (ref), viewModule (ref), gridDebugStyleSheetModule (ref), textModule (ref), styleSheetContextModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = useTokensModule()
	local var3, var4 = reactModule.useState(nil)
	local var5 = useResponsiveModule()
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = useBreakpointModule(var6)
	local var10 = getGridMetricsModule(var5.config, var8, var9.X)
	local xLarge = var5.config.breakpoint.widths[breakpointModule.XLarge]
	local t_1 = {}
	local align = ({
		[Enum.ItemLineAlignment.Start] = "position-top-left anchor-top-left",
		[Enum.ItemLineAlignment.Center] = "position-top-center anchor-top-center",
		[Enum.ItemLineAlignment.End] = "position-top-right anchor-top-right"
	})[var1.align]
	
	for i = 1, var10.full.colCount - 1 do
		if i < var10.full.colCount then
			table.insert(t_1, reactModule.createElement(DebugCol, {
				key = `DebugCol{i}`,
				width = var10.gutterWidth,
				backgroundStyle = {
					Transparency = 0.5,
					Color3 = var2.Color.System.Alert.Color3
				},
				LayoutOrder = i
			}))
		end
	end
	return reactModule.createElement(viewModule, { tag = `size-full-full {align}` }, {
		GridDebugStyleSheet = reactModule.createElement(gridDebugStyleSheetModule, { breakpoint = var8, ref = var4 }),
		GridDebugMeasureWrapper = reactModule.createElement(viewModule, { tag = "size-full-0", ref = var7 }, {
			GridMeasureSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) })
		}),
		GridDebugMeasure = reactModule.createElement(viewModule, {
			Size = UDim2.new(1, 0, 0, 4),
			backgroundStyle = {
				Color3 = Color3.fromRGB(255, 0, 0),
				Transparency = var1.debugTransparency
			}
		}),
		GridDebugSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) }),
		GridDebugSizeLabel = reactModule.createElement(textModule, {
			tag = "position-top-center anchor-top-center auto-xy padding-xxsmall text-label-small text-truncate-end bg-over-media-300",
			Text = `breakpoint: {var5.config.breakpoint.shortNames[var8]}, width: {var9.X}, columns: {var10.full.colCount}, maxWidth: {xLarge}, margin: {var10.margin}, gapWidth: {var10.gutterWidth}`
		}),
		GridDebug = reactModule.createElement(viewModule, {
			tag = "row size-full-full",
			backgroundStyle = {
				Color3 = var2.Color.System.Emphasis.Color3,
				Transparency = var1.debugTransparency
			}
		}, {
			LeftMargin = reactModule.createElement(DebugCol, {
				LayoutOrder = 0,
				width = var10.margin,
				backgroundStyle = {
					Color3 = var2.Color.System.Warning.Color3,
					Transparency = var1.debugTransparency
				}
			}),
			Columns = reactModule.createElement(viewModule, {
				tag = "row flex-x-evenly fill size-0-full",
				LayoutOrder = 1,
				backgroundStyle = {
					Color3 = var2.Color.System.Emphasis.Color3,
					Transparency = var1.debugTransparency
				}
			}, t_1),
			RightMargin = reactModule.createElement(DebugCol, {
				LayoutOrder = 2,
				width = var10.margin,
				backgroundStyle = {
					Color3 = var2.Color.System.Warning.Color3,
					Transparency = var1.debugTransparency
				}
			})
		}),
		GridDebugContent = if var3 then reactModule.createElement(styleSheetContextModule.Provider, { value = var3 }, reactModule.createElement(viewModule, { tag = "size-full-full" }, {
			GridDebugPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var10.gapHeight * 2) }),
			GridDebugChildren = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		})) else nil
	})
end