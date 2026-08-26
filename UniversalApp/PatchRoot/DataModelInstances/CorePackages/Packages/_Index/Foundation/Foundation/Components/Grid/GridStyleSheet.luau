local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(foundation.Enums.Breakpoint)
local createGridStyleRulesModule = require(script.Parent.createGridStyleRules)
local getGridMetricsModule = require(foundation.Utility.getGridMetrics)
local useResponsiveModule = require(foundation.Providers.Responsive.useResponsive)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local t = { containerWidth = 0 }

return reactModule.memo(function(p1)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useResponsiveModule (ref), useStyleSheet (ref), createGridStyleRulesModule (ref), dashModule (ref), getGridMetricsModule (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = reactModule.useRef(nil)
	local var3 = useResponsiveModule()
	local var4 = useStyleSheet()
	local breakpoint = var3.config.breakpoint
	local grid = var3.config.grid
	local var5 = breakpoint.order[#breakpoint.order]
	local var6 = grid.columns[var5]
	local breakpoint_1 = var1.breakpoint or var5
	local maxValue = math.max(1, var1.containerWidth)
	local var7 = reactModule.useMemo(function()
		-- upvalues: createGridStyleRulesModule (copy), var3 (ref)
		return createGridStyleRulesModule(var3.config)
	end, { var3.config })
	local var8 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), var7 (ref), breakpoint_1 (ref)
		return dashModule.join(var7.baseRules, var7.rulesByBreakpoint[breakpoint_1])
	end, { var7, breakpoint_1 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), grid (ref), breakpoint_1 (ref), var6 (ref), getGridMetricsModule (copy), var3 (ref), maxValue (ref)
		if var2.current then
			local var9 = grid.columns[breakpoint_1]
			
			for i = 0, var6 do
				local var10 = getGridMetricsModule(var3.config, breakpoint_1, maxValue, math.min(i, var9))
				local vector2 = Vector2.new(var10.cellWidth, 0)
				local vector2_1 = Vector2.new(var10.cellWidth, 1e999)
				var2.current:SetAttribute("Col" .. i, var10.cellSize)
				var2.current:SetAttribute("ColMin" .. i, vector2)
				var2.current:SetAttribute("ColMax" .. i, vector2_1)
			end
		end
	end, { var3.config, maxValue, breakpoint_1 })
	reactModule.useLayoutEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		if var2.current then
			var2.current:SetDerives({ var4 })
		end
	end, { var4 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GridStyleSheet = reactModule.createElement("StyleSheet", { ref = var2 }, var8),
		GridStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var2.current })
	})
end)