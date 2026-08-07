local error = require(script.Parent.Parent.LuauPolyfill).Error

return function(p0, p1, ...) --[[ line: 25 | named "invariant" ]]
	-- upvalues: error (ref)
	if not p0 then
		error(error(string.format(p1, ...)))
	end
end