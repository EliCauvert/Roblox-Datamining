-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

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

local function DebugCol(p0) --[[ line: 29 ]]
	-- upvalues: reactModule (ref), viewModule (ref)
	return reactModule.createElement(viewModule, {
		Size = p0.size or UDim2.new(0, p0.width or 0, 1, 0),
		backgroundStyle = p0.backgroundStyle,
		LayoutOrder = p0.LayoutOrder,
		tag = p0.tag
	})
end

local t = { debugTransparency = 0.7 }

return function(p1) --[[ line: 48 | named "GridDebug" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), useTokensModule (ref), reactModule (ref), useResponsiveModule (ref), useBreakpointModule (ref), getGridMetricsModule (ref), breakpointModule (ref), DebugCol (ref), viewModule (ref), gridDebugStyleSheetModule (ref), textModule (ref), styleSheetContextModule (ref)
	local var14 = withDefaultsModule(p1, t)
	local var15 = useTokensModule()
	local var16, var17 = reactModule.useState(nil)
	local var18 = useResponsiveModule()
	local var19, var20 = reactModule.useState(nil)
	local var21, var22 = useBreakpointModule(var19)
	local var23 = getGridMetricsModule(var18.config, var21, var22.X)
	local xLarge = var18.config.breakpoint.widths[breakpointModule.XLarge]
	local t_1 = {}
	local align = ({
		[Enum.ItemLineAlignment.Start] = "position-top-left anchor-top-left",
		[Enum.ItemLineAlignment.Center] = "position-top-center anchor-top-center",
		[Enum.ItemLineAlignment.End] = "position-top-right anchor-top-right"
	})[var14.align]
	
	for i = 1, var23.full.colCount - 1 do
		if i < var23.full.colCount then
			table.insert(t_1, reactModule.createElement(DebugCol, {
				key = `DebugCol{i}`,
				width = var23.gutterWidth,
				backgroundStyle = {
					Transparency = 0.5,
					Color3 = var15.Color.System.Alert.Color3
				},
				LayoutOrder = i
			}))
		end
	end
	return reactModule.createElement(viewModule, { tag = `size-full-full {align}` }, {
		GridDebugStyleSheet = reactModule.createElement(gridDebugStyleSheetModule, { breakpoint = var21, ref = var17 }),
		GridDebugMeasureWrapper = reactModule.createElement(viewModule, { tag = "size-full-0", ref = var20 }, {
			GridMeasureSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) })
		}),
		GridDebugMeasure = reactModule.createElement(viewModule, {
			Size = UDim2.new(1, 0, 0, 4),
			backgroundStyle = {
				Color3 = Color3.fromRGB(255, 0, 0),
				Transparency = var14.debugTransparency
			}
		}),
		GridDebugSizeConstraint = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(xLarge, 1e999) }),
		GridDebugSizeLabel = reactModule.createElement(textModule, {
			tag = "position-top-center anchor-top-center auto-xy padding-xxsmall text-label-small text-truncate-end bg-over-media-300",
			Text = `breakpoint: {var18.config.breakpoint.shortNames[var21]}, width: {var22.X}, columns: {var23.full.colCount}, maxWidth: {xLarge}, margin: {var23.margin}, gapWidth: {var23.gutterWidth}`
		}),
		GridDebug = reactModule.createElement(viewModule, {
			tag = "row size-full-full",
			backgroundStyle = {
				Color3 = var15.Color.System.Emphasis.Color3,
				Transparency = var14.debugTransparency
			}
		}, {
			LeftMargin = reactModule.createElement(DebugCol, {
				LayoutOrder = 0,
				width = var23.margin,
				backgroundStyle = {
					Color3 = var15.Color.System.Warning.Color3,
					Transparency = var14.debugTransparency
				}
			}),
			Columns = reactModule.createElement(viewModule, {
				tag = "row flex-x-evenly fill size-0-full",
				LayoutOrder = 1,
				backgroundStyle = {
					Color3 = var15.Color.System.Emphasis.Color3,
					Transparency = var14.debugTransparency
				}
			}, t_1),
			RightMargin = reactModule.createElement(DebugCol, {
				LayoutOrder = 2,
				width = var23.margin,
				backgroundStyle = {
					Color3 = var15.Color.System.Warning.Color3,
					Transparency = var14.debugTransparency
				}
			})
		}),
		GridDebugContent = if var16 then reactModule.createElement(styleSheetContextModule.Provider, { value = var16 }, reactModule.createElement(viewModule, { tag = "size-full-full" }, {
			GridDebugPadding = reactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, var23.gapHeight * 2) }),
			GridDebugChildren = reactModule.createElement(reactModule.Fragment, nil, p1.children)
		})) else nil
	})
end