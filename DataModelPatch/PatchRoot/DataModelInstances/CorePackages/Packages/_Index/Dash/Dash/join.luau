local Parent = script.Parent
local _ = require(Parent.Types)
local AssignModule = require(Parent.assign)

return function(...)
	-- upvalues: AssignModule (copy)
	return AssignModule({}, ...)
end