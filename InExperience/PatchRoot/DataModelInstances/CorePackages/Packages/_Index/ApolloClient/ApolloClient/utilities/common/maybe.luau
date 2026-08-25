return {
	maybe = function(p0)
		local _, status, var0 = xpcall(function()
			-- upvalues: p0 (ref)
			return p0(), true
		end, function() end)
		
		return if var0 then status else nil
	end
}