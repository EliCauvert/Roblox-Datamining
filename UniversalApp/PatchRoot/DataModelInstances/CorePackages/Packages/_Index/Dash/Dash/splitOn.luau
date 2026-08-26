local insert = table.insert

return function(p1, p2)
	-- upvalues: insert (ref)
	local t = {}
	local t_1 = {}
	local var1 = 1
	
	if p2 then
		local var2, var3 = p1:find(p2, var1)
		while var2 do
			insert(t_1, p1:sub(var2, var3))
			insert(t, p1:sub(var1, var2 - 1))
			var1 = var3 + 1
			local var4, var5 = p1:find(p2, var1)
			var2 = var4
			var3 = var5
		end
		insert(t, p1:sub(var1))
		
		return t, t_1
	else
		for i = 1, #p1 do
			insert(t, p1:sub(i, i))
		end
		return t
	end
end