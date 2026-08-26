local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p1, p2, p3)
	-- upvalues: text (ref)
	local byteOffset = utf8.offset(p1, p3 or 1)
	local t = {}
	
	for i, v in p2 do
		local matchIndex, matchIndex_1 = string.find(p1, v:gsub(text, "%%%1"), byteOffset)
		
		if matchIndex then
			local substring = string.sub(p1, 1, matchIndex - 1)
			local charCount, charCount_1 = utf8.len(substring)
			
			if charCount == nil then
				error(("string `%s` has an invalid byte at position %s"):format(substring, tostring(charCount_1)))
			end
			table.insert(t, {
				index = charCount + 1,
				match = string.sub(p1, matchIndex, matchIndex_1)
			})
		end
	end
	if #t == 0 then
		return nil
	end
	local var1 = nil
	
	for i_1, v_1 in t do
		if var1 == nil then
			var1 = v_1
		end
		if v_1.index < var1.index then
			var1 = v_1
		end
	end
	return var1
end