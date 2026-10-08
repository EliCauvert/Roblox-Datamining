local eventNamesModule = require(script.Parent.EventNames)
local getTileRowInSortModule = require(script.Parent.getTileRowInSort)

return function(p1, p2)
	-- upvalues: getTileRowInSortModule (ref), eventNamesModule (ref)
	local impressions = p1.impressions
	local entries = p1.entries
	local startRowNumber = p1.startRowNumber
	local itemsPerRow = p1.itemsPerRow
	
	if not entries then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i = 1, #impressions do
		local var1 = impressions[i]
		local var2 = entries[var1]
		
		if var2 then
			table.insert(t, var1)
			table.insert(t_1, var2.id)
			table.insert(t_2, var2.name)
			table.insert(t_3, getTileRowInSortModule(var1, startRowNumber, itemsPerRow))
		end
	end
	p2(eventNamesModule.PlayerTileImpressions, {
		tilePos = t,
		playerId = t_1,
		playerName = t_2,
		rowInSort = t_3
	})
end