local var0 = nil

return {
	setSnapshot = function(value)
		-- upvalues: var0 (write)
		var0 = value
	end,
	getSnapshot = function()
		-- upvalues: var0 (write)
		return var0
	end,
	clearSnapshot = function()
		-- upvalues: var0 (write)
		var0 = nil
	end
}