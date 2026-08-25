local _ = require(script.Parent.Parent.Parent.ES7Types)
local indexOfModule = require(script.Parent.indexOf)

return function(p0, p1, p2)
	-- upvalues: indexOfModule (ref)
	return indexOfModule(p0, p1, p2) ~= -1
end