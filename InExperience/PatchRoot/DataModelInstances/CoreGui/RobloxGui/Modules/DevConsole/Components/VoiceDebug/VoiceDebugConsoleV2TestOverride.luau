local var1 = nil

return {
	get = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setForTesting = function(value)
		-- upvalues: var1 (write)
		var1 = value
		
		return var1
	end
}