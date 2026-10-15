local char = utf8.char(8205)

return function(p1)
	-- upvalues: char (ref)
	if utf8.len(p1) == nil then
		return #p1
	end
	local var1 = 0
	
	for i, v in utf8.graphemes(p1) do
		local var2 = 0
		
		for i_1, v_1 in string.split(string.sub(p1, i, v), char) do
			if v_1 ~= "" then
				var2 += 1
			end
		end
		var1 += math.max(var2, 1)
	end
	return var1
end