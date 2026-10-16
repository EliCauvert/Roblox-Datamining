local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.Breakpoint)
local _ = require(Foundation.Enums.BreakpointShortName)
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Providers.Responsive.ResponsiveContext)
local StyleRuleModule = require(Foundation.StyleSheet.StyleRule)

local function createGridStyleRule(p1, ShortName) --[[ Line: 13 ]]
	-- upvalues: ReactModule (copy), StyleRuleModule (copy)
	return ReactModule.createElement(StyleRuleModule, {
		Selector = `{if ShortName then `.{ShortName}-col-{p1}` else `.col-{p1}`} ::UISizeConstraint`,
		properties = { MinSize = `$ColMin{p1}`, MaxSize = `$ColMax{p1}` }
	})
end

return function(p2) --[[ Line: 24 | Named "createGridStyleRules" ]]
	-- upvalues: createGridStyleRule (copy), ReactModule (copy), StyleRuleModule (copy)
	local Breakpoint = p2.breakpoint
	local Grid = p2.grid
	local RulesByBreakpoint = {}
	local BaseRules = {}
	
	for i = 0, Grid.columns[Breakpoint.order[#Breakpoint.order]] do
		BaseRules[`Col{i}`] = createGridStyleRule(i)
		
		if i == 0 then
			BaseRules.ColVisible0 = ReactModule.createElement(StyleRuleModule, { Selector = ".col-0", properties = { Visible = false } })
		end
	end
	for _, value in Breakpoint.order do
		local ShortName = Breakpoint.shortNames[value]
		local Elements = {}
		
		for i1 = 0, Grid.columns[value] do
			Elements[`{value}Col{i1}`] = createGridStyleRule(i1, ShortName)
			
			if i1 == 0 then
				Elements[`{value}ColVisible0`] = ReactModule.createElement(StyleRuleModule, {
					Selector = `.{ShortName}-col-0`,
					properties = { Visible = false }
				})
			end
		end
		RulesByBreakpoint[value] = Elements
	end
	return {
		baseRules = BaseRules,
		rulesByBreakpoint = RulesByBreakpoint
	}
end