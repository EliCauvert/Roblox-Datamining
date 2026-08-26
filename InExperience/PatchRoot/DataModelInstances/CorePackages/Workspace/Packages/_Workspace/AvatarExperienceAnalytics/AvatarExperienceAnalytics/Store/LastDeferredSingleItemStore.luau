local var1 = nil

return {
	setSnapshot = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end,
	getSnapshot = function()
		-- upvalues: var1 (write)
		return var1
	end,
	clearSnapshot = function()
		-- upvalues: var1 (write)
		var1 = nil
	end
}