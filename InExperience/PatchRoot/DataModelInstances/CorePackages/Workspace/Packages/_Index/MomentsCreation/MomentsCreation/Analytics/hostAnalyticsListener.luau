local v1 = nil

return {
	register = function(p1)
		-- upvalues: v1 (ref)
		v1 = p1
		
		return function()
			-- upvalues: v1 (upval), p1 (copy)
			if v1 == p1 then
				v1 = nil
			end
		end
	end,
	get = function()
		-- upvalues: v1 (ref)
		return v1
	end
}