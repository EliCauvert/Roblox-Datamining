local parent = script.Parent
local _ = require(parent.Types)
local assignModule = require(parent.assign)

return function(...) --[[ line: 13 | named "join" ]]
	-- upvalues: assignModule (ref)
	return assignModule({}, ...)
end