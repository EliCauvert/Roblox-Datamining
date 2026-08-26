return function(p1, p2)
	p2 = p2 or tostring(p1)
	
	return setmetatable(p1, {
		__index = function(_, p3)
			-- upvalues: p2 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p2), 2)
		end,
		__newindex = function(_, p3)
			-- upvalues: p2 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p2), 2)
		end
	})
end