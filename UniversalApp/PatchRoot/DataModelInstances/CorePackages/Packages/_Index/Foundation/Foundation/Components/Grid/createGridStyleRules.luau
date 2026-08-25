local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local _ = require(foundation.Enums.Breakpoint)
local _ = require(foundation.Enums.BreakpointShortName)
local reactModule = require(parent.React)
local _ = require(foundation.Providers.Responsive.ResponsiveContext)
local styleRuleModule = require(foundation.StyleSheet.StyleRule)

local function createGridStyleRule(p0, p1)
	-- upvalues: reactModule (ref), styleRuleModule (ref)
	return reactModule.createElement(styleRuleModule, {
		Selector = `{if p1 then `.{p1}-col-{p0}` else `.col-{p0}`} ::UISizeConstraint`,
		properties = { MinSize = `$ColMin{p0}`, MaxSize = `$ColMax{p0}` }
	})
end

return function(p2)
	-- upvalues: createGridStyleRule (ref), reactModule (ref), styleRuleModule (ref)
	local breakpoint = p2.breakpoint
	local grid = p2.grid
	local var4 = grid.columns[breakpoint.order[#breakpoint.order]]
	local t = {}
	local t_1 = {}
	
	for i = 0, var4 do
		t_1[`Col{i}`] = createGridStyleRule(i)
		
		if i == 0 then
			t_1.ColVisible0 = reactModule.createElement(styleRuleModule, { Selector = ".col-0", properties = { Visible = false } })
		end
	end
	for i_1, v in breakpoint.order do
		local var7 = breakpoint.shortNames[v]
		local t_2 = {}
		
		for i_2 = 0, grid.columns[v] do
			t_2[`{v}Col{i_2}`] = createGridStyleRule(i_2, var7)
			
			if i_2 == 0 then
				t_2[`{v}ColVisible0`] = reactModule.createElement(styleRuleModule, {
					Selector = `.{var7}-col-0`,
					properties = { Visible = false }
				})
			end
		end
		t[v] = t_2
	end
	return { baseRules = t_1, rulesByBreakpoint = t }
end