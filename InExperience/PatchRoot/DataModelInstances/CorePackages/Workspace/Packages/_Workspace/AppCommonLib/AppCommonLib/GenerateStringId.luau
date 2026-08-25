local var0 = 0

return function()
	-- upvalues: var0 (write)
	var0 += 1
	
	return tostring(var0)
end