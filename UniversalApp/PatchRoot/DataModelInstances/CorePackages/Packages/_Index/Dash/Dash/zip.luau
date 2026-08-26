return function(p1, p2)
	local var1 = nil
	local var2 = nil
	local var3 = nil
	local var4 = nil
	
	return function()
		-- upvalues: var1 (write), var3 (write), p1 (ref), var2 (write), var4 (write), p2 (ref)
		local var5, var6 = next(p1, var1)
		var1 = var5
		var3 = var6
		local var7, var8 = next(p2, var2)
		var2 = var7
		var4 = var8
		
		if var3 and var4 then
			return var3, var4
		end
		return nil
	end
end