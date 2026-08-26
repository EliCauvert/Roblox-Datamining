local var1 = nil

return {
	getUrl = function()
		-- upvalues: var1 (write)
		return var1
	end,
	setUrl = function(value)
		-- upvalues: var1 (write)
		var1 = value
	end
}