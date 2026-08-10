local var0 = nil

return {
	setSnapshot = function(value) --[[ line: 10 ]]
		-- upvalues: var0 (write)
		var0 = value
	end,
	getSnapshot = function() --[[ line: 14 ]]
		-- upvalues: var0 (write)
		return var0
	end,
	clearSnapshot = function() --[[ line: 18 ]]
		-- upvalues: var0 (write)
		var0 = nil
	end
}