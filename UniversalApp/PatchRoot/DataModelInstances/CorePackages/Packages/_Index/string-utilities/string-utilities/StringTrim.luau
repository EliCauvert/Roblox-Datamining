return function(p1, p2, p3)
	if not p2 then
		p2 = "%s"
	end
	if #p2 == 0 then
		return p1
	elseif not p3 then
		p3 = { left = true, right = true }
	end
	local var1 = p1
	
	if p3.left then
		local matchIndex = string.find(var1, "[^" .. p1 .. "]")
		
		if not matchIndex then
			return ""
		end
		var1 = string.sub(var1, matchIndex)
	end
	if p3.right then
		local matchIndex = string.find(var1, "[" .. p1 .. "]+$")
		
		if not matchIndex then
			return var1
		end
		var1 = string.sub(var1, 1, matchIndex - 1)
	end
	return var1
end