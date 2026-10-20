local RequiredActionModule = {
	Unknown = "Unknown",
	PlusMembershipRequired = "PlusMembershipRequired"
}
local t = {}

for _, value in pairs(RequiredActionModule) do
	t[value] = true
end
function RequiredActionModule.fromValue(p1)
	-- upvalues: t (copy)
	return if p1 == nil or not t[p1] then nil else p1
end

function RequiredActionModule.fromValues(List)
	-- upvalues: RequiredActionModule (copy)
	if type(List) ~= "table" then
		return nil
	end
	local FromValueResults = {}
	
	for _, value in List do
		local FromValueResult = RequiredActionModule.fromValue(value)
		
		if FromValueResult == nil then
			return nil
		end
		table.insert(FromValueResults, FromValueResult)
	end
	return FromValueResults
end

return RequiredActionModule