local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local useBreakpoint = foundationModule.Hooks.useBreakpoint
local statsCardModule = require(script.Parent.StatsCard.StatsCard)
local getStatsCardColumnsModule = require(script.Parent.getStatsCardColumns)

return function(p0) --[[ line: 19 | named "StatsCardContainer" ]]
	-- upvalues: reactModule (ref), useBreakpoint (ref), getStatsCardColumnsModule (ref), view (ref), statsCardModule (ref)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = useBreakpoint(var4)
	local var8 = if var7.X > 0 then getStatsCardColumnsModule(var6) else 2
	local cards = p0.cards
	local t = {}
	
	for i_1 = 1, math.ceil(#cards / var8) do
		local t_1 = {}
		
		for i = 1, var8 do
			local var11 = cards[(i_1 - 1) * var8 + i]
			
			if var11 ~= nil then
				t_1[`Cell{i}`] = reactModule.createElement(view, { tag = "fill auto-y", LayoutOrder = i }, { Card = reactModule.createElement(statsCardModule, var11) })
			end
		end
		t[`Row{i_1}`] = reactModule.createElement(view, {
			tag = "row gap-medium size-full-0 auto-y",
			LayoutOrder = i_1
		}, t_1)
	end
	return reactModule.createElement(view, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p0.layoutOrder,
		testId = p0.testId or "StatsCardContainer",
		ref = var5
	}, t)
end