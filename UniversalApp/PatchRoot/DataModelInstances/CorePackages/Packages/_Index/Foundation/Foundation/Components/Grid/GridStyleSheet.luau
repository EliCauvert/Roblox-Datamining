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

return reactModule.memo(function(p0) --[[ line: 25 | named "GridStyleSheet" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), useResponsiveModule (ref), useStyleSheet (ref), createGridStyleRulesModule (ref), dashModule (ref), getGridMetricsModule (ref)
	local var8 = withDefaultsModule(p0, t)
	local var9 = reactModule.useRef(nil)
	local var10 = useResponsiveModule()
	local var11 = useStyleSheet()
	local breakpoint = var10.config.breakpoint
	local grid = var10.config.grid
	local var12 = breakpoint.order[#breakpoint.order]
	local var13 = grid.columns[var12]
	local breakpoint_1 = var8.breakpoint or var12
	local maxValue = math.max(1, var8.containerWidth)
	local var16 = reactModule.useMemo(function() --[[ line: 39 ]]
		-- upvalues: createGridStyleRulesModule (copy), var10 (ref)
		return createGridStyleRulesModule(var10.config)
	end, { var10.config })
	local var17 = reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: dashModule (copy), var16 (ref), breakpoint_1 (ref)
		return dashModule.join(var16.baseRules, var16.rulesByBreakpoint[breakpoint_1])
	end, { var16, breakpoint_1 })
	reactModule.useLayoutEffect(function() --[[ line: 47 ]]
		-- upvalues: var9 (ref), grid (ref), breakpoint_1 (ref), var13 (ref), getGridMetricsModule (copy), var10 (ref), maxValue (ref)
		if var9.current then
			local var18 = grid.columns[breakpoint_1]
			
			for i = 0, var13 do
				local var19 = getGridMetricsModule(var10.config, breakpoint_1, maxValue, math.min(i, var18))
				local vector2 = Vector2.new(var19.cellWidth, 0)
				local vector2_1 = Vector2.new(var19.cellWidth, 1e999)
				var9.current:SetAttribute("Col" .. i, var19.cellSize)
				var9.current:SetAttribute("ColMin" .. i, vector2)
				var9.current:SetAttribute("ColMax" .. i, vector2_1)
			end
		end
	end, { var10.config, maxValue, breakpoint_1 })
	reactModule.useLayoutEffect(function() --[[ line: 70 ]]
		-- upvalues: var9 (ref), var11 (ref)
		if var9.current then
			var9.current:SetDerives({ var11 })
		end
	end, { var11 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		GridStyleSheet = reactModule.createElement("StyleSheet", { ref = var9 }, var17),
		GridStyleLink = reactModule.createElement("StyleLink", { StyleSheet = var9.current })
	})
end)