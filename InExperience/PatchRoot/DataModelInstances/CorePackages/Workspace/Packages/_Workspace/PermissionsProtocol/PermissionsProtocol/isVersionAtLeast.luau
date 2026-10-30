local function parseVersion(Text: string)
	local List = {}
	
	for _, value in string.split(Text, ".") do
		if string.match(value, "^%d+$") == nil then
			return nil
		end
		table.insert(List, (tonumber(value)))
	end
	return List
end

return function(p1, p2): boolean
	-- upvalues: parseVersion (copy)
	local ParseVersionResult = parseVersion(p1)
	local ParseVersionResult1 = parseVersion(p2)
	
	if ParseVersionResult == nil or ParseVersionResult1 == nil then
		return false
	end
	local ParseVersionResultEntry = nil
	local ParseVersionResultEntry1 = nil
	for i = 1, math.max(#ParseVersionResult, #ParseVersionResult1) do
		ParseVersionResultEntry = ParseVersionResult[i] or 0
		ParseVersionResultEntry1 = ParseVersionResult1[i] or 0
		
		if ParseVersionResultEntry ~= ParseVersionResultEntry1 then
			return ParseVersionResultEntry1 < ParseVersionResultEntry
		end
	end
	return true
end