local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Enums.BreakpointShortName)
local reactModule = require(parent.React)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local styleRuleModule = require(foundation.StyleSheet.StyleRule)

local function createGridStyleRule(p1, p2)
	-- upvalues: reactModule (ref), styleRuleModule (ref)
	return reactModule.createElement(styleRuleModule, {
		Selector = `{if p2 then `.{p2}-col-{p1}` else `.col-{p1}`} ::UISizeConstraint`,
		properties = { MinSize = `$ColMin{p1}`, MaxSize = `$ColMax{p1}` }
	})
end

return function(p1)
	-- upvalues: createGridStyleRule (ref), reactModule (ref), styleRuleModule (ref)
	local breakpoint = p1.breakpoint
	local grid = p1.grid
	local var1 = grid.columns[breakpoint.order[#breakpoint.order]]
	local t = {}
	local t_1 = {}
	
	for i = 0, var1 do
		t_1[`Col{i}`] = createGridStyleRule(i)
		
		if i == 0 then
			t_1.ColVisible0 = reactModule.createElement(styleRuleModule, { Selector = ".col-0", properties = { Visible = false } })
		end
	end
	for i_1, v in breakpoint.order do
		local var2 = breakpoint.shortNames[v]
		local t_2 = {}
		
		for i_2 = 0, grid.columns[v] do
			t_2[`{v}Col{i_2}`] = createGridStyleRule(i_2, var2)
			
			if i_2 == 0 then
				t_2[`{v}ColVisible0`] = reactModule.createElement(styleRuleModule, {
					Selector = `.{var2}-col-0`,
					properties = { Visible = false }
				})
			end
		end
		t[v] = t_2
	end
	return { baseRules = t_1, rulesByBreakpoint = t }
end