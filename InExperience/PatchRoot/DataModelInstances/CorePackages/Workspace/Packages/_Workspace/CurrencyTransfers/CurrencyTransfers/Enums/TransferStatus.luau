local t = {
	Initiated = "Initiated",
	Pending = "Pending",
	Cancelled = "Cancelled",
	Failed = "Failed",
	Completed = "Completed"
}
local t_1 = {
	[0] = t.Initiated,
	[1] = t.Pending,
	[2] = t.Cancelled,
	[3] = t.Failed,
	[4] = t.Completed
}

function t.fromValue(p1)
	-- upvalues: t_1 (ref), t (ref)
	if p1 == nil then
		return nil
	elseif type(p1) == "number" then
		return t_1[p1]
	elseif type(p1) == "string" then
		for i, v in pairs(t) do
			if v == p1 then
				return p1
			end
		end
	end
	return nil
end

return t