local t = {}
local object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object

function t.compact(...)
	-- upvalues: object (ref)
	return object.assign({}, ...)
end

return t