return function(p0, p1, p2) --[[ line: 3 | named "StringTrim" ]]
	if not p1 then
		p1 = "%s"
	end
	if #p1 == 0 then
		return p0
	elseif not p2 then
		p2 = { left = true, right = true }
	end
	local var0 = p0
	
	if p2.left then
		local matchIndex = string.find(var0, "[^" .. p1 .. "]")
		
		if not matchIndex then
			return ""
		end
		var0 = string.sub(var0, matchIndex)
	end
	if p2.right then
		local matchIndex = string.find(var0, "[" .. p1 .. "]+$")
		
		if not matchIndex then
			return var0
		end
		var0 = string.sub(var0, 1, matchIndex - 1)
	end
	return var0
end