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

function t.fromValue(p0)
	-- upvalues: t_1 (ref), t (ref)
	if p0 == nil then
		return nil
	elseif type(p0) == "number" then
		return t_1[p0]
	elseif type(p0) == "string" then
		for i, v in pairs(t) do
			if v == p0 then
				return p0
			end
		end
	end
	return nil
end

return t