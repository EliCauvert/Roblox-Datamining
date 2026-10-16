local ForTesting = nil

return {
	get = function() --[[ Line: 10 ]]
		-- upvalues: ForTesting (ref)
		return ForTesting
	end,
	setForTesting = function(Value) --[[ Line: 14 ]]
		-- upvalues: ForTesting (ref)
		local ForTesting1 = ForTesting
		ForTesting = Value
		
		return ForTesting1
	end
}