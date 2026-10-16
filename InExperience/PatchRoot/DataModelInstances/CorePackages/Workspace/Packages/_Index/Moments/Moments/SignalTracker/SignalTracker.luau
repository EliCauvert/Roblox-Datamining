local config = {
	View = {
		ids = "signal_view_item_ids",
		values = "signal_view_duration_seconds"
	},
	AddReaction = {
		ids = "signal_add_reaction_item_ids",
		values = "signal_add_reaction_values"
	},
	RemoveReaction = {
		ids = "signal_remove_reaction_item_ids",
		values = "signal_remove_reaction_values"
	},
	Share = { ids = "signal_share_item_ids", values = nil },
	Report = { ids = "signal_report_item_ids", values = nil },
	Join = { ids = "signal_join_item_ids", values = nil }
}
local Module = {}
Module.__index = Module

local function createSignalTracker() --[[ Line: 32 ]]
	-- upvalues: Module (copy)
	return (setmetatable({ _totalCount = 0, _payload = {}, _counts = {} }, Module))
end

function Module.recordSignal(p1, p2, p3, p4) --[[ Line: 41 ]]
	-- upvalues: config (copy)
	local Entry = config[p3]
	
	if Entry == nil then return end
	local Payload = p1._payload
	local Counts = p1._counts
	local Ids = Entry.ids
	local List = Payload[Ids]
	
	if not List then
		List = {}
		Payload[Ids] = List
	end
	local Values = Entry.values
	local List1 = if Values then Payload[Values] else nil
	
	if Values and not List1 then
		List1 = {}
		Payload[Values] = List1
	end
	local Count = Counts[Ids] or 0
	
	if Count >= 25 then
		table.remove(List, 1)
		
		if List1 then
			table.remove(List1, 1)
		end
	else
		Counts[Ids] = Count + 1
		p1._totalCount += 1
	end
	table.insert(List, p2)
	
	if List1 then
		table.insert(List1, p4 or "")
	end
end

function Module.getSignalsPayload(p1) --[[ Line: 82 ]]
	return if p1._totalCount == 0 then nil else p1._payload
end

function Module.getSignalCount(p1) --[[ Line: 90 ]]
	return p1._totalCount
end

return createSignalTracker