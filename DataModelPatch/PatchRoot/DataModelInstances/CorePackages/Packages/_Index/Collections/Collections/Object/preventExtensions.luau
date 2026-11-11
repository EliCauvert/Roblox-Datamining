local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p1)
	local Text = tostring(p1)
	
	return (setmetatable(p1, {
		__metatable = false,
		__newindex = function(_, p2, _)
			-- upvalues: Text (copy)
			error(("%q (%s) is not a valid member of %s"):format(tostring(p2), typeof(p2), Text), 2)
		end
	}))
end