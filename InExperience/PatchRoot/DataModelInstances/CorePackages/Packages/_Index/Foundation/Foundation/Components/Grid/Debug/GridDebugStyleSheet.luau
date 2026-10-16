local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local UseForwardRefFunction = require(Parent.ReactUtils).useForwardRef
local StyleRuleModule = require(Foundation.StyleSheet.StyleRule)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local _ = require(Foundation.Enums.Breakpoint)
local _ = require(Foundation.Enums.BreakpointShortName)
local UseResponsiveModule = require(Foundation.Providers.Responsive.useResponsive)

return ReactModule.memo(ReactModule.forwardRef(function(p1, p2) --[[ Line: 19 | Named "GridDebugStyleSheet" ]]
	-- upvalues: UseResponsiveModule (copy), UseStyleSheetFunction (copy), ReactModule (copy), UseForwardRefFunction (copy), StyleRuleModule (copy)
	local UseResponsiveModuleResult = UseResponsiveModule()
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseForwardRefResult = UseForwardRefFunction(p2, UseStateResult2)
	local Breakpoint = UseResponsiveModuleResult.config.breakpoint
	local Grid = UseResponsiveModuleResult.config.grid
	local OrderEntry = Breakpoint.order[#Breakpoint.order]
	local Breakpoint1 = p1.breakpoint or OrderEntry
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 31 ]]
		-- upvalues: Breakpoint (copy), Breakpoint1 (copy), Grid (copy), ReactModule (upval), StyleRuleModule (upval)
		local ShortName = Breakpoint.shortNames[Breakpoint1]
		local Column: number = Grid.columns[Breakpoint1]
		local Elements = {}
		
		for i = 0, Column do
			Elements[`DebugColColor${i}`] = ReactModule.createElement(StyleRuleModule, {
				Selector = if ShortName then `.{ShortName}-col-{i}` else `.col-{i}`,
				properties = {
					BackgroundColor3 = Color3.fromRGB(math.floor(i / math.max(1, Column) * 255), math.floor((1 - i / math.max(1, Column)) * 255), (math.floor(i % 3 / 2 * 255)))
				}
			})
		end
		return Elements
	end, { Breakpoint1, Breakpoint, Grid })
	ReactModule.useLayoutEffect(function() --[[ Line: 54 ]]
		-- upvalues: UseStateResult (copy), UseStyleSheetResult (copy)
		if UseStateResult then
			UseStateResult:SetDerives({ UseStyleSheetResult })
		end
	end, { UseStateResult, UseStyleSheetResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		GridDebugStyleSheet = ReactModule.createElement("StyleSheet", { ref = UseForwardRefResult }, UseMemoResult),
		GridDebugStyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStateResult })
	})
end))