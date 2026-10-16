local Parent = script.Parent
local _ = require(Parent.Types)
local AssignModule = require(Parent.assign)

return function(...) --[[ Line: 13 | Named "join" ]]
	-- upvalues: AssignModule (copy)
	return AssignModule({}, ...)
end