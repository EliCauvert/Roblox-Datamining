local _ = require(script.Parent.types)
local GetCurrentNavigationStateModule = require(script.Parent.getCurrentNavigationState)

return function(p1)
	-- upvalues: GetCurrentNavigationStateModule (copy)
	return if p1 and p1.state then GetCurrentNavigationStateModule(p1.state) else nil
end