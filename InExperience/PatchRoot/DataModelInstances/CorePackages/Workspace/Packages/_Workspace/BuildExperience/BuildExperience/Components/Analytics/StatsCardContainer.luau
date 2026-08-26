local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useBreakpoint = foundationModule.Hooks.useBreakpoint
local statsCardModule = require(script.Parent.StatsCard.StatsCard)
local getStatsCardColumnsModule = require(script.Parent.getStatsCardColumns)

return function(p1)
	-- upvalues: reactModule (ref), useBreakpoint (ref), getStatsCardColumnsModule (ref), view (ref), statsCardModule (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = useBreakpoint(var1)
	local var5 = if var4.X > 0 then getStatsCardColumnsModule(var3) else 2
	local cards = p1.cards
	local t = {}
	
	for i_1 = 1, math.ceil(#cards / var5) do
		local t_1 = {}
		
		for i = 1, var5 do
			local var6 = cards[(i_1 - 1) * var5 + i]
			
			if var6 ~= nil then
				t_1[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, { Card = reactModule.createElement(statsCardModule, var6) })
			end
		end
		t[`Row{i_1}`] = reactModule.createElement(view, {
			tag = "row gap-medium size-full-0 auto-y",
			LayoutOrder = i_1
		}, t_1)
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "StatsCardContainer",
		ref = var2
	}, t)
end