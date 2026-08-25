return function(p0, p1)
	p1 = p1 or tostring(p0)
	
	return setmetatable(p0, {
		__index = function(_, p2)
			-- upvalues: p1 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), p1), 2)
		end,
		__newindex = function(_, p3, _)
			-- upvalues: p1 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), p1), 2)
		end
	})
end