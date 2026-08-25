local error = require(script.Parent.Parent.Parent.LuauPolyfill).Error

return function(p0, p1, ...)
	-- upvalues: error (ref)
	if not p0 then
		error(error(string.format(p1, ...)))
	end
end