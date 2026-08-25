local parent = script.Parent
local _ = require(parent.Types)
local assignModule = require(parent.assign)

return function(...)
	-- upvalues: assignModule (ref)
	return assignModule({}, ...)
end