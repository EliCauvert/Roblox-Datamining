local ForTesting = nil

return {
	get = function()
		-- upvalues: ForTesting (ref)
		return ForTesting
	end,
	setForTesting = function(Value)
		-- upvalues: ForTesting (ref)
		local ForTesting1 = ForTesting
		ForTesting = Value
		
		return ForTesting1
	end
}