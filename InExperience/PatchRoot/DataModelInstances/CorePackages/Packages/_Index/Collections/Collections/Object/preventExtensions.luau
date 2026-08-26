local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	local var1 = tostring(p1)
	
	return setmetatable(p1, {
		__metatable = false,
		__newindex = function(_, p2, _)
			-- upvalues: var1 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), var1), 2)
		end
	})
end