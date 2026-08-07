local t = {}
local object = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).Object

function t.compact(...) --[[ line: 13 ]]
	-- upvalues: object (ref)
	return object.assign({}, ...)
end

return t