local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0)
	local var0 = tostring(p0)
	
	return setmetatable(p0, {
		__metatable = false,
		__newindex = function(_, p1, _)
			-- upvalues: var0 (ref)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p1), typeof(p1), var0), 2)
		end
	})
end