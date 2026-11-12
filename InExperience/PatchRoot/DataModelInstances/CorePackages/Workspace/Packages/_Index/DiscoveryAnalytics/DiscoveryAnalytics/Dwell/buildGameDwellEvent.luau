local _ = require(script.Parent.DwellTracker)
local _ = require(script.Parent.GameDwellItem)

local function viewArrays()
	return {
		universeIds = {},
		viewUuids = {},
		absPositions = {},
		topicDataPositions = {},
		rowsOnPage = {},
		itemComponentTypes = {},
		adFlags = {},
		sampledStartTimestampsMs = {},
		precedingScanGapsMs = {},
		positionsInRows = {},
		rows = {}
	}
end

local function appendView(p1, View)
	local Item = View.item
	table.insert(p1.universeIds, (tostring(Item.universeId)))
	table.insert(p1.viewUuids, View.uuid)
	table.insert(p1.absPositions, (tostring(Item.cell)))
	table.insert(p1.topicDataPositions, (tostring(Item.rank)))
	table.insert(p1.rowsOnPage, (tostring(Item.rowOnPage)))
	table.insert(p1.itemComponentTypes, Item.componentType)
	table.insert(p1.adFlags, (tostring(Item.adFlag)))
	table.insert(p1.sampledStartTimestampsMs, (tostring(View.startTimestamp)))
	table.insert(p1.precedingScanGapsMs, (tostring(View.precedingGap)))
	table.insert(p1.positionsInRows, (tostring(Item.positionInRow)))
	table.insert(p1.rows, (tostring(Item.row)))
end

local function join(Tbl, List)
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = table.concat(value, ",")
	end
	return Copy
end

return {
	starts = function(p1, List)
		-- upvalues: viewArrays (copy), appendView (copy), join (copy)
		local ViewArraysResult = viewArrays()
		
		for _, value in List do
			appendView(ViewArraysResult, value)
		end
		return (join(p1, ViewArraysResult))
	end,
	ends = function(p2, List)
		-- upvalues: viewArrays (copy), appendView (copy), join (copy)
		local ViewArraysResult = viewArrays()
		ViewArraysResult.sampledEndTimestampsMs = {}
		ViewArraysResult.dwellTimesMs = {}
		ViewArraysResult.lastPresentOffsetsMs = {}
		ViewArraysResult.visibleSampleCounts = {}
		ViewArraysResult.maxObservationGapsMs = {}
		ViewArraysResult.endReasons = {}
		
		for _, value in List do
			local View = value.view
			appendView(ViewArraysResult, View)
			table.insert(ViewArraysResult.sampledEndTimestampsMs, (tostring(value.timestamp)))
			table.insert(ViewArraysResult.dwellTimesMs, (tostring(value.duration)))
			table.insert(ViewArraysResult.lastPresentOffsetsMs, (tostring(View.lastPresent - View.start)))
			table.insert(ViewArraysResult.visibleSampleCounts, (tostring(View.count)))
			table.insert(ViewArraysResult.maxObservationGapsMs, (tostring(View.maxGap)))
			table.insert(ViewArraysResult.endReasons, value.reason)
		end
		return (join(p2, ViewArraysResult))
	end
}