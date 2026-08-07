-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

local text = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"

return function(p0, p1, p2) --[[ line: 24 | named "findOr" ]]
	-- upvalues: text (ref)
	local byteOffset = utf8.offset(p0, p2 or 1)
	local t = {}
	
	for i, v in p1 do
		local matchIndex, matchIndex_1 = string.find(p0, v:gsub(text, "%%%1"), byteOffset)
		
		if matchIndex then
			local substring = string.sub(p0, 1, matchIndex - 1)
			local charCount, charCount_1 = utf8.len(substring)
			
			if charCount == nil then
				error(("string `%s` has an invalid byte at position %s"):format(substring, tostring(charCount_1)))
			end
			table.insert(t, {
				index = charCount + 1,
				match = string.sub(p0, matchIndex, matchIndex_1)
			})
		end
	end
	if #t == 0 then
		return nil
	end
	local var3 = nil
	
	for i_1, v_1 in t do
		if var3 == nil then
			var3 = v_1
		end
		if v_1.index < var3.index then
			var3 = v_1
		end
	end
	return var3
end