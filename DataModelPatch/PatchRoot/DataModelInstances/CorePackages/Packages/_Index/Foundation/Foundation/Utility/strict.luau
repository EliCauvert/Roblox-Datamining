return function(p1, p2)
	local P1 = p2 or tostring(p1)
	
	return (setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end,
		__newindex = function(_, p3)
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end
	}))
end