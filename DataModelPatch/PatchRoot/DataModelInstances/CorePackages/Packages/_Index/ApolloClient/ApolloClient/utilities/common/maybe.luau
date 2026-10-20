return {
	maybe = function(Callback)
		local _, Result, Result3 = xpcall(function()
			-- upvalues: Callback (copy)
			return Callback(), true
		end, function() end)
		
		return if Result3 then Result else nil
	end
}