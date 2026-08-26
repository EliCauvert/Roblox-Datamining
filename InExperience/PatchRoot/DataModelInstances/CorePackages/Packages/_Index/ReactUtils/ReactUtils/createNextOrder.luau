return function()
	local var1 = 0
	
	return function()
		-- upvalues: var1 (write)
		var1 += 1
		
		return var1
	end
end