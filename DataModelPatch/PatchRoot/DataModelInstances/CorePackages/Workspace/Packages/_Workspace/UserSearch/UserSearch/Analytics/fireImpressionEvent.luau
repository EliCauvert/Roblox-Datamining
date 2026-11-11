local EventNamesModule = require(script.Parent.EventNames)
local GetTileRowInSortModule = require(script.Parent.getTileRowInSort)

return function(p1, Callback: (any, any) -> ())
	-- upvalues: GetTileRowInSortModule (copy), EventNamesModule (copy)
	local Impressions = p1.impressions
	local Entries = p1.entries
	local StartRowNumber = p1.startRowNumber
	local ItemsPerRow = p1.itemsPerRow
	
	if not Entries then return end
	local TilePos = {}
	local PlayerId = {}
	local PlayerName = {}
	local RowInSort = {}
	
	for i = 1, #Impressions do
		local Impression = Impressions[i]
		local Entry = Entries[Impression]
		
		if Entry then
			table.insert(TilePos, Impression)
			table.insert(PlayerId, Entry.id)
			table.insert(PlayerName, Entry.name)
			table.insert(RowInSort, (GetTileRowInSortModule(Impression, StartRowNumber, ItemsPerRow)))
		end
	end
	Callback(EventNamesModule.PlayerTileImpressions, {
		tilePos = TilePos,
		playerId = PlayerId,
		playerName = PlayerName,
		rowInSort = RowInSort
	})
end