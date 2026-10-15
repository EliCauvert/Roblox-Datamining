local t = {
	Unknown = "Unknown",
	ParentConsentRecourse = "ParentConsentRecourse",
	AgeEstimationRecourse = "AgeEstimationRecourse",
	ParentLinkRecourse = "ParentLinkRecourse"
}
local t_1 = {}

for i, v in pairs(t) do
	t_1[v] = true
end
function t.fromValue(p1)
	-- upvalues: t_1 (ref)
	return if p1 == nil or not t_1[p1] then nil else p1
end

function t.fromValues(p1)
	-- upvalues: t (ref)
	if type(p1) ~= "table" then
		return nil
	end
	local t_1 = {}
	
	for i, v in p1 do
		local var1 = t.fromValue(v)
		
		if var1 ~= nil then
			table.insert(t_1, var1)
			continue
		end
		return nil
	end
	return t_1
end

return t