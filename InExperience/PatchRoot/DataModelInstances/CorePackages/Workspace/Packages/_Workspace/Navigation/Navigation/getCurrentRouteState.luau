local _ = require(script.Parent.types)
local getCurrentNavigationStateModule = require(script.Parent.getCurrentNavigationState)

return function(p1)
	-- upvalues: getCurrentNavigationStateModule (ref)
	return if p1 then if p1.state then getCurrentNavigationStateModule(p1.state) else nil else nil
end