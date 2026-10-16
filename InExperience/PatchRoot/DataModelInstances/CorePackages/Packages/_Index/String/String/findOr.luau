local Text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(Text1: string, List, p1) --[[ Line: 24 | Named "findOr" ]]
	-- upvalues: Text (copy)
	local OffsetResult = utf8.offset(Text1, p1 or 1)
	local List1 = {}
	
	for _, Text2 in List do
		local StartIndex, EndIndex = string.find(Text1, Text2:gsub(Text, "%%%1"), OffsetResult)
		
		if StartIndex then
			local Segment = string.sub(Text1, 1, StartIndex - 1)
			local Length, Length2 = utf8.len(Segment)
			
			if Length == nil then
				error(("string `%s` has an invalid byte at position %s"):format(Segment, (tostring(Length2))))
			end
			table.insert(List1, {
				index = Length + 1,
				match = string.sub(Text1, StartIndex, EndIndex)
			})
		end
	end
	if #List1 == 0 then
		return nil
	end
	local v1 = nil
	
	for _, value in List1 do
		if v1 == nil then
			v1 = value
		end
		if value.index < v1.index then
			v1 = value
		end
	end
	return v1
end