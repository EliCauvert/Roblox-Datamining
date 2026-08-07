local gameFilters = script:FindFirstAncestor("GameFilters")
local parent = gameFilters.Parent
local argCheckModule = require(parent.ArgCheck)
local _ = require(parent.DiscoveryTypes)
local filterImpressionsEventModule = require(gameFilters.Analytics.filterImpressionsEvent)
local getOptionContextTagModule = require(gameFilters.Analytics.getOptionContextTag)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function(p0, p1, p2, p3, p4) --[[ line: 12 | named "sendFilterImpressions" ]]
	-- upvalues: fFlagLuaAppChartsFilterOptionTextTag (ref), getOptionContextTagModule (ref), argCheckModule (ref), filterImpressionsEventModule (ref)
	if not p0 then return end
	if not p1 or #p1 == 0 then return end
	if not p2 or #p2 == 0 then return end
	local t = {
		gameSetTypeId = p4.gameSetTypeId,
		gameSetTargetId = p4.gameSetTargetId,
		sortPos = p4.sortPos
	}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local var8 = if fFlagLuaAppChartsFilterOptionTextTag then {} else nil
	
	for i, v in p1 do
		local var10 = p2[v]
		
		if var10 then
			table.insert(t_1, v)
			table.insert(t_2, var10.filterId)
			table.insert(t_3, var10.selectedOptionId)
			
			if fFlagLuaAppChartsFilterOptionTextTag then
				table.insert(var8, getOptionContextTagModule(var10, var10.selectedOptionId) or "0")
			end
		end
	end
	local t_2Count = #t_2
	argCheckModule.assert(t_2Count == #t_1)
	argCheckModule.assert(t_2Count == #t_3)
	
	if fFlagLuaAppChartsFilterOptionTextTag then
		argCheckModule.assert(t_2Count == #var8)
	end
	t.absPositions = table.concat(t_1, ",")
	t.filterIds = table.concat(t_2, ",")
	t.selectedOptionIds = table.concat(t_3, ",")
	t.selectedOptionContextTags = if fFlagLuaAppChartsFilterOptionTextTag then table.concat(var8, ",") else nil
	filterImpressionsEventModule(p0, p3, t)
end