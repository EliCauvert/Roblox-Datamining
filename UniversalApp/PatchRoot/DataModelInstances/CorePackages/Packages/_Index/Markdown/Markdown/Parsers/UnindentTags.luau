return function(p1, p2)
	p2 = p2 or 2
	
	if not string.find(p1, "<.->") then
		return p1
	end
	local parts = string.split(string.gsub(p1, "\r\n", "\n"), "\n")
	local list = table.create(#parts)
	local t = {}
	
	for i, v in parts do
		local _, matchIndex = string.find(v, "^[ \t]*")
		matchIndex = matchIndex or 0
		local substring = string.sub(v, matchIndex + 1)
		
		if not string.find(substring, "^<") then
			table.insert(list, string.rep(" ", math.max(0, matchIndex - (if #t > 0 then t[#t] + p2 else 0))) .. substring)
		elseif string.find(substring, "^</") then
			table.remove(t)
			table.insert(list, substring)
		elseif string.find(substring, "/>$") then
			table.insert(list, substring)
		else
			table.insert(t, matchIndex)
			table.insert(list, substring)
		end
	end
	return table.concat(list, "\n")
end