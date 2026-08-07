local t = {
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
local t_1 = {}
t_1.__index = t_1

local function createSignalTracker() --[[ line: 32 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({ _totalCount = 0, _payload = {}, _counts = {} }, t_1)
end

function t_1.recordSignal(value, p0, p1, p2) --[[ line: 41 ]]
	-- upvalues: t (ref)
	local var3 = t[p1]
	
	if var3 == nil then return end
	local payload = value._payload
	local counts = value._counts
	local ids = var3.ids
	local var4 = payload[ids]
	
	if not var4 then
		var4 = {}
		payload[ids] = var4
	end
	local values = var3.values
	local var5 = if values then payload[values] else nil
	
	if values and not var5 then
		var5 = {}
		payload[values] = var5
	end
	local var6 = counts[ids] or 0
	
	if var6 >= 25 then
		table.remove(var4, 1)
		
		if var5 then
			table.remove(var5, 1)
		end
	else
		counts[ids] = var6 + 1
		value._totalCount += 1
	end
	table.insert(var4, p0)
	
	if var5 then
		table.insert(var5, p2 or "")
	end
end

function t_1.getSignalsPayload(value) --[[ line: 82 ]]
	return if value._totalCount == 0 then nil else value._payload
end

function t_1.getSignalCount(value) --[[ line: 90 ]]
	return value._totalCount
end

return createSignalTracker