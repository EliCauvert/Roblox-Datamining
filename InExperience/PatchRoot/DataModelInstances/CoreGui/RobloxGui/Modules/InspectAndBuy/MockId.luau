local var1 = 0

return function()
	-- upvalues: var1 (write)
	var1 += 1
	
	return ("MOCK-%d"):format(var1)
end