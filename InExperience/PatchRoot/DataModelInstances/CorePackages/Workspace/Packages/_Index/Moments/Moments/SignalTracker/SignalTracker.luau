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

local function createSignalTracker()
	-- upvalues: t_1 (ref)
	return setmetatable({ _totalCount = 0, _payload = {}, _counts = {} }, t_1)
end

function t_1.recordSignal(value, p1, p2, p3)
	-- upvalues: t (ref)
	local var1 = t[p2]
	
	if var1 == nil then return end
	local payload = value._payload
	local counts = value._counts
	local ids = var1.ids
	local var2 = payload[ids]
	
	if not var2 then
		var2 = {}
		payload[ids] = var2
	end
	local values = var1.values
	local var3 = if values then payload[values] else nil
	
	if values and not var3 then
		var3 = {}
		payload[values] = var3
	end
	local var4 = counts[ids] or 0
	
	if var4 >= 25 then
		table.remove(var2, 1)
		
		if var3 then
			table.remove(var3, 1)
		end
	else
		counts[ids] = var4 + 1
		value._totalCount += 1
	end
	table.insert(var2, p1)
	
	if var3 then
		table.insert(var3, p3 or "")
	end
end

function t_1.getSignalsPayload(value)
	return if value._totalCount == 0 then nil else value._payload
end

function t_1.getSignalCount(value)
	return value._totalCount
end

return createSignalTracker