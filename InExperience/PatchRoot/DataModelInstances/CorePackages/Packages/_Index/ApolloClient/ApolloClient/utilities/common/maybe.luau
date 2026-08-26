return {
	maybe = function(p1)
		local _, status, var1 = xpcall(function()
			-- upvalues: p1 (ref)
			return p1(), true
		end, function() end)
		
		return if var1 then status else nil
	end
}