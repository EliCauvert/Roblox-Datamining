return function(p1)
	return function(p2, p3)
		-- upvalues: p1 (ref)
		local var1, var2 = p1(p2)
		
		if var1 == false then
			return var1, var2 .. ". Issue with: " .. p2
		end
		return var1
	end
end