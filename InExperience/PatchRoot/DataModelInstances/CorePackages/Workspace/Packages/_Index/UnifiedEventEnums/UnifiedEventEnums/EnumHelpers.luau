return {
	nameTyped = function(p1)
		return p1
	end,
	validator = function(List)
		local t = {}
		
		for _, value in List do
			t[value] = true
		end
		return function(p1)
			-- upvalues: t (copy)
			return if type(p1) == "number" and t[p1] then p1 else nil
		end
	end
}