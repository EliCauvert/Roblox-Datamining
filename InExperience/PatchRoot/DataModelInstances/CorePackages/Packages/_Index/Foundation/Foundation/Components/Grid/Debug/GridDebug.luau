local Foundation = script:FindFirstAncestor("Foundation")
local BreakpointModule = require(Foundation.Enums.Breakpoint)
local GridDebugStyleSheetModule = require(script.Parent.GridDebugStyleSheet)
local ReactModule = require(Foundation.Parent.React)
local StyleSheetContextModule = require(Foundation.Providers.Style.StyleSheetContext)
local TextModule = require(Foundation.Components.Text)
local ViewModule = require(Foundation.Components.View)
local GetGridMetricsModule = require(Foundation.Utility.getGridMetrics)
local UseBreakpointModule = require(Foundation.Providers.Responsive.Hooks.useBreakpoint)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)

local function DebugCol(Frame) --[[ Line: 29 ]]
	-- upvalues: ReactModule (copy), ViewModule (copy)
	return ReactModule.createElement(ViewModule, {
		Size = Frame.size or UDim2.new(0, Frame.width or 0, 1, 0),
		backgroundStyle = Frame.backgroundStyle,
		LayoutOrder = Frame.LayoutOrder,
		tag = Frame.tag
	})
end

local config = { debugTransparency = 0.7 }

return function(p1) --[[ Line: 48 | Named "GridDebug" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UseTokensModule (copy), ReactModule (copy), UseResponsiveModule (copy), UseBreakpointModule (copy), GetGridMetricsModule (copy), BreakpointModule (copy), DebugCol (copy), ViewModule (copy), GridDebugStyleSheetModule (copy), TextModule (copy), StyleSheetContextModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseTokensModuleResult = UseTokensModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResponsiveModuleResult = UseResponsiveModule()
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseBreakpointModuleResult, UseBreakpointModuleResult2 = UseBreakpointModule(UseStateResult1)
	local GridMetricsModule = GetGridMetricsModule(UseResponsiveModuleResult.config, UseBreakpointModuleResult, UseBreakpointModuleResult2.X)
	local Width = UseResponsiveModuleResult.config.breakpoint.widths[BreakpointModule.XLarge]
	local Elements = {}
	local Entry = ({
		[Enum.ItemLineAlignment.Start] = "position-top-left anchor-top-left",
		[Enum.ItemLineAlignment.Center] = "position-top-center anchor-top-center",
		[Enum.ItemLineAlignment.End] = "position-top-right anchor-top-right"
	})[WithDefaultsModuleResult.align]
	
	for i = 1, GridMetricsModule.full.colCount - 1 do
		if i < GridMetricsModule.full.colCount then
			table.insert(Elements, ReactModule.createElement(DebugCol, {
				key = `DebugCol{i}`,
				width = GridMetricsModule.gutterWidth,
				backgroundStyle = {
					Transparency = 0.5,
					Color3 = UseTokensModuleResult.Color.System.Alert.Color3
				},
				LayoutOrder = i
			}))
		end
	end
	return ReactModule.createElement(ViewModule, { tag = `size-full-full {Entry}` }, {
		GridDebugStyleSheet = ReactModule.createElement(GridDebugStyleSheetModule, {
			breakpoint = UseBreakpointModuleResult,
			ref = UseStateResult2
		}),
		GridDebugMeasureWrapper = ReactModule.createElement(ViewModule, { tag = "size-full-0", ref = UseStateResult2_1 }, {
			GridMeasureSizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Width, 1e999) })
		}),
		GridDebugMeasure = ReactModule.createElement(ViewModule, {
			Size = UDim2.new(1, 0, 0, 4),
			backgroundStyle = {
				Color3 = Color3.fromRGB(255, 0, 0),
				Transparency = WithDefaultsModuleResult.debugTransparency
			}
		}),
		GridDebugSizeConstraint = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Width, 1e999) }),
		GridDebugSizeLabel = ReactModule.createElement(TextModule, {
			tag = "position-top-center anchor-top-center auto-xy padding-xxsmall text-label-small text-truncate-end bg-over-media-300",
			Text = `breakpoint: {UseResponsiveModuleResult.config.breakpoint.shortNames[UseBreakpointModuleResult]}, width: {UseBreakpointModuleResult2.X}, columns: {GridMetricsModule.full.colCount}, maxWidth: {Width}, margin: {GridMetricsModule.margin}, gapWidth: {GridMetricsModule.gutterWidth}`
		}),
		GridDebug = ReactModule.createElement(ViewModule, {
			tag = "row size-full-full",
			backgroundStyle = {
				Color3 = UseTokensModuleResult.Color.System.Emphasis.Color3,
				Transparency = WithDefaultsModuleResult.debugTransparency
			}
		}, {
			LeftMargin = ReactModule.createElement(DebugCol, {
				LayoutOrder = 0,
				width = GridMetricsModule.margin,
				backgroundStyle = {
					Color3 = UseTokensModuleResult.Color.System.Warning.Color3,
					Transparency = WithDefaultsModuleResult.debugTransparency
				}
			}),
			Columns = ReactModule.createElement(ViewModule, {
				tag = "row flex-x-evenly fill size-0-full",
				LayoutOrder = 1,
				backgroundStyle = {
					Color3 = UseTokensModuleResult.Color.System.Emphasis.Color3,
					Transparency = WithDefaultsModuleResult.debugTransparency
				}
			}, Elements),
			RightMargin = ReactModule.createElement(DebugCol, {
				LayoutOrder = 2,
				width = GridMetricsModule.margin,
				backgroundStyle = {
					Color3 = UseTokensModuleResult.Color.System.Warning.Color3,
					Transparency = WithDefaultsModuleResult.debugTransparency
				}
			})
		}),
		GridDebugContent = if UseStateResult then ReactModule.createElement(StyleSheetContextModule.Provider, { value = UseStateResult }, ReactModule.createElement(ViewModule, { tag = "size-full-full" }, {
			GridDebugPadding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, GridMetricsModule.gapHeight * 2)
			}),
			GridDebugChildren = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
		})) else nil
	})
end