local Text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(Text1: string, Text2: string, p1): boolean
	-- upvalues: Text (copy)
	local Length, Length2 = utf8.len(Text1)
	assert(Length ~= nil, ("string `%s` has an invalid byte at position %s"):format(Text1, (tostring(Length2))))
	
	if Length == 0 then
		return false
	end
	if #Text2 == 0 then
		return true
	end
	local Number = 1
	
	if p1 ~= nil then
		Number = tonumber(p1) or 1
		
		if Length < Number then
			return false
		end
	end
	if Number < 1 then
		Number = 1
	end
	local StartIndex, _ = string.find(Text1, Text2:gsub(Text, "%%%1"), (utf8.offset(Text1, Number)))
	
	return StartIndex ~= nil
end