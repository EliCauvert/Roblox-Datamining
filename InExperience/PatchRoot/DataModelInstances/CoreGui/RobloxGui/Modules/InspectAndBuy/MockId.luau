local var0 = 0

return function()
	-- upvalues: var0 (write)
	var0 += 1
	
	return ("MOCK-%d"):format(var0)
end