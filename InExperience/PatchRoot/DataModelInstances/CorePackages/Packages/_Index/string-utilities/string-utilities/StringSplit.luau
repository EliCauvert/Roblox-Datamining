local function StringSplit(p1, p2, p3)
	-- upvalues: StringSplit (ref)
	if #p1 == 0 then
		return if string.find(p1, p2) then {} else { "" }
	elseif not p3 then
		p3 = -1
	end
	if p3 == 1 then
		return { p1 }
	elseif not p2 then
		p2 = "%s+"
	end
	local matchIndex, matchIndex_1 = string.find(p1, p2)
	
	if not matchIndex then
		return { p1 }
	elseif matchIndex_1 < 1 then
		local matchIndex_2, matchIndex_3 = string.find(string.sub(p1, 2), p2)
		matchIndex = matchIndex_2 + 1
		matchIndex_1 = matchIndex_3 + 1
	end
	local substring = string.sub(p1, 1, matchIndex - 1)
	local substring_1 = string.sub(p1, matchIndex_1 + 1)
	
	if #substring_1 == 0 and matchIndex <= matchIndex_1 then
		return { substring, substring_1 }
	end
	local var1 = StringSplit(substring_1, p2, p3 - 1)
	table.insert(var1, 1, substring)
	
	return var1
end

return StringSplit