return function(p1)
	local var1 = ""
	local var2 = 0
	
	for i = 1, #p1 do
		local substring = string.sub(p1, i, i)
		
		if substring == "<" then
			var2 += 1
			continue
		end
		if substring == ">" and var2 > 0 then
			var2 -= 1
		elseif var2 == 0 then
			var1 ..= substring
		end
	end
	return if var2 == 0 then var1 else p1
end