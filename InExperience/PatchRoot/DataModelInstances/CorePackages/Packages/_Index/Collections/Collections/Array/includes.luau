local _ = require(script.Parent.Parent.Parent.ES7Types)
local IndexOfModule = require(script.Parent.indexOf)

return function(p1, p2, p3): boolean
	-- upvalues: IndexOfModule (copy)
	return IndexOfModule(p1, p2, p3) ~= -1
end