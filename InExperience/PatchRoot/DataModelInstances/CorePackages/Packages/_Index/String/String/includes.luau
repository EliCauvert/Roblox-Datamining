local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p1, p2, p3)
	-- upvalues: text (ref)
	local charCount, charCount_1 = utf8.len(p1)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p1, tostring(charCount_1)))
	
	if charCount == 0 then
		return false
	elseif #p2 == 0 then
		return true
	end
	local var1 = 1
	
	if p3 ~= nil then
		var1 = tonumber(p3) or 1
		
		if charCount < var1 then
			return false
		elseif var1 < 1 then
			var1 = 1
		end
		local matchIndex, _ = string.find(p1, p2:gsub(text, "%%%1"), utf8.offset(p1, var1))
		
		return matchIndex ~= nil
	end
end