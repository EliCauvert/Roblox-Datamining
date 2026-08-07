local function StringSplit(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: StringSplit (ref)
	if #p0 == 0 then
		return if string.find(p0, p1) then {} else { "" }
	elseif not p2 then
		p2 = -1
	end
	if p2 == 1 then
		return { p0 }
	elseif not p1 then
		p1 = "%s+"
	end
	local matchIndex, matchIndex_1 = string.find(p0, p1)
	
	if not matchIndex then
		return { p0 }
	elseif matchIndex_1 < 1 then
		local matchIndex_2, matchIndex_3 = string.find(string.sub(p0, 2), p1)
		matchIndex = matchIndex_2 + 1
		matchIndex_1 = matchIndex_3 + 1
	end
	local substring = string.sub(p0, 1, matchIndex - 1)
	local substring_1 = string.sub(p0, matchIndex_1 + 1)
	
	if #substring_1 == 0 and matchIndex <= matchIndex_1 then
		return { substring, substring_1 }
	end
	local var7 = StringSplit(substring_1, p1, p2 - 1)
	table.insert(var7, 1, substring)
	
	return var7
end

return StringSplit