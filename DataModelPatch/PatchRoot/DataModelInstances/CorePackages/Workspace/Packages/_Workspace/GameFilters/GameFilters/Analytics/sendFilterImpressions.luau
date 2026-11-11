local GameFilters = script:FindFirstAncestor("GameFilters")
local Parent = GameFilters.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local _ = require(Parent.DiscoveryTypes)
local FilterImpressionsEventModule = require(GameFilters.Analytics.filterImpressionsEvent)
local GetOptionContextTagModule = require(GameFilters.Analytics.getOptionContextTag)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function(p1, List, p2, p3, p4)
	-- upvalues: FFlagLuaAppChartsFilterOptionTextTag (copy), GetOptionContextTagModule (copy), ArgCheckModule (copy), FilterImpressionsEventModule (copy)
	if not p1 then return end
	if not List or #List == 0 then return end
	if not p2 or #p2 == 0 then return end
	local config = {
		gameSetTypeId = p4.gameSetTypeId,
		gameSetTargetId = p4.gameSetTargetId,
		sortPos = p4.sortPos
	}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local T = if FFlagLuaAppChartsFilterOptionTextTag then {} else nil
	for _, value in List do
		local v1 = p2[value]
		
		if v1 then
			table.insert(List1, value)
			table.insert(List2, v1.filterId)
			table.insert(List3, v1.selectedOptionId)
			
			if FFlagLuaAppChartsFilterOptionTextTag then
				table.insert(T, GetOptionContextTagModule(v1, v1.selectedOptionId) or "0")
			end
		end
	end
	local CountList2 = #List2
	ArgCheckModule.assert(CountList2 == #List1)
	ArgCheckModule.assert(CountList2 == #List3)
	
	if FFlagLuaAppChartsFilterOptionTextTag then
		ArgCheckModule.assert(CountList2 == #T)
	end
	config.absPositions = table.concat(List1, ",")
	config.filterIds = table.concat(List2, ",")
	config.selectedOptionIds = table.concat(List3, ",")
	config.selectedOptionContextTags = if FFlagLuaAppChartsFilterOptionTextTag then table.concat(T, ",") else nil
	FilterImpressionsEventModule(p1, p3, config)
end