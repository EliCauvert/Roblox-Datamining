local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local argCheckModule = require(parent.ArgCheck)
local _ = require(parent.DiscoveryTypes)
local filterImpressionsEventModule = require(gameFilters.Analytics.filterImpressionsEvent)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), argCheckModule (ref), filterImpressionsEventModule (ref)
	if not p1 then return end
	if not p2 or #p2 == 0 then return end
	if not p3 or #p3 == 0 then return end
	local t = {
		gameSetTypeId = p5.gameSetTypeId,
		gameSetTargetId = p5.gameSetTargetId,
		sortPos = p5.sortPos
	}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var1 = if fFlagLuaAppChartsFilterOptionTextTag then {} else nil
	
	for i, v in p2 do
		local var2 = p3[v]
		
		if var2 then
			table.insert(t_1, v)
			table.insert(t_2, var2.filterId)
			table.insert(t_3, var2.selectedOptionId)
			
			if fFlagLuaAppChartsFilterOptionTextTag then
				table.insert(var1, getOptionContextTagModule(var2, var2.selectedOptionId) or "0")
			end
		end
	end
	local t_2Count = #t_2
	argCheckModule.assert(t_2Count == #t_1)
	argCheckModule.assert(t_2Count == #t_3)
	
	if fFlagLuaAppChartsFilterOptionTextTag then
		argCheckModule.assert(t_2Count == #var1)
	end
	t.absPositions = table.concat(t_1, ",")
	t.filterIds = table.concat(t_2, ",")
	t.selectedOptionIds = table.concat(t_3, ",")
	t.selectedOptionContextTags = if fFlagLuaAppChartsFilterOptionTextTag then table.concat(var1, ",") else nil
	filterImpressionsEventModule(p1, p4, t)
end