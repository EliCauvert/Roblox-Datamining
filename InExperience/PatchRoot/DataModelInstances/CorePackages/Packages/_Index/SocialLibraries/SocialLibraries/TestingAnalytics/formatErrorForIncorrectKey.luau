return function(p0) --[[ line: 1 ]]
	return function(p1, p2) --[[ line: 2 ]]
		-- upvalues: p0 (ref)
		local var0, var1 = p0(p1)
		
		if var0 == false then
			return var0, var1 .. ". Issue with: " .. p2
		end
		return var0
	end
end