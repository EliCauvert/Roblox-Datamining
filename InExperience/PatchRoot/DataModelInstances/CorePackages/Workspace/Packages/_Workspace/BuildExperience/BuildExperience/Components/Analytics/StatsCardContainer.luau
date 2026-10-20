local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseBreakpointFunction = FoundationModule.Hooks.useBreakpoint
local StatsCardModule = require(script.Parent.StatsCard.StatsCard)
local GetStatsCardColumnsModule = require(script.Parent.getStatsCardColumns)

return function(p1)
	-- upvalues: ReactModule (copy), UseBreakpointFunction (copy), GetStatsCardColumnsModule (copy), View (copy), StatsCardModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local _, UseBreakpointResult2 = UseBreakpointFunction(UseStateResult)
	local StatsCardColumnsModule = if UseBreakpointResult2.X > 0 then GetStatsCardColumnsModule(UseBreakpointResult2.X) else 2
	local Cards = p1.cards
	local Elements = {}
	
	for i = 1, math.ceil(#Cards / StatsCardColumnsModule) do
		local Elements1 = {}
		
		for i1 = 1, StatsCardColumnsModule do
			local Card = Cards[(i - 1) * StatsCardColumnsModule + i1]
			
			if Card ~= nil then
				Elements1[`Cell{i1}`] = ReactModule.createElement(View, { tag = "fill auto-y", LayoutOrder = i1 }, { Card = ReactModule.createElement(StatsCardModule, Card) })
			end
		end
		Elements[`Row{i}`] = ReactModule.createElement(View, {
			tag = "row gap-medium size-full-0 auto-y",
			LayoutOrder = i
		}, Elements1)
	end
	return ReactModule.createElement(View, {
		tag = "col gap-medium size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = p1.testId or "StatsCardContainer",
		ref = UseStateResult2
	}, Elements)
end