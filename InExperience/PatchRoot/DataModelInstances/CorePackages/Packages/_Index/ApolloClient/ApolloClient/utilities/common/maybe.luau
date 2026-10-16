return {
	maybe = function(Callback) --[[ Line: 10 ]]
		local _, Result, Result3 = xpcall(function() --[[ Line: 12 ]]
			-- upvalues: Callback (copy)
			return Callback(), true
		end, function() --[[ Line: 14 ]] end)
		
		return if Result3 then Result else nil
	end
}