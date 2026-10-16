return function(p1, p2) --[[ Line: 1 | Named "strict" ]]
	local P1 = p2 or tostring(p1)
	
	return (setmetatable(p1, {
		__index = function(_, p3) --[[ Line: 5 ]]
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end,
		__newindex = function(_, p3) --[[ Line: 11 ]]
			-- upvalues: P1 (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), P1), 2)
		end
	}))
end