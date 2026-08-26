local _ = require(script.Parent.Parent.Parent.ES7Types)
local indexOfModule = require(script.Parent.indexOf)

return function(p1, p2, p3)
	-- upvalues: indexOfModule (ref)
	return indexOfModule(p1, p2, p3) ~= -1
end