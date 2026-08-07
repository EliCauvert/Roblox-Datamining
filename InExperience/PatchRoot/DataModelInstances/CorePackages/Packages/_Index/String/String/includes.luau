local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p0, p1, p2) --[[ line: 20 | named "includes" ]]
	-- upvalues: text (ref)
	local charCount, charCount_1 = utf8.len(p0)
	assert(charCount ~= nil, ("string `%s` has an invalid byte at position %s"):format(p0, tostring(charCount_1)))
	
	if charCount == 0 then
		return false
	elseif #p1 == 0 then
		return true
	end
	local var3 = 1
	
	if p2 ~= nil then
		var3 = tonumber(p2) or 1
		
		if charCount < var3 then
			return false
		elseif var3 < 1 then
			var3 = 1
		end
		local matchIndex, _ = string.find(p0, p1:gsub(text, "%%%1"), utf8.offset(p0, var3))
		
		return matchIndex ~= nil
	end
end