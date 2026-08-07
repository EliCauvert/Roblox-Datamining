return function() --[[ line: 2 | named "createNextOrder" ]]
	local var0 = 0
	
	return function() --[[ line: 5 ]]
		-- upvalues: var0 (write)
		var0 += 1
		
		return var0
	end
end