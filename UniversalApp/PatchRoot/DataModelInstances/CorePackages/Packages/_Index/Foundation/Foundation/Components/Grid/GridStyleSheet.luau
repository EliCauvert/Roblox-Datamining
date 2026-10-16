local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(Foundation.Enums.Breakpoint)
local CreateGridStyleRulesModule = require(script.Parent.createGridStyleRules)
local GetGridMetricsModule = require(Foundation.Utility.getGridMetrics)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { containerWidth = 0 }

return ReactModule.memo(function(p1) --[[ Line: 25 | Named "GridStyleSheet" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), UseResponsiveModule (copy), UseStyleSheetFunction (copy), CreateGridStyleRulesModule (copy), DashModule (copy), GetGridMetricsModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResponsiveModuleResult = UseResponsiveModule()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local Breakpoint = UseResponsiveModuleResult.config.breakpoint
	local Grid = UseResponsiveModuleResult.config.grid
	local OrderEntry = Breakpoint.order[#Breakpoint.order]
	local Column = Grid.columns[OrderEntry]
	local Breakpoint1 = WithDefaultsModuleResult.breakpoint or OrderEntry
	local Largest = math.max(1, WithDefaultsModuleResult.containerWidth)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 39 ]]
		-- upvalues: CreateGridStyleRulesModule (upval), UseResponsiveModuleResult (copy)
		return CreateGridStyleRulesModule(UseResponsiveModuleResult.config)
	end, { UseResponsiveModuleResult.config })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 43 ]]
		-- upvalues: DashModule (upval), UseMemoResult (copy), Breakpoint1 (copy)
		return DashModule.join(UseMemoResult.baseRules, UseMemoResult.rulesByBreakpoint[Breakpoint1])
	end, { UseMemoResult, Breakpoint1 })
	ReactModule.useLayoutEffect(function() --[[ Line: 47 ]]
		-- upvalues: UseRefResult (copy), Grid (copy), Breakpoint1 (copy), Column (copy), GetGridMetricsModule (upval), UseResponsiveModuleResult (copy), Largest (copy)
		if UseRefResult.current then
			local Column1: number = Grid.columns[Breakpoint1]
			
			for i = 0, Column do
				local GridMetricsModule = GetGridMetricsModule(UseResponsiveModuleResult.config, Breakpoint1, Largest, (math.min(i, Column1)))
				local _Vector2 = Vector2.new(GridMetricsModule.cellWidth, 0)
				local _Vector2_1 = Vector2.new(GridMetricsModule.cellWidth, 1e999)
				UseRefResult.current:SetAttribute("Col" .. i, GridMetricsModule.cellSize)
				UseRefResult.current:SetAttribute("ColMin" .. i, _Vector2)
				UseRefResult.current:SetAttribute("ColMax" .. i, _Vector2_1)
			end
		end
	end, { UseResponsiveModuleResult.config, Largest, Breakpoint1 })
	ReactModule.useLayoutEffect(function() --[[ Line: 70 ]]
		-- upvalues: UseRefResult (copy), UseStyleSheetResult (copy)
		if UseRefResult.current then
			UseRefResult.current:SetDerives({ UseStyleSheetResult })
		end
	end, { UseStyleSheetResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		GridStyleSheet = ReactModule.createElement("StyleSheet", { ref = UseRefResult }, UseMemoResult1),
		GridStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseRefResult.current })
	})
end)