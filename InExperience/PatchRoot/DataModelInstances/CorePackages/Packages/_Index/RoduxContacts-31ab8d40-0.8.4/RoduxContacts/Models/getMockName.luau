local var0 = 0

return function() --[[ line: 3 ]]
	-- upvalues: var0 (write)
	var0 += 1
	
	return tostring(var0)
end