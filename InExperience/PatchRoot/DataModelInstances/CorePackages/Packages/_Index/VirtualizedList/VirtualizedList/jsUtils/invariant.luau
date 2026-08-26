local error = require(script.Parent.Parent.Parent.LuauPolyfill).Error

return function(p1, p2, ...)
	-- upvalues: error (ref)
	if not p1 then
		error(error(string.format(p2, ...)))
	end
end